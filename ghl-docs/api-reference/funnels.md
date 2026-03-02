# Funnels API

Documentation for funnels API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### POST `/funnels/lookup/redirect`

Create Redirect

The "Create Redirect" API Allows adding a new url redirect to the system. Use this endpoint to create a url redirect with the specified details. Ensure that the required information is provided in the request payload.

Operation ID: `create-redirect`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateRedirectParams`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `domain` | string | Yes | - |
| `path` | string | Yes | - |
| `target` | string | Yes | - |
| `action` | string (enum: funnel, website, url, all) | Yes | - |


**Responses:**

- `200`: Successful response
- `422`: Unprocessable Entity

---

### PATCH `/funnels/lookup/redirect/{id}`

Update Redirect By Id

The "Update Redirect By Id" API Allows updating an existing URL redirect in the system. Use this endpoint to modify a URL redirect with the specified ID using details provided in the request payload.

Operation ID: `update-redirect-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | - |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateRedirectParams`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `target` | string | Yes | - |
| `action` | string (enum: funnel, website, url, all) | Yes | - |
| `locationId` | string | Yes | - |


**Responses:**

- `200`: Successful response
- `422`: Unprocessable Entity

---

### DELETE `/funnels/lookup/redirect/{id}`

Delete Redirect By Id

The "Delete Redirect By Id" API Allows deletion of a URL redirect from the system using its unique identifier. Use this endpoint to delete a URL redirect with the specified ID using details provided in the request payload.

Operation ID: `delete-redirect-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | - |
| `locationId` | query | string | Yes | - |

**Responses:**

- `200`: Successful response - URL redirect deleted successfully
- `422`: Unprocessable Entity - The provided data is invalid or incomplete

---

### GET `/funnels/lookup/redirect/list`

Fetch List of Redirects

Retrieves a list of all URL redirects based on the given query parameters.

Operation ID: `fetch-redirects-list`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | - |
| `limit` | query | number | Yes | - |
| `offset` | query | number | Yes | - |
| `search` | query | string | No | - |

**Responses:**

- `200`: Successful response - List of URL redirects returned
- `422`: Unprocessable Entity - The provided data is invalid or incomplete

---

### GET `/funnels/funnel/list`

Fetch List of Funnels

Retrieves a list of all funnels based on the given query parameters.

Operation ID: `getFunnels`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `locationId` | query | string | Yes | - |
| `type` | query | string | No | - |
| `category` | query | string | No | - |
| `offset` | query | string | No | - |
| `limit` | query | string | No | - |
| `parentId` | query | string | No | - |
| `name` | query | string | No | - |

**Responses:**

- `200`: Successful response - List of funnels returned

---

### GET `/funnels/page`

Fetch list of funnel pages

Retrieves a list of all funnel pages based on the given query parameters.

Operation ID: `getPagesByFunnelId`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `locationId` | query | string | Yes | - |
| `funnelId` | query | string | Yes | - |
| `name` | query | string | No | - |
| `limit` | query | number | Yes | - |
| `offset` | query | number | Yes | - |

**Responses:**

- `200`: Successful response - List of funnel pages returned

---

### GET `/funnels/page/count`

Fetch count of funnel pages

Retrieves count of all funnel pages based on the given query parameters.

Operation ID: `getPagesCountByFunnelId`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `locationId` | query | string | Yes | - |
| `funnelId` | query | string | Yes | - |
| `name` | query | string | No | - |

**Responses:**

- `200`: Successful response - Count of funnel pages returned

---

## Schemas

### CreateRedirectParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `domain` | string | Yes | - |
| `path` | string | Yes | - |
| `target` | string | Yes | - |
| `action` | string (enum: funnel, website, url, all) | Yes | - |


### RedirectResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Unique identifier of the redirect |
| `locationId` | string | Yes | Identifier of the location associated with the redirect |
| `domain` | string | Yes | Domain where the redirect occurs |
| `path` | string | Yes | Original path that will be redirected |
| `pathLowercase` | string | Yes | Lowercase version of the original path |
| `type` | string | Yes | Type of redirect (e.g., Permanent, Temporary) |
| `target` | string | Yes | Target URL to which the original path will be redirected |
| `action` | string | Yes | Action performed by the redirect |


### CreateRedirectResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | object | Yes | Data containing details of the created redirect |


### UpdateRedirectParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `target` | string | Yes | - |
| `action` | string (enum: funnel, website, url, all) | Yes | - |
| `locationId` | string | Yes | - |


### RedirectListResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | object | Yes | Object containing the count of redirects and an array of redirect data |


### DeleteRedirectResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | object | Yes | Status of the delete operation |


### UpdateRedirectResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | object | Yes | Data containing details of the updated redirect |


### FunnelPageResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | - |
| `locationId` | string | Yes | - |
| `funnelId` | string | Yes | - |
| `name` | string | Yes | - |
| `stepId` | string | Yes | - |
| `deleted` | string | Yes | - |
| `updatedAt` | string | Yes | - |


### FunnelPageCountResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `count` | number | Yes | - |


### FunnelListResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `funnels` | object | Yes | - |
| `count` | number | Yes | - |
| `traceId` | string | Yes | - |


