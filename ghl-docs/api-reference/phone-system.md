# Phone System API

Documentation for Phone System API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.

## Endpoints

### GET `/phone-system/number-pools`

List Number Pools

Get list of number pools

Operation ID: `getNumberPoolList`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `locationId` | query | string | No | Location ID to filter pools |
| `Version` | header | string | Yes | API Version |

**Responses:**

- `200`: Successfully retrieved number pools list
- `400`: Bad request - Invalid location ID or parameters
- `401`: Unauthorized - Invalid or missing authentication token
- `403`: Forbidden - Insufficient permissions for this location

---

### GET `/phone-system/numbers/location/{locationId}`

List active numbers

Retrieve a paginated list of active phone numbers for a specific location. Supports filtering, pagination, and optional exclusion of number pool assignments.

Operation ID: `active-numbers`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `locationId` | path | string | Yes | The unique identifier of the location |
| `pageSize` | query | number | No | How many resources to return in each list page. The default is 50, and the maximum is 1000. |
| `page` | query | number | No | The page index for pagination. The default is 0. |
| `searchFilter` | query | string | No | Filter numbers by phone number pattern. Supports partial matching (e.g., "+91" to find all Indian numbers). |
| `skipNumberPool` | query | boolean | No | Whether to exclude numbers that are assigned to number pools. Default is true. |
| `Version` | header | string | Yes | API Version |

**Responses:**

- `200`: Successfully retrieved list of active numbers
- `400`: Bad request - Invalid parameters
- `401`: Unauthorized
- `404`: Phone system not connected
- `500`: Internal server error

---

## Schemas

### DetailedPhoneNumberDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `phoneNumber` | string | Yes | E.164 formatted phone number |
| `friendlyName` | string | No | Human-readable name assigned to the number |
| `sid` | string | Yes | Phone number SID (unique identifier) |
| `countryCode` | string | Yes | ISO 3166-1 alpha-2 country code |
| `capabilities` | object | Yes | Communication capabilities supported by this number |
| `type` | string (enum: local, toll-free, mobile, national) | Yes | Type of phone number (local, toll-free, mobile, etc.) |
| `isDefaultNumber` | boolean | Yes | Whether this is the default outbound number for the location |
| `linkedUser` | string | No | User ID of the user assigned to this number |
| `linkedRingAllUsers` | array<string> | Yes | Array of user IDs that should ring when this number is called |
| `inboundCallService` | object | No | Configuration for inbound call handling service |
| `forwardingNumber` | string | No | Phone number to forward calls to |
| `isGroupConversationEnabled` | boolean | Yes | Whether group conversations are enabled for this number (US/CA numbers with SMS/MMS only) |
| `addressSid` | string | No | Address SID for compliance purposes |
| `bundleSid` | string | No | Bundle SID for regulatory compliance |
| `dateAdded` | string | No | When the number was originally purchased/added |
| `dateUpdated` | string | No | When the number configuration was last updated |
| `origin` | string (enum: twilio, hosted, ported) | No | Source or origin of the phone number |


### NumberPoolDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | Unique identifier for the number pool |
| `name` | string | No | Human-readable name of the number pool |
| `locationId` | string | No | Location ID this pool belongs to |
| `numbers` | array<object> | No | Phone numbers in this pool |
| `forwardingNumber` | string | No | Number to forward calls to |
| `whisper` | boolean | No | Whether whisper is enabled |
| `whisperMessage` | string | No | Message played during whisper |
| `callRecording` | boolean | No | Whether call recording is enabled |
| `isActive` | boolean | No | Whether the number pool is active |
| `inboundCallService` | object | No | Inbound call service configuration |


