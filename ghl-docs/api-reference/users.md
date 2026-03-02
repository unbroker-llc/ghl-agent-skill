# Users API

Documentation for users API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.
- **Agency-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency.

## Endpoints

### GET `/users/search`

Search Users

Search Users

Operation ID: `search-users`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `companyId` | query | string | Yes | Company ID in which the search needs to be performed |
| `query` | query | string | No | The search term for the user is matched based on the user full name, email or phone |
| `skip` | query | string | No | No of results to be skipped before returning the result |
| `limit` | query | string | No | No of results to be limited before returning the result |
| `locationId` | query | string | No | Location ID in which the search needs to be performed |
| `type` | query | string | No | Type of the users to be filtered in the search |
| `role` | query | string | No | Role of the users to be filtered in the search |
| `ids` | query | string | No | List of User IDs to be filtered in the search |
| `sort` | query | string | No | The field on which sort is applied in which the results need to be sorted. Default is based on the first and last name |
| `sortDirection` | query | string | No | The direction in which the results need to be sorted |
| `enabled2waySync` | query | boolean | No | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/users/search/filter-by-email`

Filter Users by Email

Filter users by company ID, deleted status, and email array

Operation ID: `filter-users-by-email`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `FilterByEmailDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `companyId` | string | Yes | Company ID to filter users |
| `emails` | array<string> | Yes | Array of email addresses to filter users |
| `deleted` | boolean | No | Filter deleted users |
| `skip` | string | No | No of results to be skipped before returning the result |
| `limit` | string | No | No of results to be limited before returning the result |
| `projection` | string | No | Projection fields to return. Use "all" for all fields, or specify comma-separated field names. Default returns only id and email |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/users/{userId}`

Get User

Get User

Operation ID: `get-user`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `userId` | path | string | Yes | User Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/users/{userId}`

Update User

Update User

Operation ID: `update-user`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateUserDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `email` | string | No | Email update is no longer supported due to security reasons. |
| `emailChangeOTP` | string | No | OTP to change the email ID of the user |
| `password` | string | No | - |
| `phone` | string | No | - |
| `type` | string | No | - |
| `role` | string | No | - |
| `companyId` | string | No | Company/Agency Id. Required for Agency Level access |
| `locationIds` | array<string> | No | - |
| `permissions` | PermissionsDto | No | - |
| `scopes` | array<string> | No | Scopes allowed for users. Only scopes that have been passed will be enabled. If passed empty all the scopes will be get disabled |
| `scopesAssignedToOnly` | array<string> | No | Assigned Scopes allowed for users. Only scopes that have been passed will be enabled. If passed empty all the assigned scopes will be get disabled |
| `profilePhoto` | string | No | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/users/{userId}`

Delete User

Delete User

Operation ID: `delete-user`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/users/`

Get User by Location

Get User by Location

Operation ID: `get-user-by-location`

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

### POST `/users/`

Create User

Create User

Operation ID: `create-user`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateUserDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `companyId` | string | Yes | - |
| `firstName` | string | Yes | - |
| `lastName` | string | Yes | - |
| `email` | string | Yes | - |
| `password` | string | Yes | - |
| `phone` | string | No | - |
| `type` | string | Yes | - |
| `role` | string | Yes | - |
| `locationIds` | array<string> | Yes | - |
| `permissions` | PermissionsDto | No | - |
| `scopes` | array<string> | No | Scopes allowed for users. Only scopes that have been passed will be enabled. Note:- If passed empty all the scopes will be get disabled |
| `scopesAssignedToOnly` | array<string> | No | Assigned Scopes allowed for users. Only scopes that have been passed will be enabled. If passed empty all the assigned scopes will be get disabled |
| `profilePhoto` | string | No | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### PermissionsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `campaignsEnabled` | boolean | No | - |
| `campaignsReadOnly` | boolean | No | - |
| `contactsEnabled` | boolean | No | - |
| `workflowsEnabled` | boolean | No | - |
| `workflowsReadOnly` | boolean | No | - |
| `triggersEnabled` | boolean | No | - |
| `funnelsEnabled` | boolean | No | - |
| `websitesEnabled` | boolean | No | - |
| `opportunitiesEnabled` | boolean | No | - |
| `dashboardStatsEnabled` | boolean | No | - |
| `bulkRequestsEnabled` | boolean | No | - |
| `appointmentsEnabled` | boolean | No | - |
| `reviewsEnabled` | boolean | No | - |
| `onlineListingsEnabled` | boolean | No | - |
| `phoneCallEnabled` | boolean | No | - |
| `conversationsEnabled` | boolean | No | - |
| `assignedDataOnly` | boolean | No | - |
| `adwordsReportingEnabled` | boolean | No | - |
| `membershipEnabled` | boolean | No | - |
| `facebookAdsReportingEnabled` | boolean | No | - |
| `attributionsReportingEnabled` | boolean | No | - |
| `settingsEnabled` | boolean | No | - |
| `tagsEnabled` | boolean | No | - |
| `leadValueEnabled` | boolean | No | - |
| `marketingEnabled` | boolean | No | - |
| `agentReportingEnabled` | boolean | No | - |
| `botService` | boolean | No | - |
| `socialPlanner` | boolean | No | - |
| `bloggingEnabled` | boolean | No | - |
| `invoiceEnabled` | boolean | No | - |
| `affiliateManagerEnabled` | boolean | No | - |
| `contentAiEnabled` | boolean | No | - |
| `refundsEnabled` | boolean | No | - |
| `recordPaymentEnabled` | boolean | No | - |
| `cancelSubscriptionEnabled` | boolean | No | - |
| `paymentsEnabled` | boolean | No | - |
| `communitiesEnabled` | boolean | No | - |
| `exportPaymentsEnabled` | boolean | No | - |


### RoleSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string | No | - |
| `role` | string | No | - |
| `locationIds` | array<string> | No | - |
| `restrictSubAccount` | boolean | No | - |


### UserSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `email` | string | No | - |
| `phone` | string | No | - |
| `extension` | string | No | - |
| `permissions` | PermissionsDto | No | - |
| `scopes` | string (enum: campaigns.readonly, campaigns.write, calendars.readonly, calendars/events.write, calendars/groups.write, calendars.write, contacts.write, contacts/bulkActions.write, ...) | No | - |
| `roles` | RoleSchema | No | - |
| `deleted` | boolean | No | - |
| `lcPhone` | object | No | LC Phone Inbound Phone Numbers |


### SearchUserSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `users` | array<UserSchema> | No | - |
| `count` | number | No | - |


### FilterByEmailDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `companyId` | string | Yes | Company ID to filter users |
| `emails` | array<string> | Yes | Array of email addresses to filter users |
| `deleted` | boolean | No | Filter deleted users |
| `skip` | string | No | No of results to be skipped before returning the result |
| `limit` | string | No | No of results to be limited before returning the result |
| `projection` | string | No | Projection fields to return. Use "all" for all fields, or specify comma-separated field names. Default returns only id and email |


### LocationSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `users` | array<UserSchema> | No | - |


### UserSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `email` | string | No | - |
| `phone` | string | No | - |
| `extension` | string | No | - |
| `permissions` | PermissionsDto | No | - |
| `scopes` | string (enum: campaigns.readonly, campaigns.write, calendars.readonly, calendars/events.write, calendars/groups.write, calendars.write, contacts.write, contacts/bulkActions.write, ...) | No | - |
| `roles` | RoleSchema | No | - |
| `lcPhone` | object | No | LC Phone Inbound Phone Numbers |


### CreateUserDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `companyId` | string | Yes | - |
| `firstName` | string | Yes | - |
| `lastName` | string | Yes | - |
| `email` | string | Yes | - |
| `password` | string | Yes | - |
| `phone` | string | No | - |
| `type` | string | Yes | - |
| `role` | string | Yes | - |
| `locationIds` | array<string> | Yes | - |
| `permissions` | PermissionsDto | No | - |
| `scopes` | array<string> | No | Scopes allowed for users. Only scopes that have been passed will be enabled. Note:- If passed empty all the scopes will be get disabled |
| `scopesAssignedToOnly` | array<string> | No | Assigned Scopes allowed for users. Only scopes that have been passed will be enabled. If passed empty all the assigned scopes will be get disabled |
| `profilePhoto` | string | No | - |


### UpdateUserDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `email` | string | No | Email update is no longer supported due to security reasons. |
| `emailChangeOTP` | string | No | OTP to change the email ID of the user |
| `password` | string | No | - |
| `phone` | string | No | - |
| `type` | string | No | - |
| `role` | string | No | - |
| `companyId` | string | No | Company/Agency Id. Required for Agency Level access |
| `locationIds` | array<string> | No | - |
| `permissions` | PermissionsDto | No | - |
| `scopes` | array<string> | No | Scopes allowed for users. Only scopes that have been passed will be enabled. If passed empty all the scopes will be get disabled |
| `scopesAssignedToOnly` | array<string> | No | Assigned Scopes allowed for users. Only scopes that have been passed will be enabled. If passed empty all the assigned scopes will be get disabled |
| `profilePhoto` | string | No | - |


### DeleteUserSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |
| `message` | string | No | - |


