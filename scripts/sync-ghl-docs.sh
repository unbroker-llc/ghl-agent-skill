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

# ─── 7. Assemble SKILL.md (compact — must fit in LLM context) ───────────
echo "==> Assembling SKILL.md..."
SKILL_DIR="$(cd "$SCRIPT_DIR/.." && pwd)/.kiro/skills/ghl-api"
mkdir -p "$SKILL_DIR"
SKILL="$SKILL_DIR/SKILL.md"

cat > "$SKILL" <<'FRONTMATTER'
---
inclusion: manual
name: "GHL API"
description: "GoHighLevel API v2 documentation — endpoints, auth, webhooks, and schemas"
---

# GHL API v2

You are an expert on the GoHighLevel (GHL) API v2. This documentation is auto-generated from https://github.com/GoHighLevel/highlevel-api-docs.

Base URL: `https://services.leadconnectorhq.com`
Auth: OAuth 2.0 Bearer tokens. Apps authenticate via the GHL marketplace.
"Locations" = "Sub-Accounts" in the UI. The API still uses `locationId`.
Most endpoints require a `locationId` (sub-account level) or operate at agency level.
All endpoints require a `Version` header (e.g. `2021-07-28`).

FRONTMATTER

# Guides — include selectively (skip large/low-value files)
# Files excluded from SKILL.md (still available in ghl-docs/guides/):
#   Scopes.md, ScopesOld.md, Billing.md, CustomJs.md,
#   shared_secret_customJS_customPages.md, Country.md
SKILL_SKIP_GUIDES="Scopes.md ScopesOld.md Billing.md CustomJs.md shared_secret_customJS_customPages.md Country.md Authorization.md ExternalAuthentication.md ConversationProviders.md"
echo "---" >> "$SKILL"
echo "" >> "$SKILL"
echo "# Guides" >> "$SKILL"
echo "" >> "$SKILL"
for f in "$OUT_DIR"/guides/*.md; do
  [ -f "$f" ] || continue
  fname=$(basename "$f")
  case " $SKILL_SKIP_GUIDES " in
    *" $fname "*) continue ;;
  esac
  echo "---" >> "$SKILL"
  echo "" >> "$SKILL"
  cat "$f" >> "$SKILL"
  echo "" >> "$SKILL"
done

# API Reference — compact format (endpoint table + compact schemas)
echo "---" >> "$SKILL"
echo "" >> "$SKILL"
echo "# API Reference" >> "$SKILL"
echo "" >> "$SKILL"
for spec in "$SRC"/apps/*.json; do
  "$NODE" "$SCRIPT_DIR/convert-openapi-compact.js" "$spec" >> "$SKILL" \
    || true
done

# Webhook events — omitted from SKILL.md (too large).
# Full webhook docs remain in ghl-docs/webhook-events/ for direct file reference.

# Overrides — include in full (these are small and high-value corrections)
if [ -d "$OVERRIDES_DIR" ]; then
  has_overrides=false
  for override in "$OVERRIDES_DIR"/**/*.md; do
    [ -f "$override" ] && has_overrides=true && break
  done
  if $has_overrides; then
    echo "---" >> "$SKILL"
    echo "" >> "$SKILL"
    echo "# Overrides" >> "$SKILL"
    echo "" >> "$SKILL"
    echo "> These corrections take precedence over the auto-generated docs above." >> "$SKILL"
    echo "" >> "$SKILL"
    find "$OVERRIDES_DIR" -name '*.md' -type f | sort | while read -r override; do
      rel="${override#$OVERRIDES_DIR/}"
      echo "## Override: $rel" >> "$SKILL"
      echo "" >> "$SKILL"
      cat "$override" >> "$SKILL"
      echo "" >> "$SKILL"
    done
  fi
fi

SKILL_SIZE=$(wc -c < "$SKILL" | tr -d ' ')
echo "    SKILL.md assembled ($(( SKILL_SIZE / 1024 )) KB)"

echo ""
echo "==> Done! Docs written to $OUT_DIR"
echo "    SKILL.md written to $SKILL"
echo "    Source commit: $COMMIT_SHA"
