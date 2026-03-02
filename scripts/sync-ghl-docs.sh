#!/usr/bin/env bash
# sync-ghl-docs.sh — Clones the GoHighLevel API docs repo and converts
# its OpenAPI specs + markdown guides into an LLM-friendly layout.
set -euo pipefail

REPO_URL="https://github.com/GoHighLevel/highlevel-api-docs.git"
WORK_DIR=$(mktemp -d)
OUT_DIR="$(cd "$(dirname "$0")/.." && pwd)/ghl-docs"

cleanup() { rm -rf "$WORK_DIR"; }
trap cleanup EXIT

echo "==> Cloning GoHighLevel API docs..."
git clone --depth 1 "$REPO_URL" "$WORK_DIR/repo"

SRC="$WORK_DIR/repo"

# Clean previous output
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR/api-reference" "$OUT_DIR/guides" "$OUT_DIR/webhook-events"

# ─── 1. Process OpenAPI JSON specs into markdown summaries ───────────────
echo "==> Processing OpenAPI specs..."
for spec in "$SRC"/apps/*.json; do
  name=$(basename "$spec" .json)
  out_file="$OUT_DIR/api-reference/${name}.md"

  # Use node to convert OpenAPI JSON → concise markdown
  node -e "
const fs = require('fs');
const spec = JSON.parse(fs.readFileSync('$spec', 'utf8'));

let md = '# ' + (spec.info?.title || '$name') + '\n\n';
if (spec.info?.description) md += spec.info.description + '\n\n';
if (spec.info?.version) md += 'Version: ' + spec.info.version + '\n\n';

// Server info
if (spec.servers?.length) {
  md += '## Base URL\n\n';
  for (const s of spec.servers) {
    md += '- ' + s.url + (s.description ? ' (' + s.description + ')' : '') + '\n';
  }
  md += '\n';
}

// Auth info
if (spec.components?.securitySchemes) {
  md += '## Authentication\n\n';
  for (const [name, scheme] of Object.entries(spec.components.securitySchemes)) {
    md += '- **' + name + '**: ' + scheme.type;
    if (scheme.scheme) md += ' (' + scheme.scheme + ')';
    if (scheme.bearerFormat) md += ' [' + scheme.bearerFormat + ']';
    if (scheme.description) md += ' — ' + scheme.description;
    md += '\n';
  }
  md += '\n';
}

// Endpoints
if (spec.paths) {
  md += '## Endpoints\n\n';
  for (const [path, methods] of Object.entries(spec.paths)) {
    for (const [method, op] of Object.entries(methods)) {
      if (['get','post','put','patch','delete'].indexOf(method) === -1) continue;
      md += '### ' + method.toUpperCase() + ' \`' + path + '\`\n\n';
      if (op.summary) md += op.summary + '\n\n';
      if (op.description) md += op.description + '\n\n';
      if (op.operationId) md += 'Operation ID: \`' + op.operationId + '\`\n\n';

      // Parameters
      const params = op.parameters || [];
      if (params.length) {
        md += '**Parameters:**\n\n';
        md += '| Name | In | Type | Required | Description |\n';
        md += '|------|-----|------|----------|-------------|\n';
        for (const p of params) {
          const type = p.schema?.type || p.schema?.\"\\\$ref\"?.split('/').pop() || '-';
          md += '| \`' + p.name + '\` | ' + p.in + ' | ' + type + ' | ' + (p.required ? 'Yes' : 'No') + ' | ' + (p.description || '-').replace(/\\n/g, ' ') + ' |\n';
        }
        md += '\n';
      }

      // Request body
      if (op.requestBody) {
        md += '**Request Body';
        if (op.requestBody.required) md += ' (required)';
        md += ':**\n\n';
        const content = op.requestBody.content || {};
        for (const [ct, media] of Object.entries(content)) {
          md += 'Content-Type: \`' + ct + '\`\n\n';
          if (media.schema) {
            md += printSchema(media.schema, spec.components?.schemas || {});
          }
        }
        md += '\n';
      }

      // Responses
      if (op.responses) {
        md += '**Responses:**\n\n';
        for (const [code, resp] of Object.entries(op.responses)) {
          md += '- \`' + code + '\`: ' + (resp.description || '') + '\n';
        }
        md += '\n';
      }
      md += '---\n\n';
    }
  }
}

// Schema printer (1 level deep for readability)
function printSchema(schema, schemas, depth) {
  depth = depth || 0;
  if (depth > 2) return '_(nested object)_\n';
  let out = '';
  // Resolve ref
  if (schema.\"\\\$ref\") {
    const refName = schema.\"\\\$ref\".split('/').pop();
    const resolved = schemas[refName];
    if (resolved) {
      out += 'Schema: \`' + refName + '\`\n\n';
      return out + printSchema(resolved, schemas, depth);
    }
    return 'Schema: \`' + refName + '\`\n\n';
  }
  if (schema.properties) {
    out += '| Property | Type | Required | Description |\n';
    out += '|----------|------|----------|-------------|\n';
    const req = new Set(schema.required || []);
    for (const [prop, def] of Object.entries(schema.properties)) {
      let type = def.type || 'object';
      if (def.enum) type += ' (enum: ' + def.enum.join(', ') + ')';
      if (def.\"\\\$ref\") type = def.\"\\\$ref\".split('/').pop();
      if (def.items?.\"\\\$ref\") type = 'array<' + def.items.\"\\\$ref\".split('/').pop() + '>';
      out += '| \`' + prop + '\` | ' + type + ' | ' + (req.has(prop) ? 'Yes' : 'No') + ' | ' + (def.description || '-').replace(/\\n/g, ' ') + ' |\n';
    }
    out += '\n';
  }
  return out;
}

// Schemas appendix
if (spec.components?.schemas && Object.keys(spec.components.schemas).length) {
  md += '## Schemas\n\n';
  for (const [name, schema] of Object.entries(spec.components.schemas)) {
    md += '### ' + name + '\n\n';
    if (schema.description) md += schema.description + '\n\n';
    md += printSchema(schema, spec.components.schemas);
    md += '\n';
  }
}

process.stdout.write(md);
" > "$out_file" 2>/dev/null || echo "# ${name}\n\n_Failed to parse spec._" > "$out_file"

  echo "    ✓ $name"
done

# ─── 2. Copy guide markdown files ───────────────────────────────────────
echo "==> Copying guide docs..."

# OAuth & marketplace guides
for f in "$SRC"/docs/oauth/*.md; do
  [ -f "$f" ] && cp "$f" "$OUT_DIR/guides/"
done
for f in "$SRC"/docs/marketplace\ modules/*.md; do
  [ -f "$f" ] && cp "$f" "$OUT_DIR/guides/"
done
# Country list
for f in "$SRC"/docs/country\ list/*.md; do
  [ -f "$f" ] && cp "$f" "$OUT_DIR/guides/"
done

# ─── 3. Copy webhook event docs ─────────────────────────────────────────
echo "==> Copying webhook event docs..."
for f in "$SRC"/docs/webhook\ events/*.md; do
  [ -f "$f" ] && cp "$f" "$OUT_DIR/webhook-events/"
done

# ─── 4. Copy common schemas ─────────────────────────────────────────────
cp "$SRC/common/common-schemas.json" "$OUT_DIR/" 2>/dev/null || true

# ─── 5. Generate index ──────────────────────────────────────────────────
echo "==> Generating index..."
INDEX="$OUT_DIR/INDEX.md"
cat > "$INDEX" <<'HEADER'
# GoHighLevel API v2 — Documentation Index

> Auto-generated from https://github.com/GoHighLevel/highlevel-api-docs
> This index lists all available documentation files for LLM consumption.

HEADER

echo "## Guides" >> "$INDEX"
echo "" >> "$INDEX"
for f in "$OUT_DIR"/guides/*.md; do
  [ -f "$f" ] || continue
  name=$(basename "$f" .md)
  echo "- [${name}](guides/${name}.md)" >> "$INDEX"
done

echo "" >> "$INDEX"
echo "## API Reference (OpenAPI)" >> "$INDEX"
echo "" >> "$INDEX"
for f in "$OUT_DIR"/api-reference/*.md; do
  [ -f "$f" ] || continue
  name=$(basename "$f" .md)
  echo "- [${name}](api-reference/${name}.md)" >> "$INDEX"
done

echo "" >> "$INDEX"
echo "## Webhook Events" >> "$INDEX"
echo "" >> "$INDEX"
for f in "$OUT_DIR"/webhook-events/*.md; do
  [ -f "$f" ] || continue
  name=$(basename "$f" .md)
  echo "- [${name}](webhook-events/${name}.md)" >> "$INDEX"
done

# ─── 6. Record sync metadata ────────────────────────────────────────────
COMMIT_SHA=$(cd "$SRC" && git rev-parse HEAD)
cat > "$OUT_DIR/SYNC_META.json" <<EOF
{
  "source": "$REPO_URL",
  "commit": "$COMMIT_SHA",
  "synced_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
}
EOF

echo ""
echo "==> Done! Docs written to $OUT_DIR"
echo "    Source commit: $COMMIT_SHA"
