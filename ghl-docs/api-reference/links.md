# Trigger Links API

Documentation for links API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### GET `/links/id/{linkId}`

Get Link by ID

Get a single link by its ID

Operation ID: `get-link-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location Id |
| `linkId` | path | string | Yes | Link Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/links/{linkId}`

Update Link

Update Link

Operation ID: `update-link`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `linkId` | path | string | Yes | Link Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `LinkUpdateDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `redirectTo` | string | Yes | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/links/{linkId}`

Delete Link

Delete Link

Operation ID: `delete-link`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `linkId` | path | string | Yes | Link Id |

**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/links/search`

Search Trigger Links

Get list of links by searching

Operation ID: `search-trigger-links`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location Id |
| `query` | query | string | No | Search query as a string |
| `skip` | query | number | No | Numbers of query results to skip |
| `limit` | query | number | No | Limit on number of search results |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/links/`

Get Links

Get Links

Operation ID: `get-links`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/links/`

Create Link

Create Link

Operation ID: `create-link`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `LinksDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `name` | string | Yes | - |
| `redirectTo` | string | Yes | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### LinkSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `redirectTo` | string | No | - |
| `fieldKey` | string | No | - |
| `locationId` | string | No | - |


### GetLinksSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `links` | array<LinkSchema> | No | - |


### LinksDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `name` | string | Yes | - |
| `redirectTo` | string | Yes | - |


### GetLinkSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `link` | LinkSchema | No | - |


### LinkUpdateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `redirectTo` | string | Yes | - |


### DeleteLinksSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |


