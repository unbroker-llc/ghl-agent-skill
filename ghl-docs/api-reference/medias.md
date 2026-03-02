# Media Library API

Documentation for Files API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency.

## Endpoints

### GET `/medias/files`

Get List of Files/ Folders

Fetches list of files and folders from the media library

Operation ID: `fetch-media-content`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `offset` | query | string | No | Number of files to skip in listing |
| `limit` | query | string | No | Number of files to show in the listing |
| `sortBy` | query | string | Yes | Field to sorting the file listing by |
| `sortOrder` | query | string | Yes | Direction in which file needs to be sorted |
| `type` | query | string | Yes | Type |
| `query` | query | string | No | Query text |
| `altType` | query | string | Yes | AltType |
| `altId` | query | string | Yes | location Id |
| `parentId` | query | string | No | parent id or folder id |
| `fetchAll` | query | string | No | Fetch all files or folders |

**Responses:**

- `200`: Successful response

---

### POST `/medias/upload-file`

Upload File into Media Library

If hosted is set to true then fileUrl is required. Else file is required. If adding a file, maximum allowed is 25 MB

Operation ID: `upload-media-content`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `multipart/form-data`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `file` | string | No | - |
| `hosted` | boolean | No | - |
| `fileUrl` | string | No | - |
| `name` | string | No | - |
| `parentId` | string | No | - |


**Responses:**

- `200`: Successful response

---

### DELETE `/medias/{id}`

Delete File or Folder

Deletes specific file or folder from the media library

Operation ID: `delete-media-content`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | - |
| `altType` | query | string | Yes | AltType |
| `altId` | query | string | Yes | location Id |

**Responses:**

- `200`: Successful response

---

### POST `/medias/{id}`

Update File/ Folder

Updates a single file or folder by ID

Operation ID: `update-media-object`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `id` | path | string | Yes | Unique identifier of the file or folder to update |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateObject`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | New name for the file or folder |
| `altType` | string (enum: location) | Yes | Type of entity that owns the file or folder |
| `altId` | string | Yes | Location identifier that owns the file or folder |


**Responses:**

- `200`: Successful response

---

### POST `/medias/folder`

Create Folder

Creates a new folder in the media library

Operation ID: `create-media-folder`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateFolderParams`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | Type of entity (location only) |
| `name` | string | Yes | Name of the folder to be created |
| `parentId` | string | No | ID of the parent folder (optional) |


**Responses:**

- `200`: Returns the newly created folder object

---

### PUT `/medias/update-files`

Bulk Update Files/ Folders

Updates metadata or status of multiple files and folders

Operation ID: `bulk-update-media-objects`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateMediaObjects`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location identifier |
| `altType` | string (enum: location) | Yes | Type of entity that owns the files |
| `filesToBeUpdated` | array<UpdateMediaObject> | Yes | Array of file objects to be updated |


**Responses:**

- `200`: Successful response

---

### PUT `/medias/delete-files`

Bulk Delete / Trash Files or Folders

Soft-deletes or trashes multiple files and folders in a single request

Operation ID: `bulk-delete-media-objects`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `DeleteMediaObjectsBodyParams`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `filesToBeDeleted` | array<DeleteMediaObjectItem> | Yes | Array of file objects to be deleted or trashed |
| `altType` | string (enum: location) | Yes | Type of entity that owns the files |
| `altId` | string | Yes | Location identifier |
| `status` | string (enum: deleted, trashed) | Yes | Status to set for the files (deleted or trashed) |


**Responses:**

- `200`: Successful response

---

## Schemas

### GetFilesResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `files` | array<string> | Yes | Array of File Objects |


### UploadFileResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `fileId` | string | Yes | ID of the uploaded file |
| `url` | string | Yes | Google Cloud Storage URL of the uploaded file |


### FolderDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location identifier that owns this folder |
| `altType` | string (enum: location) | Yes | Type of entity that owns the folder |
| `name` | string | Yes | Name of the folder |
| `parentId` | string | No | ID of the parent folder (null for root folders) |
| `type` | string | Yes | Type of the object (always 'folder' for folders) |
| `deleted` | boolean | No | Whether the folder has been deleted |
| `pendingUpload` | boolean | No | Whether there are pending uploads to this folder |
| `category` | string | No | Primary category of content stored in the folder |
| `subCategory` | string | No | Sub-category of content stored in the folder |
| `isPrivate` | boolean | No | Whether the folder is private and not publicly accessible |
| `relocatedFolder` | boolean | No | Whether the folder has been moved from its original location |
| `migrationCompleted` | boolean | No | Whether the data migration process has been completed for this folder |
| `appFolder` | boolean | No | Whether this is a system-generated application folder |
| `isEssential` | boolean | No | Whether the folder is essential and should not be deleted |
| `status` | string | No | Current status of the folder |
| `lastUpdatedBy` | string | No | ID of the user who last updated the folder |


### CreateFolderParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | Type of entity (location only) |
| `name` | string | Yes | Name of the folder to be created |
| `parentId` | string | No | ID of the parent folder (optional) |


### UpdateObject

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | New name for the file or folder |
| `altType` | string (enum: location) | Yes | Type of entity that owns the file or folder |
| `altId` | string | Yes | Location identifier that owns the file or folder |


### UpdateMediaObjects

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location identifier |
| `altType` | string (enum: location) | Yes | Type of entity that owns the files |
| `filesToBeUpdated` | array<UpdateMediaObject> | Yes | Array of file objects to be updated |


### DeleteMediaObjectItem

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Unique identifier of the file or folder to be deleted |


### UpdateMediaObject

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Unique identifier of the file or folder to be updated |
| `name` | string | No | New name for the file or folder |


### DeleteMediaObjectsBodyParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `filesToBeDeleted` | array<DeleteMediaObjectItem> | Yes | Array of file objects to be deleted or trashed |
| `altType` | string (enum: location) | Yes | Type of entity that owns the files |
| `altId` | string | Yes | Location identifier |
| `status` | string (enum: deleted, trashed) | Yes | Status to set for the files (deleted or trashed) |


### MoveOrDeleteObjectParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altType` | string | Yes | - |
| `altId` | string | Yes | - |
| `_id` | string | Yes | - |


