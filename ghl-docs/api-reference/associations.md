# Associations API

Documentation for Associations API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### POST `/associations/relations`

Create Relation for you associated entities.

Create Relation.Documentation Link - https://doc.clickup.com/8631005/d/h/87cpx-293776/cd0f4122abc04d3

Operation ID: `create-relation`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `createRelationReqDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Your Sub Account's ID |
| `associationId` | string | Yes | Association's Id |
| `firstRecordId` | string | Yes | First Record's Id. For instance, if you have an association between a contact and a custom object, and you specify the contact as the first object while creating the association, then your firstRecordId would be the contactId  |
| `secondRecordId` | string | Yes | Second Record's Id.For instance, if you have an association between a contact and a custom object, and you specify the custom object as the second entity while creating the association, then your secondRecordId would be the customObject record Id |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/associations/relations/{recordId}`

Get all relations By record Id

Get all relations by record Id

Operation ID: `get-relations-by-record-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `recordId` | path | string | Yes | - |
| `locationId` | query | string | Yes | Your Sub Account's ID |
| `skip` | query | number | Yes | - |
| `limit` | query | number | Yes | - |
| `associationIds` | query | array | No | Association Ids |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/associations/relations/{relationId}`

Delete Relation

Delete Relation

Operation ID: `delete-relation`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `relationId` | path | string | Yes | - |
| `locationId` | query | string | Yes | Your Sub Account's ID |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/associations/key/{key_name}`

Get association key by key name

Using this api you can get standard / user defined association by key

Operation ID: `get-association-key-by-key-name`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `key_name` | path | string | Yes | - |
| `locationId` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/associations/objectKey/{objectKey}`

Get association by object keys

Get association by object keys like contacts, custom objects and opportunities. Documentation Link - https://doc.clickup.com/8631005/d/h/87cpx-293776/cd0f4122abc04d3

Operation ID: `get-association-by-object-keys`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `objectKey` | path | string | No | - |
| `locationId` | query | string | No | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/associations/{associationId}`

Update Association By Id

Update Association , Allows you to update labels of an associations. Documentation Link - https://doc.clickup.com/8631005/d/h/87cpx-293776/cd0f4122abc04d3

Operation ID: `update-association`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `associationId` | path | string | Yes | - |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateAssociationReqDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstObjectLabel` | object | Yes | - |
| `secondObjectLabel` | object | Yes | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/associations/{associationId}`

Delete Association

Delete USER_DEFINED Association By Id, deleting an association will also all the relations for that association

Operation ID: `delete-association`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `associationId` | path | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/associations/{associationId}`

Get association by ID

Using this api you can get SYSTEM_DEFINED / USER_DEFINED association by id 

Operation ID: `get-association-by-ID`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `associationId` | path | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/associations/`

Create Association

Allow you to create contact - contact , contact - custom objects associations, will add more in the future.Documentation Link - https://doc.clickup.com/8631005/d/h/87cpx-293776/cd0f4122abc04d3

Operation ID: `create-association`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `createAssociationReqDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `key` | string | Yes | Association's Unique key |
| `firstObjectLabel` | object | Yes | First Objects Association Label (custom_objects.children) |
| `firstObjectKey` | object | Yes | First Objects Key |
| `secondObjectLabel` | object | Yes | Second Object Association Label (contact) |
| `secondObjectKey` | object | Yes | Second Objects Key |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/associations/`

Get all associations for a sub-account / location

Get all Associations

Operation ID: `find-associations`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | - |
| `skip` | query | number | Yes | - |
| `limit` | query | number | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### createRelationReqDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Your Sub Account's ID |
| `associationId` | string | Yes | Association's Id |
| `firstRecordId` | string | Yes | First Record's Id. For instance, if you have an association between a contact and a custom object, and you specify the contact as the first object while creating the association, then your firstRecordId would be the contactId  |
| `secondRecordId` | string | Yes | Second Record's Id.For instance, if you have an association between a contact and a custom object, and you specify the custom object as the second entity while creating the association, then your secondRecordId would be the customObject record Id |


### GetPostSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `id` | string | Yes | - |
| `key` | string | Yes | First Objects Association Label (custom_objects.children) |
| `firstObjectLabel` | object | Yes | First Objects Association Label (custom_objects.children) |
| `firstObjectKey` | object | Yes | First Objects Key |
| `secondObjectLabel` | object | Yes | Second Object Association Label (contact) |
| `secondObjectKey` | object | Yes | Second Objects Key |
| `associationType` | object | Yes | Association Type can be USER_DEFINED or SYSTEM_DEFINED |


### createAssociationReqDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `key` | string | Yes | Association's Unique key |
| `firstObjectLabel` | object | Yes | First Objects Association Label (custom_objects.children) |
| `firstObjectKey` | object | Yes | First Objects Key |
| `secondObjectLabel` | object | Yes | Second Object Association Label (contact) |
| `secondObjectKey` | object | Yes | Second Objects Key |


### UpdateAssociationReqDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `firstObjectLabel` | object | Yes | - |
| `secondObjectLabel` | object | Yes | - |


### DeleteAssociationsResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `deleted` | boolean | Yes | Deletion status |
| `id` | string | Yes | Association Id |
| `message` | string | Yes | - |


