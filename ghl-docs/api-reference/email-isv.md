# Email ISV API

Documentation for Email ISV API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### POST `/email/verify`

Email Verification

Verify Email

Operation ID: `verify-email`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location Id, The email verification charges will be deducted from this location (if rebilling is enabled) / company wallet |

**Request Body (required):**

Content-Type: `application/json`

Schema: `VerificationBodyDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: email, contact) | Yes | Email Verification type |
| `verify` | string | Yes | Email Verification recepient (email address / contactId) |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### EmailNotVerifiedResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `verified` | boolean | Yes | Email verification not processed |
| `message` | string | No | Email verification failure message |
| `address` | string | No | Email address |


### LeadConnectorRecomandationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `isEmailValid` | boolean | No | Email verification status |


### EmailVerifiedResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `reason` | array<string> | No | Reason for email verification failure |
| `result` | string (enum: deliverable, undeliverable, do_not_send, unknown, catch_all) | Yes | Email verification result |
| `risk` | string (enum: high, low, medium, unknown) | Yes | Risk level of email sending to bounce |
| `address` | string | Yes | Email address |
| `leadconnectorRecomendation` | object | Yes | Lead Connector email verification recomendation |


### VerificationBodyDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: email, contact) | Yes | Email Verification type |
| `verify` | string | Yes | Email Verification recepient (email address / contactId) |


