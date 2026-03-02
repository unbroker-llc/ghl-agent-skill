# Surveys API

Documentation for surveys API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### GET `/surveys/submissions`

Get Surveys Submissions

Get Surveys Submissions

Operation ID: `get-surveys-submissions`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | - |
| `page` | query | number | No | Page No. By default it will be 1 |
| `limit` | query | number | No | Limit Per Page records count. will allow maximum up to 100 and default will be 20 |
| `surveyId` | query | string | No | Filter submission by survey id |
| `q` | query | string | No | Filter by contactId, name, email or phone no. |
| `startAt` | query | string | No | Get submission by starting of this date. By default it will be same date of last month(YYYY-MM-DD). |
| `endAt` | query | string | No | Get submission by ending of this date. By default it will be current date(YYYY-MM-DD). |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/surveys/`

Get Surveys

Get Surveys

Operation ID: `get-surveys`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | - |
| `skip` | query | number | No | - |
| `limit` | query | number | No | Limit Per Page records count. will allow maximum up to 50 and default will be 10 |
| `type` | query | string | No | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

## Schemas

### GetSurveysSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `locationId` | string | No | - |


### GetSurveysSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `surveys` | array<GetSurveysSchema> | No | - |
| `total` | number | No | Number of surveys |


### PageDetailsSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `url` | string | No | - |
| `title` | string | No | - |


### ContactSessionIds

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `ids` | array<string> | No | - |


### EventDataSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `fbc` | string | No | - |
| `fbp` | string | No | - |
| `page` | PageDetailsSchema | No | - |
| `type` | string | No | - |
| `domain` | string | No | - |
| `medium` | string | No | - |
| `source` | string | No | - |
| `version` | string | No | - |
| `adSource` | string | No | - |
| `mediumId` | string | No | - |
| `parentId` | string | No | - |
| `referrer` | string | No | - |
| `fbEventId` | string | No | - |
| `timestamp` | number | No | - |
| `parentName` | string | No | - |
| `fingerprint` | string | No | - |
| `pageVisitType` | string | No | - |
| `contactSessionIds` | object | No | - |


### othersSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `__submissions_other_field__` | string | No | - |
| `__custom_field_id__` | string | No | - |
| `eventData` | EventDataSchema | No | - |
| `fieldsOriSequance` | array<string> | No | - |


### SubmissionSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `contactId` | string | No | - |
| `createdAt` | string | No | - |
| `surveyId` | string | No | - |
| `name` | string | No | - |
| `email` | string | No | - |
| `others` | othersSchema | No | - |


### metaSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `total` | number | No | - |
| `currentPage` | number | No | - |
| `nextPage` | number | No | - |
| `prevPage` | number | No | - |


### GetSurveysSubmissionSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `submissions` | array<SubmissionSchema> | No | - |
| `meta` | metaSchema | No | - |


