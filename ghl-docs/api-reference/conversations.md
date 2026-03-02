# Conversations API

Documentation for Conversations API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access-Only**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### GET `/conversations/search`

Search Conversations

Returns a list of all conversations matching the search criteria along with the sort and filter options selected.

Operation ID: `search-conversation`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location Id |
| `contactId` | query | string | No | Contact Id |
| `assignedTo` | query | string | No | User IDs that conversations are assigned to. Multiple IDs can be provided as comma-separated values. Use "unassigned" to fetch conversations not assigned to any user. |
| `followers` | query | string | No | User IDs of followers to filter conversations by. Multiple IDs can be provided as comma-separated values. |
| `mentions` | query | string | No | User Id of the mention. Multiple values are comma separated. |
| `query` | query | string | No | Search paramater as a string |
| `sort` | query | string | No | Sort paramater - asc or desc |
| `startAfterDate` | query | any | No | Search to begin after the specified date - should contain the sort value of the last document |
| `id` | query | string | No | Id of the conversation |
| `limit` | query | number | No | Limit of conversations - Default is 20 |
| `lastMessageType` | query | string | No | Type of the last message in the conversation as a string |
| `lastMessageAction` | query | string | No | Action of the last outbound message in the conversation as string. |
| `lastMessageDirection` | query | string | No | Direction of the last message in the conversation as string. |
| `status` | query | string | No | The status of the conversation to be filtered - all, read, unread, starred  |
| `sortBy` | query | string | No | The sorting of the conversation to be filtered as - manual messages or all messages |
| `sortScoreProfile` | query | string | No | Id of score profile on which sortBy.ScoreProfile should sort on |
| `scoreProfile` | query | string | No | Id of score profile on which conversations should get filtered out, works with scoreProfileMin & scoreProfileMax |
| `scoreProfileMin` | query | number | No | Minimum value for score |
| `scoreProfileMax` | query | number | No | Maximum value for score |

**Responses:**

- `200`: Successfully fetched the conversations
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/conversations/{conversationId}`

Get Conversation

Get the conversation details based on the conversation ID

Operation ID: `get-conversation`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `conversationId` | path | string | Yes | Conversation ID as string |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/conversations/{conversationId}`

Update Conversation

Update the conversation details based on the conversation ID

Operation ID: `update-conversation`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `conversationId` | path | string | Yes | Conversation ID as string |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateConversationDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location ID as string |
| `unreadCount` | number | No | Count of unread messages in the conversation |
| `starred` | boolean | No | Starred status of the conversation. |
| `feedback` | object | No | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/conversations/{conversationId}`

Delete Conversation

Delete the conversation details based on the conversation ID

Operation ID: `delete-conversation`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `conversationId` | path | string | Yes | Conversation ID as string |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/conversations/messages/email/{id}`

Get email by Id

Get email by Id

Operation ID: `get-email-by-id`

**Responses:**

- `200`: Email object for the id given.

---

### DELETE `/conversations/messages/email/{emailMessageId}/schedule`

Cancel a scheduled email message.

Post the messageId for the API to delete a scheduled email message. <br />

Operation ID: `cancel-scheduled-email-message`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `emailMessageId` | path | string | Yes | Email Message Id |

**Responses:**

- `200`: The scheduled email message was cancelled successfully

---

### GET `/conversations/messages/{id}`

Get message by message id

Get message by message id.

Operation ID: `get-message`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Responses:**

- `200`: Message object for the id given.
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/conversations/{conversationId}/messages`

Get messages by conversation id

Get messages by conversation id.

Operation ID: `get-messages`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `conversationId` | path | string | Yes | Conversation ID as string |
| `lastMessageId` | query | string | No | Message ID of the last message in the list as a string |
| `limit` | query | number | No | Number of messages to be fetched from the conversation. Default limit is 20 |
| `type` | query | string | No | Types of message to fetched separated with comma |

**Responses:**

- `200`: List of messages for the conversation id of the given type.
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/conversations/messages`

Send a new message

Post the necessary fields for the API to send a new message.

Operation ID: `send-a-new-message`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `SendMessageBodyDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: SMS, Email, WhatsApp, IG, FB, Custom, Live_Chat) | Yes | Type of message being sent |
| `contactId` | string | Yes | ID of the contact receiving the message |
| `appointmentId` | string | No | ID of the associated appointment |
| `attachments` | array<string> | No | Array of attachment URLs |
| `emailFrom` | string | No | Email address to send from |
| `emailCc` | array<string> | No | Array of CC email addresses |
| `emailBcc` | array<string> | No | Array of BCC email addresses |
| `html` | string | No | HTML content of the message |
| `message` | string | No | Text content of the message |
| `subject` | string | No | Subject line for email messages |
| `replyMessageId` | string | No | ID of message being replied to |
| `templateId` | string | No | ID of message template |
| `threadId` | string | No | ID of message thread. For email messages, this is the message ID that contains multiple email messages in the thread |
| `scheduledTimestamp` | number | No | UTC Timestamp (in seconds) at which the message should be scheduled |
| `conversationProviderId` | string | No | ID of conversation provider |
| `emailTo` | string | No | Email address to send to, if different from contact's primary email. This should be a valid email address associated with the contact. |
| `emailReplyMode` | string (enum: reply, reply_all) | No | Mode for email replies |
| `fromNumber` | string | No | Phone number used as the sender number for outbound messages |
| `toNumber` | string | No | Recipient phone number for outbound messages |


**Responses:**

- `200`: Created the message
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/conversations/messages/inbound`

Add an inbound message

Post the necessary fields for the API to add a new inbound message. <br />

Operation ID: `add-an-inbound-message`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `ProcessMessageBodyDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: SMS, Email, WhatsApp, GMB, IG, FB, Custom, WebChat, ...) | Yes | Message Type |
| `attachments` | array<string> | No | Array of attachments |
| `message` | string | No | Message Body |
| `conversationId` | string | Yes | Conversation Id |
| `conversationProviderId` | string | Yes | Conversation Provider Id |
| `html` | string | No | HTML Body of Email |
| `subject` | string | No | Subject of the Email |
| `emailFrom` | string | No | Email address to send from. This field is associated with the contact record and cannot be dynamically changed. |
| `emailTo` | string | No | Recipient email address. This field is associated with the contact record and cannot be dynamically changed. |
| `emailCc` | array<string> | No | List of email address to CC |
| `emailBcc` | array<string> | No | List of email address to BCC |
| `emailMessageId` | string | No | Send the email message id for which this email should be threaded. This is for replying to a specific email |
| `altId` | string | No | external mail provider's message id |
| `direction` | object | No | Message direction, if required can be set manually, default is outbound |
| `date` | string | No | Date of the inbound message |
| `call` | object | No | Phone call dialer and receiver information |


**Responses:**

- `200`: Created the message
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/conversations/messages/outbound`

Add an external outbound call

Post the necessary fields for the API to add a new outbound call.

Operation ID: `add-an-outbound-message`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `ProcessOutboundMessageBodyDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: Call) | Yes | Message Type |
| `attachments` | array<string> | No | Array of attachments |
| `conversationId` | string | Yes | Conversation Id |
| `conversationProviderId` | string | Yes | Conversation Provider Id |
| `altId` | string | No | external mail provider's message id |
| `date` | string | No | Date of the outbound message |
| `call` | object | No | Phone call dialer and receiver information |


**Responses:**

- `200`: Created the message
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/conversations/messages/{messageId}/schedule`

Cancel a scheduled message.

Post the messageId for the API to delete a scheduled message. <br />

Operation ID: `cancel-scheduled-message`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `messageId` | path | string | Yes | Message Id |

**Responses:**

- `200`: The scheduled message was cancelled successfully
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/conversations/messages/upload`

Upload file attachments

Post the necessary fields for the API to upload files. The files need to be a buffer with the key "fileAttachment". <br /><br /> The allowed file types are: <br/> <ul><li>JPG</li><li>JPEG</li><li>PNG</li><li>MP4</li><li>MPEG</li><li>ZIP</li><li>RAR</li><li>PDF</li><li>DOC</li><li>DOCX</li><li>TXT</li><li>MP3</li><li>WAV</li></ul> <br /><br /> The API will return an object with the URLs

Operation ID: `upload-file-attachments`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `multipart/form-data`

Schema: `UploadFilesDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `conversationId` | string | Yes | Conversation Id |
| `locationId` | string | Yes | - |
| `attachmentUrls` | array<string> | Yes | - |


**Responses:**

- `200`: Uploaded the file successfully
- `400`: Bad Request
- `401`: Unauthorized
- `413`: Payload Too Large
- `415`: Unsupported Media Type

---

### PUT `/conversations/messages/{messageId}/status`

Update message status

Post the necessary fields for the API to update message status.

Operation ID: `update-message-status`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `messageId` | path | string | Yes | Message Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateMessageStatusDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | string (enum: delivered, failed, pending, read) | Yes | Message status |
| `error` | object | No | Error object from the conversation provider |
| `emailMessageId` | string | No | Email message Id |
| `recipients` | array<string> | No | Email delivery status for additional email recipients. |


**Responses:**

- `200`: Created the message
- `400`: Bad Request
- `401`: Unauthorized
- `403`: Forbidden

---

### GET `/conversations/messages/{messageId}/locations/{locationId}/recording`

Get Recording by Message ID

Get the recording for a message by passing the message id

Operation ID: `get-message-recording`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location ID as string |
| `messageId` | path | string | Yes | Message ID as string |

**Responses:**

- `200`: Gives the attached recording to the message
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/conversations/locations/{locationId}/messages/{messageId}/transcription`

Get transcription by Message ID

Get the recording transcription for a message by passing the message id

Operation ID: `get-message-transcription`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location ID as string |
| `messageId` | path | string | Yes | Message ID as string |

**Responses:**

- `200`: Gives the attached recording transcription to the message
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/conversations/locations/{locationId}/messages/{messageId}/transcription/download`

Download transcription by Message ID

Download the recording transcription for a message by passing the message id

Operation ID: `download-message-transcription`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | path | string | Yes | Location ID as string |
| `messageId` | path | string | Yes | Message ID as string |

**Responses:**

- `200`: Downloads the attached transcription of the message
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/conversations/providers/live-chat/typing`

Agent/Ai-Bot is typing a message indicator for live chat

Agent/AI-Bot will call this when they are typing a message in live chat message

Operation ID: `live-chat-agent-typing`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UserTypingBody`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `isTyping` | string | Yes | Typing status |
| `visitorId` | string | Yes | visitorId is the Unique ID assigned to each Live chat visitor. visitorId will be added soon in <a href="https://highlevel.stoplight.io/docs/integrations/00c5ff21f0030-get-contact" target="_blank">GET Contact API</a> |
| `conversationId` | string | Yes | Conversation Id |


**Responses:**

- `201`: Show typing indicator for live chat
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/conversations/`

Create Conversation

Creates a new conversation with the data provided

Operation ID: `create-conversation`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateConversationDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location ID as string |
| `contactId` | string | Yes | Contact ID as string |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

## Schemas

### BadRequestDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `statusCode` | number | No | - |
| `message` | string | No | - |


### UnauthorizedDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `statusCode` | number | No | - |
| `message` | string | No | - |
| `error` | string | No | - |


### ForbiddenDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `statusCode` | number | No | - |
| `message` | string | No | - |
| `error` | string | No | - |


### StartAfterNumberSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `startAfterDate` | number | No | Search to begin after the specified date - should contain the sort value of the last document |


### StartAfterArrayNumberSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `startAfterDate` | array<string> | No | Search to begin after the specified date - should contain the sort value of the last document |


### ConversationSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Conversation Id |
| `contactId` | string | Yes | Contact Id |
| `locationId` | string | Yes | Location Id |
| `lastMessageBody` | string | Yes | Content of the most recent message in the conversation |
| `lastMessageType` | string (enum: TYPE_CALL, TYPE_SMS, TYPE_EMAIL, TYPE_SMS_REVIEW_REQUEST, TYPE_WEBCHAT, TYPE_SMS_NO_SHOW_REQUEST, TYPE_CAMPAIGN_SMS, TYPE_CAMPAIGN_CALL, ...) | Yes | Channel/type of the most recent message (SMS, Email, Call, etc) |
| `type` | string (enum: TYPE_PHONE, TYPE_EMAIL, TYPE_FB_MESSENGER, TYPE_REVIEW, TYPE_GROUP_SMS) | Yes | Primary channel/type of the conversation (Phone, Email, etc) |
| `unreadCount` | number | Yes | Number of unread messages in this conversation |
| `fullName` | string | Yes | Complete name of the contact (first and last name) |
| `contactName` | string | Yes | Alternative display name for the contact - used when full name is not available |
| `email` | string | Yes | Primary email address of the contact |
| `phone` | string | Yes | Primary phone number of the contact |


### SendConversationResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `conversations` | array<ConversationSchema> | Yes | The list of all conversations found for the given query |
| `total` | number | Yes | Total Number of results found for the given query |


### CreateConversationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location ID as string |
| `contactId` | string | Yes | Contact ID as string |


### ConversationCreateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Unique identifier for the conversation |
| `dateUpdated` | string | Yes | Date when the conversation was last updated |
| `dateAdded` | string | Yes | Date when the conversation was created |
| `deleted` | boolean | Yes | Flag indicating if this conversation has been deleted |
| `contactId` | string | Yes | Unique identifier of the contact associated with this conversation |
| `locationId` | string | Yes | Unique identifier of the business location where this conversation takes place |
| `lastMessageDate` | string | Yes | Date of the last message in the conversation |
| `assignedTo` | string | No | Unique identifier of the team member assigned to this conversation |


### CreateConversationSuccessResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Indicates whether the API request was successful. |
| `conversation` | object | Yes | Conversation data of the provided conversation ID. |


### GetConversationByIdResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `contactId` | string | Yes | Unique identifier of the contact associated with this conversation |
| `locationId` | string | Yes | Unique identifier of the business location where this conversation takes place |
| `deleted` | boolean | Yes | Flag indicating if this conversation has been moved to trash/deleted |
| `inbox` | boolean | Yes | Flag indicating if this conversation is currently in the main inbox view |
| `type` | number | Yes | Communication channel type for this conversation: 1 (Phone), 2 (Email), 3 (Facebook Messenger), 4 (Review), 5 (Group SMS), 6 (Internal Chat - coming soon) |
| `unreadCount` | number | Yes | Number of messages in this conversation that have not been read by the user |
| `assignedTo` | string | No | Unique identifier of the team member currently responsible for handling this conversation |
| `id` | string | Yes | Unique identifier for this specific conversation thread |
| `starred` | boolean | No | Flag indicating if this conversation has been marked as important/starred by the user |


### UpdateConversationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location ID as string |
| `unreadCount` | number | No | Count of unread messages in the conversation |
| `starred` | boolean | No | Starred status of the conversation. |
| `feedback` | object | No | - |


### ConversationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | Contact ID as string |
| `locationId` | string | Yes | Location ID as string |
| `contactId` | string | Yes | Contact ID as string |
| `assignedTo` | string | No | Assigned User ID as string |
| `userId` | string | No | User ID as string |
| `lastMessageBody` | string | No | Last message body as string |
| `lastMessageDate` | string | No | Last message date as UTC |
| `lastMessageType` | string (enum: TYPE_CALL, TYPE_SMS, TYPE_EMAIL, TYPE_SMS_REVIEW_REQUEST, TYPE_WEBCHAT, TYPE_SMS_NO_SHOW_REQUEST, TYPE_CAMPAIGN_SMS, TYPE_CAMPAIGN_CALL, ...) | No | Type of the last message sent/received in the conversation. |
| `unreadCount` | number | No | Count of unread messages in the conversation |
| `inbox` | boolean | No | Inbox status of the conversation. |
| `starred` | boolean | No | Starred status of the conversation. |
| `deleted` | boolean | Yes | Deleted status of the conversation. |


### GetConversationSuccessfulResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Boolean value as the API response. |
| `conversation` | object | Yes | Conversation data of the provided conversation ID. |


### DeleteConversationSuccessfulResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Boolean value as the API response. |


### GetEmailMessageResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `altId` | string | No | External Id |
| `threadId` | string | Yes | Message Id or thread Id |
| `locationId` | string | Yes | - |
| `contactId` | string | Yes | - |
| `conversationId` | string | Yes | - |
| `dateAdded` | string | Yes | - |
| `subject` | string | No | - |
| `body` | string | Yes | - |
| `direction` | string (enum: inbound, outbound) | Yes | - |
| `status` | string (enum: pending, scheduled, sent, delivered, read, undelivered, connected, failed, ...) | No | - |
| `contentType` | string | Yes | - |
| `attachments` | array<string> | No | An array of attachment URLs. |
| `provider` | string | No | - |
| `from` | string | Yes | Name and Email Id of the sender |
| `to` | array<string> | Yes | List of email Ids of the receivers |
| `cc` | array<string> | No | List of email Ids of the people in the cc field |
| `bcc` | array<string> | No | List of email Ids of the people in the bcc field |
| `replyToMessageId` | string | No | In case of reply, email message Id of the reply to email |
| `source` | string (enum: workflow, bulk_actions, campaign, api, app) | No | Email source |
| `conversationProviderId` | string | No | Conversation provider ID |


### CancelScheduledResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | number | Yes | HTTP Status code of the request |
| `message` | string | Yes | Error message of the request |


### MessageMeta

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `callDuration` | string | No | Call duration in seconds |
| `callStatus` | string (enum: pending, completed, answered, busy, no-answer, failed, canceled, voicemail) | No | Call status - can be pending, completed, answered, busy, no-answer, failed, canceled, or voicemail |
| `email` | object | No | meta will contain email, for message type 3 (email). messageIds is list of all email message ids under the message thread |


### GetMessageResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | - |
| `altId` | string | No | Alternative identifier for the message |
| `type` | number | Yes | - |
| `messageType` | string (enum: TYPE_CALL, TYPE_SMS, TYPE_EMAIL, TYPE_SMS_REVIEW_REQUEST, TYPE_WEBCHAT, TYPE_SMS_NO_SHOW_REQUEST, TYPE_CAMPAIGN_SMS, TYPE_CAMPAIGN_CALL, ...) | Yes | Type of the message as a string |
| `locationId` | string | Yes | - |
| `contactId` | string | Yes | - |
| `conversationId` | string | Yes | - |
| `dateAdded` | string | Yes | - |
| `body` | string | No | - |
| `direction` | string (enum: inbound, outbound) | Yes | - |
| `status` | string (enum: connected, delivered, failed, opened, pending, read, scheduled, sent, ...) | No | - |
| `contentType` | string | Yes | - |
| `attachments` | array<string> | No | An array of attachment URLs. Attachments will be empty for Call and Voicemails, type 1 and 10. Please use get call recording API to fetch call recording and voicemails. |
| `meta` | MessageMeta | No | - |
| `source` | string (enum: workflow, bulk_actions, campaign, api, app) | No | Message source |
| `userId` | string | No | User Id |
| `conversationProviderId` | string | No | Conversation Provider Id |
| `chatWidgetId` | string | No | Chat Widget Id |


### GetMessagesByConversationResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `messages` | object | Yes | - |


### SendMessageBodyDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: SMS, Email, WhatsApp, IG, FB, Custom, Live_Chat) | Yes | Type of message being sent |
| `contactId` | string | Yes | ID of the contact receiving the message |
| `appointmentId` | string | No | ID of the associated appointment |
| `attachments` | array<string> | No | Array of attachment URLs |
| `emailFrom` | string | No | Email address to send from |
| `emailCc` | array<string> | No | Array of CC email addresses |
| `emailBcc` | array<string> | No | Array of BCC email addresses |
| `html` | string | No | HTML content of the message |
| `message` | string | No | Text content of the message |
| `subject` | string | No | Subject line for email messages |
| `replyMessageId` | string | No | ID of message being replied to |
| `templateId` | string | No | ID of message template |
| `threadId` | string | No | ID of message thread. For email messages, this is the message ID that contains multiple email messages in the thread |
| `scheduledTimestamp` | number | No | UTC Timestamp (in seconds) at which the message should be scheduled |
| `conversationProviderId` | string | No | ID of conversation provider |
| `emailTo` | string | No | Email address to send to, if different from contact's primary email. This should be a valid email address associated with the contact. |
| `emailReplyMode` | string (enum: reply, reply_all) | No | Mode for email replies |
| `fromNumber` | string | No | Phone number used as the sender number for outbound messages |
| `toNumber` | string | No | Recipient phone number for outbound messages |


### SendMessageResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `conversationId` | string | Yes | Conversation ID. |
| `emailMessageId` | string | No | This contains the email message id (only for Email type). Use this ID to send inbound replies to GHL to create a threaded email. |
| `messageId` | string | Yes | This is the main Message ID |
| `messageIds` | array<string> | No | When sending via the GMB channel, we will be returning list of `messageIds` instead of single `messageId`. |
| `msg` | string | No | Additional response message when sending a workflow message |


### CallDataDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `to` | string | No | Phone number of the receiver |
| `from` | string | No | Phone number of the dialer |
| `status` | string (enum: pending, completed, answered, busy, no-answer, failed, canceled, voicemail) | No | Call status |


### ProcessMessageBodyDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: SMS, Email, WhatsApp, GMB, IG, FB, Custom, WebChat, ...) | Yes | Message Type |
| `attachments` | array<string> | No | Array of attachments |
| `message` | string | No | Message Body |
| `conversationId` | string | Yes | Conversation Id |
| `conversationProviderId` | string | Yes | Conversation Provider Id |
| `html` | string | No | HTML Body of Email |
| `subject` | string | No | Subject of the Email |
| `emailFrom` | string | No | Email address to send from. This field is associated with the contact record and cannot be dynamically changed. |
| `emailTo` | string | No | Recipient email address. This field is associated with the contact record and cannot be dynamically changed. |
| `emailCc` | array<string> | No | List of email address to CC |
| `emailBcc` | array<string> | No | List of email address to BCC |
| `emailMessageId` | string | No | Send the email message id for which this email should be threaded. This is for replying to a specific email |
| `altId` | string | No | external mail provider's message id |
| `direction` | object | No | Message direction, if required can be set manually, default is outbound |
| `date` | string | No | Date of the inbound message |
| `call` | object | No | Phone call dialer and receiver information |


### ProcessMessageResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | - |
| `conversationId` | string | Yes | Conversation ID. |
| `messageId` | string | Yes | This is the main Message ID |
| `message` | string | Yes | - |
| `contactId` | string | No | - |
| `dateAdded` | string | No | - |
| `emailMessageId` | string | No | - |


### ProcessOutboundMessageBodyDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: Call) | Yes | Message Type |
| `attachments` | array<string> | No | Array of attachments |
| `conversationId` | string | Yes | Conversation Id |
| `conversationProviderId` | string | Yes | Conversation Provider Id |
| `altId` | string | No | external mail provider's message id |
| `date` | string | No | Date of the outbound message |
| `call` | object | No | Phone call dialer and receiver information |


### UploadFilesDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `conversationId` | string | Yes | Conversation Id |
| `locationId` | string | Yes | - |
| `attachmentUrls` | array<string> | Yes | - |


### UploadFilesResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `uploadedFiles` | object | Yes | - |


### UploadFilesErrorResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | number (enum: 400, 413, 415) | Yes | HTTP Status code of the request |
| `message` | string | Yes | Error message of the request |


### ErrorDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `code` | string | Yes | Error Code |
| `type` | string | Yes | Error Type |
| `message` | string | Yes | Error Message |


### UpdateMessageStatusDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | string (enum: delivered, failed, pending, read) | Yes | Message status |
| `error` | object | No | Error object from the conversation provider |
| `emailMessageId` | string | No | Email message Id |
| `recipients` | array<string> | No | Email delivery status for additional email recipients. |


### GetMessageTranscriptionResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `mediaChannel` | number | Yes | Media channel describes the user interaction channel |
| `sentenceIndex` | number | Yes | Index of the sentence in the transcription |
| `startTime` | number | Yes | Start time of the sentence in milliseconds |
| `endTime` | number | Yes | End time of the sentence in milliseconds |
| `transcript` | string | Yes | Transcript of the sentence |
| `confidence` | number | Yes | Confidence of the transcription |


### UserTypingBody

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `isTyping` | string | Yes | Typing status |
| `visitorId` | string | Yes | visitorId is the Unique ID assigned to each Live chat visitor. visitorId will be added soon in <a href="https://highlevel.stoplight.io/docs/integrations/00c5ff21f0030-get-contact" target="_blank">GET Contact API</a> |
| `conversationId` | string | Yes | Conversation Id |


### CreateLiveChatMessageFeedbackResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | - |


