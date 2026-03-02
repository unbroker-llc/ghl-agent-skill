[![Sync GoHighLevel API Docs](https://github.com/unbroker-llc/ghl-agent-skill/actions/workflows/sync-ghl-docs.yml/badge.svg?branch=main)](https://github.com/unbroker-llc/ghl-agent-skill/actions/workflows/sync-ghl-docs.yml)

# GoHighLevel API — Kiro Skill

A [Kiro](https://kiro.dev) skill that provides LLM-friendly access to the [GoHighLevel API v2](https://github.com/GoHighLevel/highlevel-api-docs) documentation.

## What's in here

- `.kiro/skills/ghl-api/SKILL.md` — The Kiro skill definition. Reference it in chat with `#ghl` to give Kiro deep knowledge of the GHL API.
- `ghl-docs/` — Auto-generated markdown docs converted from GHL's OpenAPI specs and guides. Updated weekly.
- `scripts/sync-ghl-docs.sh` — The sync script that clones the upstream repo and converts everything to markdown.
- `.github/workflows/sync-ghl-docs.yml` — GitHub Action that runs the sync every Monday.

## Initial setup

Run the sync script once to populate `ghl-docs/`:

```bash
bash -i scripts/sync-ghl-docs.sh
```

The `-i` flag ensures interactive shell init runs (needed if your Node.js is managed by fnm, nvm, etc.). On CI (GitHub Actions), node is in PATH already so this isn't needed.

After that, the weekly GitHub Action keeps it current.

## Usage in Kiro

In any Kiro chat, type `#ghl` to activate the skill, then ask about any GHL topic — endpoints, auth flows, webhook payloads, scopes, etc.

## Overrides

The upstream GHL docs sometimes have inaccurate or incomplete information. To correct this, add markdown files under `overrides/` mirroring the `ghl-docs/` structure. For example:

```
overrides/api-reference/proposals.md  →  appended to ghl-docs/api-reference/proposals.md
overrides/guides/Authorization.md     →  appended to ghl-docs/guides/Authorization.md
overrides/webhook-events/ContactCreate.md → appended to ghl-docs/webhook-events/ContactCreate.md
```

Override content is appended under an `# OVERRIDES` heading with a note that it takes precedence over the auto-generated content above it. Overrides are preserved across syncs since they live outside `ghl-docs/`.
