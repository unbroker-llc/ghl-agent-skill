# OAuth 2.0

Documentation for OAuth 2.0 API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### POST `/oauth/token`

Get Access Token

Use Access Tokens to access GoHighLevel resources on behalf of an authenticated location/company.

Operation ID: `get-access-token`

**Request Body (required):**

Content-Type: `application/x-www-form-urlencoded`

Schema: `GetAccessCodebodyDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `client_id` | string | Yes | The ID provided by GHL for your integration |
| `client_secret` | string | Yes | - |
| `grant_type` | string (enum: authorization_code, refresh_token, client_credentials) | Yes | - |
| `code` | string | No | - |
| `refresh_token` | string | No | - |
| `user_type` | string (enum: Company, Location) | No | The type of token to be requested |
| `redirect_uri` | string | No | The redirect URI for your application |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/oauth/locationToken`

Get Location Access Token from Agency Token

This API allows you to generate locationAccessToken from AgencyAccessToken

Operation ID: `get-location-access-token`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/x-www-form-urlencoded`

Schema: `GetLocationAccessCodeBodyDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `companyId` | string | Yes | Company Id of location you want to request token for |
| `locationId` | string | Yes | The location ID for which you want to obtain accessToken |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/oauth/installedLocations`

Get Location where app is installed

This API allows you fetch location where app is installed upon

Operation ID: `get-installed-location`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `skip` | query | string | No | Parameter to skip the number installed locations |
| `limit` | query | string | No | Parameter to limit the number installed locations |
| `query` | query | string | No | Parameter to search for the installed location by name |
| `isInstalled` | query | boolean | No | Filters out location which are installed for specified app under the specified company |
| `companyId` | query | string | Yes | Parameter to search by the companyId |
| `appId` | query | string | Yes | Parameter to search by the appId |
| `versionId` | query | string | No | VersionId of the app |
| `onTrial` | query | boolean | No | Filters out locations which are installed for specified app in trial mode |
| `planId` | query | string | No | Filters out location which are installed for specified app under the specified planId |
| `Version` | header | string | Yes | API Version |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### GetAccessCodebodyDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `client_id` | string | Yes | The ID provided by GHL for your integration |
| `client_secret` | string | Yes | - |
| `grant_type` | string (enum: authorization_code, refresh_token, client_credentials) | Yes | - |
| `code` | string | No | - |
| `refresh_token` | string | No | - |
| `user_type` | string (enum: Company, Location) | No | The type of token to be requested |
| `redirect_uri` | string | No | The redirect URI for your application |


### GetAccessCodeSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `access_token` | string | No | - |
| `token_type` | string | No | - |
| `expires_in` | number | No | - |
| `refresh_token` | string | No | - |
| `scope` | string | No | - |
| `userType` | string | No | - |
| `locationId` | string | No | Location ID - Present only for Sub-Account Access Token |
| `companyId` | string | No | Company ID |
| `approvedLocations` | array<string> | No | Approved locations to generate location access token |
| `userId` | string | Yes | USER ID - Represent user id of person who performed installation |
| `planId` | string | No | Plan Id of the subscribed plan in paid apps. |
| `isBulkInstallation` | boolean | No | - |


### GetLocationAccessCodeBodyDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `companyId` | string | Yes | Company Id of location you want to request token for |
| `locationId` | string | Yes | The location ID for which you want to obtain accessToken |


### GetLocationAccessTokenSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `access_token` | string | No | Location access token which can be used to authenticate & authorize API under following scope |
| `token_type` | string | No | - |
| `expires_in` | number | No | Time in seconds remaining for token to expire |
| `scope` | string | No | Scopes the following accessToken have access to |
| `locationId` | string | No | Location ID - Present only for Sub-Account Access Token |
| `planId` | string | No | Plan Id of the subscribed plan in paid apps. |
| `userId` | string | Yes | USER ID - Represent user id of person who performed installation |


### InstalledLocationSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Location ID |
| `name` | string | Yes | Name of the location |
| `address` | string | Yes | Address linked to location |
| `isInstalled` | boolean | No | Check if the requested app is installed for following location |


### GetInstalledLocationsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locations` | array<InstalledLocationSchema> | No | - |
| `count` | number | No | Total location count under the company |
| `installToFutureLocations` | boolean | No | Boolean to control if user wants app to be automatically installed to future locations |


