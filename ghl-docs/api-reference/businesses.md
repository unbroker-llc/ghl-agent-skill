# Business API

Documentation for business API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### PUT `/businesses/{businessId}`

Update Business

Update Business

Operation ID: `update-business`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `businessId` | path | string | Yes | - |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateBusinessDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | No | - |
| `phone` | string | No | - |
| `email` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `address` | string | No | - |
| `state` | string | No | - |
| `city` | string | No | - |
| `country` | string | No | - |
| `description` | string | No | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/businesses/{businessId}`

Delete Business

Delete Business

Operation ID: `delete-Business`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `businessId` | path | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/businesses/{businessId}`

Get Business

Get Business

Operation ID: `get-business`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `businessId` | path | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/businesses/`

Get Businesses by Location

Get Businesses by Location

Operation ID: `get-businesses-by-location`

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

### POST `/businesses/`

Create Business

Create Business

Operation ID: `create-business`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateBusinessDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `locationId` | string | Yes | - |
| `phone` | string | No | - |
| `email` | string | No | - |
| `website` | string | No | - |
| `address` | string | No | - |
| `city` | string | No | - |
| `postalCode` | string | No | - |
| `state` | string | No | - |
| `country` | string | No | - |
| `description` | string | No | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### BusinessCreatedByOrUpdatedBy

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### BusinessDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Business Id |
| `name` | string | Yes | Business Name |
| `phone` | string | No | phone number |
| `email` | string | No | email |
| `website` | string | No | website |
| `address` | string | No | address |
| `city` | string | No | city |
| `description` | string | No | description |
| `state` | string | No | state |
| `postalCode` | string | No | postal code |
| `country` | string | No | country |
| `updatedBy` | object | No | updated By |
| `locationId` | string | Yes | locaitonId |
| `createdBy` | object | No | Created By |
| `createdAt` | string | No | Creation Time |
| `updatedAt` | string | No | Last updation time |


### GetBusinessByLocationResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `businesses` | array<BusinessDto> | Yes | Business Response |


### CreateBusinessDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `locationId` | string | Yes | - |
| `phone` | string | No | - |
| `email` | string | No | - |
| `website` | string | No | - |
| `address` | string | No | - |
| `city` | string | No | - |
| `postalCode` | string | No | - |
| `state` | string | No | - |
| `country` | string | No | - |
| `description` | string | No | - |


### UpdateBusinessResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Success Value |
| `buiseness` | object | Yes | Business Response |


### UpdateBusinessDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | No | - |
| `phone` | string | No | - |
| `email` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `address` | string | No | - |
| `state` | string | No | - |
| `city` | string | No | - |
| `country` | string | No | - |
| `description` | string | No | - |


### DeleteBusinessResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Success value |


### GetBusinessByIdResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `business` | object | Yes | Business Response |


