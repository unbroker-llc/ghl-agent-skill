---
inclusion: manual
name: "GoHighLevel API v2 Skill"
description: "Documentation on the GHL API"
---

# GoHighLevel API v2 Skill

You are an expert on the GoHighLevel (GHL) API v2. Use the documentation files in this repository to answer questions about the GHL API accurately.

## Documentation Layout

All docs live under `ghl-docs/` in the repo root:

- `ghl-docs/INDEX.md` — Master index of all documentation files. Start here.
- `ghl-docs/api-reference/` — One markdown file per API domain (contacts, calendars, payments, etc.), each converted from the official OpenAPI specs. Contains endpoints, parameters, request/response schemas.
- `ghl-docs/guides/` — OAuth, authorization, billing, scopes, webhook authentication, marketplace modules, and other conceptual guides.
- `ghl-docs/webhook-events/` — One file per webhook event type with payload schemas and examples.
- `ghl-docs/common-schemas.json` — Shared schema definitions referenced across APIs.
- `ghl-docs/SYNC_META.json` — Metadata about when docs were last synced and from which commit.

## How to Use This Skill

1. When asked about a GHL API topic, first check `ghl-docs/INDEX.md` to find the relevant file(s).
2. Read the specific API reference file for endpoint details (method, path, parameters, request body, responses, schemas).
3. For auth/OAuth questions, check the guides directory.
4. For webhook payloads, check the webhook-events directory.
5. Always reference the specific endpoint path and operation ID when discussing API calls.

## Key Concepts

- GHL uses OAuth 2.0 for authentication. Apps get access via the marketplace.
- APIs are scoped — each endpoint requires specific OAuth scopes.
- The API base URL is `https://services.leadconnectorhq.com`.
- "Locations" are now called "Sub-Accounts" in the UI but the API still uses `locations`.
- Most endpoints require either a `locationId` (sub-account) or work at the agency/company level.

## API Domains

The GHL API covers: OAuth, Agencies, Associations, Blogs, Businesses, Calendars, Campaigns, Companies, Contacts, Conversations, Courses, Custom Fields, Custom Menus, Emails, Email ISV, Forms, Funnels, Invoices, Links, Locations (Sub-Accounts), Marketplace, Media, Objects, Opportunities, Payments, Phone System, Products, Proposals, SaaS, Snapshots, Social Media Posting, Store, Surveys, Users, Voice AI, and Workflows.
