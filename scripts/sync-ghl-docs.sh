#!/usr/bin/env bash
# sync-ghl-docs.sh — Clones the GoHighLevel API docs repo and converts
# its OpenAPI specs + markdown guides into an LLM-friendly layout.
set -euo pipefail

REPO_URL="https://github.com/GoHighLevel/highlevel-api-docs.git"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_DIR=$(mktemp -d)
OUT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)/ghl-docs"

# Use NODE env var if set, otherwise find it
NODE="${NODE:-$(command -v node 2>/dev/null || echo node)}"

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

  "$NODE" "$SCRIPT_DIR/convert-openapi.js" "$spec" > "$out_file" \
    || printf "# %s\n\n_Failed to parse spec._\n" "$name" > "$out_file"

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

# ─── 4b. Apply overrides ────────────────────────────────────────────────
OVERRIDES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)/overrides"
if [ -d "$OVERRIDES_DIR" ]; then
  echo "==> Applying overrides..."
  find "$OVERRIDES_DIR" -name '*.md' -type f | while read -r override; do
    # Get the relative path under overrides/, e.g. api-reference/proposals.md
    rel="${override#$OVERRIDES_DIR/}"
    target="$OUT_DIR/$rel"
    if [ -f "$target" ]; then
      {
        echo ""
        echo "---"
        echo ""
        echo "# OVERRIDES"
        echo ""
        echo "> The following corrections and additions override inaccurate or incomplete"
        echo "> information in the auto-generated docs above. When conflicts exist between"
        echo "> the above content and the overrides below, the overrides are authoritative."
        echo ""
        cat "$override"
      } >> "$target"
      echo "    ✓ override applied: $rel"
    else
      echo "    ⚠ no target for override: $rel (skipped)"
    fi
  done
fi

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

# ─── 7. Assemble SKILL.md ───────────────────────────────────────────────
echo "==> Assembling SKILL.md..."
SKILL_DIR="$(cd "$SCRIPT_DIR/.." && pwd)/.kiro/skills/ghl-api"
mkdir -p "$SKILL_DIR"
SKILL="$SKILL_DIR/SKILL.md"

cat > "$SKILL" <<'FRONTMATTER'
---
inclusion: manual
name: ghl
description: "GoHighLevel API v2 documentation — endpoints, auth, webhooks, and schemas"
---

# GHL API v2

You are an expert on the GoHighLevel (GHL) API v2. All documentation below is auto-generated from the official GoHighLevel OpenAPI specs and guides at https://github.com/GoHighLevel/highlevel-api-docs.

## Key Concepts

- GHL uses OAuth 2.0 for authentication. Apps get access via the marketplace.
- APIs are scoped — each endpoint requires specific OAuth scopes.
- The API base URL is `https://services.leadconnectorhq.com`.
- "Locations" are now called "Sub-Accounts" in the UI but the API still uses `locations`.
- Most endpoints require either a `locationId` (sub-account) or work at the agency/company level.

---

FRONTMATTER

# Append guides
echo "# Guides" >> "$SKILL"
echo "" >> "$SKILL"
for f in "$OUT_DIR"/guides/*.md; do
  [ -f "$f" ] || continue
  echo "---" >> "$SKILL"
  echo "" >> "$SKILL"
  cat "$f" >> "$SKILL"
  echo "" >> "$SKILL"
done

# Append API references
echo "---" >> "$SKILL"
echo "" >> "$SKILL"
echo "# API Reference" >> "$SKILL"
echo "" >> "$SKILL"
for f in "$OUT_DIR"/api-reference/*.md; do
  [ -f "$f" ] || continue
  echo "---" >> "$SKILL"
  echo "" >> "$SKILL"
  cat "$f" >> "$SKILL"
  echo "" >> "$SKILL"
done

# Append webhook events
echo "---" >> "$SKILL"
echo "" >> "$SKILL"
echo "# Webhook Events" >> "$SKILL"
echo "" >> "$SKILL"
for f in "$OUT_DIR"/webhook-events/*.md; do
  [ -f "$f" ] || continue
  echo "---" >> "$SKILL"
  echo "" >> "$SKILL"
  cat "$f" >> "$SKILL"
  echo "" >> "$SKILL"
done

SKILL_SIZE=$(wc -c < "$SKILL" | tr -d ' ')
echo "    SKILL.md assembled ($(( SKILL_SIZE / 1024 )) KB)"

echo ""
echo "==> Done! Docs written to $OUT_DIR"
echo "    SKILL.md written to $SKILL"
echo "    Source commit: $COMMIT_SHA"
