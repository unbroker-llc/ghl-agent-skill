# Forms API

Documentation for forms API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### GET `/forms/submissions`

Get Forms Submissions

Get Forms Submissions

Operation ID: `get-forms-submissions`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | - |
| `page` | query | number | No | Page No. By default it will be 1 |
| `limit` | query | number | No | Limit Per Page records count. will allow maximum up to 100 and default will be 20 |
| `formId` | query | string | No | Filter submission by form id |
| `q` | query | string | No | Filter by contactId, name, email or phone no. |
| `startAt` | query | string | No | Get submission by starting of this date. By default it will be same date of last month(YYYY-MM-DD). |
| `endAt` | query | string | No | Get submission by ending of this date. By default it will be current date(YYYY-MM-DD). |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/forms/upload-custom-files`

Upload files to custom fields

Post the necessary fields for the API to upload files. The files need to be a buffer with the key "< custom_field_id >_< file_id >". <br /> Here custom field id is the ID of your custom field and file id is a randomly generated id (or uuid) <br /> There is support for multiple file uploads as well. Have multiple fields in the format mentioned.<br />File size is limited to 50 MB.<br /><br /> The allowed file types are: <br/> <ul><li>PDF</li><li>DOCX</li><li>DOC</li><li>JPG</li><li>JPEG</li><li>PNG</li><li>GIF</li><li>CSV</li><li>XLSX</li><li>XLS</li><li>MP4</li><li>MPEG</li><li>ZIP</li><li>RAR</li><li>TXT</li><li>SVG</li></ul> <br /><br /> The API will return the updated contact object.

Operation ID: `upload-to-custom-fields`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | query | string | Yes | Contact ID to upload the file to. |
| `locationId` | query | string | Yes | Location ID of the contact. |

**Request Body (required):**

Content-Type: `multipart/form-data`


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/forms/`

Get Forms

Get Forms

Operation ID: `get-forms`

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


### FormsSubmissionsSubmissionsSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `contactId` | string | No | - |
| `createdAt` | string | No | - |
| `formId` | string | No | - |
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


### FormsSubmissionsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `submissions` | array<FormsSubmissionsSubmissionsSchema> | No | - |
| `meta` | metaSchema | No | - |


### FormsParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `locationId` | string | No | - |


### FormsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `forms` | array<FormsParams> | No | - |
| `total` | number | No | Total number of forms |


