# Sub-Account (Formerly location) API

Documentation for Sub-Account (Formerly location) API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### GET `/locations/search`

Search

Search Sub-Account (Formerly Location)

Operation ID: `search-locations`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `companyId` | query | string | No | The company/agency id on which you want to perform the search |
| `skip` | query | string | No | The value by which the results should be skipped. Default will be 0 |
| `limit` | query | string | No | The value by which the results should be limited. Default will be 10 |
| `order` | query | string | No | The order in which the results should be returned - Allowed values asc, desc. Default will be asc |
| `email` | query | string | No | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/locations/{locationId}`

Get Sub-Account (Formerly Location)

Get details of a Sub-Account (Formerly Location) by passing the sub-account id

Operation ID: `get-location`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/locations/{locationId}`

Put Sub-Account (Formerly Location)

Update a Sub-Account (Formerly Location) based on the data provided

Operation ID: `put-location`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateLocationDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | No | The name for the sub-account/location |
| `phone` | string | No | The phone number of the business for which sub-account is created |
| `companyId` | string | Yes | Company/Agency Id |
| `address` | string | No | The address of the business for which sub-account is created |
| `city` | string | No | The city where the business is located for which sub-account is created |
| `state` | string | No | The state in which the business operates for which sub-account is created |
| `country` | string (enum: AF, AX, AL, DZ, AS, AD, AO, AI, ...) | No | The country in which the business is present for which sub-account is created |
| `postalCode` | string | No | The postal code of the business for which sub-account is created |
| `website` | string | No | The website of the business for which sub-account is created |
| `timezone` | string | No | The timezone of the business for which sub-account is created |
| `prospectInfo` | object | No | - |
| `settings` | object | No | The default settings for location |
| `social` | object | No | The social media links for location |
| `twilio` | object | No | The twilio credentials for location |
| `mailgun` | object | No | The mailgun credentials for location |
| `snapshot` | object | No | The snapshot to be updated in the location. |


**Responses:**

- `200`: Successful update response
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/locations/{locationId}`

Delete Sub-Account (Formerly Location)

Delete a Sub-Account (Formerly Location) from the Agency

Operation ID: `delete-location`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `deleteTwilioAccount` | query | boolean | Yes | Boolean value to indicate whether to delete Twilio Account or not |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/locations/{locationId}/tags`

Get Tags

Get Sub-Account (Formerly Location) Tags

Operation ID: `get-location-tags`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/locations/{locationId}/tags`

Create Tag

Create tag

Operation ID: `create-tag`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `tagBody`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | Tag name |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/locations/{locationId}/tags/{tagId}`

Get tag by id

Get tag by id

Operation ID: `get-tag-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `tagId` | path | string | Yes | Tag Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/locations/{locationId}/tags/{tagId}`

Update tag

Update tag

Operation ID: `update-tag`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `tagId` | path | string | Yes | Tag Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `tagBody`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | Tag name |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/locations/{locationId}/tags/{tagId}`

Delete tag

Delete tag

Operation ID: `delete-tag`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `tagId` | path | string | Yes | Tag Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/locations/{locationId}/tasks/search`

Task Search Filter

Task Search

Operation ID: `task-search`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `TaskSearchParamsDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `contactId` | array<string> | No | Contact Ids |
| `completed` | boolean | No | Task Completed Or Pending |
| `assignedTo` | array<string> | No | Assigned User Ids |
| `query` | string | No | Search Value |
| `limit` | number | No | Limit To Api |
| `skip` | number | No | Number Of Tasks To Skip |
| `businessId` | string | No | Bussiness Id |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/locations/{locationId}/recurring-tasks/{id}`

Get Recurring Task By Id

Get Recurring Task By Id

Operation ID: `get-recurring-task-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | Recurring Task Id |
| `locationId` | path | string | Yes | Location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/locations/{locationId}/recurring-tasks/{id}`

Update Recurring Task

Update Recurring Task

Operation ID: `update-recurring-task`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | Recurring Task Id |
| `locationId` | path | string | Yes | Location Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `RecurringTaskUpdateDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | Name of the task |
| `description` | string | No | Description of the task |
| `contactIds` | array<string> | No | Contact Id |
| `owners` | array<string> | No | Assigned To |
| `rruleOptions` | object | No | Recurring rules |
| `ignoreTaskCreation` | boolean | No | Create initial task or not |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/locations/{locationId}/recurring-tasks/{id}`

Delete Recurring Task

Delete Recurring Task

Operation ID: `delete-recurring-task`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | Recurring Task Id |
| `locationId` | path | string | Yes | Location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/locations/{locationId}/recurring-tasks`

Create Recurring Task

Create Recurring Task

Operation ID: `create-recurring-task`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | - |

**Request Body (required):**

Content-Type: `application/json`

Schema: `RecurringTaskCreateDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | Name of the task |
| `description` | string | No | Description of the task |
| `contactIds` | array<string> | No | Contact Id |
| `owners` | array<string> | No | Assigned To |
| `rruleOptions` | object | Yes | Recurring rules |
| `ignoreTaskCreation` | boolean | No | Create initial task or not |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/locations/{locationId}/customFields`

Get Custom Fields

Get Custom Fields

Operation ID: `get-custom-fields`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `model` | query | string | No | Model of the custom field you want to retrieve |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/locations/{locationId}/customFields`

Create Custom Field

Create Custom Field

Operation ID: `create-custom-field`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateCustomFieldsDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `dataType` | string | Yes | - |
| `placeholder` | string | No | - |
| `acceptedFormat` | array<string> | No | - |
| `isMultipleFile` | boolean | No | - |
| `maxNumberOfFiles` | number | No | - |
| `textBoxListOptions` | array | No | - |
| `position` | number | No | - |
| `model` | string (enum: contact, opportunity) | No | Model of the custom field you want to create |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/locations/{locationId}/customFields/{id}`

Get Custom Field

Get Custom Field

Operation ID: `get-custom-field`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `id` | path | string | Yes | Custom Field Id or Field Key (e.g. "contact.first_name" or "opportunity.pipeline_id") |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/locations/{locationId}/customFields/{id}`

Update Custom Field

Update Custom Field

Operation ID: `update-custom-field`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `id` | path | string | Yes | Custom Field Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateCustomFieldsDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `placeholder` | string | No | - |
| `acceptedFormat` | array<string> | No | - |
| `isMultipleFile` | boolean | No | - |
| `maxNumberOfFiles` | number | No | - |
| `textBoxListOptions` | array | No | - |
| `position` | number | No | - |
| `model` | string (enum: contact, opportunity) | No | Model of the custom field you want to update |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/locations/{locationId}/customFields/{id}`

Delete Custom Field

Delete Custom Field

Operation ID: `delete-custom-field`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `id` | path | string | Yes | Custom Field Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/locations/{locationId}/customFields/upload`

Uploads File to customFields

Uploads File to customFields

Operation ID: `upload-file-customFields`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | - |

**Request Body (required):**

Content-Type: `multipart/form-data`

Schema: `FileUploadBody`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | Id(Contact Id/Opportunity Id/Custom Field Id) |
| `maxFiles` | string | No | Max number of files |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/locations/{locationId}/customValues`

Get Custom Values

Get Custom Values

Operation ID: `get-custom-values`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/locations/{locationId}/customValues`

Create Custom Value

Create Custom Value

Operation ID: `create-custom-value`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `customValuesDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `value` | string | Yes | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/locations/{locationId}/customValues/{id}`

Get Custom Value

Get Custom Value

Operation ID: `get-custom-value`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `id` | path | string | Yes | Custom Value Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/locations/{locationId}/customValues/{id}`

Update Custom Value

Update Custom Value

Operation ID: `update-custom-value`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `id` | path | string | Yes | Custom Value Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `customValuesDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `value` | string | Yes | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/locations/{locationId}/customValues/{id}`

Delete Custom Value

Delete Custom Value

Operation ID: `delete-custom-value`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `id` | path | string | Yes | Custom Value Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/locations/{locationId}/timezones`

Fetch Timezones

Fetch the available timezones

Operation ID: `get-timezones`

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

### GET `/locations/{locationId}/templates`

GET all or email/sms templates

GET all or email/sms templates

Operation ID: `GET-all-or-email-sms-templates`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `deleted` | query | boolean | No | - |
| `skip` | query | string | No | - |
| `limit` | query | string | No | - |
| `type` | query | string | No | - |
| `originId` | query | string | Yes | Origin Id |
| `locationId` | path | string | Yes | Location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/locations/{locationId}/templates/{id}`

DELETE an email/sms template

DELETE an email/sms template

Operation ID: `DELETE-an-email-sms-template`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location Id |
| `id` | path | string | Yes | Template Id |

**Responses:**

- `200`: 
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/locations/`

Create Sub-Account (Formerly Location)

<div>
                  <p>Create a new Sub-Account (Formerly Location) based on the data provided</p> 
                  <div>
                    <span style= "display: inline-block;
                                width: 25px; height: 25px;
                                background-color: yellow;
                                color: black;
                                font-weight: bold;
                                font-size: 24px;
                                text-align: center;
                                line-height: 22px;
                                border: 2px solid black;
                                border-radius: 10%;
                                margin-right: 10px;">
                                !
                      </span>
                      <span>
                        <strong>
                          This feature is only available on Agency Pro ($497) plan.
                        </strong>
                      </span>
                  </div>
                </div>
    

Operation ID: `create-location`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateLocationDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name for the sub-account/location |
| `phone` | string | No | The phone number of the business for which sub-account is created with the appropriate country-code |
| `companyId` | string | Yes | Company/Agency Id |
| `address` | string | No | The address of the business for which sub-account is created |
| `city` | string | No | The city where the business is located for which sub-account is created |
| `state` | string | No | The state in which the business operates for which sub-account is created |
| `country` | string (enum: AF, AX, AL, DZ, AS, AD, AO, AI, ...) | No | The 2 letter country-code in which the business is present for which sub-account is created |
| `postalCode` | string | No | The postal code of the business for which sub-account is created |
| `website` | string | No | The website of the business for which sub-account is created |
| `timezone` | string | No | The timezone of the business for which sub-account is created |
| `prospectInfo` | object | No | - |
| `settings` | object | No | The default settings for location |
| `social` | object | No | The social media links for location |
| `twilio` | object | No | The twilio credentials for location |
| `mailgun` | object | No | The mailgun credentials for location |
| `snapshotId` | string | No | The snapshot ID to be loaded into the location. |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

## Schemas

### SettingsSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `allowDuplicateContact` | boolean | No | - |
| `allowDuplicateOpportunity` | boolean | No | - |
| `allowFacebookNameMerge` | boolean | No | - |
| `disableContactTimezone` | boolean | No | - |


### SocialSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `facebookUrl` | string | No | Facebook URL |
| `googlePlus` | string | No | Googleplus URL |
| `linkedIn` | string | No | LinkedIn URL |
| `foursquare` | string | No | Foursquare URL |
| `twitter` | string | No | Twitter URL |
| `yelp` | string | No | Yelp URL |
| `instagram` | string | No | Instagram URL |
| `youtube` | string | No | Instagram URL |
| `pinterest` | string | No | Instagram URL |
| `blogRss` | string | No | Instagram URL |
| `googlePlacesId` | string | No | Google Business Places ID |


### GetLocationSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | Location Id |
| `name` | string | No | The name for the sub-account/location |
| `phone` | string | No | The phone number of the business for which sub-account is created |
| `email` | string | No | The email for the sub-account/location |
| `address` | string | No | The address of the business for which sub-account is created |
| `city` | string | No | The city where the business is located for which sub-account is created |
| `state` | string | No | The state in which the business operates for which sub-account is created |
| `country` | string | No | The country in which the business is present for which sub-account is created |
| `postalCode` | string | No | The postal code of the business for which sub-account is created |
| `website` | string | No | The website of the business for which sub-account is created |
| `timezone` | string | No | The timezone of the business for which sub-account is created |
| `settings` | object | No | The default settings for location |
| `social` | object | No | The social media links for location |


### SearchSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locations` | array<GetLocationSchema> | No | - |


### BusinessSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | No | - |
| `address` | string | No | - |
| `city` | string | No | - |
| `state` | string | No | - |
| `country` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `timezone` | string | No | - |
| `logoUrl` | string | No | - |


### GetLocationByIdSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `companyId` | string | No | - |
| `name` | string | No | - |
| `domain` | string | No | - |
| `address` | string | No | - |
| `city` | string | No | - |
| `state` | string | No | - |
| `logoUrl` | string | No | - |
| `country` | string | No | - |
| `postalCode` | string | No | - |
| `website` | string | No | - |
| `timezone` | string | No | - |
| `firstName` | string | No | - |
| `lastName` | string | No | - |
| `email` | string | No | - |
| `phone` | string | No | - |
| `business` | BusinessSchema | No | - |
| `social` | SocialSchema | No | - |
| `settings` | SettingsSchema | No | - |
| `reseller` | object | No | - |


### GetLocationByIdSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `location` | GetLocationByIdSchema | No | - |


### ProspectInfoDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstName` | string | Yes | First name of the prospect |
| `lastName` | string | Yes | Last name of the prospect |
| `email` | string | Yes | Email of the prospect |


### TwilioSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `sid` | string | Yes | SID provided by Twilio |
| `authToken` | string | Yes | Auth token provided by Twilio |


### MailgunSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `apiKey` | string | Yes | API key provided by Mailgun |
| `domain` | string | Yes | Domain connected with Mailgun |


### CreateLocationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name for the sub-account/location |
| `phone` | string | No | The phone number of the business for which sub-account is created with the appropriate country-code |
| `companyId` | string | Yes | Company/Agency Id |
| `address` | string | No | The address of the business for which sub-account is created |
| `city` | string | No | The city where the business is located for which sub-account is created |
| `state` | string | No | The state in which the business operates for which sub-account is created |
| `country` | string (enum: AF, AX, AL, DZ, AS, AD, AO, AI, ...) | No | The 2 letter country-code in which the business is present for which sub-account is created |
| `postalCode` | string | No | The postal code of the business for which sub-account is created |
| `website` | string | No | The website of the business for which sub-account is created |
| `timezone` | string | No | The timezone of the business for which sub-account is created |
| `prospectInfo` | object | No | - |
| `settings` | object | No | The default settings for location |
| `social` | object | No | The social media links for location |
| `twilio` | object | No | The twilio credentials for location |
| `mailgun` | object | No | The mailgun credentials for location |
| `snapshotId` | string | No | The snapshot ID to be loaded into the location. |


### CreateLocationSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | Location Id |
| `companyId` | string | No | Company/Agency Id |
| `name` | string | No | The name for the sub-account/location |
| `phone` | string | No | The phone number of the business for which sub-account is created |
| `email` | string | No | The email for the sub-account/location |
| `address` | string | No | The address of the business for which sub-account is created |
| `city` | string | No | The city where the business is located for which sub-account is created |
| `state` | string | No | The state in which the business operates for which sub-account is created |
| `domain` | string | No | - |
| `country` | string (enum: AF, AX, AL, DZ, AS, AD, AO, AI, ...) | No | The country in which the business is present for which sub-account is created |
| `postalCode` | string | No | The postal code of the business for which sub-account is created |
| `website` | string | No | The website of the business for which sub-account is created |
| `timezone` | string | No | The timezone of the business for which sub-account is created |
| `settings` | object | No | The default settings for location |
| `social` | object | No | The social media links for location |


### SnapshotPutSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Snaptshot ID |
| `override` | boolean | No | If you want override all conflicted assets then pass true. Default value is false. |


### UpdateLocationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | No | The name for the sub-account/location |
| `phone` | string | No | The phone number of the business for which sub-account is created |
| `companyId` | string | Yes | Company/Agency Id |
| `address` | string | No | The address of the business for which sub-account is created |
| `city` | string | No | The city where the business is located for which sub-account is created |
| `state` | string | No | The state in which the business operates for which sub-account is created |
| `country` | string (enum: AF, AX, AL, DZ, AS, AD, AO, AI, ...) | No | The country in which the business is present for which sub-account is created |
| `postalCode` | string | No | The postal code of the business for which sub-account is created |
| `website` | string | No | The website of the business for which sub-account is created |
| `timezone` | string | No | The timezone of the business for which sub-account is created |
| `prospectInfo` | object | No | - |
| `settings` | object | No | The default settings for location |
| `social` | object | No | The social media links for location |
| `twilio` | object | No | The twilio credentials for location |
| `mailgun` | object | No | The mailgun credentials for location |
| `snapshot` | object | No | The snapshot to be updated in the location. |


### LocationDeletedSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Success status of the API |
| `message` | string | Yes | Success message of the API |


### LocationTagsSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | No | - |
| `locationId` | string | No | - |
| `id` | string | No | - |


### LocationTagsSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `tags` | array<LocationTagsSchema> | No | - |


### LocationTagSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `tag` | LocationTagsSchema | No | - |


### tagBody

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | Tag name |


### LocationTagDeleteSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |


### TaskSearchParamsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `contactId` | array<string> | No | Contact Ids |
| `completed` | boolean | No | Task Completed Or Pending |
| `assignedTo` | array<string> | No | Assigned User Ids |
| `query` | string | No | Search Value |
| `limit` | number | No | Limit To Api |
| `skip` | number | No | Number Of Tasks To Skip |
| `businessId` | string | No | Bussiness Id |


### LocationTaskListSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `tasks` | array<array> | No | - |


### CustomFieldSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `fieldKey` | string | No | - |
| `placeholder` | string | No | - |
| `dataType` | string | No | - |
| `position` | number | No | - |
| `picklistOptions` | array<string> | No | - |
| `picklistImageOptions` | array<string> | No | - |
| `isAllowedCustomOption` | boolean | No | - |
| `isMultiFileAllowed` | boolean | No | - |
| `maxFileLimit` | number | No | - |
| `locationId` | string | No | - |
| `model` | string (enum: contact, opportunity) | No | Model of the custom field |


### CustomFieldsListSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `customFields` | array<CustomFieldSchema> | No | - |


### CustomFieldSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `customField` | CustomFieldSchema | No | - |


### textBoxListOptionsSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `label` | string | No | - |
| `prefillValue` | string | No | - |


### CreateCustomFieldsDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `dataType` | string | Yes | - |
| `placeholder` | string | No | - |
| `acceptedFormat` | array<string> | No | - |
| `isMultipleFile` | boolean | No | - |
| `maxNumberOfFiles` | number | No | - |
| `textBoxListOptions` | array | No | - |
| `position` | number | No | - |
| `model` | string (enum: contact, opportunity) | No | Model of the custom field you want to create |


### UpdateCustomFieldsDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `placeholder` | string | No | - |
| `acceptedFormat` | array<string> | No | - |
| `isMultipleFile` | boolean | No | - |
| `maxNumberOfFiles` | number | No | - |
| `textBoxListOptions` | array | No | - |
| `position` | number | No | - |
| `model` | string (enum: contact, opportunity) | No | Model of the custom field you want to update |


### CustomFieldDeleteSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |


### FileUploadBody

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | Id(Contact Id/Opportunity Id/Custom Field Id) |
| `maxFiles` | string | No | Max number of files |


### FileUploadResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `uploadedFiles` | object | No | Uploaded files |
| `meta` | array<string> | No | Meta data of uploaded files |


### CustomValueSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `fieldKey` | string | No | - |
| `value` | string | No | - |
| `locationId` | string | No | - |


### CustomValuesListSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `customValues` | array<CustomValueSchema> | No | - |


### CustomValueIdSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `customValue` | CustomValueSchema | No | - |


### customValuesDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `value` | string | Yes | - |


### CustomValueDeleteSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | No | - |


### SmsTemplateSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `body` | string | No | - |
| `attachments` | array<array> | No | - |


### GetSmsTemplateResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `type` | string | No | - |
| `template` | SmsTemplateSchema | No | - |
| `dateAdded` | string | No | - |
| `locationId` | string | No | - |
| `urlAttachments` | array<string> | No | - |


### EmailTemplateSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `subject` | string | No | - |
| `attachments` | array<array> | No | - |
| `html` | string | No | - |


### GetEmailTemplateResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |
| `type` | string | No | - |
| `dateAdded` | string | No | - |
| `template` | EmailTemplateSchema | No | - |
| `locationId` | string | No | - |


### GetTemplatesSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `templates` | array | No | - |
| `totalCount` | number | No | - |


### CustomRRulesOptions

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `intervalType` | string (enum: yearly, monthly, weekly, daily, hourly) | Yes | - |
| `interval` | number | Yes | - |
| `startDate` | string | Yes | Start Date |
| `endDate` | string | No | End Date |
| `dayOfMonth` | number | No | 1, 2, 3, ..., 27, 31 |
| `dayOfWeek` | string (enum: MO, TU, WE, TH, FR, SA, SU) | No | - |
| `monthOfYear` | number | No | 1, 2, ....., 11, 12 |
| `count` | number | No | Max number of task executions |
| `createTaskIfOverDue` | boolean | No | Create Task If Over Due |
| `dueAfterSeconds` | number | Yes | Due after seconds |


### RecurringTaskResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Recurring Task Id |
| `title` | string | Yes | Name of the task |
| `description` | string | Yes | Description of the task |
| `locationId` | string | Yes | Location Id |
| `updatedAt` | string | Yes | Updated At |
| `createdAt` | string | Yes | Created At |
| `rruleOptions` | object | Yes | Recurring rules |
| `totalOccurrence` | number | Yes | Total Occurrence |
| `deleted` | boolean | Yes | Deleted |
| `assignedTo` | string | No | Assigned To |
| `contactId` | string | No | Contact Id |


### RecurringTaskSingleResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `recurringTask` | object | Yes | Recurring Tasks |


### RecurringTaskCreateDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | Name of the task |
| `description` | string | No | Description of the task |
| `contactIds` | array<string> | No | Contact Id |
| `owners` | array<string> | No | Assigned To |
| `rruleOptions` | object | Yes | Recurring rules |
| `ignoreTaskCreation` | boolean | No | Create initial task or not |


### RecurringTaskUpdateDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | Name of the task |
| `description` | string | No | Description of the task |
| `contactIds` | array<string> | No | Contact Id |
| `owners` | array<string> | No | Assigned To |
| `rruleOptions` | object | No | Recurring rules |
| `ignoreTaskCreation` | boolean | No | Create initial task or not |


### DeleteRecurringTaskResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Recurring Task Id |
| `success` | boolean | Yes | Success |


