# Custom Fields V2

Custom fields are data points that allow you to capture and store specific information tailored to your business requirements. You can create fields across field types like text, numeric, selection options and special fields like date/time or signature

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### GET `/custom-fields/{id}`

Get Custom Field / Folder By Id

<div>
                  <p> Get Custom Field / Folder By Id.</p> 
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
                        Only supports Custom Objects and Company (Business) today. Will be extended to other Standard Objects in the future.
                        </strong>
                      </span>
                  </div>
                </div>

Operation ID: `get-custom-field-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/custom-fields/{id}`

Update Custom Field By Id

<div>
    <p> Update Custom Field By Id </p> 
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
          Only supports Custom Objects and Company (Business) today. Will be extended to other Standard Objects in the future.
          </strong>
        </span>
    </div>
  </div>

Operation ID: `update-custom-field`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | - |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateCustomFieldsDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `name` | string | No | Field name |
| `description` | string | No | Description of the field |
| `placeholder` | string | No | Placeholder text for the field |
| `showInForms` | boolean | Yes | Whether the field should be shown in forms |
| `options` | array<OptionDTO> | No | Options for the field. Important: Providing options will completely replace the existing options array. You must include all existing options alongside any new options you wish to add. Removal of options is not supported through this update. Applicable only for SINGLE_OPTIONS, MULTIPLE_OPTIONS, RADIO, CHECKBOX, TEXTBOX_LIST types. |
| `acceptedFormats` | string (enum: .pdf, .docx, .doc, .jpg, .jpeg, .png, .gif, .csv, ...) | No | Allowed file formats for uploads. Options include: .pdf, .docx, .doc, .jpg, .jpeg, .png, .gif, .csv, .xlsx, .xls, all |
| `maxFileLimit` | number | No | Maximum file limit for uploads. Applicable only for fields with a data type of FILE_UPLOAD. |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/custom-fields/{id}`

Delete Custom Field By Id

<div>
    <p> Delete Custom Field By Id </p> 
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
          Only supports Custom Objects and Company (Business) today. Will be extended to other Standard Objects in the future.
          </strong>
        </span>
    </div>
  </div>

Operation ID: `delete-custom-field`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/custom-fields/object-key/{objectKey}`

Get Custom Fields By Object Key

<div>
                  <p> Get Custom Fields By Object Key</p> 
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
                        Only supports Custom Objects and Company (Business) today. Will be extended to other Standard Objects in the future.
                        </strong>
                      </span>
                  </div>
                </div>

Operation ID: `get-custom-fields-by-object-key`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `objectKey` | path | string | Yes | key of the Object. Must include "custom_objects." prefix for custom objects. Available on the Custom Objects details Page under settings |
| `locationId` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/custom-fields/folder`

Create Custom Field Folder

<div>
    <p> Create Custom Field Folder </p> 
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
          Only supports Custom Objects and Company (Business) today. Will be extended to other Standard Objects in the future.
          </strong>
        </span>
    </div>
  </div>

Operation ID: `create-custom-field-folder`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateFolder`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `objectKey` | string | Yes | The key for your custom object. This key uniquely identifies the custom object. Example: "custom_object.pet" for a custom object related to pets. |
| `name` | string | Yes | Field name |
| `locationId` | string | Yes | Location Id |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/custom-fields/folder/{id}`

Update Custom Field Folder Name

<div>
    <p> Create Custom Field Folder </p> 
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
          Only supports Custom Objects and Company (Business) today. Will be extended to other Standard Objects in the future.
          </strong>
        </span>
    </div>
  </div>

Operation ID: `update-custom-field-folder`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | - |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateFolder`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | Field name |
| `locationId` | string | Yes | Location Id |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/custom-fields/folder/{id}`

Delete Custom Field Folder

<div>
    <p> Create Custom Field Folder </p> 
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
          Only supports Custom Objects and Company (Business) today. Will be extended to other Standard Objects in the future.
          </strong>
        </span>
    </div>
  </div>

Operation ID: `delete-custom-field-folder`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | - |
| `locationId` | query | string | Yes | Location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/custom-fields/`

Create Custom Field

<div>
                  <p> Create Custom Field </p> 
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
                        Only supports Custom Objects and Company (Business) today. Will be extended to other Standard Objects in the future.
                        </strong>
                      </span>
                  </div>
                </div>

Operation ID: `create-custom-field`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateCustomFieldsDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `name` | string | No | Field name |
| `description` | string | No | Description of the field |
| `placeholder` | string | No | Placeholder text for the field |
| `showInForms` | boolean | Yes | Whether the field should be shown in forms |
| `options` | array<OptionDTO> | No | Options for the field (Optional, valid only for SINGLE_OPTIONS, MULTIPLE_OPTIONS, RADIO, CHECKBOX, TEXTBOX_LIST type) |
| `acceptedFormats` | string (enum: .pdf, .docx, .doc, .jpg, .jpeg, .png, .gif, .csv, ...) | No | Allowed file formats for uploads. Options include: .pdf, .docx, .doc, .jpg, .jpeg, .png, .gif, .csv, .xlsx, .xls, all |
| `dataType` | string (enum: TEXT, LARGE_TEXT, NUMERICAL, PHONE, MONETORY, CHECKBOX, SINGLE_OPTIONS, MULTIPLE_OPTIONS, ...) | Yes | Type of field that you are trying to create |
| `fieldKey` | string | Yes | Field key. For Custom Object it's formatted as "custom_object.{objectKey}.{fieldKey}". "custom_object" is a fixed prefix, "{objectKey}" is your custom object's identifier, and "{fieldKey}" is the unique field name within that object. Example: "custom_object.pet.name" for a "name" field in a "pet" custom object. |
| `objectKey` | string | Yes | The key for your custom object. This key uniquely identifies the custom object. Example: "custom_object.pet" for a custom object related to pets. |
| `maxFileLimit` | number | No | Maximum file limit for uploads. Applicable only for fields with a data type of FILE_UPLOAD. |
| `allowCustomOption` | boolean | No | Determines if users can add a custom option value different from the predefined options in records for RADIO type fields. A custom value added in one record does not automatically become an option and will not appear as an option for other records. |
| `parentId` | string | Yes | ID of the parent folder |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

## Schemas

### OptionDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `key` | string | Yes | Key of the option (Included in Create and Response, excluded in Update) |
| `label` | string | Yes | Value of the option |
| `url` | string | No | URL associated with the option (Optional, valid only for RADIO type) |


### ICustomField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `name` | string | No | Field name |
| `description` | string | No | Description of the field |
| `placeholder` | string | No | Placeholder text for the field |
| `showInForms` | boolean | Yes | Whether the field should be shown in forms |
| `options` | array<OptionDTO> | No | Options for the field (Optional, valid only for SINGLE_OPTIONS, MULTIPLE_OPTIONS, RADIO, CHECKBOX, TEXTBOX_LIST type) |
| `acceptedFormats` | string (enum: .pdf, .docx, .doc, .jpg, .jpeg, .png, .gif, .csv, ...) | No | Allowed file formats for uploads. Options include: .pdf, .docx, .doc, .jpg, .jpeg, .png, .gif, .csv, .xlsx, .xls, all |
| `id` | string | Yes | Unique identifier of the object |
| `objectKey` | string | Yes | The key for your custom / standard object. This key uniquely identifies the custom object. Example: "custom_object.pet" for a custom object related to pets. |
| `dataType` | string (enum: TEXT, LARGE_TEXT, NUMERICAL, PHONE, MONETORY, CHECKBOX, SINGLE_OPTIONS, MULTIPLE_OPTIONS, ...) | Yes | Type of field that you are trying to create |
| `parentId` | string | Yes | ID of the parent folder |
| `fieldKey` | string | Yes | Field key. For Custom Object it's formatted as "custom_object.{objectKey}.{fieldKey}". "custom_object" is a fixed prefix, "{objectKey}" is your custom object's identifier, and "{fieldName}" is the unique field name within that object. Example: "custom_object.pet.name" for a "name" field in a "pet" custom object. |
| `allowCustomOption` | boolean | No | Determines if users can add a custom option value different from the predefined options in records for RADIO type fields. A custom value added in one record does not automatically become an option and will not appear as an option for other records. |
| `maxFileLimit` | number | No | Maximum file limit for uploads |
| `dateAdded` | string | Yes | Date and time when the object was added |
| `dateUpdated` | string | Yes | Date and time when the object was last updated |


### CustomFieldSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `field` | ICustomField | No | - |


### CustomFieldsResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `fields` | array<ICustomField> | No | Custom Fields for the object. |
| `folders` | array<ICustomField> | No | Custom Fields folder for the object. |


### CreateCustomFieldsDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `name` | string | No | Field name |
| `description` | string | No | Description of the field |
| `placeholder` | string | No | Placeholder text for the field |
| `showInForms` | boolean | Yes | Whether the field should be shown in forms |
| `options` | array<OptionDTO> | No | Options for the field (Optional, valid only for SINGLE_OPTIONS, MULTIPLE_OPTIONS, RADIO, CHECKBOX, TEXTBOX_LIST type) |
| `acceptedFormats` | string (enum: .pdf, .docx, .doc, .jpg, .jpeg, .png, .gif, .csv, ...) | No | Allowed file formats for uploads. Options include: .pdf, .docx, .doc, .jpg, .jpeg, .png, .gif, .csv, .xlsx, .xls, all |
| `dataType` | string (enum: TEXT, LARGE_TEXT, NUMERICAL, PHONE, MONETORY, CHECKBOX, SINGLE_OPTIONS, MULTIPLE_OPTIONS, ...) | Yes | Type of field that you are trying to create |
| `fieldKey` | string | Yes | Field key. For Custom Object it's formatted as "custom_object.{objectKey}.{fieldKey}". "custom_object" is a fixed prefix, "{objectKey}" is your custom object's identifier, and "{fieldKey}" is the unique field name within that object. Example: "custom_object.pet.name" for a "name" field in a "pet" custom object. |
| `objectKey` | string | Yes | The key for your custom object. This key uniquely identifies the custom object. Example: "custom_object.pet" for a custom object related to pets. |
| `maxFileLimit` | number | No | Maximum file limit for uploads. Applicable only for fields with a data type of FILE_UPLOAD. |
| `allowCustomOption` | boolean | No | Determines if users can add a custom option value different from the predefined options in records for RADIO type fields. A custom value added in one record does not automatically become an option and will not appear as an option for other records. |
| `parentId` | string | Yes | ID of the parent folder |


### CreateFolder

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `objectKey` | string | Yes | The key for your custom object. This key uniquely identifies the custom object. Example: "custom_object.pet" for a custom object related to pets. |
| `name` | string | Yes | Field name |
| `locationId` | string | Yes | Location Id |


### ICustomFieldFolder

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Unique identifier of the object |
| `objectKey` | string | Yes | The key for your custom object. This key uniquely identifies the custom object. Example: "custom_object.pet" for a custom object related to pets. |
| `locationId` | string | Yes | Location Id |
| `name` | string | Yes | Field name |


### UpdateFolder

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | Field name |
| `locationId` | string | Yes | Location Id |


### CustomFolderDeleteResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeded` | boolean | Yes | - |
| `id` | string | Yes | - |
| `key` | string | Yes | - |


### UpdateCustomFieldsDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `name` | string | No | Field name |
| `description` | string | No | Description of the field |
| `placeholder` | string | No | Placeholder text for the field |
| `showInForms` | boolean | Yes | Whether the field should be shown in forms |
| `options` | array<OptionDTO> | No | Options for the field. Important: Providing options will completely replace the existing options array. You must include all existing options alongside any new options you wish to add. Removal of options is not supported through this update. Applicable only for SINGLE_OPTIONS, MULTIPLE_OPTIONS, RADIO, CHECKBOX, TEXTBOX_LIST types. |
| `acceptedFormats` | string (enum: .pdf, .docx, .doc, .jpg, .jpeg, .png, .gif, .csv, ...) | No | Allowed file formats for uploads. Options include: .pdf, .docx, .doc, .jpg, .jpeg, .png, .gif, .csv, .xlsx, .xls, all |
| `maxFileLimit` | number | No | Maximum file limit for uploads. Applicable only for fields with a data type of FILE_UPLOAD. |


