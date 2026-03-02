# Opportunities API

Documentation for Opportunities API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### GET `/opportunities/search`

Search Opportunity

Search Opportunity

Operation ID: `search-opportunity`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `q` | query | string | No | - |
| `location_id` | query | string | Yes | Location Id |
| `pipeline_id` | query | string | No | Pipeline Id |
| `pipeline_stage_id` | query | string | No | stage Id |
| `contact_id` | query | string | No | Contact Id |
| `status` | query | string | No | - |
| `assigned_to` | query | string | No | - |
| `campaignId` | query | string | No | Campaign Id |
| `id` | query | string | No | Opportunity Id |
| `order` | query | string | No | - |
| `endDate` | query | string | No | End date |
| `startAfter` | query | string | No | Start After |
| `startAfterId` | query | string | No | Start After Id |
| `date` | query | string | No | Start date |
| `country` | query | string | No | - |
| `page` | query | number | No | - |
| `limit` | query | number | No | Limit Per Page records count. will allow maximum up to 100 and default will be 20 |
| `getTasks` | query | boolean | No | get Tasks in contact |
| `getNotes` | query | boolean | No | get Notes in contact |
| `getCalendarEvents` | query | boolean | No | get Calender event in contact |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/opportunities/pipelines`

Get Pipelines

Get Pipelines

Operation ID: `get-pipelines`

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

### GET `/opportunities/{id}`

Get Opportunity

Get Opportunity

Operation ID: `get-opportunity`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | Opportunity Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/opportunities/{id}`

Delete Opportunity

Delete Opportunity

Operation ID: `delete-opportunity`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | Opportunity Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/opportunities/{id}`

Update Opportunity

Update Opportunity

Operation ID: `update-opportunity`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | Opportunity Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateOpportunityDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `pipelineId` | string | No | pipeline Id |
| `name` | string | No | - |
| `pipelineStageId` | string | No | - |
| `status` | string (enum: open, won, lost, abandoned, all) | No | - |
| `monetaryValue` | number | No | - |
| `assignedTo` | string | No | - |
| `customFields` | array | No | Update custom fields to opportunities. |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/opportunities/{id}/status`

Update Opportunity Status

Update Opportunity Status

Operation ID: `update-opportunity-status`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | Opportunity Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateStatusDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | string (enum: open, won, lost, abandoned, all) | Yes | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/opportunities/upsert`

Upsert Opportunity

Upsert Opportunity

Operation ID: `Upsert-opportunity`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpsertOpportunityDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `pipelineId` | string | Yes | pipeline Id |
| `locationId` | string | Yes | locationId |
| `contactId` | string | Yes | contactId |
| `name` | string | No | name |
| `status` | string (enum: open, won, lost, abandoned, all) | No | - |
| `pipelineStageId` | string | No | - |
| `monetaryValue` | number | No | - |
| `assignedTo` | string | No | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/opportunities/{id}/followers`

Add Followers

Add Followers

Operation ID: `add-followers-opportunity`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | Opportunity Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `FollowersDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `followers` | array<string> | Yes | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/opportunities/{id}/followers`

Remove Followers

Remove Followers

Operation ID: `remove-followers-opportunity`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | Opportunity Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `FollowersDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `followers` | array<string> | Yes | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/opportunities/`

Create Opportunity

Create Opportunity

Operation ID: `create-opportunity`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `pipelineId` | string | Yes | pipeline Id |
| `locationId` | string | Yes | - |
| `name` | string | Yes | - |
| `pipelineStageId` | string | No | - |
| `status` | string (enum: open, won, lost, abandoned, all) | Yes | - |
| `contactId` | string | Yes | - |
| `monetaryValue` | number | No | - |
| `assignedTo` | string | No | - |
| `customFields` | array | No | Add custom fields to opportunities. |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### SearchOpportunitiesContactResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `companyName` | string | No | - |
| `email` | string | No | - |
| `phone` | string | No | - |
| `tags` | array<string> | No | - |


### CustomFieldResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `fieldValue` | object | Yes | The value of the custom field |


### SearchOpportunitiesResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `monetaryValue` | number | No | - |
| `pipelineId` | string | No | - |
| `pipelineStageId` | string | No | - |
| `assignedTo` | string | No | - |
| `status` | string | No | - |
| `source` | string | No | - |
| `lastStatusChangeAt` | string | No | - |
| `lastStageChangeAt` | string | No | - |
| `lastActionDate` | string | No | - |
| `indexVersion` | string | No | - |
| `createdAt` | string | No | - |
| `updatedAt` | string | No | - |
| `contactId` | string | No | - |
| `locationId` | string | No | - |
| `contact` | SearchOpportunitiesContactResponseSchema | No | - |
| `notes` | array<string> | No | - |
| `tasks` | array<string> | No | - |
| `calendarEvents` | array<string> | No | - |
| `customFields` | array<CustomFieldResponseSchema> | No | - |
| `followers` | array<array> | No | - |


### SearchMetaResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `total` | number | No | - |
| `nextPageUrl` | string | No | - |
| `startAfterId` | string | No | - |
| `startAfter` | number | No | - |
| `currentPage` | number | No | - |
| `nextPage` | number | No | - |
| `prevPage` | number | No | - |


### SearchSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `opportunities` | array<SearchOpportunitiesResponseSchema> | No | - |
| `meta` | SearchMetaResponseSchema | No | - |
| `aggregations` | object | No | - |


### PipelinesResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `stages` | array<array> | No | - |
| `showInFunnel` | boolean | No | - |
| `showInPieChart` | boolean | No | - |
| `locationId` | string | No | - |


### GetPipelinesSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `pipelines` | array<PipelinesResponseSchema> | No | - |


### GetPostOpportunitySuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `opportunity` | SearchOpportunitiesResponseSchema | No | - |


### DeleteUpdateOpportunitySuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |


### UpdateStatusDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | string (enum: open, won, lost, abandoned, all) | Yes | - |


### customFieldsInputArraySchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | array<string> | No | - |


### customFieldsInputObjectSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | object | No | - |


### customFieldsInputStringSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | Pass either `id` or `key` of custom field |
| `key` | string | No | Pass either `id` or `key` of custom field |
| `field_value` | string | No | - |


### CreateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `pipelineId` | string | Yes | pipeline Id |
| `locationId` | string | Yes | - |
| `name` | string | Yes | - |
| `pipelineStageId` | string | No | - |
| `status` | string (enum: open, won, lost, abandoned, all) | Yes | - |
| `contactId` | string | Yes | - |
| `monetaryValue` | number | No | - |
| `assignedTo` | string | No | - |
| `customFields` | array | No | Add custom fields to opportunities. |


### UpdateOpportunityDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `pipelineId` | string | No | pipeline Id |
| `name` | string | No | - |
| `pipelineStageId` | string | No | - |
| `status` | string (enum: open, won, lost, abandoned, all) | No | - |
| `monetaryValue` | number | No | - |
| `assignedTo` | string | No | - |
| `customFields` | array | No | Update custom fields to opportunities. |


### UpsertOpportunityDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `pipelineId` | string | Yes | pipeline Id |
| `locationId` | string | Yes | locationId |
| `contactId` | string | Yes | contactId |
| `name` | string | No | name |
| `status` | string (enum: open, won, lost, abandoned, all) | No | - |
| `pipelineStageId` | string | No | - |
| `monetaryValue` | number | No | - |
| `assignedTo` | string | No | - |


### UpsertOpportunitySuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `opportunity` | object | Yes | Updated / New Opportunity |
| `new` | boolean | Yes | - |


### FollowersDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `followers` | array<string> | Yes | - |


### CreateAddFollowersSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `followers` | array<string> | No | - |
| `followersAdded` | array<string> | No | - |


### DeleteFollowersSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `followers` | array<string> | No | - |
| `followersRemoved` | array<string> | No | - |


