---
inclusion: manual
name: "GHL API"
description: "GoHighLevel API v2 documentation — endpoints, auth, webhooks, and schemas"
---

# GHL API v2

You are an expert on the GoHighLevel (GHL) API v2. This documentation is auto-generated from https://github.com/GoHighLevel/highlevel-api-docs.

Base URL: `https://services.leadconnectorhq.com`
Auth: OAuth 2.0 Bearer tokens. Apps authenticate via the GHL marketplace.
"Locations" = "Sub-Accounts" in the UI. The API still uses `locationId`.
Most endpoints require a `locationId` (sub-account level) or operate at agency level.
All endpoints require a `Version` header (e.g. `2021-07-28`).

---

# Guides

---

# FAQs

Here you will find answers to commonly encountered questions.

> If you are having trouble and cannot find a suitable answer, please reach out to support.

### How do I listen to webhook events?

For listening to the webhook events -

1. Register for an app.
2. Go to the app settings and update the webhook url (where you want to listen for events)
3. Under the settings, also add the scope needed for the webhook event under the scopes section.
4. Ask the location/agency admin to go to the app page in marketplace and click on "Add App".
5. Select the location, it will redirect you to the redirect uri with the authorization code.
6. Use the authorization code to get the access token.
7. You would start receiving the webhook event for the location.
---

## Overview

These APIs use OAuth 2.0 flow for authentication.

To get started, please follow [Authorization steps](docs/oauth/Authorization.md).

### Standard Response Fields

Below we have listed the standard fields you would receive with every request.

#### TraceId

A traceId represents a unique id for every request and is returned with every response. It is useful in pinpointing the exact request and helps while debugging.

---

---
stoplight-id: vyc3gbbez52ip
---

# Webhook Authentication Guide

## How It Works

### 1. Receiving the Webhook

When your endpoint receives a webhook request, it will include the following:

- **Headers**:

  - `x-wh-signature`: The digital signature of the payload.

- **Body**: The payload containing the timestamp, webhook ID, and data.

Example payload:

    {
      "timestamp": "2025-01-28T14:35:00Z",
      "webhookId": "abc123xyz",
      ...<add_other_webhook_data>
    }


### 2. Verifying the Signature

To verify the authenticity of the webhook request:

1. Retrieve the `x-wh-signature` header from the request.

2. Use the public key mentioned below to verify the signature:

3. Compute the signature on your end using the payload and the public key.

4. Compare your computed signature with the `x-wh-signature` header.

```
-----BEGIN PUBLIC KEY-----
MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAokvo/r9tVgcfZ5DysOSC
Frm602qYV0MaAiNnX9O8KxMbiyRKWeL9JpCpVpt4XHIcBOK4u3cLSqJGOLaPuXw6
dO0t6Q/ZVdAV5Phz+ZtzPL16iCGeK9po6D6JHBpbi989mmzMryUnQJezlYJ3DVfB
csedpinheNnyYeFXolrJvcsjDtfAeRx5ByHQmTnSdFUzuAnC9/GepgLT9SM4nCpv
uxmZMxrJt5Rw+VUaQ9B8JSvbMPpez4peKaJPZHBbU3OdeCVx5klVXXZQGNHOs8gF
3kvoV5rTnXV0IknLBXlcKKAQLZcY/Q9rG6Ifi9c+5vqlvHPCUJFT5XUGG5RKgOKU
J062fRtN+rLYZUV+BjafxQauvC8wSWeYja63VSUruvmNj8xkx2zE/Juc+yjLjTXp
IocmaiFeAO6fUtNjDeFVkhf5LNb59vECyrHD2SQIrhgXpO4Q3dVNA5rw576PwTzN
h/AMfHKIjE4xQA1SZuYJmNnmVZLIZBlQAF9Ntd03rfadZ+yDiOXCCs9FkHibELhC
HULgCsnuDJHcrGNd5/Ddm5hxGQ0ASitgHeMZ0kcIOwKDOzOU53lDza6/Y09T7sYJ
PQe7z0cvj7aE4B+Ax1ZoZGPzpJlZtGXCsu9aTEGEnKzmsFqwcSsnw3JB31IGKAyk
T1hhTiaCeIY/OwwwNUY2yvcCAwEAAQ==
-----END PUBLIC KEY-----
```

If they match, the payload is valid and comes from a trusted source.

### 3. Handling Replay Attacks

To protect against replay attacks:

- Ensure the `timestamp` in the payload is within an acceptable time window (e.g., 5 minutes).

- Reject any requests with duplicate `webhookId` values.

### 4. Handling Public Key Rotation

Please keep an eye on your email and [our social channels](https://ghl-developer-council.slack.com/archives/C01F43GUJV6) for notices regarding public key rotation to stay updated. The public key in this doc is the one to use to validate the webhook payload.

***


## Example Code

Here’s an example of how to verify the signature in Node.js:

    const crypto = require('crypto');

    const publicKey = `<use_the_above_key>`;

    function verifySignature(payload, signature) {
        const verifier = crypto.createVerify('SHA256');
        verifier.update(payload);
        verifier.end();

        return verifier.verify(publicKey, signature, 'base64');
    }

    // Example usage
    const payload = JSON.stringify({
      "timestamp": "2025-01-28T14:35:00Z",
      "webhookId": "abc123xyz",
      ...<add_other_webhook_data>
    });

    const signature = "<received-x-wh-signature>";
    const isValid = verifySignature(payload, signature);

    return isValid;


## Summary

These new features significantly enhance the security of webhook integrations. By including a timestamp, webhook ID, and a digitally signed payload, we ensure your data remains secure and trusted. Implement these changes today to keep your integrations robust and secure!

---

# API Reference

## Agency API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|

## Associations API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/associations/relations` | create-relation | Create Relation for you associated entities. |
| GET | `/associations/relations/{recordId}` | get-relations-by-record-id | Get all relations By record Id |
| DELETE | `/associations/relations/{relationId}` | delete-relation | Delete Relation |
| GET | `/associations/key/{key_name}` | get-association-key-by-key-name | Get association key by key name |
| GET | `/associations/objectKey/{objectKey}` | get-association-by-object-keys | Get association by object keys |
| PUT | `/associations/{associationId}` | update-association | Update Association By Id |
| DELETE | `/associations/{associationId}` | delete-association | Delete Association |
| GET | `/associations/{associationId}` | get-association-by-ID | Get association by ID |
| POST | `/associations/` | create-association | Create Association |
| GET | `/associations/` | find-associations | Get all associations for a sub-account / location |

**Request bodies** (* = required):

**POST `/associations/relations`**: locationId*:string, associationId*:string, firstRecordId*:string, secondRecordId*:string

**PUT `/associations/{associationId}`**: firstObjectLabel*:object, secondObjectLabel*:object

**POST `/associations/`**: locationId*:string, key*:string, firstObjectLabel*:object, firstObjectKey*:object, secondObjectLabel*:object, secondObjectKey*:object

## Blogs API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/blogs/posts/url-slug-exists` | check-url-slug-exists | Check url slug |
| PUT | `/blogs/posts/{postId}` | update-blog-post | Update Blog Post |
| POST | `/blogs/posts` | create-blog-post | Create Blog Post |
| GET | `/blogs/authors` | get-all-blog-authors-by-location | Get all authors |
| GET | `/blogs/categories` | get-all-categories-by-location | Get all categories |
| GET | `/blogs/posts/all` | get-blog-post | Get Blog posts by Blog ID |
| GET | `/blogs/site/all` | get-blogs | Get Blogs by Location ID |

**Request bodies** (* = required):

**PUT `/blogs/posts/{postId}`**: title*:string, locationId*:string, blogId*:string, imageUrl*:string, description*:string, rawHTML*:string, status*:string(DRAFT|PUBLISHED|SCHEDULED|ARCHIVED), imageAltText*:string, categories*:string[], tags:string[], author*:string, urlSlug*:string, canonicalLink:string, publishedAt*:string

**POST `/blogs/posts`**: title*:string, locationId*:string, blogId*:string, imageUrl*:string, description*:string, rawHTML*:string, status*:string(DRAFT|PUBLISHED|SCHEDULED|ARCHIVED), imageAltText*:string, categories*:string[], tags:string[], author*:string, urlSlug*:string, canonicalLink:string, publishedAt*:string

## Business API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| PUT | `/businesses/{businessId}` | update-business | Update Business |
| DELETE | `/businesses/{businessId}` | delete-Business | Delete Business |
| GET | `/businesses/{businessId}` | get-business | Get Business |
| GET | `/businesses/` | get-businesses-by-location | Get Businesses by Location |
| POST | `/businesses/` | create-business | Create Business |

**Request bodies** (* = required):

**PUT `/businesses/{businessId}`**: name:string, phone:string, email:string, postalCode:string, website:string, address:string, state:string, city:string, country:string, description:string

**POST `/businesses/`**: name*:string, locationId*:string, phone:string, email:string, website:string, address:string, city:string, postalCode:string, state:string, country:string, description:string

## Calendars API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/calendars/groups` | get-groups | Get Groups |
| POST | `/calendars/groups` | create-calendar-group | Create Calendar Group |
| POST | `/calendars/groups/validate-slug` | validate-groups-slug | Validate group slug |
| DELETE | `/calendars/groups/{groupId}` | delete-group | Delete Group |
| PUT | `/calendars/groups/{groupId}` | edit-group | Update Group |
| PUT | `/calendars/groups/{groupId}/status` | disable-group | Disable Group |
| POST | `/calendars/events/appointments` | create-appointment | Create appointment |
| PUT | `/calendars/events/appointments/{eventId}` | edit-appointment | Update Appointment |
| GET | `/calendars/events/appointments/{eventId}` | get-appointment | Get Appointment |
| GET | `/calendars/events` | get-calendar-events | Get Calendar Events |
| GET | `/calendars/blocked-slots` | get-blocked-slots | Get Blocked Slots |
| POST | `/calendars/events/block-slots` | create-block-slot | Create Block Slot |
| PUT | `/calendars/events/block-slots/{eventId}` | edit-block-slot | Update Block Slot |
| GET | `/calendars/{calendarId}/free-slots` | get-slots | Get Free Slots |
| PUT | `/calendars/{calendarId}` | update-calendar | Update Calendar |
| GET | `/calendars/{calendarId}` | get-calendar | Get Calendar |
| DELETE | `/calendars/{calendarId}` | delete-calendar | Delete Calendar |
| DELETE | `/calendars/events/{eventId}` | delete-event | Delete Event |
| GET | `/calendars/appointments/{appointmentId}/notes` | get-appointment-notes | Get Notes |
| POST | `/calendars/appointments/{appointmentId}/notes` | create-appointment-note | Create Note |
| PUT | `/calendars/appointments/{appointmentId}/notes/{noteId}` | update-appointment-note | Update Note |
| DELETE | `/calendars/appointments/{appointmentId}/notes/{noteId}` | delete-appointment-note | Delete Note |
| GET | `/calendars/resources/{resourceType}/{id}` | get-calendar-resource | Get Calendar Resource |
| PUT | `/calendars/resources/{resourceType}/{id}` | update-calendar-resource | Update Calendar Resource |
| DELETE | `/calendars/resources/{resourceType}/{id}` | delete-calendar-resource | Delete Calendar Resource |
| GET | `/calendars/resources/{resourceType}` | fetch-calendar-resources | List Calendar Resources |
| POST | `/calendars/resources/{resourceType}` | create-calendar-resource | Create Calendar Resource |
| GET | `/calendars/{calendarId}/notifications` | get-event-notification | Get notifications |
| POST | `/calendars/{calendarId}/notifications` | create-event-notification | Create notification |
| GET | `/calendars/{calendarId}/notifications/{notificationId}` | find-event-notification | Get notification |
| PUT | `/calendars/{calendarId}/notifications/{notificationId}` | update-event-notification | Update notification |
| DELETE | `/calendars/{calendarId}/notifications/{notificationId}` | delete-event-notification | Delete Notification |
| GET | `/calendars/` | get-calendars | Get Calendars |
| POST | `/calendars/` | create-calendar | Create Calendar |

**Request bodies** (* = required):

**POST `/calendars/groups`**: locationId*:string, name*:string, description*:string, slug*:string, isActive:boolean

**POST `/calendars/groups/validate-slug`**: locationId*:string, slug*:string

**PUT `/calendars/groups/{groupId}`**: name*:string, description*:string, slug*:string

**PUT `/calendars/groups/{groupId}/status`**: isActive*:boolean

**POST `/calendars/events/appointments`**: title:string, meetingLocationType:string(custom|zoom|gmeet|phone|address|ms_teams|google), meetingLocationId:string, overrideLocationConfig:boolean, appointmentStatus:string(new|confirmed|cancelled|showed|noshow|invalid), assignedUserId:string, description:string, address:string, ignoreDateRange:boolean, toNotify:boolean, ignoreFreeSlotValidation:boolean, rrule:string, calendarId*:string, locationId*:string, contactId*:string, startTime*:string, endTime:string

**PUT `/calendars/events/appointments/{eventId}`**: title:string, meetingLocationType:string(custom|zoom|gmeet|phone|address|ms_teams|google), meetingLocationId:string, overrideLocationConfig:boolean, appointmentStatus:string(new|confirmed|cancelled|showed|noshow|invalid), assignedUserId:string, description:string, address:string, ignoreDateRange:boolean, toNotify:boolean, ignoreFreeSlotValidation:boolean, rrule:string, calendarId:string, startTime:string, endTime:string

**POST `/calendars/events/block-slots`**: title:string, calendarId*:string, assignedUserId:string, locationId*:string, startTime:string, endTime:string

**PUT `/calendars/events/block-slots/{eventId}`**: title:string, calendarId*:string, assignedUserId:string, locationId*:string, startTime:string, endTime:string

**PUT `/calendars/{calendarId}`**: notifications:CalendarNotification[], groupId:string, teamMembers:TeamMember[], eventType:string(RoundRobin_OptimizeForAvailability|RoundRobin_OptimizeForEqualDistribution), name:string, description:string, slug:string, widgetSlug:string, widgetType:string(default|classic), eventTitle:string, eventColor:string, locationConfigurations:LocationConfiguration[], meetingLocation:string, slotDuration:number, slotDurationUnit:string(mins|hours), preBufferUnit:string(mins|hours), slotInterval:number, slotIntervalUnit:string(mins|hours), slotBuffer:number, preBuffer:number, appoinmentPerSlot:number, appoinmentPerDay:number, allowBookingAfter:number, allowBookingAfterUnit:string(hours|days|weeks|months), allowBookingFor:number, allowBookingForUnit:string(days|weeks|months), openHours:OpenHour[], enableRecurring:boolean, recurring:Recurring, formId:string, stickyContact:boolean, isLivePaymentMode:boolean, autoConfirm:boolean, shouldSendAlertEmailsToAssignedMember:boolean, alertEmail:string, googleInvitationEmails:boolean, allowReschedule:boolean, allowCancellation:boolean, shouldAssignContactToTeamMember:boolean, shouldSkipAssigningContactForExisting:boolean, notes:string, pixelId:string, formSubmitType:string(RedirectURL|ThankYouMessage), formSubmitRedirectURL:string, formSubmitThanksMessage:string, availabilityType:number(0|1), availabilities:UpdateAvailability[], guestType:string(count_only|collect_detail), consentLabel:string, calendarCoverImage:string, lookBusyConfig:object, isActive:boolean

**POST `/calendars/appointments/{appointmentId}/notes`**: userId:string, body*:string

**PUT `/calendars/appointments/{appointmentId}/notes/{noteId}`**: userId:string, body*:string

**PUT `/calendars/resources/{resourceType}/{id}`**: locationId:string, name:string, description:string, quantity:number, outOfService:number, capacity:number, calendarIds:string[], isActive:boolean

**POST `/calendars/resources/{resourceType}`**: locationId*:string, name*:string, description*:string, quantity*:number, outOfService*:number, capacity*:number, calendarIds*:string[]

**PUT `/calendars/{calendarId}/notifications/{notificationId}`**: receiverType:string(contact|guest|assignedUser|emails|phoneNumbers), additionalEmailIds:string[], additionalPhoneNumbers:string[], selectedUsers:string[], channel:string(email|inApp|sms|whatsapp), notificationType:string(booked|confirmation|cancellation|reminder|followup|reschedule), isActive:boolean, deleted:boolean, templateId:string, body:string, subject:string, afterTime:SchedulesDTO[], beforeTime:SchedulesDTO[], fromAddress:string, fromNumber:string, fromName:string

**POST `/calendars/`**: isActive:boolean, notifications:CalendarNotification[], locationId*:string, groupId:string, teamMembers:TeamMember[], eventType:string(RoundRobin_OptimizeForAvailability|RoundRobin_OptimizeForEqualDistribution), name*:string, description:string, slug:string, widgetSlug:string, calendarType:string(round_robin|event|class_booking|collective|service_booking|personal), widgetType:string(default|classic), eventTitle:string, eventColor:string, meetingLocation:string, locationConfigurations:LocationConfiguration[], slotDuration:number, slotDurationUnit:string(mins|hours), slotInterval:number, slotIntervalUnit:string(mins|hours), slotBuffer:number, slotBufferUnit:string(mins|hours), preBuffer:number, preBufferUnit:string(mins|hours), appoinmentPerSlot:number, appoinmentPerDay:number, allowBookingAfter:number, allowBookingAfterUnit:string(hours|days|weeks|months), allowBookingFor:number, allowBookingForUnit:string(days|weeks|months), openHours:OpenHour[], enableRecurring:boolean, recurring:Recurring, formId:string, stickyContact:boolean, isLivePaymentMode:boolean, autoConfirm:boolean, shouldSendAlertEmailsToAssignedMember:boolean, alertEmail:string, googleInvitationEmails:boolean, allowReschedule:boolean, allowCancellation:boolean, shouldAssignContactToTeamMember:boolean, shouldSkipAssigningContactForExisting:boolean, notes:string, pixelId:string, formSubmitType:string(RedirectURL|ThankYouMessage), formSubmitRedirectURL:string, formSubmitThanksMessage:string, availabilityType:number(0|1), availabilities:Availability[], guestType:string(count_only|collect_detail), consentLabel:string, calendarCoverImage:string, lookBusyConfig:object

## Campaigns API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/campaigns/` | get-campaigns | Get Campaigns |

## Companies API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/companies/{companyId}` | get-company | Get Company |

## Contacts API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/contacts/search` | search-contacts-advanced | Search Contacts |
| GET | `/contacts/search/duplicate` | get-duplicate-contact | Get Duplicate Contact |
| GET | `/contacts/{contactId}/tasks` | get-all-tasks | Get all Tasks |
| POST | `/contacts/{contactId}/tasks` | create-task | Create Task |
| GET | `/contacts/{contactId}/tasks/{taskId}` | get-task | Get Task |
| PUT | `/contacts/{contactId}/tasks/{taskId}` | update-task | Update Task |
| DELETE | `/contacts/{contactId}/tasks/{taskId}` | delete-task | Delete Task |
| PUT | `/contacts/{contactId}/tasks/{taskId}/completed` | update-task-completed | Update Task Completed |
| GET | `/contacts/{contactId}/appointments` | get-appointments-for-contact | Get Appointments for Contact |
| POST | `/contacts/{contactId}/tags` | add-tags | Add Tags |
| DELETE | `/contacts/{contactId}/tags` | remove-tags | Remove Tags |
| GET | `/contacts/{contactId}/notes` | get-all-notes | Get All Notes |
| POST | `/contacts/{contactId}/notes` | create-note | Create Note |
| GET | `/contacts/{contactId}/notes/{id}` | get-note | Get Note |
| PUT | `/contacts/{contactId}/notes/{id}` | update-note | Update Note |
| DELETE | `/contacts/{contactId}/notes/{id}` | delete-note | Delete Note |
| POST | `/contacts/bulk/tags/update/{type}` | create-association | Update Contacts Tags |
| POST | `/contacts/bulk/business` | add-remove-contact-from-business | Add/Remove Contacts From Business |
| GET | `/contacts/{contactId}` | get-contact | Get Contact |
| PUT | `/contacts/{contactId}` | update-contact | Update Contact |
| DELETE | `/contacts/{contactId}` | delete-contact | Delete Contact |
| POST | `/contacts/upsert` | upsert-contact | Upsert Contact |
| GET | `/contacts/business/{businessId}` | get-contacts-by-businessId | Get Contacts By BusinessId |
| POST | `/contacts/{contactId}/followers` | add-followers-contact | Add Followers |
| DELETE | `/contacts/{contactId}/followers` | remove-followers-contact | Remove Followers |
| POST | `/contacts/{contactId}/campaigns/{campaignId}` | add-contact-to-campaign | Add Contact to Campaign |
| DELETE | `/contacts/{contactId}/campaigns/{campaignId}` | remove-contact-from-campaign | Remove Contact From Campaign |
| DELETE | `/contacts/{contactId}/campaigns/removeAll` | remove-contact-from-every-campaign | Remove Contact From Every Campaign |
| POST | `/contacts/{contactId}/workflow/{workflowId}` | add-contact-to-workflow | Add Contact to Workflow |
| DELETE | `/contacts/{contactId}/workflow/{workflowId}` | delete-contact-from-workflow | Delete Contact from Workflow |
| POST | `/contacts/` | create-contact | Create Contact |
| GET | `/contacts/` | get-contacts | Get Contacts |

**Request bodies** (* = required):

**POST `/contacts/search`**: 

**POST `/contacts/{contactId}/tasks`**: title*:string, body:string, dueDate*:string, completed*:boolean, assignedTo:string

**PUT `/contacts/{contactId}/tasks/{taskId}`**: title:string, body:string, dueDate:string, completed:boolean, assignedTo:string

**PUT `/contacts/{contactId}/tasks/{taskId}/completed`**: completed*:boolean

**POST `/contacts/{contactId}/tags`**: tags*:string[]

**POST `/contacts/{contactId}/notes`**: userId:string, body*:string

**PUT `/contacts/{contactId}/notes/{id}`**: userId:string, body*:string

**POST `/contacts/bulk/tags/update/{type}`**: contacts*:string[], tags*:string[], locationId*:string, removeAllTags:boolean

**POST `/contacts/bulk/business`**: locationId*:string, ids*:string[], businessId*:string

**PUT `/contacts/{contactId}`**: firstName:string, lastName:string, name:string, email:string, phone:string, address1:string, city:string, state:string, postalCode:string, website:string, timezone:string, dnd:boolean, dndSettings:DndSettingsSchema, inboundDndSettings:InboundDndSettingsSchema, tags:string[], customFields:array, source:string, country:string, assignedTo:string

**POST `/contacts/upsert`**: firstName:string, lastName:string, name:string, email:string, locationId*:string, gender:string, phone:string, address1:string, city:string, state:string, postalCode:string, website:string, timezone:string, dnd:boolean, dndSettings:DndSettingsSchema, inboundDndSettings:InboundDndSettingsSchema, tags:string[], customFields:array, source:string, country:string, companyName:string, assignedTo:string

**POST `/contacts/{contactId}/followers`**: followers*:string[]

**POST `/contacts/{contactId}/campaigns/{campaignId}`**: 

**POST `/contacts/{contactId}/workflow/{workflowId}`**: eventStartTime:string

**POST `/contacts/`**: firstName:string, lastName:string, name:string, email:string, locationId*:string, gender:string, phone:string, address1:string, city:string, state:string, postalCode:string, website:string, timezone:string, dnd:boolean, dndSettings:DndSettingsSchema, inboundDndSettings:InboundDndSettingsSchema, tags:string[], customFields:array, source:string, country:string, companyName:string, assignedTo:string

## Conversations API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/conversations/search` | search-conversation | Search Conversations |
| GET | `/conversations/{conversationId}` | get-conversation | Get Conversation |
| PUT | `/conversations/{conversationId}` | update-conversation | Update Conversation |
| DELETE | `/conversations/{conversationId}` | delete-conversation | Delete Conversation |
| GET | `/conversations/messages/email/{id}` | get-email-by-id | Get email by Id |
| DELETE | `/conversations/messages/email/{emailMessageId}/schedule` | cancel-scheduled-email-message | Cancel a scheduled email message. |
| GET | `/conversations/messages/{id}` | get-message | Get message by message id |
| GET | `/conversations/{conversationId}/messages` | get-messages | Get messages by conversation id |
| POST | `/conversations/messages` | send-a-new-message | Send a new message |
| POST | `/conversations/messages/inbound` | add-an-inbound-message | Add an inbound message |
| POST | `/conversations/messages/outbound` | add-an-outbound-message | Add an external outbound call |
| DELETE | `/conversations/messages/{messageId}/schedule` | cancel-scheduled-message | Cancel a scheduled message. |
| POST | `/conversations/messages/upload` | upload-file-attachments | Upload file attachments |
| PUT | `/conversations/messages/{messageId}/status` | update-message-status | Update message status |
| GET | `/conversations/messages/{messageId}/locations/{locationId}/recording` | get-message-recording | Get Recording by Message ID |
| GET | `/conversations/locations/{locationId}/messages/{messageId}/transcription` | get-message-transcription | Get transcription by Message ID |
| GET | `/conversations/locations/{locationId}/messages/{messageId}/transcription/download` | download-message-transcription | Download transcription by Message ID |
| POST | `/conversations/providers/live-chat/typing` | live-chat-agent-typing | Agent/Ai-Bot is typing a message indicator for live chat |
| POST | `/conversations/` | create-conversation | Create Conversation |

**Request bodies** (* = required):

**PUT `/conversations/{conversationId}`**: locationId*:string, unreadCount:number, starred:boolean, feedback:object

**POST `/conversations/messages`**: type*:string(SMS|Email|WhatsApp|IG|FB|Custom|Live_Chat), contactId*:string, appointmentId:string, attachments:string[], emailFrom:string, emailCc:string[], emailBcc:string[], html:string, message:string, subject:string, replyMessageId:string, templateId:string, threadId:string, scheduledTimestamp:number, conversationProviderId:string, emailTo:string, emailReplyMode:string(reply|reply_all), fromNumber:string, toNumber:string

**POST `/conversations/messages/inbound`**: type*:string(SMS|Email|WhatsApp|GMB|IG|FB|Custom|WebChat|Live_Chat|Call), attachments:string[], message:string, conversationId*:string, conversationProviderId*:string, html:string, subject:string, emailFrom:string, emailTo:string, emailCc:string[], emailBcc:string[], emailMessageId:string, altId:string, direction:object, date:string, call:object

**POST `/conversations/messages/outbound`**: type*:string(Call), attachments:string[], conversationId*:string, conversationProviderId*:string, altId:string, date:string, call:object

**POST `/conversations/messages/upload`**: conversationId*:string, locationId*:string, attachmentUrls*:string[]

**PUT `/conversations/messages/{messageId}/status`**: status*:string(delivered|failed|pending|read), error:object, emailMessageId:string, recipients:string[]

**POST `/conversations/providers/live-chat/typing`**: locationId*:string, isTyping*:string, visitorId*:string, conversationId*:string

**POST `/conversations/`**: locationId*:string, contactId*:string

## MEMBERSHIPS API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/courses/courses-exporter/public/import` | import-courses | Import Courses |

**Request bodies** (* = required):

**POST `/courses/courses-exporter/public/import`**: locationId*:string, userId:string, products*:ProductInterface[]

## Custom Fields V2

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/custom-fields/{id}` | get-custom-field-by-id | Get Custom Field / Folder By Id |
| PUT | `/custom-fields/{id}` | update-custom-field | Update Custom Field By Id |
| DELETE | `/custom-fields/{id}` | delete-custom-field | Delete Custom Field By Id |
| GET | `/custom-fields/object-key/{objectKey}` | get-custom-fields-by-object-key | Get Custom Fields By Object Key |
| POST | `/custom-fields/folder` | create-custom-field-folder | Create Custom Field Folder |
| PUT | `/custom-fields/folder/{id}` | update-custom-field-folder | Update Custom Field Folder Name |
| DELETE | `/custom-fields/folder/{id}` | delete-custom-field-folder | Delete Custom Field Folder |
| POST | `/custom-fields/` | create-custom-field | Create Custom Field |

**Request bodies** (* = required):

**PUT `/custom-fields/{id}`**: locationId*:string, name:string, description:string, placeholder:string, showInForms*:boolean, options:OptionDTO[], acceptedFormats:string(.pdf|.docx|.doc|.jpg|.jpeg|.png|.gif|.csv|.xlsx|.xls|all), maxFileLimit:number

**POST `/custom-fields/folder`**: objectKey*:string, name*:string, locationId*:string

**PUT `/custom-fields/folder/{id}`**: name*:string, locationId*:string

**POST `/custom-fields/`**: locationId*:string, name:string, description:string, placeholder:string, showInForms*:boolean, options:OptionDTO[], acceptedFormats:string(.pdf|.docx|.doc|.jpg|.jpeg|.png|.gif|.csv|.xlsx|.xls|all), dataType*:string(TEXT|LARGE_TEXT|NUMERICAL|PHONE|MONETORY|CHECKBOX|SINGLE_OPTIONS|MULTIPLE_OPTIONS|DATE|TEXTBOX_LIST|FILE_UPLOAD|RADIO|EMAIL), fieldKey*:string, objectKey*:string, maxFileLimit:number, allowCustomOption:boolean, parentId*:string

## Custom menus API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/custom-menus/{customMenuId}` | get-custom-menu-by-id | Get Custom Menu Link |
| DELETE | `/custom-menus/{customMenuId}` | delete-custom-menu | Delete Custom Menu Link |
| PUT | `/custom-menus/{customMenuId}` | update-custom-menu | Update Custom Menu Link |
| GET | `/custom-menus/` | get-custom-menus | Get Custom Menu Links |
| POST | `/custom-menus/` | create-custom-menu | Create Custom Menu Link |

**Request bodies** (* = required):

**PUT `/custom-menus/{customMenuId}`**: title:string, url:string, icon:object, showOnCompany:boolean, showOnLocation:boolean, showToAllLocations:boolean, openMode:string(iframe|new_tab|current_tab), locations:string[], userRole:string(all|admin|user), allowCamera:boolean, allowMicrophone:boolean

**POST `/custom-menus/`**: title*:string, url*:string, icon*:object, showOnCompany*:boolean, showOnLocation*:boolean, showToAllLocations*:boolean, openMode*:string(iframe|new_tab|current_tab), locations*:string[], userRole*:string(all|admin|user), allowCamera:boolean, allowMicrophone:boolean

## Email ISV API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/email/verify` | verify-email | Email Verification |

**Request bodies** (* = required):

**POST `/email/verify`**: type*:string(email|contact), verify*:string

## Email API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/emails/schedule` | fetch-campaigns | Get Campaigns |
| POST | `/emails/builder` | create-template | Create a new template |
| GET | `/emails/builder` | fetch-template | Fetch email templates |
| DELETE | `/emails/builder/{locationId}/{templateId}` | delete-template | Delete a template |
| POST | `/emails/builder/data` | update-template | Update a template |

**Request bodies** (* = required):

**POST `/emails/builder`**: locationId*:string, title:string, type*:string(html|folder|import|builder|blank), updatedBy:string, builderVersion:string(1|2), name:string, parentId:string, templateDataUrl:string, importProvider*:string(mailchimp|active_campaign|kajabi), importURL:string, templateSource:string, isPlainText:boolean

**POST `/emails/builder/data`**: locationId*:string, templateId*:string, updatedBy*:string, dnd*:object, html*:string, editorType*:string(html|builder), previewText:string, isPlainText:boolean

## Forms API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/forms/submissions` | get-forms-submissions | Get Forms Submissions |
| POST | `/forms/upload-custom-files` | upload-to-custom-fields | Upload files to custom fields |
| GET | `/forms/` | get-forms | Get Forms |

## Funnels API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/funnels/lookup/redirect` | create-redirect | Create Redirect |
| PATCH | `/funnels/lookup/redirect/{id}` | update-redirect-by-id | Update Redirect By Id |
| DELETE | `/funnels/lookup/redirect/{id}` | delete-redirect-by-id | Delete Redirect By Id |
| GET | `/funnels/lookup/redirect/list` | fetch-redirects-list | Fetch List of Redirects |
| GET | `/funnels/funnel/list` | getFunnels | Fetch List of Funnels |
| GET | `/funnels/page` | getPagesByFunnelId | Fetch list of funnel pages |
| GET | `/funnels/page/count` | getPagesCountByFunnelId | Fetch count of funnel pages |

**Request bodies** (* = required):

**POST `/funnels/lookup/redirect`**: locationId*:string, domain*:string, path*:string, target*:string, action*:string(funnel|website|url|all)

**PATCH `/funnels/lookup/redirect/{id}`**: target*:string, action*:string(funnel|website|url|all), locationId*:string

## Invoice API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/invoices/template` | create-invoice-template | Create template |
| GET | `/invoices/template` | list-invoice-templates | List templates |
| GET | `/invoices/template/{templateId}` | get-invoice-template | Get an template |
| PUT | `/invoices/template/{templateId}` | update-invoice-template | Update template |
| DELETE | `/invoices/template/{templateId}` | delete-invoice-template | Delete template |
| PATCH | `/invoices/template/{templateId}/late-fees-configuration` | update-invoice-template-late-fees-configuration | Update template late fees configuration |
| PATCH | `/invoices/template/{templateId}/payment-methods-configuration` | update-invoice-payment-methods-configuration | Update template late fees configuration |
| POST | `/invoices/schedule` | create-invoice-schedule | Create Invoice Schedule |
| GET | `/invoices/schedule` | list-invoice-schedules | List schedules |
| GET | `/invoices/schedule/{scheduleId}` | get-invoice-schedule | Get an schedule |
| PUT | `/invoices/schedule/{scheduleId}` | update-invoice-schedule | Update schedule |
| DELETE | `/invoices/schedule/{scheduleId}` | delete-invoice-schedule | Delete schedule |
| POST | `/invoices/schedule/{scheduleId}/updateAndSchedule` | update-and-schedule-invoice-schedule | Update scheduled recurring invoice |
| POST | `/invoices/schedule/{scheduleId}/schedule` | schedule-invoice-schedule | Schedule an schedule invoice |
| POST | `/invoices/schedule/{scheduleId}/auto-payment` | auto-payment-invoice-schedule | Manage Auto payment for an schedule invoice |
| POST | `/invoices/schedule/{scheduleId}/cancel` | cancel-invoice-schedule | Cancel an scheduled invoice |
| POST | `/invoices/text2pay` | text2pay-invoice | Create & Send |
| GET | `/invoices/generate-invoice-number` | generate-invoice-number | Generate Invoice Number |
| GET | `/invoices/{invoiceId}` | get-invoice | Get invoice |
| PUT | `/invoices/{invoiceId}` | update-invoice | Update invoice |
| DELETE | `/invoices/{invoiceId}` | delete-invoice | Delete invoice |
| PATCH | `/invoices/{invoiceId}/late-fees-configuration` | update-invoice-late-fees-configuration | Update invoice late fees configuration |
| POST | `/invoices/{invoiceId}/void` | void-invoice | Void invoice |
| POST | `/invoices/{invoiceId}/send` | send-invoice | Send invoice |
| POST | `/invoices/{invoiceId}/record-payment` | record-invoice | Record a manual payment for an invoice |
| PATCH | `/invoices/stats/last-visited-at` | update-invoice-last-visited-at | Update invoice last visited at |
| POST | `/invoices/estimate` | create-new-estimate | Create New Estimate |
| PUT | `/invoices/estimate/{estimateId}` | update-estimate | Update Estimate |
| DELETE | `/invoices/estimate/{estimateId}` | delete-estimate | Delete Estimate |
| GET | `/invoices/estimate/number/generate` | generate-estimate-number | Generate Estimate Number |
| POST | `/invoices/estimate/{estimateId}/send` | send-estimate | Send Estimate |
| POST | `/invoices/estimate/{estimateId}/invoice` | create-invoice-from-estimate | Create Invoice from Estimate |
| GET | `/invoices/estimate/list` | list-estimates | List Estimates |
| PATCH | `/invoices/estimate/stats/last-visited-at` | update-estimate-last-visited-at | Update estimate last visited at |
| GET | `/invoices/estimate/template` | list-estimate-templates | List Estimate Templates |
| POST | `/invoices/estimate/template` | create-estimate-template | Create Estimate Template |
| PUT | `/invoices/estimate/template/{templateId}` | update-estimate-template | Update Estimate Template |
| DELETE | `/invoices/estimate/template/{templateId}` | delete-estimate-template | Delete Estimate Template |
| GET | `/invoices/estimate/template/preview` | preview-estimate-template | Preview Estimate Template |
| POST | `/invoices/` | create-invoice | Create Invoice |
| GET | `/invoices/` | list-invoices | List invoices |

**Request bodies** (* = required):

**POST `/invoices/template`**: altId*:string, altType*:string(location), internal:boolean, name*:string, businessDetails*:BusinessDetailsDto, currency*:string, items*:InvoiceItemDto[], automaticTaxesEnabled:boolean, discount:DiscountDto, termsNotes:string, title:string, tipsConfiguration:object, lateFeesConfiguration:object, invoiceNumberPrefix:string, paymentMethods:object, attachments:string[], miscellaneousCharges:object

**PUT `/invoices/template/{templateId}`**: altId*:string, altType*:string(location), internal:boolean, name*:string, businessDetails*:BusinessDetailsDto, currency*:string, items*:InvoiceItemDto[], discount:DiscountDto, termsNotes:string, title:string, miscellaneousCharges:object

**PATCH `/invoices/template/{templateId}/late-fees-configuration`**: altId*:string, altType*:string(location), lateFeesConfiguration*:object

**PATCH `/invoices/template/{templateId}/payment-methods-configuration`**: altId*:string, altType*:string(location), paymentMethods:object

**POST `/invoices/schedule`**: altId*:string, altType*:string(location), name*:string, contactDetails*:ContactDetailsDto, schedule*:ScheduleOptionsDto, liveMode*:boolean, businessDetails*:BusinessDetailsDto, currency*:string, items*:InvoiceItemDto[], automaticTaxesEnabled:boolean, discount*:DiscountDto, termsNotes:string, title:string, tipsConfiguration:object, lateFeesConfiguration:object, invoiceNumberPrefix:string, paymentMethods:object, attachments:AttachmentsDto[], miscellaneousCharges:object

**PUT `/invoices/schedule/{scheduleId}`**: altId*:string, altType*:string(location), name*:string, contactDetails*:ContactDetailsDto, schedule*:ScheduleOptionsDto, liveMode*:boolean, businessDetails*:BusinessDetailsDto, currency*:string, items*:InvoiceItemDto[], discount*:DiscountDto, termsNotes:string, title:string, attachments:AttachmentsDto[], miscellaneousCharges:object

**POST `/invoices/schedule/{scheduleId}/schedule`**: altId*:string, altType*:string(location), liveMode*:boolean, autoPayment:object

**POST `/invoices/schedule/{scheduleId}/auto-payment`**: altId*:string, altType*:string(location), id*:string, autoPayment*:object

**POST `/invoices/schedule/{scheduleId}/cancel`**: altId*:string, altType*:string(location)

**POST `/invoices/text2pay`**: altId*:string, altType*:string(location), name*:string, currency*:string, items*:InvoiceItemDto[], termsNotes:string, title:string, contactDetails*:object, invoiceNumber:string, issueDate*:string, dueDate:string, sentTo*:SentToDto, liveMode*:boolean, automaticTaxesEnabled:boolean, paymentSchedule:object, lateFeesConfiguration:object, tipsConfiguration:object, invoiceNumberPrefix:string, paymentMethods:object, attachments:AttachmentsDto[], miscellaneousCharges:object, id:string, includeTermsNote:boolean, action*:string(draft|send), userId*:string, discount:DiscountDto, businessDetails:BusinessDetailsDto

**PUT `/invoices/{invoiceId}`**: altId*:string, altType*:string(location), name*:string, title:string, currency*:string, description:string, businessDetails:object, invoiceNumber:string, contactId:string, contactDetails:ContactDetailsDto, termsNotes:string, discount:DiscountDto, invoiceItems*:InvoiceItemDto[], automaticTaxesEnabled:boolean, liveMode:boolean, issueDate*:string, dueDate*:string, paymentSchedule:object, tipsConfiguration:object, xeroDetails:object, invoiceNumberPrefix:string, paymentMethods:object, attachments:AttachmentsDto[], miscellaneousCharges:object

**PATCH `/invoices/{invoiceId}/late-fees-configuration`**: altId*:string, altType*:string(location), lateFeesConfiguration*:object

**POST `/invoices/{invoiceId}/void`**: altId*:string, altType*:string(location)

**POST `/invoices/{invoiceId}/send`**: altId*:string, altType*:string(location), userId*:string, action*:string(sms_and_email|send_manually|email|sms), liveMode*:boolean, sentFrom:object, autoPayment:object

**POST `/invoices/{invoiceId}/record-payment`**: altId*:string, altType*:string(location), mode*:string(cash|card|cheque|bank_transfer|other), card*:CardDto, cheque*:ChequeDto, notes*:string, amount:number, meta:object, paymentScheduleIds:string[], fulfilledAt:string

**PATCH `/invoices/stats/last-visited-at`**: invoiceId*:string

**POST `/invoices/estimate`**: altId*:string, altType*:string(location), name*:string, businessDetails*:BusinessDetailsDto, currency*:string, items*:InvoiceItemDto[], liveMode:boolean, discount*:DiscountDto, termsNotes:string, title:string, contactDetails*:object, estimateNumber:number, issueDate:string, expiryDate:string, sentTo:object, automaticTaxesEnabled:boolean, meta:object, sendEstimateDetails:object, frequencySettings*:object, estimateNumberPrefix:string, userId:string, attachments:AttachmentsDto[], autoInvoice:object, miscellaneousCharges:object, paymentScheduleConfig:object

**PUT `/invoices/estimate/{estimateId}`**: altId*:string, altType*:string(location), name*:string, businessDetails*:BusinessDetailsDto, currency*:string, items*:InvoiceItemDto[], liveMode:boolean, discount*:DiscountDto, termsNotes:string, title:string, contactDetails*:object, estimateNumber:number, issueDate:string, expiryDate:string, sentTo:object, automaticTaxesEnabled:boolean, meta:object, sendEstimateDetails:object, frequencySettings*:object, estimateNumberPrefix:string, userId:string, attachments:AttachmentsDto[], autoInvoice:object, miscellaneousCharges:object, paymentScheduleConfig:object, estimateStatus:string(all|draft|sent|accepted|declined|invoiced|viewed)

**POST `/invoices/estimate/{estimateId}/send`**: altId*:string, altType*:string(location), action*:string(sms_and_email|send_manually|email|sms), liveMode*:boolean, userId*:string, sentFrom:object, estimateName:string

**POST `/invoices/estimate/{estimateId}/invoice`**: altId*:string, altType*:string(location), markAsInvoiced*:boolean, version:string(v1|v2)

**PATCH `/invoices/estimate/stats/last-visited-at`**: estimateId*:string

**POST `/invoices/estimate/template`**: altId*:string, altType*:string(location), name*:string, businessDetails*:BusinessDetailsDto, currency*:string, items*:array[], liveMode:boolean, discount*:DiscountDto, termsNotes:string, title:string, automaticTaxesEnabled:boolean, meta:object, sendEstimateDetails:object, estimateNumberPrefix:string, attachments:AttachmentsDto[], miscellaneousCharges:object

**PUT `/invoices/estimate/template/{templateId}`**: altId*:string, altType*:string(location), name*:string, businessDetails*:BusinessDetailsDto, currency*:string, items*:array[], liveMode:boolean, discount*:DiscountDto, termsNotes:string, title:string, automaticTaxesEnabled:boolean, meta:object, sendEstimateDetails:object, estimateNumberPrefix:string, attachments:AttachmentsDto[], miscellaneousCharges:object

**POST `/invoices/`**: altId*:string, altType*:string(location), name*:string, businessDetails*:BusinessDetailsDto, currency*:string, items*:InvoiceItemDto[], discount*:DiscountDto, termsNotes:string, title:string, contactDetails*:object, invoiceNumber:string, issueDate*:string, dueDate:string, sentTo*:SentToDto, liveMode*:boolean, automaticTaxesEnabled:boolean, paymentSchedule:object, lateFeesConfiguration:object, tipsConfiguration:object, invoiceNumberPrefix:string, paymentMethods:object, attachments:AttachmentsDto[], miscellaneousCharges:object

## Trigger Links API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/links/id/{linkId}` | get-link-by-id | Get Link by ID |
| PUT | `/links/{linkId}` | update-link | Update Link |
| DELETE | `/links/{linkId}` | delete-link | Delete Link |
| GET | `/links/search` | search-trigger-links | Search Trigger Links |
| GET | `/links/` | get-links | Get Links |
| POST | `/links/` | create-link | Create Link |

**Request bodies** (* = required):

**PUT `/links/{linkId}`**: name*:string, redirectTo*:string

**POST `/links/`**: locationId*:string, name*:string, redirectTo*:string

## Sub-Account (Formerly location) API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/locations/search` | search-locations | Search |
| GET | `/locations/{locationId}` | get-location | Get Sub-Account (Formerly Location) |
| PUT | `/locations/{locationId}` | put-location | Put Sub-Account (Formerly Location) |
| DELETE | `/locations/{locationId}` | delete-location | Delete Sub-Account (Formerly Location) |
| GET | `/locations/{locationId}/tags` | get-location-tags | Get Tags |
| POST | `/locations/{locationId}/tags` | create-tag | Create Tag |
| GET | `/locations/{locationId}/tags/{tagId}` | get-tag-by-id | Get tag by id |
| PUT | `/locations/{locationId}/tags/{tagId}` | update-tag | Update tag |
| DELETE | `/locations/{locationId}/tags/{tagId}` | delete-tag | Delete tag |
| POST | `/locations/{locationId}/tasks/search` | task-search | Task Search Filter |
| GET | `/locations/{locationId}/recurring-tasks/{id}` | get-recurring-task-by-id | Get Recurring Task By Id |
| PUT | `/locations/{locationId}/recurring-tasks/{id}` | update-recurring-task | Update Recurring Task |
| DELETE | `/locations/{locationId}/recurring-tasks/{id}` | delete-recurring-task | Delete Recurring Task |
| POST | `/locations/{locationId}/recurring-tasks` | create-recurring-task | Create Recurring Task |
| GET | `/locations/{locationId}/customFields` | get-custom-fields | Get Custom Fields |
| POST | `/locations/{locationId}/customFields` | create-custom-field | Create Custom Field |
| GET | `/locations/{locationId}/customFields/{id}` | get-custom-field | Get Custom Field |
| PUT | `/locations/{locationId}/customFields/{id}` | update-custom-field | Update Custom Field |
| DELETE | `/locations/{locationId}/customFields/{id}` | delete-custom-field | Delete Custom Field |
| POST | `/locations/{locationId}/customFields/upload` | upload-file-customFields | Uploads File to customFields |
| GET | `/locations/{locationId}/customValues` | get-custom-values | Get Custom Values |
| POST | `/locations/{locationId}/customValues` | create-custom-value | Create Custom Value |
| GET | `/locations/{locationId}/customValues/{id}` | get-custom-value | Get Custom Value |
| PUT | `/locations/{locationId}/customValues/{id}` | update-custom-value | Update Custom Value |
| DELETE | `/locations/{locationId}/customValues/{id}` | delete-custom-value | Delete Custom Value |
| GET | `/locations/{locationId}/timezones` | get-timezones | Fetch Timezones |
| GET | `/locations/{locationId}/templates` | GET-all-or-email-sms-templates | GET all or email/sms templates |
| DELETE | `/locations/{locationId}/templates/{id}` | DELETE-an-email-sms-template | DELETE an email/sms template |
| POST | `/locations/` | create-location | Create Sub-Account (Formerly Location) |

**Request bodies** (* = required):

**PUT `/locations/{locationId}`**: name:string, phone:string, companyId*:string, address:string, city:string, state:string, country:string(AF|AX|AL|DZ|AS|AD|AO|AI|AQ|AG|AR|AM|AW|AU|AT|AZ|BS|BH|BD|BB|BY|BE|BZ|BJ|BM|BT|BO|BA|BW|BV|BR|IO|BN|BG|BF|BI|KH|CM|CA|CV|KY|CF|TD|CL|CN|CX|CC|CO|KM|CG|CD|CK|CR|CI|HR|CU|CY|CZ|DK|DJ|DM|DO|EC|EG|SV|GQ|ER|EE|ET|FK|FO|FJ|FI|FR|GF|PF|TF|GA|GM|GE|DE|GH|GI|GR|GL|GD|GP|GU|GT|GG|GN|GW|GY|HT|HM|VA|HN|HK|HU|IS|IN|ID|IR|IQ|IE|IM|IL|IT|JM|JP|JE|JO|KZ|KE|KI|KP|KR|XK|KW|KG|LA|LV|LB|LS|LR|LY|LI|LT|LU|MO|MK|MG|MW|MY|MV|ML|MT|MH|MQ|MR|MU|YT|MX|FM|MD|MC|MN|ME|MS|MA|MZ|MM|NA|NR|NP|NL|AN|NC|NZ|NI|NE|NG|NU|NF|MP|NO|OM|PK|PW|PS|PA|PG|PY|PE|PH|PN|PL|PT|PR|QA|RE|RO|RU|RW|SH|KN|LC|MF|PM|VC|WS|SM|ST|SA|SN|RS|SC|SL|SG|SX|SK|SI|SB|SO|ZA|GS|ES|LK|SD|SR|SJ|SZ|SE|CH|SY|TW|TJ|TZ|TH|TL|TG|TK|TO|TT|TN|TR|TM|TC|TV|UG|GB|UA|AE|US|UM|UY|UZ|VU|VE|VN|VG|VI|WF|EH|YE|ZM|ZW), postalCode:string, website:string, timezone:string, prospectInfo:object, settings:object, social:object, twilio:object, mailgun:object, snapshot:object

**POST `/locations/{locationId}/tags`**: name*:string

**PUT `/locations/{locationId}/tags/{tagId}`**: name*:string

**POST `/locations/{locationId}/tasks/search`**: contactId:string[], completed:boolean, assignedTo:string[], query:string, limit:number, skip:number, businessId:string

**PUT `/locations/{locationId}/recurring-tasks/{id}`**: title:string, description:string, contactIds:string[], owners:string[], rruleOptions:object, ignoreTaskCreation:boolean

**POST `/locations/{locationId}/recurring-tasks`**: title*:string, description:string, contactIds:string[], owners:string[], rruleOptions*:object, ignoreTaskCreation:boolean

**POST `/locations/{locationId}/customFields`**: name*:string, dataType*:string, placeholder:string, acceptedFormat:string[], isMultipleFile:boolean, maxNumberOfFiles:number, textBoxListOptions:array, position:number, model:string(contact|opportunity)

**PUT `/locations/{locationId}/customFields/{id}`**: name*:string, placeholder:string, acceptedFormat:string[], isMultipleFile:boolean, maxNumberOfFiles:number, textBoxListOptions:array, position:number, model:string(contact|opportunity)

**POST `/locations/{locationId}/customFields/upload`**: id:string, maxFiles:string

**POST `/locations/{locationId}/customValues`**: name*:string, value*:string

**PUT `/locations/{locationId}/customValues/{id}`**: name*:string, value*:string

**POST `/locations/`**: name*:string, phone:string, companyId*:string, address:string, city:string, state:string, country:string(AF|AX|AL|DZ|AS|AD|AO|AI|AQ|AG|AR|AM|AW|AU|AT|AZ|BS|BH|BD|BB|BY|BE|BZ|BJ|BM|BT|BO|BA|BW|BV|BR|IO|BN|BG|BF|BI|KH|CM|CA|CV|KY|CF|TD|CL|CN|CX|CC|CO|KM|CG|CD|CK|CR|CI|HR|CU|CY|CZ|DK|DJ|DM|DO|EC|EG|SV|GQ|ER|EE|ET|FK|FO|FJ|FI|FR|GF|PF|TF|GA|GM|GE|DE|GH|GI|GR|GL|GD|GP|GU|GT|GG|GN|GW|GY|HT|HM|VA|HN|HK|HU|IS|IN|ID|IR|IQ|IE|IM|IL|IT|JM|JP|JE|JO|KZ|KE|KI|KP|KR|XK|KW|KG|LA|LV|LB|LS|LR|LY|LI|LT|LU|MO|MK|MG|MW|MY|MV|ML|MT|MH|MQ|MR|MU|YT|MX|FM|MD|MC|MN|ME|MS|MA|MZ|MM|NA|NR|NP|NL|AN|NC|NZ|NI|NE|NG|NU|NF|MP|NO|OM|PK|PW|PS|PA|PG|PY|PE|PH|PN|PL|PT|PR|QA|RE|RO|RU|RW|SH|KN|LC|MF|PM|VC|WS|SM|ST|SA|SN|RS|SC|SL|SG|SX|SK|SI|SB|SO|ZA|GS|ES|LK|SD|SR|SJ|SZ|SE|CH|SY|TW|TJ|TZ|TH|TL|TG|TK|TO|TT|TN|TR|TM|TC|TV|UG|GB|UA|AE|US|UM|UY|UZ|VU|VE|VN|VG|VI|WF|EH|YE|ZM|ZW), postalCode:string, website:string, timezone:string, prospectInfo:object, settings:object, social:object, twilio:object, mailgun:object, snapshotId:string

## Developer marketplace API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/marketplace/billing/charges` | charge | Create a new wallet charge |
| GET | `/marketplace/billing/charges` | getCharges | Get all wallet charges |
| DELETE | `/marketplace/billing/charges/{chargeId}` | deleteCharge | Delete a wallet charge |
| GET | `/marketplace/billing/charges/{chargeId}` | getSpecificCharge | Get specific wallet charge details |
| GET | `/marketplace/billing/charges/has-funds` | hasFunds | Check if account has sufficient funds |
| DELETE | `/marketplace/app/{appId}/installations` | uninstall-application | Uninstall an application |
| GET | `/marketplace/app/{appId}/installations` | get-installer-details | Get Installer Details |

**Request bodies** (* = required):

**POST `/marketplace/billing/charges`**: appId*:string, meterId*:string, eventId*:string, userId:string, locationId*:string, companyId*:string, description*:string, price:number, units*:string, eventTime:string

## Media Library API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/medias/files` | fetch-media-content | Get List of Files/ Folders |
| POST | `/medias/upload-file` | upload-media-content | Upload File into Media Library |
| DELETE | `/medias/{id}` | delete-media-content | Delete File or Folder |
| POST | `/medias/{id}` | update-media-object | Update File/ Folder |
| POST | `/medias/folder` | create-media-folder | Create Folder |
| PUT | `/medias/update-files` | bulk-update-media-objects | Bulk Update Files/ Folders |
| PUT | `/medias/delete-files` | bulk-delete-media-objects | Bulk Delete / Trash Files or Folders |

**Request bodies** (* = required):

**POST `/medias/upload-file`**: file:string, hosted:boolean, fileUrl:string, name:string, parentId:string

**POST `/medias/{id}`**: name*:string, altType*:string(location), altId*:string

**POST `/medias/folder`**: altId*:string, altType*:string(location), name*:string, parentId:string

**PUT `/medias/update-files`**: altId*:string, altType*:string(location), filesToBeUpdated*:UpdateMediaObject[]

**PUT `/medias/delete-files`**: filesToBeDeleted*:DeleteMediaObjectItem[], altType*:string(location), altId*:string, status*:string(deleted|trashed)

## OAuth 2.0

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/oauth/token` | get-access-token | Get Access Token |
| POST | `/oauth/locationToken` | get-location-access-token | Get Location Access Token from Agency Token |
| GET | `/oauth/installedLocations` | get-installed-location | Get Location where app is installed |

**Request bodies** (* = required):

**POST `/oauth/token`**: client_id*:string, client_secret*:string, grant_type*:string(authorization_code|refresh_token|client_credentials), code:string, refresh_token:string, user_type:string(Company|Location), redirect_uri:string

**POST `/oauth/locationToken`**: companyId*:string, locationId*:string

## CUSTOM_OBJECTS API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/objects/{key}` | get-object-schema-by-key | Get Object Schema by key / id |
| PUT | `/objects/{key}` | update-custom-object | Update Object Schema By Key / Id |
| GET | `/objects/{schemaKey}/records/{id}` | get-record-by-id | Get Record By Id |
| PUT | `/objects/{schemaKey}/records/{id}` | update-object-record | Update Record |
| DELETE | `/objects/{schemaKey}/records/{id}` | delete-object-record | Delete Record |
| POST | `/objects/{schemaKey}/records` | create-object-record | Create Record |
| POST | `/objects/{schemaKey}/records/search` | search-object-records | Search Object Records |
| GET | `/objects/` | get-object-by-location-id | Get all objects for a location |
| POST | `/objects/` | create-custom-object-schema | Create Custom Object |

**Request bodies** (* = required):

**PUT `/objects/{key}`**: labels:object, description:string, locationId*:string, searchableProperties*:string[]

**PUT `/objects/{schemaKey}/records/{id}`**: 

**POST `/objects/{schemaKey}/records`**: 

**POST `/objects/{schemaKey}/records/search`**: locationId*:string, page*:number, pageLimit*:number, query*:string, searchAfter*:string[]

**POST `/objects/`**: labels*:object, key*:string, description:string, locationId*:string, primaryDisplayPropertyDetails*:object

## Opportunities API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/opportunities/search` | search-opportunity | Search Opportunity |
| GET | `/opportunities/pipelines` | get-pipelines | Get Pipelines |
| GET | `/opportunities/{id}` | get-opportunity | Get Opportunity |
| DELETE | `/opportunities/{id}` | delete-opportunity | Delete Opportunity |
| PUT | `/opportunities/{id}` | update-opportunity | Update Opportunity |
| PUT | `/opportunities/{id}/status` | update-opportunity-status | Update Opportunity Status |
| POST | `/opportunities/upsert` | Upsert-opportunity | Upsert Opportunity |
| POST | `/opportunities/{id}/followers` | add-followers-opportunity | Add Followers |
| DELETE | `/opportunities/{id}/followers` | remove-followers-opportunity | Remove Followers |
| POST | `/opportunities/` | create-opportunity | Create Opportunity |

**Request bodies** (* = required):

**PUT `/opportunities/{id}`**: pipelineId:string, name:string, pipelineStageId:string, status:string(open|won|lost|abandoned|all), monetaryValue:number, assignedTo:string, customFields:array

**PUT `/opportunities/{id}/status`**: status*:string(open|won|lost|abandoned|all)

**POST `/opportunities/upsert`**: pipelineId*:string, locationId*:string, contactId*:string, name:string, status:string(open|won|lost|abandoned|all), pipelineStageId:string, monetaryValue:number, assignedTo:string

**POST `/opportunities/{id}/followers`**: followers*:string[]

**POST `/opportunities/`**: pipelineId*:string, locationId*:string, name*:string, pipelineStageId:string, status*:string(open|won|lost|abandoned|all), contactId*:string, monetaryValue:number, assignedTo:string, customFields:array

## Payments API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/payments/integrations/provider/whitelabel` | create-integration provider | Create White-label Integration Provider |
| GET | `/payments/integrations/provider/whitelabel` | list-integration-providers | List White-label Integration Providers |
| GET | `/payments/orders` | list-orders | List Orders |
| GET | `/payments/orders/{orderId}` | get-order-by-id | Get Order by ID |
| POST | `/payments/orders/{orderId}/record-payment` | record-order-payment | Record Order Payment |
| POST | `/payments/orders/migrate-order-ps` | post-migrate-order-payment-status | migration Endpoint for Order Payment Status |
| POST | `/payments/orders/{orderId}/fulfillments` | create-order-fulfillment | Create order fulfillment |
| GET | `/payments/orders/{orderId}/fulfillments` | list-order-fulfillment | List fulfillment |
| GET | `/payments/orders/{orderId}/notes` | list-order-notes | List Order Notes |
| GET | `/payments/transactions` | list-transactions | List Transactions |
| GET | `/payments/transactions/{transactionId}` | get-transaction-by-id | Get Transaction by ID |
| GET | `/payments/subscriptions` | list-subscriptions | List Subscriptions |
| GET | `/payments/subscriptions/{subscriptionId}` | get-subscription-by-id | Get Subscription by ID |
| GET | `/payments/coupon/list` | list-coupons | List Coupons |
| POST | `/payments/coupon` | create-coupon | Create Coupon |
| PUT | `/payments/coupon` | update-coupon | Update Coupon |
| DELETE | `/payments/coupon` | delete-coupon | Delete Coupon |
| GET | `/payments/coupon` | get-coupon | Fetch Coupon |
| POST | `/payments/custom-provider/provider` | create-integration | Create new integration |
| DELETE | `/payments/custom-provider/provider` | delete-integration | Deleting an existing integration |
| GET | `/payments/custom-provider/connect` | fetch-config | Fetch given provider config |
| POST | `/payments/custom-provider/connect` | create-config | Create new provider config |
| POST | `/payments/custom-provider/disconnect` | disconnect-config | Disconnect existing provider config |
| PUT | `/payments/custom-provider/capabilities` | custom-provider-marketplace-app-update-capabilities | Custom-provider marketplace app update capabilities |

**Request bodies** (* = required):

**POST `/payments/integrations/provider/whitelabel`**: altId*:string, altType*:string(location), uniqueName*:string, title*:string, provider*:string(authorize-net|nmi), description*:string, imageUrl*:string

**POST `/payments/orders/{orderId}/record-payment`**: altId*:string, altType*:string(location), mode*:string(cash|card|cheque|bank_transfer|other), card:object, cheque:object, notes:string, amount:number, meta:object, isPartialPayment:boolean

**POST `/payments/orders/{orderId}/fulfillments`**: altId*:string, altType*:string(location), trackings*:FulfillmentTracking[], items*:FulfillmentItems[], notifyCustomer*:boolean

**POST `/payments/coupon`**: altId*:string, altType*:string(location), name*:string, code*:string, discountType*:string(percentage|amount), discountValue*:number, startDate*:string, endDate:string, usageLimit:number, productIds:string[], applyToFuturePayments:boolean, applyToFuturePaymentsConfig:object, limitPerCustomer:boolean

**PUT `/payments/coupon`**: altId*:string, altType*:string(location), name*:string, code*:string, discountType*:string(percentage|amount), discountValue*:number, startDate*:string, endDate:string, usageLimit:number, productIds:string[], applyToFuturePayments:boolean, applyToFuturePaymentsConfig:object, limitPerCustomer:boolean, id*:string

**POST `/payments/custom-provider/provider`**: name*:string, description*:string, paymentsUrl*:string, queryUrl*:string, imageUrl*:string, supportsSubscriptionSchedule*:boolean

**POST `/payments/custom-provider/connect`**: live*:object, test*:object

**POST `/payments/custom-provider/disconnect`**: liveMode*:boolean

**PUT `/payments/custom-provider/capabilities`**: supportsSubscriptionSchedules*:boolean, companyId:string, locationId:string

## Phone System API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/phone-system/number-pools` | getNumberPoolList | List Number Pools |
| GET | `/phone-system/numbers/location/{locationId}` | active-numbers | List active numbers |

## Products API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/products/bulk-update` | bulkUpdate | Bulk Update Products |
| POST | `/products/bulk-update/edit` | bulkEdit | Bulk Edit Products and Prices |
| POST | `/products/{productId}/price` | create-price-for-product | Create Price for a Product |
| GET | `/products/{productId}/price` | list-prices-for-product | List Prices for a Product |
| GET | `/products/inventory` | get-list-inventory | List Inventory |
| POST | `/products/inventory` | update-inventory | Update Inventory |
| GET | `/products/{productId}/price/{priceId}` | get-price-by-id-for-product | Get Price by ID for a Product |
| PUT | `/products/{productId}/price/{priceId}` | update-price-by-id-for-product | Update Price by ID for a Product |
| DELETE | `/products/{productId}/price/{priceId}` | delete-price-by-id-for-product | Delete Price by ID for a Product |
| GET | `/products/store/{storeId}/stats` | get-product-store-stats | Fetch Product Store Stats |
| POST | `/products/store/{storeId}` | update-store-status | Action to include/exclude the product in store |
| POST | `/products/store/{storeId}/priority` | update-display-priority | Update product display priorities in store |
| GET | `/products/collections` | get-product-collection | Fetch Product Collections |
| POST | `/products/collections` | create-product-collection | Create Product Collection |
| GET | `/products/collections/{collectionId}` | get-product-collection-id | Get Details about individual product collection |
| PUT | `/products/collections/{collectionId}` | update-product-collection | Update Product Collection |
| DELETE | `/products/collections/{collectionId}` | delete-product-collection | Delete Product Collection |
| GET | `/products/reviews` | get-product-reviews | Fetch Product Reviews |
| GET | `/products/reviews/count` | get-reviews-count | Fetch Review Count as per status |
| PUT | `/products/reviews/{reviewId}` | update-product-review | Update Product Reviews |
| DELETE | `/products/reviews/{reviewId}` | delete-product-review | Delete Product Review |
| POST | `/products/reviews/bulk-update` | bulk-update-product-review | Update Product Reviews |
| GET | `/products/{productId}` | get-product-by-id | Get Product by ID |
| DELETE | `/products/{productId}` | delete-product-by-id | Delete Product by ID |
| PUT | `/products/{productId}` | update-product-by-id | Update Product by ID |
| POST | `/products/` | create-product | Create Product |
| GET | `/products/` | list-invoices | List Products |

**Request bodies** (* = required):

**POST `/products/bulk-update`**: altId*:string, altType*:string(location), type*:string(bulk-update-price|bulk-update-availability|bulk-update-product-collection|bulk-delete-products|bulk-update-currency), productIds*:string[], filters:object, price:object, compareAtPrice:object, availability:boolean, collectionIds:string[], currency:string

**POST `/products/bulk-update/edit`**: altId*:string, altType*:string(location), products*:BulkEditProductDto[]

**POST `/products/{productId}/price`**: name*:string, type*:string(one_time|recurring), currency*:string, amount*:number, recurring:object, description:string, membershipOffers:MembershipOfferDto[], trialPeriod:number, totalCycles:number, setupFee:number, variantOptionIds:string[], compareAtPrice:number, locationId*:string, userId:string, meta:object, trackInventory:boolean, availableQuantity:number, allowOutOfStockPurchases:boolean, sku:string, shippingOptions:object, isDigitalProduct:boolean, digitalDelivery:string[]

**POST `/products/inventory`**: altId*:string, altType*:string(location), items*:UpdateInventoryItemDto[]

**PUT `/products/{productId}/price/{priceId}`**: name*:string, type*:string(one_time|recurring), currency*:string, amount*:number, recurring:object, description:string, membershipOffers:MembershipOfferDto[], trialPeriod:number, totalCycles:number, setupFee:number, variantOptionIds:string[], compareAtPrice:number, locationId*:string, userId:string, meta:object, trackInventory:boolean, availableQuantity:number, allowOutOfStockPurchases:boolean, sku:string, shippingOptions:object, isDigitalProduct:boolean, digitalDelivery:string[]

**POST `/products/store/{storeId}`**: altId*:string, altType*:string(location), action*:string(include|exclude), productIds*:string[]

**POST `/products/store/{storeId}/priority`**: altId*:string, altType*:string(location), products*:array[]

**POST `/products/collections`**: altId*:string, altType*:string(location), collectionId:string, name*:string, slug*:string, image:string, seo:object

**PUT `/products/collections/{collectionId}`**: altId*:string, altType*:string(location), name:string, slug:string, image:string, seo:object

**PUT `/products/reviews/{reviewId}`**: altId*:string, altType*:string(location), productId*:string, status*:string, reply:ProductReviewDto[], rating:number, headline:string, detail:string

**POST `/products/reviews/bulk-update`**: altId*:string, altType*:string(location), reviews*:UpdateProductReviewObjectDto[], status*:object

**PUT `/products/{productId}`**: name*:string, locationId*:string, description:string, productType*:string(DIGITAL|PHYSICAL|SERVICE|PHYSICAL/DIGITAL), image:string, statementDescriptor:string, availableInStore:boolean, medias:ProductMediaDto[], variants:ProductVariantDto[], collectionIds:string[], isTaxesEnabled:boolean, taxes:string[], automaticTaxCategoryId:string, isLabelEnabled:boolean, label:object, slug:string, seo:object, taxInclusive:boolean, prices:string[]

**POST `/products/`**: name*:string, locationId*:string, description:string, productType*:string(DIGITAL|PHYSICAL|SERVICE|PHYSICAL/DIGITAL), image:string, statementDescriptor:string, availableInStore:boolean, medias:ProductMediaDto[], variants:ProductVariantDto[], collectionIds:string[], isTaxesEnabled:boolean, taxes:string[], automaticTaxCategoryId:string, isLabelEnabled:boolean, label:object, slug:string, seo:object, taxInclusive:boolean

## Documents and Contracts API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/proposals/document` | list-documents-contracts | List documents |
| POST | `/proposals/document/send` | send-documents-contracts | Send document |
| GET | `/proposals/templates` | list-documents-contracts-templates | List templates |
| POST | `/proposals/templates/send` | send-documents-contracts-template | Send template |

**Request bodies** (* = required):

**POST `/proposals/document/send`**: locationId*:string, documentId*:string, documentName:string, medium:string(link|email), ccRecipients:CCRecipientItem[], notificationSettings:object, sentBy*:string

**POST `/proposals/templates/send`**: templateId*:string, userId*:string, sendDocument:boolean, locationId*:string, contactId*:string, opportunityId:string

## SaaS API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/saas-api/public-api/locations` | locations-deprecated | Get locations by stripeId with companyId |
| PUT | `/saas-api/public-api/update-saas-subscription/{locationId}` | update-saas-subscription-deprecated | Update SaaS subscription |
| POST | `/saas-api/public-api/bulk-disable-saas/{companyId}` | bulk-disable-saas-deprecated | Disable SaaS for locations |
| POST | `/saas-api/public-api/enable-saas/{locationId}` | enable-saas-location-deprecated | Enable SaaS for Sub-Account (Formerly Location) |
| POST | `/saas-api/public-api/pause/{locationId}` | pause-location-deprecated | Pause location |
| POST | `/saas-api/public-api/update-rebilling/{companyId}` | update-rebilling-deprecated | Update Rebilling |
| GET | `/saas-api/public-api/agency-plans/{companyId}` | get-agency-plans-deprecated | Get Agency Plans |
| GET | `/saas-api/public-api/get-saas-subscription/{locationId}` | get-location-subscription-deprecated | Get Location Subscription Details |
| POST | `/saas-api/public-api/bulk-enable-saas/{companyId}` | bulk-enable-saas-deprecated | Bulk Enable SaaS |
| GET | `/saas-api/public-api/saas-locations/{companyId}` | get-saas-locations-deprecated | Get SaaS Locations |
| GET | `/saas-api/public-api/saas-plan/{planId}` | get-saas-plan-deprecated | Get SaaS Plan |
| GET | `/saas/locations` | locations | Get locations by stripeId with companyId |
| PUT | `/saas/update-saas-subscription/{locationId}` | generate-payment-link | Update SaaS subscription |
| POST | `/saas/bulk-disable-saas/{companyId}` | bulk-disable-saas | Disable SaaS for locations |
| POST | `/saas/enable-saas/{locationId}` | enable-saas-location | Enable SaaS for Sub-Account (Formerly Location) |
| POST | `/saas/pause/{locationId}` | pause-location | Pause location |
| POST | `/saas/update-rebilling/{companyId}` | update-rebilling | Update Rebilling |
| GET | `/saas/agency-plans/{companyId}` | get-agency-plans | Get Agency Plans |
| GET | `/saas/get-saas-subscription/{locationId}` | get-location-subscription | Get Location Subscription Details |
| POST | `/saas/bulk-enable-saas/{companyId}` | bulk-enable-saas | Bulk Enable SaaS |
| GET | `/saas/saas-locations/{companyId}` | get-saas-locations | Get SaaS Locations |
| GET | `/saas/saas-plan/{planId}` | get-saas-plan | Get SaaS Plan |

**Request bodies** (* = required):

**PUT `/saas-api/public-api/update-saas-subscription/{locationId}`**: subscriptionId*:string, customerId*:string, companyId*:string

**POST `/saas-api/public-api/bulk-disable-saas/{companyId}`**: locationIds*:string[]

**POST `/saas-api/public-api/enable-saas/{locationId}`**: stripeAccountId:string, name:string, email:string, stripeCustomerId:string, companyId*:string, isSaaSV2*:boolean, contactId:string, providerLocationId:string, description:string, saasPlanId:string, priceId:string

**POST `/saas-api/public-api/pause/{locationId}`**: paused*:boolean, companyId*:string

**POST `/saas-api/public-api/update-rebilling/{companyId}`**: product*:string(contentAI|workflow_premium_actions|workflow_ai|conversationAI|EmailNotification|whatsApp|reviewsAI|VERIFIED_CALLER_ID|WALLET_SALES_TAX|NOTIFICATION_SMS|EmailSmtp|EmailVerification|autoCompleteAddress|funnelAI|domainPurchase|Phone|Email), locationIds*:string[], config*:object

**POST `/saas-api/public-api/bulk-enable-saas/{companyId}`**: locationIds*:string[], isSaaSV2*:boolean, actionPayload*:object

**PUT `/saas/update-saas-subscription/{locationId}`**: subscriptionId*:string, customerId*:string, companyId*:string

**POST `/saas/bulk-disable-saas/{companyId}`**: locationIds*:string[]

**POST `/saas/enable-saas/{locationId}`**: stripeAccountId:string, name:string, email:string, stripeCustomerId:string, companyId*:string, isSaaSV2*:boolean, contactId:string, providerLocationId:string, description:string, saasPlanId:string, priceId:string

**POST `/saas/pause/{locationId}`**: paused*:boolean, companyId*:string

**POST `/saas/update-rebilling/{companyId}`**: product*:string(contentAI|workflow_premium_actions|workflow_ai|conversationAI|EmailNotification|whatsApp|reviewsAI|VERIFIED_CALLER_ID|WALLET_SALES_TAX|NOTIFICATION_SMS|EmailSmtp|EmailVerification|autoCompleteAddress|funnelAI|domainPurchase|Phone|Email), locationIds*:string[], config*:object

**POST `/saas/bulk-enable-saas/{companyId}`**: locationIds*:string[], isSaaSV2*:boolean, actionPayload*:object

## Snapshots API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/snapshots/` | get-custom-snapshots | Get Snapshots |
| POST | `/snapshots/share/link` | create-snapshot-share-link | Create Snapshot Share Link |
| GET | `/snapshots/snapshot-status/{snapshotId}` | get-snapshot-push | Get Snapshot Push between Dates |
| GET | `/snapshots/snapshot-status/{snapshotId}/location/{locationId}` | get-latest-snapshot-push | Get Last Snapshot Push |

**Request bodies** (* = required):

**POST `/snapshots/share/link`**: snapshot_id*:string, share_type*:string(link|permanent_link|agency_link|location_link), relationship_number:string, share_location_id:string

## Social Media Posting API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/social-media-posting/oauth/google/start` | start-google-oauth | Starts OAuth For Google Account |
| GET | `/social-media-posting/oauth/{locationId}/google/locations/{accountId}` | get-google-locations | Get google business locations |
| POST | `/social-media-posting/oauth/{locationId}/google/locations/{accountId}` | set-google-locations | Set google business locations |
| POST | `/social-media-posting/{locationId}/posts/list` | get-posts | Get posts |
| POST | `/social-media-posting/{locationId}/posts` | create-post | Create post |
| GET | `/social-media-posting/{locationId}/posts/{id}` | get-post | Get post |
| PUT | `/social-media-posting/{locationId}/posts/{id}` | edit-post | Edit post |
| DELETE | `/social-media-posting/{locationId}/posts/{id}` | delete-post | Delete Post |
| POST | `/social-media-posting/{locationId}/posts/bulk-delete` | bulk-delete-social-planner-posts | Bulk Delete Social Planner Posts |
| GET | `/social-media-posting/{locationId}/accounts` | get-account | Get Accounts |
| DELETE | `/social-media-posting/{locationId}/accounts/{id}` | delete-account | Delete Account |
| GET | `/social-media-posting/oauth/facebook/start` | start-facebook-oauth | Starts OAuth For Facebook Account |
| GET | `/social-media-posting/oauth/{locationId}/facebook/accounts/{accountId}` | get-facebook-page-group | Get facebook pages |
| POST | `/social-media-posting/oauth/{locationId}/facebook/accounts/{accountId}` | attach-facebook-page-group | Attach facebook pages |
| GET | `/social-media-posting/oauth/instagram/start` | start-instagram-oauth | Starts OAuth For Instagram Account |
| GET | `/social-media-posting/oauth/{locationId}/instagram/accounts/{accountId}` | get-instagram-page-group | Get Instagram Professional Accounts |
| POST | `/social-media-posting/oauth/{locationId}/instagram/accounts/{accountId}` | attach-instagram-page-group | Attach Instagram Professional Accounts |
| GET | `/social-media-posting/oauth/linkedin/start` | start-linkedin-oauth | Starts OAuth For LinkedIn Account |
| GET | `/social-media-posting/oauth/{locationId}/linkedin/accounts/{accountId}` | get-linkedin-page-profile | Get Linkedin pages and profile |
| POST | `/social-media-posting/oauth/{locationId}/linkedin/accounts/{accountId}` | attach-linkedin-page-profile | Attach linkedin pages and profile |
| GET | `/social-media-posting/oauth/twitter/start` | start-twitter-oauth | Starts OAuth For Twitter Account |
| GET | `/social-media-posting/oauth/{locationId}/twitter/accounts/{accountId}` | get-twitter-profile | Get Twitter profile |
| POST | `/social-media-posting/oauth/{locationId}/twitter/accounts/{accountId}` | attach-twitter-profile | Attach Twitter profile |
| POST | `/social-media-posting/{locationId}/csv` | upload-csv | Upload CSV |
| GET | `/social-media-posting/{locationId}/csv` | get-upload-status | Get Upload Status |
| POST | `/social-media-posting/{locationId}/set-accounts` | set-accounts | Set Accounts |
| GET | `/social-media-posting/{locationId}/csv/{id}` | get-csv-post | Get CSV Post |
| PATCH | `/social-media-posting/{locationId}/csv/{id}` | start-csv-finalize | Start CSV Finalize |
| DELETE | `/social-media-posting/{locationId}/csv/{id}` | delete-csv | Delete CSV |
| DELETE | `/social-media-posting/{locationId}/csv/{csvId}/post/{postId}` | delete-csv-post | Delete CSV Post |
| GET | `/social-media-posting/oauth/tiktok/start` | start-tiktok-oauth | Starts OAuth For Tiktok Account |
| GET | `/social-media-posting/oauth/{locationId}/tiktok/accounts/{accountId}` | get-tiktok-profile | Get Tiktok profile |
| POST | `/social-media-posting/oauth/{locationId}/tiktok/accounts/{accountId}` | attach-tiktok-profile | Attach Tiktok profile |
| GET | `/social-media-posting/oauth/tiktok-business/start` | start-tiktok-business-oauth | Starts OAuth For Tiktok Business Account |
| GET | `/social-media-posting/oauth/{locationId}/tiktok-business/accounts/{accountId}` | get-tiktok-business-profile | Get Tiktok Business profile |
| GET | `/social-media-posting/{locationId}/categories` | get-categories-location-id | Get categories by location id |
| GET | `/social-media-posting/{locationId}/categories/{id}` | get-categories-id | Get categories by id |
| GET | `/social-media-posting/{locationId}/tags` | get-tags-location-id | Get tags by location id |
| POST | `/social-media-posting/{locationId}/tags/details` | get-tags-by-ids | Get tags by ids |
| POST | `/social-media-posting/statistics` | get-social-media-statistics | Get Social Media Statistics |

**Request bodies** (* = required):

**POST `/social-media-posting/oauth/{locationId}/google/locations/{accountId}`**: location:object, account:object, companyId:string

**POST `/social-media-posting/{locationId}/posts/list`**: type:string, accounts:string, skip*:string, limit*:string, fromDate*:string, toDate*:string, includeUsers*:string, postType:object

**POST `/social-media-posting/{locationId}/posts`**: accountIds*:string[], summary:string, media:PostMediaSchema[], status:object, scheduleDate:string, createdBy:string, followUpComment:string, ogTagsDetails:object, type*:object, postApprovalDetails:object, scheduleTimeUpdated:boolean, tags:string[], categoryId:string, tiktokPostDetails:object, gmbPostDetails:object, userId*:string

**PUT `/social-media-posting/{locationId}/posts/{id}`**: accountIds:string[], summary:string, media:PostMediaSchema[], status:object, scheduleDate:string, createdBy:string, followUpComment:string, ogTagsDetails:object, type*:object, postApprovalDetails:object, scheduleTimeUpdated:boolean, tags:string[], categoryId:string, tiktokPostDetails:object, gmbPostDetails:object, userId:string

**POST `/social-media-posting/{locationId}/posts/bulk-delete`**: postIds:string[]

**POST `/social-media-posting/oauth/{locationId}/facebook/accounts/{accountId}`**: type:object, originId:string, name:string, avatar:string, companyId:string

**POST `/social-media-posting/oauth/{locationId}/instagram/accounts/{accountId}`**: originId:string, name:string, avatar:string, pageId*:string, companyId:string

**POST `/social-media-posting/oauth/{locationId}/linkedin/accounts/{accountId}`**: type:string(page|group|profile|location|business), originId:string, name:string, avatar:string, urn:string, companyId:string

**POST `/social-media-posting/oauth/{locationId}/twitter/accounts/{accountId}`**: originId:string, name:string, username:string, avatar:string, protected:boolean, verified:boolean, companyId:string

**POST `/social-media-posting/{locationId}/csv`**: file:string

**POST `/social-media-posting/{locationId}/set-accounts`**: accountIds*:string[], filePath*:string, rowsCount*:number, fileName*:string, approver:string, userId:string

**PATCH `/social-media-posting/{locationId}/csv/{id}`**: userId:string

**POST `/social-media-posting/oauth/{locationId}/tiktok/accounts/{accountId}`**: type:string(page|group|profile|location|business), originId:string, name:string, avatar:string, verified:boolean, username:string, companyId:string

**POST `/social-media-posting/{locationId}/tags/details`**: tagIds*:string[]

**POST `/social-media-posting/statistics`**: profileIds*:string[], platforms:string[]

## Store API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/store/shipping-zone` | create-shipping-zone | Create Shipping Zone |
| GET | `/store/shipping-zone` | list-shipping-zones | List Shipping Zones |
| GET | `/store/shipping-zone/{shippingZoneId}` | get-shipping-zones | Get Shipping Zone |
| PUT | `/store/shipping-zone/{shippingZoneId}` | update-shipping-zone | Update Shipping Zone |
| DELETE | `/store/shipping-zone/{shippingZoneId}` | delete-shipping-zone | Delete shipping zone |
| POST | `/store/shipping-zone/shipping-rates` | get-available-shipping-zones | Get available shipping rates |
| POST | `/store/shipping-zone/{shippingZoneId}/shipping-rate` | create-shipping-rate | Create Shipping Rate |
| GET | `/store/shipping-zone/{shippingZoneId}/shipping-rate` | list-shipping-rates | List Shipping Rates |
| GET | `/store/shipping-zone/{shippingZoneId}/shipping-rate/{shippingRateId}` | get-shipping-rates | Get Shipping Rate |
| PUT | `/store/shipping-zone/{shippingZoneId}/shipping-rate/{shippingRateId}` | update-shipping-rate | Update Shipping Rate |
| DELETE | `/store/shipping-zone/{shippingZoneId}/shipping-rate/{shippingRateId}` | delete-shipping-rate | Delete shipping rate |
| POST | `/store/shipping-carrier` | create-shipping-carrier | Create Shipping Carrier |
| GET | `/store/shipping-carrier` | list-shipping-carriers | List Shipping Carriers |
| GET | `/store/shipping-carrier/{shippingCarrierId}` | get-shipping-carriers | Get Shipping Carrier |
| PUT | `/store/shipping-carrier/{shippingCarrierId}` | update-shipping-carrier | Update Shipping Carrier |
| DELETE | `/store/shipping-carrier/{shippingCarrierId}` | delete-shipping-carrier | Delete shipping carrier |
| POST | `/store/store-setting` | create-store-setting | Create/Update Store Settings |
| GET | `/store/store-setting` | get-store-settings | Get Store Settings |

**Request bodies** (* = required):

**POST `/store/shipping-zone`**: altId*:string, altType*:string(location), name*:string, countries*:ShippingZoneCountryDto[]

**PUT `/store/shipping-zone/{shippingZoneId}`**: altId:string, altType:string(location), name:string, countries:ShippingZoneCountryDto[]

**POST `/store/shipping-zone/shipping-rates`**: altId*:string, altType*:string(location), country*:string(US|CA|AF|AX|AL|DZ|AS|AD|AO|AI|AQ|AG|AR|AM|AW|AU|AT|AZ|BS|BH|BD|BB|BY|BE|BZ|BJ|BM|BT|BO|BA|BW|BV|BR|IO|BN|BG|BF|BI|KH|CM|CV|KY|CF|TD|CL|CN|CX|CC|CO|KM|CG|CD|CK|CR|CI|HR|CU|CY|CZ|DK|DJ|DM|DO|EC|EG|SV|GQ|ER|EE|ET|FK|FO|FJ|FI|FR|GF|PF|TF|GA|GM|GE|DE|GH|GI|GR|GL|GD|GP|GU|GT|GG|GN|GW|GY|HT|HM|VA|HN|HK|HU|IS|IN|ID|IR|IQ|IE|IM|IL|IT|JM|JP|JE|JO|KZ|KE|KI|KP|XK|KW|KG|LA|LV|LB|LS|LR|LY|LI|LT|LU|MO|MK|MG|MW|MY|MV|ML|MT|MH|MQ|MR|MU|YT|MX|FM|MD|MC|MN|ME|MS|MA|MZ|MM|NA|NR|NP|NL|AN|NC|NZ|NI|NE|NG|NU|NF|MP|NO|OM|PK|PW|PS|PA|PG|PY|PE|PH|PN|PL|PT|PR|QA|RE|RO|RU|RW|SH|KN|LC|MF|PM|VC|WS|SM|ST|SA|SN|RS|SC|SL|SG|SX|SK|SI|SB|SO|ZA|GS|KR|ES|LK|SD|SR|SJ|SZ|SE|CH|SY|TW|TJ|TZ|TH|TL|TG|TK|TO|TT|TN|TR|TM|TC|TV|UG|UA|AE|GB|UM|UY|UZ|VU|VE|VN|VG|VI|WF|EH|YE|ZM|ZW), address:object, amountAvailable:string(AF|AX|AL|DZ|AS|AD|AO|AI|AQ|AG|AR|AM|AW|AU|AT|AZ|BS|BH|BD|BB|BY|BE|BZ|BJ|BM|BT|BO|BA|BW|BV|BR|IO|BN|BG|BF|BI|KH|CM|CA|CV|KY|CF|TD|CL|CN|CX|CC|CO|KM|CG|CD|CK|CR|CI|HR|CU|CY|CZ|DK|DJ|DM|DO|EC|EG|SV|GQ|ER|EE|ET|FK|FO|FJ|FI|FR|GF|PF|TF|GA|GM|GE|DE|GH|GI|GR|GL|GD|GP|GU|GT|GG|GN|GW|GY|HT|HM|VA|HN|HK|HU|IS|IN|ID|IR|IQ|IE|IM|IL|IT|JM|JP|JE|JO|KZ|KE|KI|KP|KR|XK|KW|KG|LA|LV|LB|LS|LR|LY|LI|LT|LU|MO|MK|MG|MW|MY|MV|ML|MT|MH|MQ|MR|MU|YT|MX|FM|MD|MC|MN|ME|MS|MA|MZ|MM|NA|NR|NP|NL|AN|NC|NZ|NI|NE|NG|NU|NF|MP|NO|OM|PK|PW|PS|PA|PG|PY|PE|PH|PN|PL|PT|PR|QA|RE|RO|RU|RW|SH|KN|LC|MF|PM|VC|WS|SM|ST|SA|SN|RS|SC|SL|SG|SX|SK|SI|SB|SO|ZA|GS|ES|LK|SD|SR|SJ|SZ|SE|CH|SY|TW|TJ|TZ|TH|TL|TG|TK|TO|TT|TN|TR|TM|TC|TV|UG|GB|UA|AE|US|UM|UY|UZ|VU|VE|VN|VG|VI|WF|EH|YE|ZM|ZW), totalOrderAmount*:number, weightAvailable:boolean, totalOrderWeight*:number, source*:object, products*:ProductItem[], couponCode:string

**POST `/store/shipping-zone/{shippingZoneId}/shipping-rate`**: altId*:string, altType*:string(location), name*:string, description:string, currency*:string, amount*:number, conditionType*:string(none|price|weight), minCondition*:number, maxCondition*:number, isCarrierRate:boolean, shippingCarrierId*:string, percentageOfRateFee:number, shippingCarrierServices:ShippingCarrierServiceDto[]

**PUT `/store/shipping-zone/{shippingZoneId}/shipping-rate/{shippingRateId}`**: altId:string, altType:string(location), name:string, description:string, currency:string, amount:number, conditionType:string(none|price|weight), minCondition:number, maxCondition:number, isCarrierRate:boolean, shippingCarrierId:string, percentageOfRateFee:number, shippingCarrierServices:ShippingCarrierServiceDto[]

**POST `/store/shipping-carrier`**: altId*:string, altType*:string(location), name*:string, callbackUrl*:string, services:ShippingCarrierServiceDto[], allowsMultipleServiceSelection:boolean

**PUT `/store/shipping-carrier/{shippingCarrierId}`**: altId:string, altType:string(location), name:string, callbackUrl:string, services:ShippingCarrierServiceDto[], allowsMultipleServiceSelection:boolean

**POST `/store/store-setting`**: altId*:string, altType*:string(location), shippingOrigin*:object, storeOrderNotification:object, storeOrderFulfillmentNotification:object

## Surveys API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/surveys/submissions` | get-surveys-submissions | Get Surveys Submissions |
| GET | `/surveys/` | get-surveys | Get Surveys |

## Users API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/users/search` | search-users | Search Users |
| POST | `/users/search/filter-by-email` | filter-users-by-email | Filter Users by Email |
| GET | `/users/{userId}` | get-user | Get User |
| PUT | `/users/{userId}` | update-user | Update User |
| DELETE | `/users/{userId}` | delete-user | Delete User |
| GET | `/users/` | get-user-by-location | Get User by Location |
| POST | `/users/` | create-user | Create User |

**Request bodies** (* = required):

**POST `/users/search/filter-by-email`**: companyId*:string, emails*:string[], deleted:boolean, skip:string, limit:string, projection:string

**PUT `/users/{userId}`**: firstName:string, lastName:string, email:string, emailChangeOTP:string, password:string, phone:string, type:string, role:string, companyId:string, locationIds:string[], permissions:PermissionsDto, scopes:string[], scopesAssignedToOnly:string[], profilePhoto:string

**POST `/users/`**: companyId*:string, firstName*:string, lastName*:string, email*:string, password*:string, phone:string, type*:string, role*:string, locationIds*:string[], permissions:PermissionsDto, scopes:string[], scopesAssignedToOnly:string[], profilePhoto:string

## Voice AI API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| POST | `/voice-ai/agents` | create-agent | Create Agent |
| GET | `/voice-ai/agents` | get-agents | List Agents |
| PATCH | `/voice-ai/agents/{agentId}` | patch-agent | Patch Agent |
| GET | `/voice-ai/agents/{agentId}` | get-agent | Get Agent |
| DELETE | `/voice-ai/agents/{agentId}` | delete-agent | Delete Agent |
| GET | `/voice-ai/dashboard/call-logs` | get-call-logs | List Call Logs |
| GET | `/voice-ai/dashboard/call-logs/{callId}` | getCallLog | Get Call Log |
| POST | `/voice-ai/actions` | create-action | Create Agent Action |
| PUT | `/voice-ai/actions/{actionId}` | update-action | Update Agent Action |
| GET | `/voice-ai/actions/{actionId}` | get-action | Get Agent Action |
| DELETE | `/voice-ai/actions/{actionId}` | delete-action | Delete Agent Action |

**Request bodies** (* = required):

**POST `/voice-ai/agents`**: locationId:string, agentName:string, businessName:string, welcomeMessage:string, agentPrompt:string, voiceId:string, language:VoiceAILanguage, patienceLevel:PatienceLevel, maxCallDuration:number, sendUserIdleReminders:boolean, reminderAfterIdleTimeSeconds:number, inboundNumber:string, numberPoolId:string, callEndWorkflowIds:string[], sendPostCallNotificationTo:object, agentWorkingHours:AgentWorkingHoursDTO[], timezone:string, isAgentAsBackupDisabled:boolean, translation:object

**PATCH `/voice-ai/agents/{agentId}`**: agentName:string, businessName:string, welcomeMessage:string, agentPrompt:string, voiceId:string, language:VoiceAILanguage, patienceLevel:PatienceLevel, maxCallDuration:number, sendUserIdleReminders:boolean, reminderAfterIdleTimeSeconds:number, inboundNumber:string, numberPoolId:string, callEndWorkflowIds:string[], sendPostCallNotificationTo:object, agentWorkingHours:AgentWorkingHoursDTO[], timezone:string, isAgentAsBackupDisabled:boolean, translation:object

**POST `/voice-ai/actions`**: agentId*:string, locationId*:string, actionType*:string(CALL_TRANSFER|DATA_EXTRACTION|IN_CALL_DATA_EXTRACTION|WORKFLOW_TRIGGER|SMS|APPOINTMENT_BOOKING|CUSTOM_ACTION), name*:string, actionParameters*:object

**PUT `/voice-ai/actions/{actionId}`**: agentId*:string, locationId*:string, actionType*:string(CALL_TRANSFER|DATA_EXTRACTION|IN_CALL_DATA_EXTRACTION|WORKFLOW_TRIGGER|SMS|APPOINTMENT_BOOKING|CUSTOM_ACTION), name*:string, actionParameters*:object

## workflows API

| Method | Path | Operation ID | Summary |
|--------|------|-------------|----------|
| GET | `/workflows/` | get-workflow | Get Workflow |

---

# Overrides

> These corrections take precedence over the auto-generated docs above.

## Override: api-reference/proposals.md

## SendDocumentDto.medium

The `medium` field accepts the following values:

- `link`
- `email`
- `sms`
- `sms_and_email`

The upstream docs incorrectly list only `link` and `email`. The value `sms_and_email` is also valid and sends the document via both SMS and email, similar for `sms`.

