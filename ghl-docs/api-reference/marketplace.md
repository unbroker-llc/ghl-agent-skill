# Developer marketplace API

Documentation for Marketplace API

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

### POST `/marketplace/billing/charges`

Create a new wallet charge

Create a new wallet charge

Operation ID: `charge`

**Request Body (required):**

Content-Type: `application/json`

Schema: `RaiseChargeBodyDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `appId` | string | Yes | App ID of the App |
| `meterId` | string | Yes | Billing Meter ID (you can find this on your app's pricing page) |
| `eventId` | string | Yes | Event ID / Transaction ID on your server's side. This will help you maintain the reference of the event/transaction on your end that you charged the customer for. |
| `userId` | string | No | User ID |
| `locationId` | string | Yes | ID of the Sub-Account to be charged |
| `companyId` | string | Yes | ID of the Agency the Sub-account belongs to |
| `description` | string | Yes | Description of the charge |
| `price` | number | No | Price per unit to charge |
| `units` | string | Yes | Number of units to charge |
| `eventTime` | string | No | The timestamp when the event/transaction was performed. If blank, the billing timestamp will be set as the event time. ISO8601 Format. |


**Responses:**

- `201`: Charge created successfully
- `400`: Bad request
- `422`: Unprocessable Entity

---

### GET `/marketplace/billing/charges`

Get all wallet charges

Get all wallet charges

Operation ID: `getCharges`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `meterId` | query | string | No | Billing Meter ID (you can find this on your app's pricing page on the developer portal) |
| `eventId` | query | string | No | Event ID / Transaction ID |
| `userId` | query | string | No | Filter results by User ID that your server passed via API when the charge was created |
| `startDate` | query | string | No | Filter results AFTER a specific date. Use this in combination with endDate to filter results in a specific time window. |
| `endDate` | query | string | No | Filter results BEFORE a specific date. Use this in combination with startDate to filter results in a specific time window. |
| `skip` | query | number | No | Number of records to skip |
| `limit` | query | number | No | Maximum number of records to return |

**Responses:**

- `200`: Returns list of wallet charges
- `422`: Unprocessable Entity

---

### DELETE `/marketplace/billing/charges/{chargeId}`

Delete a wallet charge

Delete a wallet charge

Operation ID: `deleteCharge`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `chargeId` | path | string | Yes | ID of the charge to delete |

**Responses:**

- `200`: Charge deleted successfully
- `404`: Charge not found
- `422`: Unprocessable Entity

---

### GET `/marketplace/billing/charges/{chargeId}`

Get specific wallet charge details

Get specific wallet charge details

Operation ID: `getSpecificCharge`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `chargeId` | path | string | Yes | ID of the charge to retrieve |

**Responses:**

- `200`: Returns charge details
- `404`: Charge not found
- `422`: Unprocessable Entity

---

### GET `/marketplace/billing/charges/has-funds`

Check if account has sufficient funds

Check if account has sufficient funds

Operation ID: `hasFunds`

**Responses:**

- `200`: Returns fund availability status
- `422`: Unprocessable Entity

---

### DELETE `/marketplace/app/{appId}/installations`

Uninstall an application

Uninstalls an application from your company or a specific location. This will remove the application`s access and stop all its functionalities

Operation ID: `uninstall-application`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `appId` | path | string | Yes | The application id which is to be uninstalled. |
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `DeleteIntegrationBodyDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `companyId` | string | No | The company id from which the application is to be uninstalled. If you pass agency token, then companyId is required. It will uninstall application from agency as well as all sub-accounts. |
| `locationId` | string | No | The location id from which the application is to be uninstalled. If you pass location token, then locationId is required. It will uninstall application from that location only. |
| `reason` | string | No | The reason for uninstalling the application. Reason is required if you are uninstalling the application as a developer. |


**Responses:**

- `200`: Successfully uninstalled the application
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/marketplace/app/{appId}/installations`

Get Installer Details

Fetches installer details for the authenticated user. This endpoint returns information about the company, location, user, and installation details associated with the current OAuth token.

Operation ID: `get-installer-details`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `appId` | path | string | Yes | ID of the app to get installer details |

**Responses:**

- `200`: Successfully retrieved installer details. Returns company, location, user, and installation information.
- `400`: Bad Request. Invalid request parameters or missing required data.
- `403`: Forbidden. The client does not have necessary permissions to access installer details.

---

## Schemas

### RaiseChargeBodyDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `appId` | string | Yes | App ID of the App |
| `meterId` | string | Yes | Billing Meter ID (you can find this on your app's pricing page) |
| `eventId` | string | Yes | Event ID / Transaction ID on your server's side. This will help you maintain the reference of the event/transaction on your end that you charged the customer for. |
| `userId` | string | No | User ID |
| `locationId` | string | Yes | ID of the Sub-Account to be charged |
| `companyId` | string | Yes | ID of the Agency the Sub-account belongs to |
| `description` | string | Yes | Description of the charge |
| `price` | number | No | Price per unit to charge |
| `units` | string | Yes | Number of units to charge |
| `eventTime` | string | No | The timestamp when the event/transaction was performed. If blank, the billing timestamp will be set as the event time. ISO8601 Format. |


### DeleteIntegrationBodyDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `companyId` | string | No | The company id from which the application is to be uninstalled. If you pass agency token, then companyId is required. It will uninstall application from agency as well as all sub-accounts. |
| `locationId` | string | No | The location id from which the application is to be uninstalled. If you pass location token, then locationId is required. It will uninstall application from that location only. |
| `reason` | string | No | The reason for uninstalling the application. Reason is required if you are uninstalling the application as a developer. |


### DeleteIntegrationResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | The status of the uninstallation of the application |


### WhitelabelDetailsDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `domain` | string | Yes | Domain of the whitelabel company |
| `logoUrl` | string | Yes | Logo URL of the whitelabel company |


### InstallerDetailsDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `companyId` | string | Yes | Company ID |
| `locationId` | string | No | Location ID (if applicable) |
| `companyName` | string | Yes | Company name |
| `companyEmail` | string | Yes | Company email |
| `companyOwnerFullName` | string | No | Company owner full name |
| `userId` | string | Yes | User ID who installed the app |
| `isWhitelabelCompany` | boolean | Yes | Whether the company is a whitelabel company |
| `companyHighLevelPlan` | string | No | Company plan |
| `marketplaceAppPlanId` | string | No | Marketplace app plan ID for paid apps |
| `whitelabelDetails` | object | No | Whitelabel details (only present if isWhitelabelCompany is true) |


### GetInstallerDetailsResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `installationDetails` | object | Yes | Installation details |


