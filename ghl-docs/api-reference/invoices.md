# Invoice API

Documentation for invoice API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.

## Endpoints

### POST `/invoices/template`

Create template

API to create a template

Operation ID: `create-invoice-template`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateInvoiceTemplateDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `internal` | boolean | No | - |
| `name` | string | Yes | Name of the template |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | - |
| `items` | array<InvoiceItemDto> | Yes | - |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `discount` | DiscountDto | No | - |
| `termsNotes` | string | No | - |
| `title` | string | No | Template title |
| `tipsConfiguration` | object | No | Configuration for tips on invoices |
| `lateFeesConfiguration` | object | No | Late fees configuration for the invoices |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `paymentMethods` | object | No | Payment Methods for Invoices |
| `attachments` | array<string> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/invoices/template`

List templates

API to get list of templates

Operation ID: `list-invoice-templates`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | location Id / company Id based on altType |
| `altType` | query | string | Yes | Alt Type |
| `status` | query | string | No | status to be filtered |
| `startAt` | query | string | No | startAt in YYYY-MM-DD format |
| `endAt` | query | string | No | endAt in YYYY-MM-DD format |
| `search` | query | string | No | To search for an invoice by id / name / email / phoneNo |
| `paymentMode` | query | string | No | payment mode |
| `limit` | query | string | Yes | Limit the number of items to return |
| `offset` | query | string | Yes | Number of items to skip |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/invoices/template/{templateId}`

Get an template

API to get an template by template id

Operation ID: `get-invoice-template`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `templateId` | path | string | Yes | Template Id |
| `altId` | query | string | Yes | location Id / company Id based on altType |
| `altType` | query | string | Yes | Alt Type |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/invoices/template/{templateId}`

Update template

API to update an template by template id

Operation ID: `update-invoice-template`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `templateId` | path | string | Yes | Template Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateInvoiceTemplateDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `internal` | boolean | No | - |
| `name` | string | Yes | Name of the template |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | - |
| `items` | array<InvoiceItemDto> | Yes | - |
| `discount` | DiscountDto | No | - |
| `termsNotes` | string | No | - |
| `title` | string | No | Template title |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/invoices/template/{templateId}`

Delete template

API to update an template by template id

Operation ID: `delete-invoice-template`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `templateId` | path | string | Yes | Template Id |
| `altId` | query | string | Yes | location Id / company Id based on altType |
| `altType` | query | string | Yes | Alt Type |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PATCH `/invoices/template/{templateId}/late-fees-configuration`

Update template late fees configuration

API to update template late fees configuration by template id

Operation ID: `update-invoice-template-late-fees-configuration`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `templateId` | path | string | Yes | Template Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateInvoiceLateFeesConfigurationDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `lateFeesConfiguration` | object | Yes | late fees configuration |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PATCH `/invoices/template/{templateId}/payment-methods-configuration`

Update template late fees configuration

API to update template late fees configuration by template id

Operation ID: `update-invoice-payment-methods-configuration`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `templateId` | path | string | Yes | Template Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdatePaymentMethodsConfigurationDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `paymentMethods` | object | No | Payment Methods for Invoices |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/schedule`

Create Invoice Schedule

API to create an invoice Schedule

Operation ID: `create-invoice-schedule`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateInvoiceScheduleDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | - |
| `contactDetails` | ContactDetailsDto | Yes | - |
| `schedule` | ScheduleOptionsDto | Yes | - |
| `liveMode` | boolean | Yes | - |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | - |
| `items` | array<InvoiceItemDto> | Yes | - |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | - |
| `title` | string | No | - |
| `tipsConfiguration` | object | No | Configuration for tips on invoices |
| `lateFeesConfiguration` | object | No | Late fees configuration for the invoices |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `paymentMethods` | object | No | Payment Methods for Invoices |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/invoices/schedule`

List schedules

API to get list of schedules

Operation ID: `list-invoice-schedules`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | location Id / company Id based on altType |
| `altType` | query | string | Yes | Alt Type |
| `status` | query | string | No | status to be filtered |
| `startAt` | query | string | No | startAt in YYYY-MM-DD format |
| `endAt` | query | string | No | endAt in YYYY-MM-DD format |
| `search` | query | string | No | To search for an invoice by id / name / email / phoneNo |
| `paymentMode` | query | string | No | payment mode |
| `limit` | query | string | Yes | Limit the number of items to return |
| `offset` | query | string | Yes | Number of items to skip |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/invoices/schedule/{scheduleId}`

Get an schedule

API to get an schedule by schedule id

Operation ID: `get-invoice-schedule`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `scheduleId` | path | string | Yes | Schedule Id |
| `altId` | query | string | Yes | location Id / company Id based on altType |
| `altType` | query | string | Yes | Alt Type |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/invoices/schedule/{scheduleId}`

Update schedule

API to update an schedule by schedule id

Operation ID: `update-invoice-schedule`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `scheduleId` | path | string | Yes | Schedule Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateInvoiceScheduleDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | - |
| `contactDetails` | ContactDetailsDto | Yes | - |
| `schedule` | ScheduleOptionsDto | Yes | - |
| `liveMode` | boolean | Yes | - |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | - |
| `items` | array<InvoiceItemDto> | Yes | - |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | - |
| `title` | string | No | - |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/invoices/schedule/{scheduleId}`

Delete schedule

API to delete an schedule by schedule id

Operation ID: `delete-invoice-schedule`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `scheduleId` | path | string | Yes | Schedule Id |
| `altId` | query | string | Yes | location Id / company Id based on altType |
| `altType` | query | string | Yes | Alt Type |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/schedule/{scheduleId}/updateAndSchedule`

Update scheduled recurring invoice

API to update scheduled recurring invoice

Operation ID: `update-and-schedule-invoice-schedule`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `scheduleId` | path | string | Yes | Schedule Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/schedule/{scheduleId}/schedule`

Schedule an schedule invoice

API to schedule an schedule invoice to start sending to the customer

Operation ID: `schedule-invoice-schedule`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `scheduleId` | path | string | Yes | Schedule Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `ScheduleInvoiceScheduleDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `liveMode` | boolean | Yes | - |
| `autoPayment` | object | No | auto-payment configuration |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/schedule/{scheduleId}/auto-payment`

Manage Auto payment for an schedule invoice

API to manage auto payment for a schedule

Operation ID: `auto-payment-invoice-schedule`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `scheduleId` | path | string | Yes | Schedule Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `AutoPaymentScheduleDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `id` | string | Yes | - |
| `autoPayment` | object | Yes | auto-payment configuration |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/schedule/{scheduleId}/cancel`

Cancel an scheduled invoice

API to cancel a scheduled invoice by schedule id

Operation ID: `cancel-invoice-schedule`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `scheduleId` | path | string | Yes | Schedule Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CancelInvoiceScheduleDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/text2pay`

Create & Send

API to create or update a text2pay invoice

Operation ID: `text2pay-invoice`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `Text2PayDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | Invoice Name |
| `currency` | string | Yes | Currency code |
| `items` | array<InvoiceItemDto> | Yes | An array of items for the invoice. |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the invoice |
| `contactDetails` | object | Yes | Contact information to send the invoice to |
| `invoiceNumber` | string | No | Invoice Number |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | No | Due date in YYYY-MM-DD format |
| `sentTo` | SentToDto | Yes | - |
| `liveMode` | boolean | Yes | - |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |
| `lateFeesConfiguration` | object | No | late fees configuration |
| `tipsConfiguration` | object | No | tips configuration for the invoice |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `paymentMethods` | object | No | Payment Methods for Invoices |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |
| `id` | string | No | id of invoice to update. If skipped, a new invoice will be created |
| `includeTermsNote` | boolean | No | include terms & notes with receipts |
| `action` | string (enum: draft, send) | Yes | create invoice in draft mode or send mode |
| `userId` | string | Yes | id of user generating invoice |
| `discount` | DiscountDto | No | - |
| `businessDetails` | BusinessDetailsDto | No | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/invoices/generate-invoice-number`

Generate Invoice Number

Get the next invoice number for the given location

Operation ID: `generate-invoice-number`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id |
| `altType` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/invoices/{invoiceId}`

Get invoice

API to get invoice by invoice id

Operation ID: `get-invoice`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `invoiceId` | path | string | Yes | Invoice Id |
| `altId` | query | string | Yes | location Id / company Id based on altType |
| `altType` | query | string | Yes | Alt Type |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/invoices/{invoiceId}`

Update invoice

API to update invoice by invoice id

Operation ID: `update-invoice`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `invoiceId` | path | string | Yes | Invoice Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateInvoiceDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | Name to be updated |
| `title` | string | No | Title for the invoice |
| `currency` | string | Yes | Currency |
| `description` | string | No | Description |
| `businessDetails` | object | No | Business details which need to be updated |
| `invoiceNumber` | string | No | Invoice Number |
| `contactId` | string | No | Id of the contact which you need to send the invoice |
| `contactDetails` | ContactDetailsDto | No | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `discount` | DiscountDto | No | - |
| `invoiceItems` | array<InvoiceItemDto> | Yes | - |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `liveMode` | boolean | No | Payment mode |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | Yes | Due date in YYYY-MM-DD format |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |
| `tipsConfiguration` | object | No | tips configuration for the invoice |
| `xeroDetails` | object | No | - |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `paymentMethods` | object | No | Payment Methods for Invoices |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/invoices/{invoiceId}`

Delete invoice

API to delete invoice by invoice id

Operation ID: `delete-invoice`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `invoiceId` | path | string | Yes | Invoice Id |
| `altId` | query | string | Yes | location Id / company Id based on altType |
| `altType` | query | string | Yes | Alt Type |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PATCH `/invoices/{invoiceId}/late-fees-configuration`

Update invoice late fees configuration

API to update invoice late fees configuration by invoice id

Operation ID: `update-invoice-late-fees-configuration`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `invoiceId` | path | string | Yes | Invoice Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateInvoiceLateFeesConfigurationDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `lateFeesConfiguration` | object | Yes | late fees configuration |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/{invoiceId}/void`

Void invoice

API to delete invoice by invoice id

Operation ID: `void-invoice`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `invoiceId` | path | string | Yes | Invoice Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `VoidInvoiceDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/{invoiceId}/send`

Send invoice

API to send invoice by invoice id

Operation ID: `send-invoice`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `invoiceId` | path | string | Yes | Invoice Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `SendInvoiceDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `userId` | string | Yes | Please ensure that the UserId corresponds to an authorized personnel, either by an employee ID or agency ID, to access this location. This account will serve as the primary channel for all future communications and updates. |
| `action` | string (enum: sms_and_email, send_manually, email, sms) | Yes | - |
| `liveMode` | boolean | Yes | - |
| `sentFrom` | object | No | sender details for invoice, valid only if invoice is not sent manually |
| `autoPayment` | object | No | auto-payment configuration |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/{invoiceId}/record-payment`

Record a manual payment for an invoice

API to record manual payment for an invoice by invoice id

Operation ID: `record-invoice`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `invoiceId` | path | string | Yes | Invoice Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `RecordPaymentDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `mode` | string (enum: cash, card, cheque, bank_transfer, other) | Yes | manual payment method |
| `card` | CardDto | Yes | - |
| `cheque` | ChequeDto | Yes | - |
| `notes` | string | Yes | Any note to be recorded with the transaction |
| `amount` | number | No | Amount to be paid against the invoice. |
| `meta` | object | No | - |
| `paymentScheduleIds` | array<string> | No | Payment Schedule Ids to be recorded against the invoice. |
| `fulfilledAt` | string | No | Updated At to be recorded against the invoice. |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PATCH `/invoices/stats/last-visited-at`

Update invoice last visited at

API to update invoice last visited at by invoice id

Operation ID: `update-invoice-last-visited-at`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `PatchInvoiceStatsLastViewedDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `invoiceId` | string | Yes | Invoice Id |


**Responses:**

- `200`: 
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/invoices/estimate`

Create New Estimate

Create a new estimate with the provided details

Operation ID: `create-new-estimate`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateEstimatesDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Estimate Name |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | Currency code |
| `items` | array<InvoiceItemDto> | Yes | An array of items for the estimate. |
| `liveMode` | boolean | No | livemode for estimate |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the estimate |
| `contactDetails` | object | Yes | Contact information to send the estimate to |
| `estimateNumber` | number | No | Estimate Number, if not specified will take in the next valid estimate number |
| `issueDate` | string | No | issue date estimate |
| `expiryDate` | string | No | expiry date estimate |
| `sentTo` | object | No | Email and sent to details for the estimate |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Estimate |
| `meta` | object | No | Meta data for the estimate |
| `sendEstimateDetails` | object | No | When sending estimate directly while saving |
| `frequencySettings` | object | Yes | frequency settings for the estimate |
| `estimateNumberPrefix` | string | No | Prefix for the estimate number |
| `userId` | string | No | User Id |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `autoInvoice` | object | No | Auto invoice for the estimate |
| `miscellaneousCharges` | object | No | miscellaneous charges for the estimate |
| `paymentScheduleConfig` | object | No | Payment Schedule Config for the estimate |


**Responses:**

- `201`: Created
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/invoices/estimate/{estimateId}`

Update Estimate

Update an existing estimate with new details

Operation ID: `update-estimate`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `estimateId` | path | string | Yes | Estimate Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateEstimateDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Estimate Name |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | Currency code |
| `items` | array<InvoiceItemDto> | Yes | An array of items for the estimate. |
| `liveMode` | boolean | No | livemode for estimate |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the estimate |
| `contactDetails` | object | Yes | Contact information to send the estimate to |
| `estimateNumber` | number | No | Estimate Number, if not specified will take in the next valid estimate number |
| `issueDate` | string | No | issue date estimate |
| `expiryDate` | string | No | expiry date estimate |
| `sentTo` | object | No | Email and sent to details for the estimate |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Estimate |
| `meta` | object | No | Meta data for the estimate |
| `sendEstimateDetails` | object | No | When sending estimate directly while saving |
| `frequencySettings` | object | Yes | frequency settings for the estimate |
| `estimateNumberPrefix` | string | No | Prefix for the estimate number |
| `userId` | string | No | User Id |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `autoInvoice` | object | No | Auto invoice for the estimate |
| `miscellaneousCharges` | object | No | miscellaneous charges for the estimate |
| `paymentScheduleConfig` | object | No | Payment Schedule Config for the estimate |
| `estimateStatus` | string (enum: all, draft, sent, accepted, declined, invoiced, viewed) | No | Estimate Status |


**Responses:**

- `200`: Successfully updated
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/invoices/estimate/{estimateId}`

Delete Estimate

Delete an existing estimate

Operation ID: `delete-estimate`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `estimateId` | path | string | Yes | Estimate Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `AltDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |


**Responses:**

- `200`: Successfully Deleted
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/invoices/estimate/number/generate`

Generate Estimate Number

Get the next estimate number for the given location

Operation ID: `generate-estimate-number`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/estimate/{estimateId}/send`

Send Estimate

API to send estimate by estimate id

Operation ID: `send-estimate`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `estimateId` | path | string | Yes | Estimate Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `SendEstimateDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `action` | string (enum: sms_and_email, send_manually, email, sms) | Yes | - |
| `liveMode` | boolean | Yes | livemode for estimate |
| `userId` | string | Yes | Please ensure that the UserId corresponds to an authorized personnel, either by an employee ID or agency ID, to access this location. This account will serve as the primary channel for all future communications and updates. |
| `sentFrom` | object | No | sender details for invoice, valid only if invoice is not sent manually |
| `estimateName` | string | No | estimate name |


**Responses:**

- `201`: Created
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/estimate/{estimateId}/invoice`

Create Invoice from Estimate

Create a new invoice from an existing estimate

Operation ID: `create-invoice-from-estimate`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `estimateId` | path | string | Yes | Estimate Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateInvoiceFromEstimateDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `markAsInvoiced` | boolean | Yes | Mark Estimate as Invoiced |
| `version` | string (enum: v1, v2) | No | Version of the update request |


**Responses:**

- `200`: Successfully Created
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/invoices/estimate/list`

List Estimates

Get a paginated list of estimates

Operation ID: `list-estimates`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `startAt` | query | string | No | startAt in YYYY-MM-DD format |
| `endAt` | query | string | No | endAt in YYYY-MM-DD format |
| `search` | query | string | No | search text for estimates name |
| `status` | query | string | No | estimate status |
| `contactId` | query | string | No | Contact ID for the estimate |
| `limit` | query | string | Yes | Limit the number of items to return |
| `offset` | query | string | Yes | Number of items to skip |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PATCH `/invoices/estimate/stats/last-visited-at`

Update estimate last visited at

API to update estimate last visited at by estimate id

Operation ID: `update-estimate-last-visited-at`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `EstimateIdParam`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `estimateId` | string | Yes | Estimate Id |


**Responses:**

- `200`: 
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/invoices/estimate/template`

List Estimate Templates

Get a list of estimate templates or a specific template by ID

Operation ID: `list-estimate-templates`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `search` | query | string | No | To search for an estimate template by id / name |
| `limit` | query | string | Yes | Limit the number of items to return |
| `offset` | query | string | Yes | Number of items to skip |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/estimate/template`

Create Estimate Template

Create a new estimate template

Operation ID: `create-estimate-template`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `EstimateTemplatesDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Estimate Name |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | Currency code |
| `items` | array<array> | Yes | An array of items for the estimate. |
| `liveMode` | boolean | No | livemode for estimate |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the estimate |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Estimate |
| `meta` | object | No | Meta data for the estimate |
| `sendEstimateDetails` | object | No | When sending estimate directly while saving |
| `estimateNumberPrefix` | string | No | Prefix for the estimate number |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the estimate |


**Responses:**

- `201`: Successfully created
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/invoices/estimate/template/{templateId}`

Update Estimate Template

Update an existing estimate template

Operation ID: `update-estimate-template`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `templateId` | path | string | Yes | Template Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `EstimateTemplatesDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Estimate Name |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | Currency code |
| `items` | array<array> | Yes | An array of items for the estimate. |
| `liveMode` | boolean | No | livemode for estimate |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the estimate |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Estimate |
| `meta` | object | No | Meta data for the estimate |
| `sendEstimateDetails` | object | No | When sending estimate directly while saving |
| `estimateNumberPrefix` | string | No | Prefix for the estimate number |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the estimate |


**Responses:**

- `200`: Successfully updated
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/invoices/estimate/template/{templateId}`

Delete Estimate Template

Delete an existing estimate template

Operation ID: `delete-estimate-template`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `templateId` | path | string | Yes | Template Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `AltDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |


**Responses:**

- `200`: Successfully deleted
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/invoices/estimate/template/preview`

Preview Estimate Template

Get a preview of an estimate template

Operation ID: `preview-estimate-template`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `templateId` | query | string | Yes | Template Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/invoices/`

Create Invoice

API to create an invoice

Operation ID: `create-invoice`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateInvoiceDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | Invoice Name |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | Currency code |
| `items` | array<InvoiceItemDto> | Yes | An array of items for the invoice. |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the invoice |
| `contactDetails` | object | Yes | Contact information to send the invoice to |
| `invoiceNumber` | string | No | Invoice Number |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | No | Due date in YYYY-MM-DD format |
| `sentTo` | SentToDto | Yes | - |
| `liveMode` | boolean | Yes | - |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |
| `lateFeesConfiguration` | object | No | late fees configuration |
| `tipsConfiguration` | object | No | tips configuration for the invoice |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `paymentMethods` | object | No | Payment Methods for Invoices |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/invoices/`

List invoices

API to get list of invoices

Operation ID: `list-invoices`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | location Id / company Id based on altType |
| `altType` | query | string | Yes | Alt Type |
| `status` | query | string | No | status to be filtered |
| `startAt` | query | string | No | startAt in YYYY-MM-DD format |
| `endAt` | query | string | No | endAt in YYYY-MM-DD format |
| `search` | query | string | No | To search for an invoice by id / name / email / phoneNo |
| `paymentMode` | query | string | No | payment mode |
| `contactId` | query | string | No | Contact ID for the invoice |
| `limit` | query | string | Yes | Limit the number of items to return |
| `offset` | query | string | Yes | Number of items to skip |
| `sortField` | query | string | No | The field on which sorting should be applied |
| `sortOrder` | query | string | No | The order of sort which should be applied for the sortField |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### AddressDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `addressLine1` | string | No | Address Line 1 |
| `addressLine2` | string | No | Address Line 2 |
| `city` | string | No | City |
| `state` | string | No | State |
| `countryCode` | string | No | Country Code |
| `postalCode` | string | No | Postal Code |


### BusinessDetailsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `logoUrl` | string | No | Business Logo URL |
| `name` | string | No | Business Name |
| `phoneNo` | string | No | Business Phone Number |
| `address` | object | No | Business Address |
| `website` | string | No | Business Website Link |
| `customValues` | array<string> | No | Custom Values |


### ItemTaxDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | - |
| `name` | string | Yes | - |
| `rate` | number | Yes | - |
| `calculation` | string (enum: exclusive) | No | - |
| `description` | string | No | - |
| `taxId` | string | No | - |


### InvoiceItemDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | Invoice Item Name |
| `description` | string | No | Invoice descriptions |
| `productId` | string | No | Product Id |
| `priceId` | string | No | Price Id |
| `currency` | string | Yes | Currency |
| `amount` | number | Yes | Product amount |
| `qty` | number | Yes | Product Quantity |
| `taxes` | array<ItemTaxDto> | No | Tax |
| `automaticTaxCategoryId` | string | No | Tax category id for calculating automatic tax |
| `isSetupFeeItem` | boolean | No | Setupfee item, only created when 1st invoice of recurring schedule is generated |
| `type` | string (enum: one_time, recurring) | No | Price type of the item |
| `taxInclusive` | boolean | No | true if item amount is tax inclusive |


### DiscountDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `value` | number | No | Discount Value |
| `type` | string (enum: percentage, fixed) | Yes | Discount type |
| `validOnProductIds` | array<string> | No | Product Ids on which discount is applicable |


### TipsConfigurationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `tipsPercentage` | array<string> | Yes | Percentage of tips allowed |
| `tipsEnabled` | boolean | Yes | Tips enabled status |


### LateFeesFrequencyDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `intervalCount` | number | No | Late fees interval count |
| `interval` | string (enum: minute, hour, day, week, month, one_time) | Yes | Late fees interval |


### LateFeesGraceDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `intervalCount` | number | Yes | Late fees grace interval count |
| `interval` | string (enum: day) | Yes | Late fees grace interval |


### LateFeesMaxFeesDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: fixed) | Yes | - |
| `value` | number | Yes | 10 |


### LateFeesConfigurationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `enable` | boolean | Yes | Enable late fees |
| `value` | number | Yes | Late Fees Value |
| `type` | string (enum: fixed, percentage) | Yes | Late Fees Type |
| `frequency` | object | Yes | Late Fees Frequency |
| `grace` | object | No | Late Fees Grace |
| `maxLateFees` | object | No | Max late fees payable |


### StripePaymentMethodDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `enableBankDebitOnly` | boolean | Yes | Enable Bank Debit Only |


### PaymentMethodDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `stripe` | object | Yes | Payment Method |


### ProcessingFeePaidChargeDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | name of the processing fee |
| `charge` | number | Yes | charge for the processing fee |
| `amount` | number | Yes | amount of the processing fee |
| `_id` | string | Yes | id of the processing fee |


### ProcessingFeeDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `charges` | array<array> | Yes | charges for the processing fee |
| `collectedMiscellaneousCharges` | number | No | collected miscellaneous charges |
| `paidCharges` | array<ProcessingFeePaidChargeDto> | No | paid miscellaneous charges |


### CreateInvoiceTemplateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `internal` | boolean | No | - |
| `name` | string | Yes | Name of the template |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | - |
| `items` | array<InvoiceItemDto> | Yes | - |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `discount` | DiscountDto | No | - |
| `termsNotes` | string | No | - |
| `title` | string | No | Template title |
| `tipsConfiguration` | object | No | Configuration for tips on invoices |
| `lateFeesConfiguration` | object | No | Late fees configuration for the invoices |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `paymentMethods` | object | No | Payment Methods for Invoices |
| `attachments` | array<string> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


### CreateInvoiceTemplateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Template Id |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the Template |
| `businessDetails` | object | Yes | Business Details |
| `currency` | string | Yes | Currency |
| `discount` | object | No | Discount |
| `items` | array<string> | Yes | Invoice Items |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `total` | number | Yes | Total Amount |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### GetTemplateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Template Id |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the Template |
| `businessDetails` | object | Yes | Business Details |
| `currency` | string | Yes | Currency |
| `discount` | object | No | Discount |
| `items` | array<string> | Yes | Invoice Items |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `total` | number | Yes | Total Amount |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### ListTemplatesResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | array<GetTemplateResponseDto> | Yes | - |
| `totalCount` | number | Yes | Total number of Templates |


### UpdateInvoiceTemplateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `internal` | boolean | No | - |
| `name` | string | Yes | Name of the template |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | - |
| `items` | array<InvoiceItemDto> | Yes | - |
| `discount` | DiscountDto | No | - |
| `termsNotes` | string | No | - |
| `title` | string | No | Template title |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


### UpdateInvoiceTemplateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Template Id |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the Template |
| `businessDetails` | object | Yes | Business Details |
| `currency` | string | Yes | Currency |
| `discount` | object | No | Discount |
| `items` | array<string> | Yes | Invoice Items |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `total` | number | Yes | Total Amount |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### UpdateInvoiceLateFeesConfigurationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `lateFeesConfiguration` | object | Yes | late fees configuration |


### UpdatePaymentMethodsConfigurationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `paymentMethods` | object | No | Payment Methods for Invoices |


### DeleteInvoiceTemplateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | success |


### AdditionalEmailsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `email` | string | Yes | - |


### ContactDetailsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Contact ID |
| `name` | string | Yes | Contact Name |
| `phoneNo` | string | Yes | Contact Phone Number |
| `email` | string | Yes | Contact Email |
| `additionalEmails` | array<AdditionalEmailsDto> | No | Secondary email addresses for the contact to be saved |
| `companyName` | string | No | Contact Company Name |
| `address` | AddressDto | No | - |
| `customFields` | array<string> | No | Custom Values |


### CustomRRuleOptionsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `intervalType` | string (enum: yearly, monthly, weekly, daily, hourly, minutely, secondly) | Yes | - |
| `interval` | number | Yes | - |
| `startDate` | string | Yes | Start date in YYYY-MM-DD format |
| `startTime` | string | No | Start time in HH:mm:ss format |
| `endDate` | string | No | End date in YYYY-MM-DD format |
| `endTime` | string | No | End time in HH:mm:ss format |
| `dayOfMonth` | number | No | -1, 1, 2, 3, ..., 27, 28 |
| `dayOfWeek` | string (enum: mo, tu, we, th, fr, sa, su) | No | - |
| `numOfWeek` | number | No | -1, 1, 2, 3, 4 |
| `monthOfYear` | string (enum: jan, feb, mar, apr, may, jun, jul, aug, ...) | No | - |
| `count` | number | No | Max number of task executions |
| `daysBefore` | number | No | Execute task number of days before |
| `useStartAsPrimaryUserAccepted` | boolean | No | Start as primary user accepted date |
| `endType` | string | No | End type like after, by, count |


### ScheduleOptionsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `executeAt` | string | No | - |
| `rrule` | CustomRRuleOptionsDto | No | - |


### AttachmentsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Id of the file selected |
| `name` | string | Yes | Name of the file  |
| `url` | string | Yes | URL of the file |
| `type` | string | Yes | Type of the file |
| `size` | number | Yes | Size of the file |


### CreateInvoiceScheduleDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | - |
| `contactDetails` | ContactDetailsDto | Yes | - |
| `schedule` | ScheduleOptionsDto | Yes | - |
| `liveMode` | boolean | Yes | - |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | - |
| `items` | array<InvoiceItemDto> | Yes | - |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | - |
| `title` | string | No | - |
| `tipsConfiguration` | object | No | Configuration for tips on invoices |
| `lateFeesConfiguration` | object | No | Late fees configuration for the invoices |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `paymentMethods` | object | No | Payment Methods for Invoices |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


### DefaultInvoiceResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Invoice Id |
| `status` | string (enum: draft, sent, payment_processing, paid, void, partially_paid) | Yes | Invoice Status |
| `liveMode` | boolean | Yes | Live Mode |
| `amountPaid` | number | Yes | Amount Paid |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `businessDetails` | object | Yes | Business Details |
| `invoiceNumber` | number | Yes | Invoice Number |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | Yes | Due date in YYYY-MM-DD format |
| `discount` | object | No | Discount |
| `invoiceItems` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `amountDue` | number | Yes | Total Amount Due |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `automaticTaxesCalculated` | boolean | No | Is Automatic taxes calculated for the Invoice items |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |


### CreateInvoiceScheduleResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Schedule Id |
| `status` | object | Yes | Schedule Status |
| `liveMode` | boolean | Yes | Live Mode |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `schedule` | ScheduleOptionsDto | No | - |
| `invoices` | array<DefaultInvoiceResponseDto> | Yes | List of invoices |
| `businessDetails` | object | Yes | Business Details |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `discount` | object | No | Discount |
| `items` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `termsNotes` | string | Yes | Terms notes |
| `compiledTermsNotes` | string | Yes | Compiled terms notes |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### GetScheduleResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Schedule Id |
| `status` | object | Yes | Schedule Status |
| `liveMode` | boolean | Yes | Live Mode |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `schedule` | ScheduleOptionsDto | No | - |
| `invoices` | array<DefaultInvoiceResponseDto> | Yes | List of invoices |
| `businessDetails` | object | Yes | Business Details |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `discount` | object | No | Discount |
| `items` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `termsNotes` | string | Yes | Terms notes |
| `compiledTermsNotes` | string | Yes | Compiled terms notes |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### ListSchedulesResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `schedules` | array<GetScheduleResponseDto> | Yes | - |
| `total` | number | Yes | Total number of Schedules |


### UpdateInvoiceScheduleDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | - |
| `contactDetails` | ContactDetailsDto | Yes | - |
| `schedule` | ScheduleOptionsDto | Yes | - |
| `liveMode` | boolean | Yes | - |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | - |
| `items` | array<InvoiceItemDto> | Yes | - |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | - |
| `title` | string | No | - |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


### UpdateInvoiceScheduleResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Schedule Id |
| `status` | object | Yes | Schedule Status |
| `liveMode` | boolean | Yes | Live Mode |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `schedule` | ScheduleOptionsDto | No | - |
| `invoices` | array<DefaultInvoiceResponseDto> | Yes | List of invoices |
| `businessDetails` | object | Yes | Business Details |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `discount` | object | No | Discount |
| `items` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `termsNotes` | string | Yes | Terms notes |
| `compiledTermsNotes` | string | Yes | Compiled terms notes |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### DeleteInvoiceScheduleResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | success |


### UpdateAndScheduleInvoiceScheduleResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Schedule Id |
| `status` | object | Yes | Schedule Status |
| `liveMode` | boolean | Yes | Live Mode |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `schedule` | ScheduleOptionsDto | No | - |
| `invoices` | array<DefaultInvoiceResponseDto> | Yes | List of invoices |
| `businessDetails` | object | Yes | Business Details |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `discount` | object | No | Discount |
| `items` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `termsNotes` | string | Yes | Terms notes |
| `compiledTermsNotes` | string | Yes | Compiled terms notes |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### CardDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `brand` | string | Yes | - |
| `last4` | string | Yes | - |


### USBankAccountDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `bank_name` | string | Yes | - |
| `last4` | string | Yes | - |


### SepaDirectDebitDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `bank_code` | string | Yes | - |
| `last4` | string | Yes | - |
| `branch_code` | string | Yes | - |


### BacsDirectDebitDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `sort_code` | string | Yes | - |
| `last4` | string | Yes | - |


### BecsDirectDebitDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `bsb_number` | string | Yes | - |
| `last4` | string | Yes | - |


### AutoPaymentDetailsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `enable` | boolean | Yes | - |
| `type` | string | No | - |
| `paymentMethodId` | string | No | - |
| `customerId` | string | No | - |
| `card` | CardDto | No | - |
| `usBankAccount` | USBankAccountDto | No | - |
| `sepaDirectDebit` | SepaDirectDebitDTO | No | - |
| `bacsDirectDebit` | BacsDirectDebitDTO | No | - |
| `becsDirectDebit` | BecsDirectDebitDTO | No | - |
| `cardId` | string | No | - |


### ScheduleInvoiceScheduleDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `liveMode` | boolean | Yes | - |
| `autoPayment` | object | No | auto-payment configuration |


### ScheduleInvoiceScheduleResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Schedule Id |
| `status` | object | Yes | Schedule Status |
| `liveMode` | boolean | Yes | Live Mode |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `schedule` | ScheduleOptionsDto | No | - |
| `invoices` | array<DefaultInvoiceResponseDto> | Yes | List of invoices |
| `businessDetails` | object | Yes | Business Details |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `discount` | object | No | Discount |
| `items` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `termsNotes` | string | Yes | Terms notes |
| `compiledTermsNotes` | string | Yes | Compiled terms notes |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### AutoPaymentScheduleDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `id` | string | Yes | - |
| `autoPayment` | object | Yes | auto-payment configuration |


### AutoPaymentInvoiceScheduleResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Schedule Id |
| `status` | object | Yes | Schedule Status |
| `liveMode` | boolean | Yes | Live Mode |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `schedule` | ScheduleOptionsDto | No | - |
| `invoices` | array<DefaultInvoiceResponseDto> | Yes | List of invoices |
| `businessDetails` | object | Yes | Business Details |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `discount` | object | No | Discount |
| `items` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `termsNotes` | string | Yes | Terms notes |
| `compiledTermsNotes` | string | Yes | Compiled terms notes |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### CancelInvoiceScheduleDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |


### CancelInvoiceScheduleResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Schedule Id |
| `status` | object | Yes | Schedule Status |
| `liveMode` | boolean | Yes | Live Mode |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `schedule` | ScheduleOptionsDto | No | - |
| `invoices` | array<DefaultInvoiceResponseDto> | Yes | List of invoices |
| `businessDetails` | object | Yes | Business Details |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `discount` | object | No | Discount |
| `items` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `termsNotes` | string | Yes | Terms notes |
| `compiledTermsNotes` | string | Yes | Compiled terms notes |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### SentToDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `email` | array<string> | Yes | Email Address |
| `emailCc` | array<string> | No | cc to be kept in any sent out emails |
| `emailBcc` | array<string> | No | bcc to be kept in any sent out emails |
| `phoneNo` | array<string> | No | Contact Phone Number |


### PaymentScheduleDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: fixed, percentage) | Yes | Payment schedule type |
| `schedules` | array<string> | Yes | payment schedule item |


### Text2PayDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | Invoice Name |
| `currency` | string | Yes | Currency code |
| `items` | array<InvoiceItemDto> | Yes | An array of items for the invoice. |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the invoice |
| `contactDetails` | object | Yes | Contact information to send the invoice to |
| `invoiceNumber` | string | No | Invoice Number |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | No | Due date in YYYY-MM-DD format |
| `sentTo` | SentToDto | Yes | - |
| `liveMode` | boolean | Yes | - |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |
| `lateFeesConfiguration` | object | No | late fees configuration |
| `tipsConfiguration` | object | No | tips configuration for the invoice |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `paymentMethods` | object | No | Payment Methods for Invoices |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |
| `id` | string | No | id of invoice to update. If skipped, a new invoice will be created |
| `includeTermsNote` | boolean | No | include terms & notes with receipts |
| `action` | string (enum: draft, send) | Yes | create invoice in draft mode or send mode |
| `userId` | string | Yes | id of user generating invoice |
| `discount` | DiscountDto | No | - |
| `businessDetails` | BusinessDetailsDto | No | - |


### Text2PayInvoiceResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `invoice` | DefaultInvoiceResponseDto | Yes | - |
| `invoiceUrl` | string | Yes | preview url of generated invoice |


### GenerateInvoiceNumberResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `invoiceNumber` | number | No | Invoice Number |


### CreateInvoiceDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | Invoice Name |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | Currency code |
| `items` | array<InvoiceItemDto> | Yes | An array of items for the invoice. |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the invoice |
| `contactDetails` | object | Yes | Contact information to send the invoice to |
| `invoiceNumber` | string | No | Invoice Number |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | No | Due date in YYYY-MM-DD format |
| `sentTo` | SentToDto | Yes | - |
| `liveMode` | boolean | Yes | - |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |
| `lateFeesConfiguration` | object | No | late fees configuration |
| `tipsConfiguration` | object | No | tips configuration for the invoice |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `paymentMethods` | object | No | Payment Methods for Invoices |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


### OldCreateInvoiceDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### CreateInvoiceResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Invoice Id |
| `status` | string (enum: draft, sent, payment_processing, paid, void, partially_paid) | Yes | Invoice Status |
| `liveMode` | boolean | Yes | Live Mode |
| `amountPaid` | number | Yes | Amount Paid |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `businessDetails` | object | Yes | Business Details |
| `invoiceNumber` | number | Yes | Invoice Number |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | Yes | Due date in YYYY-MM-DD format |
| `discount` | object | No | Discount |
| `invoiceItems` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `amountDue` | number | Yes | Total Amount Due |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `automaticTaxesCalculated` | boolean | No | Is Automatic taxes calculated for the Invoice items |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |


### TotalSummaryDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `subTotal` | number | Yes | subTotal |
| `discount` | number | Yes | discount |
| `tax` | number | Yes | tax |


### ReminderExecutionDetailsList

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### ReminderDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `enabled` | boolean | Yes | Flag indicating if the reminder is enabled or not |
| `emailTemplate` | string | Yes | Email template to be used for sending reminders |
| `smsTemplate` | string | Yes | SMS template to be used for sending reminders |
| `emailSubject` | string | Yes | Subject of the reminder |
| `reminderId` | string | Yes | Unique identifier for the reminder |
| `reminderName` | string | Yes | Name of the reminder |
| `reminderTime` | string (enum: before, after) | Yes | Time condition for the reminder |
| `intervalType` | string (enum: yearly, monthly, weekly, daily, hourly, minutely, secondly) | Yes | Interval type for the reminder |
| `maxReminders` | number | Yes | Maximum number of reminders that can be sent |
| `reminderInvoiceCondition` | string (enum: invoice_sent, invoice_overdue) | Yes | Condition for sending the reminder |
| `reminderNumber` | number | Yes | frequency gap of the reminder to exeucte |
| `startTime` | string | No | Business Hour Start Time |
| `endTime` | string | No | Business Hour End Time |
| `timezone` | string | No | Timezone at which reminder will be sent |


### ReminderSettingsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `defaultEmailTemplateId` | string | Yes | default template Id of reminder |
| `reminders` | array<ReminderDto> | Yes | List of reminders |


### RemindersConfigurationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `reminderExecutionDetailsList` | object | Yes | List of reminders |
| `reminderSettings` | object | Yes | Reminder settings |


### GetInvoiceResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Invoice Id |
| `status` | string (enum: draft, sent, payment_processing, paid, void, partially_paid) | Yes | Invoice Status |
| `liveMode` | boolean | Yes | Live Mode |
| `amountPaid` | number | Yes | Amount Paid |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `businessDetails` | object | Yes | Business Details |
| `invoiceNumber` | number | Yes | Invoice Number |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | Yes | Due date in YYYY-MM-DD format |
| `discount` | object | No | Discount |
| `invoiceItems` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `amountDue` | number | Yes | Total Amount Due |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `automaticTaxesCalculated` | boolean | No | Is Automatic taxes calculated for the Invoice items |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |
| `totalSummary` | TotalSummaryDto | Yes | - |
| `remindersConfiguration` | object | No | Reminders Configuration |


### ListInvoicesResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `invoices` | array<GetInvoiceResponseDto> | Yes | - |
| `total` | number | Yes | Total number of invoices |


### UpdateInvoiceDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | Name to be updated |
| `title` | string | No | Title for the invoice |
| `currency` | string | Yes | Currency |
| `description` | string | No | Description |
| `businessDetails` | object | No | Business details which need to be updated |
| `invoiceNumber` | string | No | Invoice Number |
| `contactId` | string | No | Id of the contact which you need to send the invoice |
| `contactDetails` | ContactDetailsDto | No | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `discount` | DiscountDto | No | - |
| `invoiceItems` | array<InvoiceItemDto> | Yes | - |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `liveMode` | boolean | No | Payment mode |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | Yes | Due date in YYYY-MM-DD format |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |
| `tipsConfiguration` | object | No | tips configuration for the invoice |
| `xeroDetails` | object | No | - |
| `invoiceNumberPrefix` | string | No | prefix for invoice number |
| `paymentMethods` | object | No | Payment Methods for Invoices |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the invoice |


### UpdateInvoiceResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Invoice Id |
| `status` | string (enum: draft, sent, payment_processing, paid, void, partially_paid) | Yes | Invoice Status |
| `liveMode` | boolean | Yes | Live Mode |
| `amountPaid` | number | Yes | Amount Paid |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `businessDetails` | object | Yes | Business Details |
| `invoiceNumber` | number | Yes | Invoice Number |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | Yes | Due date in YYYY-MM-DD format |
| `discount` | object | No | Discount |
| `invoiceItems` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `amountDue` | number | Yes | Total Amount Due |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `automaticTaxesCalculated` | boolean | No | Is Automatic taxes calculated for the Invoice items |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |


### DeleteInvoiceResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Invoice Id |
| `status` | string (enum: draft, sent, payment_processing, paid, void, partially_paid) | Yes | Invoice Status |
| `liveMode` | boolean | Yes | Live Mode |
| `amountPaid` | number | Yes | Amount Paid |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `businessDetails` | object | Yes | Business Details |
| `invoiceNumber` | number | Yes | Invoice Number |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | Yes | Due date in YYYY-MM-DD format |
| `discount` | object | No | Discount |
| `invoiceItems` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `amountDue` | number | Yes | Total Amount Due |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `automaticTaxesCalculated` | boolean | No | Is Automatic taxes calculated for the Invoice items |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |


### VoidInvoiceDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |


### VoidInvoiceResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Invoice Id |
| `status` | string (enum: draft, sent, payment_processing, paid, void, partially_paid) | Yes | Invoice Status |
| `liveMode` | boolean | Yes | Live Mode |
| `amountPaid` | number | Yes | Amount Paid |
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the invoice |
| `businessDetails` | object | Yes | Business Details |
| `invoiceNumber` | number | Yes | Invoice Number |
| `currency` | string | Yes | Currency |
| `contactDetails` | object | Yes | Contact Details |
| `issueDate` | string | Yes | Issue date in YYYY-MM-DD format |
| `dueDate` | string | Yes | Due date in YYYY-MM-DD format |
| `discount` | object | No | Discount |
| `invoiceItems` | array<string> | Yes | Invoice Items |
| `total` | number | Yes | Total Amount |
| `title` | string | Yes | Title |
| `amountDue` | number | Yes | Total Amount Due |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Invoice |
| `automaticTaxesCalculated` | boolean | No | Is Automatic taxes calculated for the Invoice items |
| `paymentSchedule` | object | No | split invoice into payment schedule summing up to full invoice amount |


### InvoiceSettingsSenderConfigurationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `fromName` | string | No | Sender name to be used while sending invoice |
| `fromEmail` | string | No | Email id to be used while sending out invoices |


### SendInvoiceDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `userId` | string | Yes | Please ensure that the UserId corresponds to an authorized personnel, either by an employee ID or agency ID, to access this location. This account will serve as the primary channel for all future communications and updates. |
| `action` | string (enum: sms_and_email, send_manually, email, sms) | Yes | - |
| `liveMode` | boolean | Yes | - |
| `sentFrom` | object | No | sender details for invoice, valid only if invoice is not sent manually |
| `autoPayment` | object | No | auto-payment configuration |


### SendInvoicesResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `invoice` | DefaultInvoiceResponseDto | Yes | - |
| `smsData` | object | Yes | - |
| `emailData` | object | Yes | - |


### ChequeDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `number` | string | Yes | check number |


### RecordPaymentDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `mode` | string (enum: cash, card, cheque, bank_transfer, other) | Yes | manual payment method |
| `card` | CardDto | Yes | - |
| `cheque` | ChequeDto | Yes | - |
| `notes` | string | Yes | Any note to be recorded with the transaction |
| `amount` | number | No | Amount to be paid against the invoice. |
| `meta` | object | No | - |
| `paymentScheduleIds` | array<string> | No | Payment Schedule Ids to be recorded against the invoice. |
| `fulfilledAt` | string | No | Updated At to be recorded against the invoice. |


### RecordPaymentResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | status |
| `invoice` | DefaultInvoiceResponseDto | Yes | - |


### PatchInvoiceStatsLastViewedDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `invoiceId` | string | Yes | Invoice Id |


### SendEstimateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `action` | string (enum: sms_and_email, send_manually, email, sms) | Yes | - |
| `liveMode` | boolean | Yes | livemode for estimate |
| `userId` | string | Yes | Please ensure that the UserId corresponds to an authorized personnel, either by an employee ID or agency ID, to access this location. This account will serve as the primary channel for all future communications and updates. |
| `sentFrom` | object | No | sender details for invoice, valid only if invoice is not sent manually |
| `estimateName` | string | No | estimate name |


### FrequencySettingsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `enabled` | boolean | Yes | enabled for the frequency settings |
| `schedule` | object | Yes | schedule setting for the estimate |


### AutoInvoicingDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `enabled` | boolean | Yes | Enable Auto Invoice |
| `directPayments` | boolean | No | Direct Payments |


### PaymentScheduleDateConfigDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `depositDateType` | string (enum: estimate_accepted, custom) | Yes | Deposit date type |
| `scheduleDateType` | string (enum: regular_interval, custom) | Yes | Payment Schedule Date Type |


### PaymentScheduleConfigDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: fixed, percentage) | Yes | Payment Schedule Type |
| `dateConfig` | object | Yes | Due date type configuration |
| `schedules` | array<array> | Yes | Payment Schedule Items |


### CreateEstimatesDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Estimate Name |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | Currency code |
| `items` | array<InvoiceItemDto> | Yes | An array of items for the estimate. |
| `liveMode` | boolean | No | livemode for estimate |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the estimate |
| `contactDetails` | object | Yes | Contact information to send the estimate to |
| `estimateNumber` | number | No | Estimate Number, if not specified will take in the next valid estimate number |
| `issueDate` | string | No | issue date estimate |
| `expiryDate` | string | No | expiry date estimate |
| `sentTo` | object | No | Email and sent to details for the estimate |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Estimate |
| `meta` | object | No | Meta data for the estimate |
| `sendEstimateDetails` | object | No | When sending estimate directly while saving |
| `frequencySettings` | object | Yes | frequency settings for the estimate |
| `estimateNumberPrefix` | string | No | Prefix for the estimate number |
| `userId` | string | No | User Id |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `autoInvoice` | object | No | Auto invoice for the estimate |
| `miscellaneousCharges` | object | No | miscellaneous charges for the estimate |
| `paymentScheduleConfig` | object | No | Payment Schedule Config for the estimate |


### BusinessDetails

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### ContactDetails

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### SentTo

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### AutoInvoice

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### EstimateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `_id` | string | Yes | Unique identifier |
| `liveMode` | boolean | Yes | Indicates if it is in live mode |
| `deleted` | boolean | Yes | Indicates if deleted |
| `name` | string | Yes | Name |
| `currency` | string | Yes | Currency code |
| `businessDetails` | object | Yes | Business details associated with the estimate |
| `items` | array<array> | Yes | An array of items |
| `discount` | object | Yes | Discount details for the estimate template |
| `title` | string | No | Title |
| `estimateNumberPrefix` | string | No | Estimate number prefix |
| `attachments` | array<AttachmentsDto> | No | Attachments |
| `updatedBy` | string | No | User Id of who last updated |
| `total` | number | Yes | Total amount |
| `createdAt` | string | Yes | Timestamp when created |
| `updatedAt` | string | Yes | Timestamp when last updated |
| `__v` | number | Yes | Version number |
| `automaticTaxesEnabled` | boolean | Yes | Indicates if automatic taxes are enabled for this estimate |
| `termsNotes` | string | No | Terms and conditions for the estimate, supports HTML markup |
| `companyId` | string | Yes | Company identifier associated with the estimate |
| `contactDetails` | object | Yes | Contact details for the estimate |
| `issueDate` | string | Yes | Date when the estimate was issued |
| `expiryDate` | string | Yes | Date when the estimate expires |
| `sentBy` | string | No | User who sent the estimate |
| `automaticTaxesCalculated` | boolean | Yes | Indicates if automatic taxes were calculated |
| `meta` | object | Yes | Additional metadata associated with the estimate |
| `estimateActionHistory` | array<string> | Yes | History of actions taken on the estimate |
| `sentTo` | object | Yes | Recipient details for the estimate |
| `frequencySettings` | object | Yes | Frequency settings for recurring estimates |
| `lastVisitedAt` | string | Yes | Timestamp when the estimate was last visited |
| `totalamountInUSD` | number | Yes | Total amount in USD |
| `autoInvoice` | object | No | Auto-invoice settings for the estimate |
| `traceId` | string | Yes | Trace ID for logging and debugging |


### UpdateEstimateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Estimate Name |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | Currency code |
| `items` | array<InvoiceItemDto> | Yes | An array of items for the estimate. |
| `liveMode` | boolean | No | livemode for estimate |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the estimate |
| `contactDetails` | object | Yes | Contact information to send the estimate to |
| `estimateNumber` | number | No | Estimate Number, if not specified will take in the next valid estimate number |
| `issueDate` | string | No | issue date estimate |
| `expiryDate` | string | No | expiry date estimate |
| `sentTo` | object | No | Email and sent to details for the estimate |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Estimate |
| `meta` | object | No | Meta data for the estimate |
| `sendEstimateDetails` | object | No | When sending estimate directly while saving |
| `frequencySettings` | object | Yes | frequency settings for the estimate |
| `estimateNumberPrefix` | string | No | Prefix for the estimate number |
| `userId` | string | No | User Id |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `autoInvoice` | object | No | Auto invoice for the estimate |
| `miscellaneousCharges` | object | No | miscellaneous charges for the estimate |
| `paymentScheduleConfig` | object | No | Payment Schedule Config for the estimate |
| `estimateStatus` | string (enum: all, draft, sent, accepted, declined, invoiced, viewed) | No | Estimate Status |


### GenerateEstimateNumberResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `estimateNumber` | number | Yes | - |
| `traceId` | string | Yes | - |


### AltDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |


### CreateInvoiceFromEstimateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `markAsInvoiced` | boolean | Yes | Mark Estimate as Invoiced |
| `version` | string (enum: v1, v2) | No | Version of the update request |


### CreateInvoiceFromEstimateResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `estimate` | object | Yes | Estimate details |
| `invoice` | object | Yes | Invoice details |


### ListEstimatesResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `estimates` | array<string> | Yes | List of estimates |
| `total` | number | Yes | Total number of estimates |
| `traceId` | string | Yes | Unique identifier for tracing the request |


### EstimateIdParam

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `estimateId` | string | Yes | Estimate Id |


### ListEstimateTemplateResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | array<string> | Yes | List of estimate templates |
| `totalCount` | number | Yes | Total number of estimate templates available |
| `traceId` | string | Yes | Unique identifier for tracing the request |


### EstimateTemplatesDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Estimate Name |
| `businessDetails` | BusinessDetailsDto | Yes | - |
| `currency` | string | Yes | Currency code |
| `items` | array<array> | Yes | An array of items for the estimate. |
| `liveMode` | boolean | No | livemode for estimate |
| `discount` | DiscountDto | Yes | - |
| `termsNotes` | string | No | Terms notes, Also supports HTML markups |
| `title` | string | No | Title for the estimate |
| `automaticTaxesEnabled` | boolean | No | Automatic taxes enabled for the Estimate |
| `meta` | object | No | Meta data for the estimate |
| `sendEstimateDetails` | object | No | When sending estimate directly while saving |
| `estimateNumberPrefix` | string | No | Prefix for the estimate number |
| `attachments` | array<AttachmentsDto> | No | attachments for the invoice |
| `miscellaneousCharges` | object | No | miscellaneous charges for the estimate |


### EstimateTemplateResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `_id` | string | Yes | Unique identifier |
| `liveMode` | boolean | Yes | Indicates if it is in live mode |
| `deleted` | boolean | Yes | Indicates if deleted |
| `name` | string | Yes | Name |
| `currency` | string | Yes | Currency code |
| `businessDetails` | object | Yes | Business details associated with the estimate |
| `items` | array<array> | Yes | An array of items |
| `discount` | object | Yes | Discount details for the estimate template |
| `title` | string | No | Title |
| `estimateNumberPrefix` | string | No | Estimate number prefix |
| `attachments` | array<AttachmentsDto> | No | Attachments |
| `updatedBy` | string | No | User Id of who last updated |
| `total` | number | Yes | Total amount |
| `createdAt` | string | Yes | Timestamp when created |
| `updatedAt` | string | Yes | Timestamp when last updated |
| `__v` | number | Yes | Version number |
| `automaticTaxesEnabled` | boolean | Yes | Indicates if automatic taxes are enabled for this estimate |
| `termsNotes` | string | No | Terms and conditions for the estimate, supports HTML markup |


