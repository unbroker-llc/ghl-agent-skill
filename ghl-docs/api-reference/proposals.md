# Documents and Contracts API

Documentation for Documents and Contracts API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.

## Endpoints

### GET `/proposals/document`

List documents

List documents for a location

Operation ID: `list-documents-contracts`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `locationId` | query | string | Yes | Location Id |
| `status` | query | string | No | Document status, pass as comma separated values |
| `paymentStatus` | query | string | No | Payment status, pass as comma separated values |
| `limit` | query | number | No | Limit to fetch number of records |
| `skip` | query | number | No | Skip number of records |
| `query` | query | string | No | Search string |
| `dateFrom` | query | string | No | Date start from (ISO 8601), dateFrom & DateTo must be provided together |
| `dateTo` | query | string | No | Date to (ISO 8601), dateFrom & DateTo must be provided together |
| `Version` | header | string | Yes | API Version |

**Responses:**

- `200`: Document fetched successfully
- `400`: Unprocessable Entity

---

### POST `/proposals/document/send`

Send document

Send document to a client

Operation ID: `send-documents-contracts`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `SendDocumentDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `documentId` | string | Yes | Document Id |
| `documentName` | string | No | Document Name |
| `medium` | string (enum: link, email) | No | Medium to be used for sending the document |
| `ccRecipients` | array<CCRecipientItem> | No | CC Recipient |
| `notificationSettings` | object | No | - |
| `sentBy` | string | Yes | Sent ByUser Id |


**Responses:**

- `200`: Document sent successfully
- `400`: Unprocessable Entity

---

### GET `/proposals/templates`

List templates

List document contract templates for a location

Operation ID: `list-documents-contracts-templates`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `locationId` | query | string | Yes | Location Id |
| `dateFrom` | query | string | No | Date start from (ISO 8601) |
| `dateTo` | query | string | No | Date to (ISO 8601) |
| `type` | query | string | No | Comma-separated template types. Valid values: proposal, estimate, contentLibrary |
| `name` | query | string | No | Template Name |
| `isPublicDocument` | query | boolean | No | If the docForm is a DocForm |
| `userId` | query | string | No | User Id, required when isPublicDocument is true |
| `limit` | query | string | No | Limit |
| `skip` | query | string | No | Skip |
| `Version` | header | string | Yes | API Version |

**Responses:**

- `200`: Templates fetched successfully
- `400`: Unprocessable Entity

---

### POST `/proposals/templates/send`

Send template

Send template to a client

Operation ID: `send-documents-contracts-template`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `SendDocumentFromPublicApiBodyDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `templateId` | string | Yes | Template Id |
| `userId` | string | Yes | User Id |
| `sendDocument` | boolean | No | Send Document |
| `locationId` | string | Yes | Location Id |
| `contactId` | string | Yes | Contact Id |
| `opportunityId` | string | No | Opportunity Id |


**Responses:**

- `200`: Document sent successfully
- `400`: Unprocessable Entity

---

## Schemas

### EntityReference

Entity type


### ELEMENTS_LOOKUP

Element type


### FillableFieldsDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `fieldId` | string | Yes | Field Id |
| `isRequired` | boolean | Yes | Is the field required |
| `hasCompleted` | boolean | Yes | Has the field been completed |
| `recipient` | string | Yes | Recipient |
| `entityType` | EntityReference | Yes | - |
| `id` | string | Yes | Id |
| `type` | ELEMENTS_LOOKUP | Yes | - |
| `value` | string | Yes | Value of the field |


### DiscountDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Unique identifier for the discount |
| `value` | number | Yes | Discount value (either a percentage or custom amount) |
| `type` | string (enum: percentage, custom_amount) | Yes | Type of discount |


### GrandTotalDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `amount` | number | Yes | Total amount before discounts |
| `currency` | string | Yes | Currency of the total amount |
| `discountPercentage` | number | Yes | Total discount percentage applied |
| `discounts` | array<DiscountDto> | Yes | List of applied discounts |


### RecipientItem

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Recipient Id |
| `firstName` | string | No | Recipient First Name |
| `lastName` | string | No | Recipient Last Name |
| `email` | string | Yes | Recipient Email |
| `phoneNumber` | string | No | Recipient Phone Number |
| `phone` | string | No | Recipient Phone |
| `hasCompleted` | boolean | Yes | Recipient has completed the document |
| `role` | string (enum: user, signer) | Yes | Recipient role |
| `isPrimary` | boolean | Yes | Recipient is primary |
| `signingOrder` | number | Yes | Recipient signing order |
| `imgUrl` | string | No | Recipient image url |
| `ip` | string | No | Recipient ip |
| `userAgent` | string | No | Recipient user agent |
| `signedDate` | string | No | Recipient signed date |
| `contactName` | string | No | Recipient contact name |
| `country` | string | No | Recipient country |
| `entityName` | string | No | Recipient entity name |
| `initialsImgUrl` | string | No | Recipient initials image url |
| `lastViewedAt` | string | No | Recipient last viewed date |
| `shareLink` | string | No | Share link |


### ProposalEstimateLinksDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `referenceId` | string | Yes | Reference ID |
| `documentId` | string | Yes | Document ID |
| `recipientId` | string | Yes | Recipient ID |
| `entityName` | string (enum: contacts, users) | Yes | Entity name that the recipient belongs to |
| `recipientCategory` | string (enum: recipient, cc, bcc) | Yes | Recipient category (recipient, cc, or bcc) |
| `documentRevision` | number | Yes | Document revision number |
| `createdBy` | string | Yes | Created by user ID |
| `deleted` | boolean | Yes | Whether the document is deleted |


### DocumentDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `documentId` | string | Yes | Document Id |
| `_id` | string | Yes | Unique identifier |
| `name` | string | Yes | Name of the document |
| `type` | string | Yes | Type of the document |
| `deleted` | boolean | Yes | Whether the document is deleted |
| `isExpired` | boolean | Yes | Whether the document is expired |
| `documentRevision` | number | Yes | Number of times document is moved to draft state |
| `fillableFields` | array<FillableFieldsDTO> | Yes | Fillable fields |
| `grandTotal` | object | Yes | Grand total object of the document |
| `locale` | string | Yes | Locale of the location |
| `status` | array<string> | Yes | Document status |
| `paymentStatus` | array<string> | Yes | Payment status |
| `recipients` | array<RecipientItem> | Yes | Recipients |
| `links` | array<ProposalEstimateLinksDto> | Yes | Links for the document if its sent |
| `updatedAt` | string | Yes | Date start from (ISO 8601) |
| `createdAt` | string | Yes | Date to (ISO 8601) |


### DocumentListResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `documents` | array<DocumentDto> | Yes | List of documents |
| `total` | number | Yes | Total records available |
| `whiteLabelBaseUrl` | number | No | WhiteLabel url for document |
| `whiteLabelBaseUrlForInvoice` | number | No | WhiteLabel url for invoice |


### BadRequestDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `statusCode` | number | No | - |
| `message` | string | No | - |


### CCRecipientItem

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `email` | string | Yes | Email |
| `id` | string | Yes | Contact ID |
| `imageUrl` | string | Yes | Contact Image URL |
| `contactName` | string | Yes | Contact Name |
| `firstName` | string | Yes | First Name |
| `lastName` | string | Yes | Last Name |


### NotificationSendSettingDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `templateId` | string | Yes | - |
| `subject` | string | Yes | - |


### NotificationSenderSettingDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `fromEmail` | string | Yes | - |
| `fromName` | string | Yes | - |


### NotificationSettingsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `receive` | NotificationSendSettingDto | Yes | - |
| `sender` | NotificationSenderSettingDto | Yes | - |


### SendDocumentDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `documentId` | string | Yes | Document Id |
| `documentName` | string | No | Document Name |
| `medium` | string (enum: link, email) | No | Medium to be used for sending the document |
| `ccRecipients` | array<CCRecipientItem> | No | CC Recipient |
| `notificationSettings` | object | No | - |
| `sentBy` | string | Yes | Sent ByUser Id |


### SendDocumentResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Success status |
| `links` | array<ProposalEstimateLinksDto> | Yes | Links for all recipients |


### TemplateListResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Template ID |
| `deleted` | boolean | Yes | Whether the template is deleted |
| `version` | number | Yes | Template version |
| `name` | string | Yes | Template name |
| `locationId` | string | Yes | Location ID |
| `type` | string (enum: proposal, estimate, contentLibrary) | Yes | Template type |
| `updatedBy` | string | Yes | User ID who last updated the template |
| `isPublicDocument` | boolean | Yes | Whether the template is a public document |
| `createdAt` | string | Yes | Template creation date |
| `updatedAt` | string | Yes | Template last update date |
| `id` | string | Yes | Template ID (alias for _id) |
| `documentCount` | number | No | Document count (only present when isPublicDocument is true) |
| `docFormUrl` | string | No | Document form URL (only present when isPublicDocument is true) |


### TemplateListPaginationResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | array<TemplateListResponseDTO> | Yes | Array of templates |
| `total` | number | Yes | Total number of templates |
| `traceId` | string | No | Trace ID for request tracking |


### SendDocumentFromPublicApiBodyDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `templateId` | string | Yes | Template Id |
| `userId` | string | Yes | User Id |
| `sendDocument` | boolean | No | Send Document |
| `locationId` | string | Yes | Location Id |
| `contactId` | string | Yes | Contact Id |
| `opportunityId` | string | No | Opportunity Id |


### SendTemplateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Success status |
| `links` | array<ProposalEstimateLinksDto> | Yes | Links for all recipients |


### UnauthorizedDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `statusCode` | number | No | - |
| `message` | string | No | - |
| `error` | string | No | - |



---

# OVERRIDES

> The following corrections and additions override inaccurate or incomplete
> information in the auto-generated docs above. When conflicts exist between
> the above content and the overrides below, the overrides are authoritative.

## SendDocumentDto.medium

The `medium` field accepts the following values:

- `link`
- `email`
- `sms`
- `sms_and_email`

The upstream docs incorrectly list only `link` and `email`. The value `sms_and_email` is also valid and sends the document via both SMS and email, similar for `sms`.
