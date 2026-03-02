# Contacts API

Documentation for Contacts API

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

### POST `/contacts/search`

Search Contacts

Search contacts based on combinations of advanced filters. Documentation Link - https://doc.clickup.com/8631005/d/h/87cpx-158396/6e629989abe7fad

Operation ID: `search-contacts-advanced`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `SearchBodyV2DTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|


**Responses:**

- `200`: Success
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/contacts/search/duplicate`

Get Duplicate Contact

Get Duplicate Contact.<br/><br/>If `Allow Duplicate Contact` is disabled under Settings, the global unique identifier will be used for searching the contact. If the setting is enabled, first priority for search is `email` and the second priority will be `phone`.

Operation ID: `get-duplicate-contact`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location Id |
| `number` | query | string | No | Phone Number - Pass in URL Encoded form. i.e +1423164516 will become `%2B1423164516` |
| `email` | query | string | No | Email - Pass in URL Encoded form. i.e test+abc@gmail.com will become `test%2Babc%40gmail.com` |

**Responses:**

- `200`: 
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/contacts/{contactId}/tasks`

Get all Tasks

Get all Tasks

Operation ID: `get-all-tasks`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/contacts/{contactId}/tasks`

Create Task

Create Task

Operation ID: `create-task`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateTaskParams`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | - |
| `body` | string | No | - |
| `dueDate` | string | Yes | - |
| `completed` | boolean | Yes | - |
| `assignedTo` | string | No | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/contacts/{contactId}/tasks/{taskId}`

Get Task

Get Task

Operation ID: `get-task`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `taskId` | path | string | Yes | Task Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/contacts/{contactId}/tasks/{taskId}`

Update Task

Update Task

Operation ID: `update-task`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `taskId` | path | string | Yes | Task Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateTaskBody`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | - |
| `body` | string | No | - |
| `dueDate` | string | No | - |
| `completed` | boolean | No | - |
| `assignedTo` | string | No | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/contacts/{contactId}/tasks/{taskId}`

Delete Task

Delete Task

Operation ID: `delete-task`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `taskId` | path | string | Yes | Task Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/contacts/{contactId}/tasks/{taskId}/completed`

Update Task Completed

Update Task Completed

Operation ID: `update-task-completed`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `taskId` | path | string | Yes | Task Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateTaskStatusParams`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `completed` | boolean | Yes | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/contacts/{contactId}/appointments`

Get Appointments for Contact

Get Appointments for Contact

Operation ID: `get-appointments-for-contact`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/contacts/{contactId}/tags`

Add Tags

Add Tags

Operation ID: `add-tags`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `TagsDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `tags` | array<string> | Yes | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/contacts/{contactId}/tags`

Remove Tags

Remove Tags

Operation ID: `remove-tags`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `TagsDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `tags` | array<string> | Yes | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/contacts/{contactId}/notes`

Get All Notes

Get All Notes

Operation ID: `get-all-notes`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/contacts/{contactId}/notes`

Create Note

Create Note

Operation ID: `create-note`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `NotesDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `userId` | string | No | - |
| `body` | string | Yes | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/contacts/{contactId}/notes/{id}`

Get Note

Get Note

Operation ID: `get-note`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `id` | path | string | Yes | Note Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/contacts/{contactId}/notes/{id}`

Update Note

Update Note

Operation ID: `update-note`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `id` | path | string | Yes | Note Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `NotesDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `userId` | string | No | - |
| `body` | string | Yes | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/contacts/{contactId}/notes/{id}`

Delete Note

Delete Note

Operation ID: `delete-note`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `id` | path | string | Yes | Note Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/contacts/bulk/tags/update/{type}`

Update Contacts Tags

Allows you to update tags to multiple contacts at once, you can add or remove tags from the contacts

Operation ID: `create-association`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `type` | path | string | Yes | Tags operation type |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateTagsDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `contacts` | array<string> | Yes | list of contact ids to be processed |
| `tags` | array<string> | Yes | list of tags to be added or removed |
| `locationId` | string | Yes | location id from where the bulk request is executed |
| `removeAllTags` | boolean | No | Option to implement remove all tags. if true, all tags will be removed from the contacts. Can only be used with remove type. |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `422`: Unprocessable Entity

---

### POST `/contacts/bulk/business`

Add/Remove Contacts From Business

Add/Remove Contacts From Business . Passing a `null` businessId will remove the businessId from the contacts

Operation ID: `add-remove-contact-from-business`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `ContactsBusinessUpdate`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `ids` | array<string> | Yes | - |
| `businessId` | string | Yes | - |


**Responses:**

- `200`: Successful response
- `422`: Unprocessable Entity

---

### GET `/contacts/{contactId}`

Get Contact

Get Contact

Operation ID: `get-contact`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/contacts/{contactId}`

Update Contact

Please find the list of acceptable values for the `country` field  <a href="https://highlevel.stoplight.io/docs/integrations/ZG9jOjI4MzUzNDIy-country-list" target="_blank">here</a>

Operation ID: `update-contact`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateContactDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `name` | string | No | - |
| `email` | string | No | - |
| `phone` | string | No | - |
| `address1` | string | No | - |
| `city` | string | No | - |
| `state` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `timezone` | string | No | - |
| `dnd` | boolean | No | - |
| `dndSettings` | DndSettingsSchema | No | - |
| `inboundDndSettings` | InboundDndSettingsSchema | No | - |
| `tags` | array<string> | No | This field will overwrite all current tags associated with the contact. To update a tags, it is recommended to use the Add Tag or Remove Tag API instead. |
| `customFields` | array | No | - |
| `source` | string | No | - |
| `country` | string | No | - |
| `assignedTo` | string | No | User's Id |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/contacts/{contactId}`

Delete Contact

Delete Contact

Operation ID: `delete-contact`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/contacts/upsert`

Upsert Contact

Please find the list of acceptable values for the `country` field  <a href="https://highlevel.stoplight.io/docs/integrations/ZG9jOjI4MzUzNDIy-country-list" target="_blank">here</a><br/><br/>The Upsert API will adhere to the configuration defined under the “Allow Duplicate Contact” setting at the Location level. If the setting is configured to check both Email and Phone, the API will attempt to identify an existing contact based on the priority sequence specified in the setting, and will create or update the contact accordingly.<br/><br/>If two separate contacts already exist—one with the same email and another with the same phone—and an upsert request includes both the email and phone, the API will update the contact that matches the first field in the configured sequence, and ignore the second field to prevent duplication.

Operation ID: `upsert-contact`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpsertContactDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `name` | string | No | - |
| `email` | string | No | - |
| `locationId` | string | Yes | - |
| `gender` | string | No | - |
| `phone` | string | No | - |
| `address1` | string | No | - |
| `city` | string | No | - |
| `state` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `timezone` | string | No | - |
| `dnd` | boolean | No | - |
| `dndSettings` | DndSettingsSchema | No | - |
| `inboundDndSettings` | InboundDndSettingsSchema | No | - |
| `tags` | array<string> | No | This field will overwrite all current tags associated with the contact. To update a tags, it is recommended to use the Add Tag or Remove Tag API instead. |
| `customFields` | array | No | - |
| `source` | string | No | - |
| `country` | string | No | - |
| `companyName` | string | No | - |
| `assignedTo` | string | No | User's Id |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/contacts/business/{businessId}`

Get Contacts By BusinessId

Get Contacts By BusinessId

Operation ID: `get-contacts-by-businessId`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `businessId` | path | string | Yes | - |
| `limit` | query | string | No | - |
| `locationId` | query | string | Yes | - |
| `skip` | query | string | No | - |
| `query` | query | string | No | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/contacts/{contactId}/followers`

Add Followers

Add Followers

Operation ID: `add-followers-contact`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `FollowersDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `followers` | array<string> | Yes | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/contacts/{contactId}/followers`

Remove Followers

Remove Followers

Operation ID: `remove-followers-contact`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `FollowersDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `followers` | array<string> | Yes | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/contacts/{contactId}/campaigns/{campaignId}`

Add Contact to Campaign

Add contact to Campaign

Operation ID: `add-contact-to-campaign`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `campaignId` | path | string | Yes | Campaigns Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `AddContactToCampaignDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/contacts/{contactId}/campaigns/{campaignId}`

Remove Contact From Campaign

Remove Contact From Campaign

Operation ID: `remove-contact-from-campaign`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `campaignId` | path | string | Yes | Campaigns Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/contacts/{contactId}/campaigns/removeAll`

Remove Contact From Every Campaign

Remove Contact From Every Campaign

Operation ID: `remove-contact-from-every-campaign`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/contacts/{contactId}/workflow/{workflowId}`

Add Contact to Workflow

Add Contact to Workflow

Operation ID: `add-contact-to-workflow`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `workflowId` | path | string | Yes | Workflow Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateWorkflowDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `eventStartTime` | string | No | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/contacts/{contactId}/workflow/{workflowId}`

Delete Contact from Workflow

Delete Contact from Workflow

Operation ID: `delete-contact-from-workflow`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `contactId` | path | string | Yes | Contact Id |
| `workflowId` | path | string | Yes | Workflow Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateWorkflowDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `eventStartTime` | string | No | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/contacts/`

Create Contact

Please find the list of acceptable values for the `country` field  <a href="https://highlevel.stoplight.io/docs/integrations/ZG9jOjI4MzUzNDIy-country-list" target="_blank">here</a>

Operation ID: `create-contact`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateContactDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `name` | string | No | - |
| `email` | string | No | - |
| `locationId` | string | Yes | - |
| `gender` | string | No | - |
| `phone` | string | No | - |
| `address1` | string | No | - |
| `city` | string | No | - |
| `state` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `timezone` | string | No | - |
| `dnd` | boolean | No | - |
| `dndSettings` | DndSettingsSchema | No | - |
| `inboundDndSettings` | InboundDndSettingsSchema | No | - |
| `tags` | array<string> | No | - |
| `customFields` | array | No | - |
| `source` | string | No | - |
| `country` | string | No | - |
| `companyName` | string | No | - |
| `assignedTo` | string | No | User's Id |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/contacts/`

Get Contacts

Get Contacts

 **Note:** This API endpoint is deprecated. Please use the [Search Contacts](https://highlevel.stoplight.io/docs/integrations/dbe4f3a00a106-search-contacts) endpoint instead.

Operation ID: `get-contacts`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location Id |
| `startAfterId` | query | string | No | Start After Id |
| `startAfter` | query | number | No | Start Afte |
| `query` | query | string | No | Contact Query |
| `limit` | query | number | No | Limit Per Page records count. will allow maximum up to 100 and default will be 20 |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### SearchBodyV2DTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### CustomFieldSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `value` | string | No | - |


### DndSettingSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | string (enum: active, inactive, permanent) | Yes | - |
| `message` | string | No | - |
| `code` | string | No | - |


### DndSettingsSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `Call` | DndSettingSchema | No | - |
| `Email` | DndSettingSchema | No | - |
| `SMS` | DndSettingSchema | No | - |
| `WhatsApp` | DndSettingSchema | No | - |
| `GMB` | DndSettingSchema | No | - |
| `FB` | DndSettingSchema | No | - |


### ContactOpportunity

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `pipeline_id` | string | Yes | - |
| `pipeline_stage_id` | string | Yes | - |
| `monetary_value` | number | Yes | - |
| `status` | string | Yes | - |


### Contact

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `phoneLabel` | string | No | - |
| `country` | string | No | - |
| `address` | string | No | - |
| `source` | string | No | - |
| `type` | string | No | - |
| `locationId` | string | No | - |
| `dnd` | boolean | No | - |
| `state` | string | No | - |
| `businessName` | string | No | - |
| `customFields` | array<CustomFieldSchema> | No | - |
| `tags` | array<string> | No | - |
| `dateAdded` | string | No | - |
| `additionalEmails` | array<string> | No | - |
| `phone` | string | No | - |
| `companyName` | string | No | - |
| `additionalPhones` | array<string> | No | - |
| `dateUpdated` | string | No | - |
| `city` | string | No | - |
| `dateOfBirth` | string | No | - |
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `firstNameLowerCase` | string | No | - |
| `lastNameLowerCase` | string | No | - |
| `email` | string | No | - |
| `assignedTo` | string | No | - |
| `followers` | array<string> | No | - |
| `validEmail` | boolean | No | - |
| `dndSettings` | DndSettingsSchema | No | - |
| `opportunities` | array<ContactOpportunity> | No | - |
| `postalCode` | string | No | - |
| `businessId` | string | No | - |
| `searchAfter` | array<string> | No | - |


### SearchContactSuccessResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `contacts` | array<Contact> | Yes | - |
| `total` | number | Yes | - |


### TaskSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `title` | string | No | - |
| `body` | string | No | - |
| `assignedTo` | string | No | - |
| `dueDate` | string | No | - |
| `completed` | boolean | No | - |
| `contactId` | string | No | - |


### TasksListSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `tasks` | array<TaskSchema> | No | - |


### TaskByIsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `task` | TaskSchema | No | - |


### CreateTaskParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | - |
| `body` | string | No | - |
| `dueDate` | string | Yes | - |
| `completed` | boolean | Yes | - |
| `assignedTo` | string | No | - |


### UpdateTaskBody

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | - |
| `body` | string | No | - |
| `dueDate` | string | No | - |
| `completed` | boolean | No | - |
| `assignedTo` | string | No | - |


### UpdateTaskStatusParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `completed` | boolean | Yes | - |


### DeleteTaskSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |


### GetEventSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `calendarId` | string | No | - |
| `status` | string | No | - |
| `title` | string | No | - |
| `assignedUserId` | string | No | - |
| `notes` | string | No | - |
| `startTime` | string | No | - |
| `endTime` | string | No | - |
| `address` | string | No | - |
| `locationId` | string | No | - |
| `contactId` | string | No | - |
| `groupId` | string | No | - |
| `appointmentStatus` | string | No | - |
| `users` | array<string> | No | - |
| `dateAdded` | string | No | - |
| `dateUpdated` | string | No | - |
| `assignedResources` | array<string> | No | - |


### GetEventsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `events` | array<GetEventSchema> | No | - |


### TagsDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `tags` | array<string> | Yes | - |


### CreateAddTagSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `tags` | array<string> | No | - |


### CreateDeleteTagSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `tags` | array<string> | No | - |


### GetNoteSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `body` | string | No | - |
| `userId` | string | No | - |
| `dateAdded` | string | No | - |
| `contactId` | string | No | - |


### GetNotesListSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `notes` | array<GetNoteSchema> | No | - |


### NotesDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `userId` | string | No | - |
| `body` | string | Yes | - |


### GetCreateUpdateNoteSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `note` | GetNoteSchema | No | - |


### DeleteNoteSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |


### UpdateTagsDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `contacts` | array<string> | Yes | list of contact ids to be processed |
| `tags` | array<string> | Yes | list of tags to be added or removed |
| `locationId` | string | Yes | location id from where the bulk request is executed |
| `removeAllTags` | boolean | No | Option to implement remove all tags. if true, all tags will be removed from the contacts. Can only be used with remove type. |


### UpdateTagsResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | Yes | Indicates if the operation was successful |
| `errorCount` | number | Yes | Number of errors encountered during the operation |
| `responses` | array<string> | Yes | Responses for each contact processed |


### ContactsBusinessUpdate

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `ids` | array<string> | Yes | - |
| `businessId` | string | Yes | - |


### ContactsBulkUpateResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | - |
| `ids` | array<string> | Yes | - |


### AttributionSource

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `url` | string | Yes | - |
| `campaign` | string | No | - |
| `utmSource` | string | No | - |
| `utmMedium` | string | No | - |
| `utmContent` | string | No | - |
| `referrer` | string | No | - |
| `campaignId` | string | No | - |
| `fbclid` | string | No | - |
| `gclid` | string | No | - |
| `msclikid` | string | No | - |
| `dclid` | string | No | - |
| `fbc` | string | No | - |
| `fbp` | string | No | - |
| `fbEventId` | string | No | - |
| `userAgent` | string | No | - |
| `ip` | string | No | - |
| `medium` | string | No | - |
| `mediumId` | string | No | - |


### GetContectByIdSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `locationId` | string | No | - |
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `email` | string | No | - |
| `emailLowerCase` | string | No | - |
| `timezone` | string | No | - |
| `companyName` | string | No | - |
| `phone` | string | No | - |
| `dnd` | boolean | No | - |
| `dndSettings` | DndSettingsSchema | No | - |
| `type` | string | No | - |
| `source` | string | No | - |
| `assignedTo` | string | No | - |
| `address1` | string | No | - |
| `city` | string | No | - |
| `state` | string | No | - |
| `country` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `tags` | array<string> | No | - |
| `dateOfBirth` | string | No | - |
| `dateAdded` | string | No | - |
| `dateUpdated` | string | No | - |
| `attachments` | string | No | - |
| `ssn` | string | No | - |
| `keyword` | string | No | - |
| `firstNameLowerCase` | string | No | - |
| `fullNameLowerCase` | string | No | - |
| `lastNameLowerCase` | string | No | - |
| `lastActivity` | string | No | - |
| `customFields` | array<CustomFieldSchema> | No | - |
| `businessId` | string | No | - |
| `attributionSource` | AttributionSource | No | - |
| `lastAttributionSource` | AttributionSource | No | - |
| `visitorId` | string | No | visitorId is the Unique ID assigned to each Live chat visitor. |


### ContactsByIdSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `contact` | GetContectByIdSchema | No | - |


### customFieldsInputArraySchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | array<string> | No | - |


### customFieldsInputObjectSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | object | No | - |


### customFieldsInputStringSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | Pass either `id` or `key` of custom field |
| `key` | string | No | Pass either `id` or `key` of custom field |
| `field_value` | string | No | - |


### TextField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | string | No | - |


### LargeTextField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | string | No | - |


### SingleSelectField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | string | No | - |


### RadioField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | string | No | - |


### NumericField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | object | No | - |


### MonetoryField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | object | No | - |


### CheckboxField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | array<string> | No | - |


### MultiSelectField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | array<string> | No | - |


### FileField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `key` | string | No | - |
| `field_value` | object | No | - |


### InboundDndSettingSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | string (enum: active, inactive) | Yes | - |
| `message` | string | No | - |


### InboundDndSettingsSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `all` | InboundDndSettingSchema | No | - |


### CreateContactDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `name` | string | No | - |
| `email` | string | No | - |
| `locationId` | string | Yes | - |
| `gender` | string | No | - |
| `phone` | string | No | - |
| `address1` | string | No | - |
| `city` | string | No | - |
| `state` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `timezone` | string | No | - |
| `dnd` | boolean | No | - |
| `dndSettings` | DndSettingsSchema | No | - |
| `inboundDndSettings` | InboundDndSettingsSchema | No | - |
| `tags` | array<string> | No | - |
| `customFields` | array | No | - |
| `source` | string | No | - |
| `country` | string | No | - |
| `companyName` | string | No | - |
| `assignedTo` | string | No | User's Id |


### CreateContactSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `dateAdded` | string | No | - |
| `dateUpdated` | string | No | - |
| `deleted` | boolean | No | - |
| `tags` | array<string> | No | - |
| `type` | string | No | - |
| `customFields` | array<CustomFieldSchema> | No | - |
| `locationId` | string | No | - |
| `firstName` | string | No | - |
| `firstNameLowerCase` | string | No | - |
| `fullNameLowerCase` | string | No | - |
| `lastName` | string | No | - |
| `lastNameLowerCase` | string | No | - |
| `email` | string | No | - |
| `emailLowerCase` | string | No | - |
| `bounceEmail` | boolean | No | - |
| `unsubscribeEmail` | boolean | No | - |
| `dnd` | boolean | No | - |
| `dndSettings` | DndSettingsSchema | No | - |
| `phone` | string | No | - |
| `address1` | string | No | - |
| `city` | string | No | - |
| `state` | string | No | - |
| `country` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `source` | string | No | - |
| `companyName` | string | No | - |
| `dateOfBirth` | string | No | - |
| `birthMonth` | number | No | - |
| `birthDay` | number | No | - |
| `lastSessionActivityAt` | string | No | - |
| `offers` | array<string> | No | - |
| `products` | array<string> | No | - |
| `businessId` | string | No | - |
| `assignedTo` | string | No | User's Id |


### CreateContactsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `contact` | CreateContactSchema | No | - |


### UpdateContactDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `name` | string | No | - |
| `email` | string | No | - |
| `phone` | string | No | - |
| `address1` | string | No | - |
| `city` | string | No | - |
| `state` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `timezone` | string | No | - |
| `dnd` | boolean | No | - |
| `dndSettings` | DndSettingsSchema | No | - |
| `inboundDndSettings` | InboundDndSettingsSchema | No | - |
| `tags` | array<string> | No | This field will overwrite all current tags associated with the contact. To update a tags, it is recommended to use the Add Tag or Remove Tag API instead. |
| `customFields` | array | No | - |
| `source` | string | No | - |
| `country` | string | No | - |
| `assignedTo` | string | No | User's Id |


### UpdateContactsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |
| `contact` | GetContectByIdSchema | No | - |


### UpsertContactDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `name` | string | No | - |
| `email` | string | No | - |
| `locationId` | string | Yes | - |
| `gender` | string | No | - |
| `phone` | string | No | - |
| `address1` | string | No | - |
| `city` | string | No | - |
| `state` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `timezone` | string | No | - |
| `dnd` | boolean | No | - |
| `dndSettings` | DndSettingsSchema | No | - |
| `inboundDndSettings` | InboundDndSettingsSchema | No | - |
| `tags` | array<string> | No | This field will overwrite all current tags associated with the contact. To update a tags, it is recommended to use the Add Tag or Remove Tag API instead. |
| `customFields` | array | No | - |
| `source` | string | No | - |
| `country` | string | No | - |
| `companyName` | string | No | - |
| `assignedTo` | string | No | User's Id |


### UpsertContactsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `new` | boolean | No | - |
| `contact` | GetContectByIdSchema | No | - |
| `traceId` | string | No | - |


### DeleteContactsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |


### ContactsSearchSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `locationId` | string | No | - |
| `email` | string | No | - |
| `timezone` | string | No | - |
| `country` | string | No | - |
| `source` | string | No | - |
| `dateAdded` | string | No | - |
| `customFields` | array<CustomFieldSchema> | No | - |
| `tags` | array<string> | No | - |
| `businessId` | string | No | - |
| `attributions` | array<AttributionSource> | No | - |
| `followers` | array<string> | No | - |


### ContactsMetaSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `total` | number | No | - |
| `nextPageUrl` | string | No | - |
| `startAfterId` | string | No | - |
| `startAfter` | number | No | - |
| `currentPage` | number | No | - |
| `nextPage` | number | No | - |
| `prevPage` | number | No | - |


### ContactsSearchSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `contacts` | array<ContactsSearchSchema> | No | - |
| `count` | number | No | - |


### FollowersDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `followers` | array<string> | Yes | - |


### CreateAddFollowersSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `followers` | array<string> | No | - |
| `followersAdded` | array<string> | No | - |


### DeleteFollowersSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `followers` | array<string> | No | - |
| `followersRemoved` | array<string> | No | - |


### AddContactToCampaignDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### CreateDeleteCantactsCampaignsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |


### CreateWorkflowDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `eventStartTime` | string | No | - |


### ContactsWorkflowSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |


