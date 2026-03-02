# GoHighLevel API — Kiro Skill

A [Kiro](https://kiro.dev) skill that provides LLM-friendly access to the [GoHighLevel API v2](https://github.com/GoHighLevel/highlevel-api-docs) documentation.

## What's in here

- `.kiro/skills/ghl-api/SKILL.md` — The Kiro skill definition. Reference it in chat with `#ghl-api` to give Kiro deep knowledge of the GHL API.
- `ghl-docs/` — Auto-generated markdown docs converted from GHL's OpenAPI specs and guides. Updated weekly.
- `scripts/sync-ghl-docs.sh` — The sync script that clones the upstream repo and converts everything to markdown.
- `.github/workflows/sync-ghl-docs.yml` — GitHub Action that runs the sync every Monday.

## Initial setup

Run the sync script once to populate `ghl-docs/`:

```bash
bash scripts/sync-ghl-docs.sh
```

After that, the weekly GitHub Action keeps it current.

## Usage in Kiro

In any Kiro chat, type `#ghl-api` to activate the skill, then ask about any GHL API topic — endpoints, auth flows, webhook payloads, scopes, etc.
