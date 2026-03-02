# MEMBERSHIPS API

API Service for Courses and Memberships

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### POST `/courses/courses-exporter/public/import`

Import Courses

Import Courses through public channels

Operation ID: `import-courses`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `PublicExporterPayload`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `userId` | string | No | - |
| `products` | array<ProductInterface> | Yes | - |


**Responses:**

- `201`: 

---

## Schemas

### visibility


### contentType


### type


### PostMaterialInterface

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | - |
| `type` | type | Yes | - |
| `url` | string | Yes | - |


### PostInterface

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | - |
| `visibility` | visibility | Yes | - |
| `thumbnailUrl` | string | No | - |
| `contentType` | contentType | Yes | - |
| `description` | string | Yes | - |
| `bucketVideoUrl` | string | No | - |
| `postMaterials` | array<PostMaterialInterface> | No | - |


### SubCategoryInterface

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | - |
| `visibility` | visibility | Yes | - |
| `thumbnailUrl` | string | No | - |
| `posts` | array<PostInterface> | No | - |


### CategoryInterface

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | - |
| `visibility` | visibility | Yes | - |
| `thumbnailUrl` | string | No | - |
| `posts` | array<PostInterface> | No | - |
| `subCategories` | array<SubCategoryInterface> | No | - |


### InstructorDetails

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `description` | string | Yes | - |


### ProductInterface

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | - |
| `description` | string | Yes | - |
| `imageUrl` | string | No | - |
| `categories` | array<CategoryInterface> | Yes | - |
| `instructorDetails` | InstructorDetails | No | - |


### PublicExporterPayload

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `userId` | string | No | - |
| `products` | array<ProductInterface> | Yes | - |


