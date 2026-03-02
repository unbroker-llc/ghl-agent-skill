# Calendars API

Documentation for Calendars API

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

### GET `/calendars/groups`

Get Groups

Get all calendar groups in a location.

Operation ID: `get-groups`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/calendars/groups`

Create Calendar Group

Create Calendar Group

Operation ID: `create-calendar-group`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `GroupCreateDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `name` | string | Yes | - |
| `description` | string | Yes | - |
| `slug` | string | Yes | - |
| `isActive` | boolean | No | - |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/calendars/groups/validate-slug`

Validate group slug

Validate if group slug is available or not.

Operation ID: `validate-groups-slug`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `ValidateGroupSlugPostBody`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `slug` | string | Yes | Slug |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/calendars/groups/{groupId}`

Delete Group

Delete Group

Operation ID: `delete-group`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `groupId` | path | string | Yes | Group Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/calendars/groups/{groupId}`

Update Group

Update Group by group ID

Operation ID: `edit-group`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `groupId` | path | string | Yes | Group Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `GroupUpdateDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `description` | string | Yes | - |
| `slug` | string | Yes | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/calendars/groups/{groupId}/status`

Disable Group

Disable Group

Operation ID: `disable-group`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `groupId` | path | string | Yes | Group Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `GroupStatusUpdateParams`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `isActive` | boolean | Yes | Is Active? |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/calendars/events/appointments`

Create appointment

Create appointment

Operation ID: `create-appointment`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `AppointmentCreateSchema`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | Title |
| `meetingLocationType` | string (enum: custom, zoom, gmeet, phone, address, ms_teams, google) | No | Meeting location type.  - If `address` is provided in the request body, the `meetingLocationType` defaults to **custom**. |
| `meetingLocationId` | string | No | The unique identifier for the meeting location. - This value can be found in `calendar.locationConfigurations`or `calendar.teamMembers[].locationConfigurations` |
| `overrideLocationConfig` | boolean | No | Flag to override location config - **false** - If only `meetingLocationId` is provided - **true** - If only `meetingLocationType` is provided  |
| `appointmentStatus` | string (enum: new, confirmed, cancelled, showed, noshow, invalid) | No | - |
| `assignedUserId` | string | No | Assigned User Id |
| `description` | string | No | Appointment Description |
| `address` | string | No | Appointment Address |
| `ignoreDateRange` | boolean | No | If set to true, the minimum scheduling notice and date range would be ignored |
| `toNotify` | boolean | No | If set to false, the automations will not run |
| `ignoreFreeSlotValidation` | boolean | No | If true the time slot validation would be avoided for any appointment creation (even the ignoreDateRange) |
| `rrule` | string | No | RRULE as per the iCalendar (RFC 5545) specification for recurring events. DTSTART is not required, instance ids are calculated on the basis of startTime of the event. The rrule only be applied if ignoreFreeSlotValidation is true. |
| `calendarId` | string | Yes | Calendar Id |
| `locationId` | string | Yes | Location Id |
| `contactId` | string | Yes | Contact Id |
| `startTime` | string | Yes | Start Time |
| `endTime` | string | No | End Time |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/calendars/events/appointments/{eventId}`

Update Appointment

Update appointment

Operation ID: `edit-appointment`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `eventId` | path | string | Yes | Event Id or Instance id. For recurring appointments send masterEventId to modify original series. |

**Request Body (required):**

Content-Type: `application/json`

Schema: `AppointmentEditSchema`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | Title |
| `meetingLocationType` | string (enum: custom, zoom, gmeet, phone, address, ms_teams, google) | No | Meeting location type.  - If `address` is provided in the request body, the `meetingLocationType` defaults to **custom**. |
| `meetingLocationId` | string | No | The unique identifier for the meeting location. - This value can be found in `calendar.locationConfigurations`or `calendar.teamMembers[].locationConfigurations` |
| `overrideLocationConfig` | boolean | No | Flag to override location config - **false** - If only `meetingLocationId` is provided - **true** - If only `meetingLocationType` is provided  |
| `appointmentStatus` | string (enum: new, confirmed, cancelled, showed, noshow, invalid) | No | - |
| `assignedUserId` | string | No | Assigned User Id |
| `description` | string | No | Appointment Description |
| `address` | string | No | Appointment Address |
| `ignoreDateRange` | boolean | No | If set to true, the minimum scheduling notice and date range would be ignored |
| `toNotify` | boolean | No | If set to false, the automations will not run |
| `ignoreFreeSlotValidation` | boolean | No | If true the time slot validation would be avoided for any appointment creation (even the ignoreDateRange) |
| `rrule` | string | No | RRULE as per the iCalendar (RFC 5545) specification for recurring events. DTSTART is not required, instance ids are calculated on the basis of startTime of the event. The rrule only be applied if ignoreFreeSlotValidation is true. |
| `calendarId` | string | No | Calendar Id |
| `startTime` | string | No | Start Time |
| `endTime` | string | No | End Time |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/events/appointments/{eventId}`

Get Appointment

Get appointment by ID

Operation ID: `get-appointment`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `eventId` | path | string | Yes | Event Id or Instance id. For recurring appointments send masterEventId to modify original series. |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/events`

Get Calendar Events

Get Calendar Events

Operation ID: `get-calendar-events`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location Id |
| `userId` | query | string | No | User Id - Owner of an appointment. Either of userId, groupId or calendarId is required |
| `calendarId` | query | string | No | Either of calendarId, userId or groupId is required |
| `groupId` | query | string | No | Either of groupId, calendarId or userId is required |
| `startTime` | query | string | Yes | Start Time (in millis) |
| `endTime` | query | string | Yes | End Time (in millis) |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/blocked-slots`

Get Blocked Slots

Get Blocked Slots

Operation ID: `get-blocked-slots`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location Id |
| `userId` | query | string | No | User Id - Owner of an appointment. Either of userId, groupId or calendarId is required |
| `calendarId` | query | string | No | Either of calendarId, userId or groupId is required |
| `groupId` | query | string | No | Either of groupId, calendarId or userId is required |
| `startTime` | query | string | Yes | Start Time (in millis) |
| `endTime` | query | string | Yes | End Time (in millis) |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/calendars/events/block-slots`

Create Block Slot

Create block slot

Operation ID: `create-block-slot`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `BlockSlotCreateRequestDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | Title |
| `calendarId` | string | Yes | Either calendarId or assignedUserId can be set, not both. |
| `assignedUserId` | string | No | Either calendarId or assignedUserId can be set, not both. |
| `locationId` | string | Yes | Location Id |
| `startTime` | string | No | Start Time |
| `endTime` | string | No | End Time |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/calendars/events/block-slots/{eventId}`

Update Block Slot

Update block slot by ID

Operation ID: `edit-block-slot`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `eventId` | path | string | Yes | Event Id or Instance id. For recurring appointments send masterEventId to modify original series. |

**Request Body (required):**

Content-Type: `application/json`

Schema: `BlockSlotEditRequestDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | Title |
| `calendarId` | string | Yes | Either calendarId or assignedUserId can be set, not both. |
| `assignedUserId` | string | No | Either calendarId or assignedUserId can be set, not both. |
| `locationId` | string | Yes | Location Id |
| `startTime` | string | No | Start Time |
| `endTime` | string | No | End Time |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/{calendarId}/free-slots`

Get Free Slots

Get free slots for a calendar between a date range. Optionally a consumer can also request free slots in a particular timezone and also for a particular user.

Operation ID: `get-slots`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `calendarId` | path | string | Yes | Calendar Id |
| `startDate` | query | number | Yes | Start Date (**⚠️ Important:** Date range cannot be more than 31 days) |
| `endDate` | query | number | Yes | End Date (**⚠️ Important:** Date range cannot be more than 31 days) |
| `timezone` | query | string | No | The timezone in which the free slots are returned |
| `userId` | query | string | No | The user for whom the free slots are returned |
| `userIds` | query | array | No | The users for whom the free slots are returned |

**Responses:**

- `200`: Availability map keyed by date (YYYY-MM-DD)
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/calendars/{calendarId}`

Update Calendar

Update calendar by ID.

Operation ID: `update-calendar`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `calendarId` | path | string | Yes | Calendar Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CalendarUpdateDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `notifications` | array<CalendarNotification> | No | 🚨 Deprecated! Please use 'Calendar Notifications APIs' instead. |
| `groupId` | string | No | Group Id |
| `teamMembers` | array<TeamMember> | No | Team members are required for calendars of type: Round Robin, Collective, Class, Service. Personal calendar must have exactly one team member. |
| `eventType` | string (enum: RoundRobin_OptimizeForAvailability, RoundRobin_OptimizeForEqualDistribution) | No | - |
| `name` | string | No | - |
| `description` | string | No | - |
| `slug` | string | No | - |
| `widgetSlug` | string | No | - |
| `widgetType` | string (enum: default, classic) | No | Calendar widget type. Choose "default" for "neo" and "classic" for "classic" layout. |
| `eventTitle` | string | No | - |
| `eventColor` | string | No | - |
| `locationConfigurations` | array<LocationConfiguration> | No | Meeting location configuration for event calendar |
| `meetingLocation` | string | No | 🚨 Deprecated! Use `locationConfigurations.location` or `teamMembers[].locationConfigurations.location` instead. |
| `slotDuration` | number | No | This controls the duration of the meeting |
| `slotDurationUnit` | string (enum: mins, hours) | No | Unit for slot duration. |
| `preBufferUnit` | string (enum: mins, hours) | No | Unit for pre-buffer. |
| `slotInterval` | number | No | Slot interval reflects the amount of time the between booking slots that will be shown in the calendar. |
| `slotIntervalUnit` | string (enum: mins, hours) | No | Unit for slot interval. |
| `slotBuffer` | number | No | Slot-Buffer is additional time that can be added after an appointment, allowing for extra time to wrap up |
| `preBuffer` | number | No | Pre-Buffer is additional time that can be added before an appointment, allowing for extra time to get ready |
| `appoinmentPerSlot` | number | No | - |
| `appoinmentPerDay` | number | No | Number of appointments that can be booked for a given day |
| `allowBookingAfter` | number | No | Minimum scheduling notice for events |
| `allowBookingAfterUnit` | string (enum: hours, days, weeks, months) | No | Unit for minimum scheduling notice |
| `allowBookingFor` | number | No | Minimum number of days/weeks/months for which to allow booking events |
| `allowBookingForUnit` | string (enum: days, weeks, months) | No | Unit for controlling the duration for which booking would be allowed for |
| `openHours` | array<OpenHour> | No | - |
| `enableRecurring` | boolean | No | Enable recurring appointments for the calendars. Please note that only one member should be added in the calendar to enable this |
| `recurring` | Recurring | No | - |
| `formId` | string | No | - |
| `stickyContact` | boolean | No | - |
| `isLivePaymentMode` | boolean | No | - |
| `autoConfirm` | boolean | No | - |
| `shouldSendAlertEmailsToAssignedMember` | boolean | No | - |
| `alertEmail` | string | No | - |
| `googleInvitationEmails` | boolean | No | - |
| `allowReschedule` | boolean | No | - |
| `allowCancellation` | boolean | No | - |
| `shouldAssignContactToTeamMember` | boolean | No | - |
| `shouldSkipAssigningContactForExisting` | boolean | No | - |
| `notes` | string | No | - |
| `pixelId` | string | No | - |
| `formSubmitType` | string (enum: RedirectURL, ThankYouMessage) | No | - |
| `formSubmitRedirectURL` | string | No | - |
| `formSubmitThanksMessage` | string | No | - |
| `availabilityType` | number (enum: 0, 1) | No | Determines which availability type to consider: - **1**: Only custom availabilities will be used. - **0**: Only open hours will be used. - **null**: Both the custom availabilities and open hours will be considered. |
| `availabilities` | array<UpdateAvailability> | No | This is only to set the custom availability. For standard availability, use the openHours property |
| `guestType` | string (enum: count_only, collect_detail) | No | - |
| `consentLabel` | string | No | - |
| `calendarCoverImage` | string | No | - |
| `lookBusyConfig` | object | No | Look Busy Configuration |
| `isActive` | boolean | No | - |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/{calendarId}`

Get Calendar

Get calendar by ID

Operation ID: `get-calendar`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `calendarId` | path | string | Yes | Calendar Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/calendars/{calendarId}`

Delete Calendar

Delete calendar by ID

Operation ID: `delete-calendar`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `calendarId` | path | string | Yes | Calendar Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/calendars/events/{eventId}`

Delete Event

Delete event by ID

Operation ID: `delete-event`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `eventId` | path | string | Yes | Event Id or Instance id. For recurring appointments send masterEventId to modify original series. |

**Request Body (required):**

Content-Type: `application/json`

Schema: `DeleteAppointmentSchema`

| Property | Type | Required | Description |
|----------|------|----------|-------------|


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/appointments/{appointmentId}/notes`

Get Notes

Get Appointment Notes

Operation ID: `get-appointment-notes`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `limit` | query | number | Yes | Limit of notes to fetch |
| `offset` | query | number | Yes | Offset of notes to fetch |
| `appointmentId` | path | string | Yes | Appointment ID |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/calendars/appointments/{appointmentId}/notes`

Create Note

Create Note

Operation ID: `create-appointment-note`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `appointmentId` | path | string | Yes | Appointment ID |

**Request Body (required):**

Content-Type: `application/json`

Schema: `NotesDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `userId` | string | No | - |
| `body` | string | Yes | Note body |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/calendars/appointments/{appointmentId}/notes/{noteId}`

Update Note

Update Note

Operation ID: `update-appointment-note`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `appointmentId` | path | string | Yes | Appointment ID |

**Request Body (required):**

Content-Type: `application/json`

Schema: `NotesDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `userId` | string | No | - |
| `body` | string | Yes | Note body |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/calendars/appointments/{appointmentId}/notes/{noteId}`

Delete Note

Delete Note

Operation ID: `delete-appointment-note`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `appointmentId` | path | string | Yes | Appointment ID |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/resources/{resourceType}/{id}`

Get Calendar Resource

Get calendar resource by ID

Operation ID: `get-calendar-resource`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `resourceType` | path | string | Yes | Calendar Resource Type |
| `id` | path | string | Yes | Calendar Resource ID |

**Responses:**

- `200`: Calendar resource fetched
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/calendars/resources/{resourceType}/{id}`

Update Calendar Resource

Update calendar resource by ID

Operation ID: `update-calendar-resource`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `resourceType` | path | string | Yes | Calendar Resource Type |
| `id` | path | string | Yes | Calendar Resource ID |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateCalendarResourceDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | No | - |
| `name` | string | No | - |
| `description` | string | No | - |
| `quantity` | number | No | Quantity of the equipment. |
| `outOfService` | number | No | Quantity of the out of service equipment. |
| `capacity` | number | No | Capacity of the room. |
| `calendarIds` | array<string> | No | Service calendar IDs to be mapped with the resource.      One equipment can only be mapped with one service calendar.      One room can be mapped with multiple service calendars. |
| `isActive` | boolean | No | - |


**Responses:**

- `200`: Calendar resource updated
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/calendars/resources/{resourceType}/{id}`

Delete Calendar Resource

Delete calendar resource by ID

Operation ID: `delete-calendar-resource`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `resourceType` | path | string | Yes | Calendar Resource Type |
| `id` | path | string | Yes | Calendar Resource ID |

**Responses:**

- `200`: Calendar resource deleted
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/resources/{resourceType}`

List Calendar Resources

List calendar resources by resource type and location ID

Operation ID: `fetch-calendar-resources`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `resourceType` | path | string | Yes | Calendar Resource Type |
| `locationId` | query | string | Yes | - |
| `limit` | query | number | Yes | - |
| `skip` | query | number | Yes | - |

**Responses:**

- `200`: Calendar resources listed
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/calendars/resources/{resourceType}`

Create Calendar Resource

Create calendar resource by resource type

Operation ID: `create-calendar-resource`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `resourceType` | path | string | Yes | Calendar Resource Type |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateCalendarResourceDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `name` | string | Yes | - |
| `description` | string | Yes | - |
| `quantity` | number | Yes | Quantity of the equipment. |
| `outOfService` | number | Yes | Quantity of the out of service equipment. |
| `capacity` | number | Yes | Capacity of the room. |
| `calendarIds` | array<string> | Yes | Service calendar IDs to be mapped with the resource.      One equipment can only be mapped with one service calendar.      One room can be mapped with multiple service calendars. |


**Responses:**

- `201`: Calendar resource created
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/{calendarId}/notifications`

Get notifications

Get calendar notifications based on query

Operation ID: `get-event-notification`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `calendarId` | path | string | Yes | - |
| `isActive` | query | boolean | No | - |
| `deleted` | query | boolean | No | - |
| `limit` | query | number | No | Number of records to return |
| `skip` | query | number | No | Number of records to skip |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/calendars/{calendarId}/notifications`

Create notification

Create Calendar notifications, either one or multiple. All notification settings must be for single calendar only

Operation ID: `create-event-notification`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `calendarId` | path | string | Yes | - |

**Request Body (required):**

Content-Type: `application/json`


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/{calendarId}/notifications/{notificationId}`

Get notification

Find Event notification by notificationId

Operation ID: `find-event-notification`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `calendarId` | path | string | Yes | - |
| `notificationId` | path | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### PUT `/calendars/{calendarId}/notifications/{notificationId}`

Update notification

Update Event notification by id

Operation ID: `update-event-notification`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `calendarId` | path | string | Yes | - |
| `notificationId` | path | string | Yes | - |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateCalendarNotificationsDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `receiverType` | string (enum: contact, guest, assignedUser, emails, phoneNumbers) | No | Notification recipient type |
| `additionalEmailIds` | array<string> | No | Additional email addresses to receive notifications. |
| `additionalPhoneNumbers` | array<string> | No | Additional phone numbers to receive notifications. |
| `selectedUsers` | array<string> | No | selected user for in-App notification |
| `channel` | string (enum: email, inApp, sms, whatsapp) | No | Notification channel |
| `notificationType` | string (enum: booked, confirmation, cancellation, reminder, followup, reschedule) | No | Notification type |
| `isActive` | boolean | No | Is the notification active |
| `deleted` | boolean | No | Marks the notification as deleted (soft delete) |
| `templateId` | string | No | Template ID for email notification |
| `body` | string | No | Body  for email notification. Not necessary for in-App notification |
| `subject` | string | No | Subject  for email notification. Not necessary for in-App notification |
| `afterTime` | array<SchedulesDTO> | No | Specifies the time after which the follow-up notification should be sent. This is not required for other notification types. |
| `beforeTime` | array<SchedulesDTO> | No | Specifies the time before which the reminder notification should be sent. This is not required for other notification types. |
| `fromAddress` | string | No | From address for email notification |
| `fromNumber` | string | No | from number for sms notification |
| `fromName` | string | No | From name for email/sms notification |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### DELETE `/calendars/{calendarId}/notifications/{notificationId}`

Delete Notification

Delete notification

Operation ID: `delete-event-notification`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `calendarId` | path | string | Yes | - |
| `notificationId` | path | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/calendars/`

Get Calendars

Get all calendars in a location.

Operation ID: `get-calendars`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location Id |
| `groupId` | query | string | No | Group Id |
| `showDrafted` | query | boolean | No | Show drafted |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/calendars/`

Create Calendar

Create calendar in a location.

Operation ID: `create-calendar`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CalendarCreateDTO`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `isActive` | boolean | No | Should the created calendar be active or draft |
| `notifications` | array<CalendarNotification> | No | 🚨 Deprecated! Please use 'Calendar Notifications APIs' instead. |
| `locationId` | string | Yes | - |
| `groupId` | string | No | Group Id |
| `teamMembers` | array<TeamMember> | No | Team members are required for calendars of type: Round Robin, Collective, Class, Service. Personal calendar must have exactly one team member. |
| `eventType` | string (enum: RoundRobin_OptimizeForAvailability, RoundRobin_OptimizeForEqualDistribution) | No | - |
| `name` | string | Yes | - |
| `description` | string | No | - |
| `slug` | string | No | - |
| `widgetSlug` | string | No | - |
| `calendarType` | string (enum: round_robin, event, class_booking, collective, service_booking, personal) | No | - |
| `widgetType` | string (enum: default, classic) | No | Calendar widget type. Choose "default" for "neo" and "classic" for "classic" layout. |
| `eventTitle` | string | No | - |
| `eventColor` | string | No | - |
| `meetingLocation` | string | No | 🚨 Deprecated! Use `locationConfigurations.location` or `teamMembers[].locationConfigurations.location` instead. |
| `locationConfigurations` | array<LocationConfiguration> | No | Meeting location configuration for event calendar |
| `slotDuration` | number | No | This controls the duration of the meeting |
| `slotDurationUnit` | string (enum: mins, hours) | No | Unit for slot duration. |
| `slotInterval` | number | No | Slot interval reflects the amount of time the between booking slots that will be shown in the calendar. |
| `slotIntervalUnit` | string (enum: mins, hours) | No | Unit for slot interval. |
| `slotBuffer` | number | No | Slot-Buffer is additional time that can be added after an appointment, allowing for extra time to wrap up |
| `slotBufferUnit` | string (enum: mins, hours) | No | Unit for slot buffer. |
| `preBuffer` | number | No | Pre-Buffer is additional time that can be added before an appointment, allowing for extra time to get ready |
| `preBufferUnit` | string (enum: mins, hours) | No | Unit for pre-buffer. |
| `appoinmentPerSlot` | number | No | Maximum bookings per slot (per user). Maximum seats per slot in case of Class Booking Calendar. |
| `appoinmentPerDay` | number | No | Number of appointments that can be booked for a given day |
| `allowBookingAfter` | number | No | Minimum scheduling notice for events |
| `allowBookingAfterUnit` | string (enum: hours, days, weeks, months) | No | Unit for minimum scheduling notice |
| `allowBookingFor` | number | No | Minimum number of days/weeks/months for which to allow booking events |
| `allowBookingForUnit` | string (enum: days, weeks, months) | No | Unit for controlling the duration for which booking would be allowed for |
| `openHours` | array<OpenHour> | No | This is only to set the standard availability. For custom availability, use the availabilities property |
| `enableRecurring` | boolean | No | Enable recurring appointments for the calendars. Please note that only one member should be added in the calendar to enable this |
| `recurring` | Recurring | No | - |
| `formId` | string | No | - |
| `stickyContact` | boolean | No | - |
| `isLivePaymentMode` | boolean | No | - |
| `autoConfirm` | boolean | No | - |
| `shouldSendAlertEmailsToAssignedMember` | boolean | No | - |
| `alertEmail` | string | No | - |
| `googleInvitationEmails` | boolean | No | - |
| `allowReschedule` | boolean | No | - |
| `allowCancellation` | boolean | No | - |
| `shouldAssignContactToTeamMember` | boolean | No | - |
| `shouldSkipAssigningContactForExisting` | boolean | No | - |
| `notes` | string | No | - |
| `pixelId` | string | No | - |
| `formSubmitType` | string (enum: RedirectURL, ThankYouMessage) | No | - |
| `formSubmitRedirectURL` | string | No | - |
| `formSubmitThanksMessage` | string | No | - |
| `availabilityType` | number (enum: 0, 1) | No | Determines which availability type to consider: - **1**: Only custom availabilities will be used. - **0**: Only open hours will be used. - **null**: Both custom availabilities and open hours will be considered. |
| `availabilities` | array<Availability> | No | This is only to set the custom availability. For standard availability, use the openHours property |
| `guestType` | string (enum: count_only, collect_detail) | No | - |
| `consentLabel` | string | No | - |
| `calendarCoverImage` | string | No | - |
| `lookBusyConfig` | object | No | Look Busy Configuration |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized

---

## Schemas

### GroupDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `name` | string | Yes | - |
| `description` | string | Yes | - |
| `slug` | string | Yes | - |
| `isActive` | boolean | No | - |
| `id` | string | No | - |


### AllGroupsSuccessfulResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `groups` | array<GroupDTO> | No | - |


### ValidateGroupSlugPostBody

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location Id |
| `slug` | string | Yes | Slug |


### ValidateGroupSlugSuccessResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `available` | boolean | Yes | - |


### GroupCreateDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `name` | string | Yes | - |
| `description` | string | Yes | - |
| `slug` | string | Yes | - |
| `isActive` | boolean | No | - |


### GroupCreateSuccessfulResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `group` | GroupDTO | No | - |


### GroupSuccessfulResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | No | Success |


### GroupStatusUpdateParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `isActive` | boolean | Yes | Is Active? |


### GroupUpdateDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | - |
| `description` | string | Yes | - |
| `slug` | string | Yes | - |


### AppointmentCreateSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | Title |
| `meetingLocationType` | string (enum: custom, zoom, gmeet, phone, address, ms_teams, google) | No | Meeting location type.  - If `address` is provided in the request body, the `meetingLocationType` defaults to **custom**. |
| `meetingLocationId` | string | No | The unique identifier for the meeting location. - This value can be found in `calendar.locationConfigurations`or `calendar.teamMembers[].locationConfigurations` |
| `overrideLocationConfig` | boolean | No | Flag to override location config - **false** - If only `meetingLocationId` is provided - **true** - If only `meetingLocationType` is provided  |
| `appointmentStatus` | string (enum: new, confirmed, cancelled, showed, noshow, invalid) | No | - |
| `assignedUserId` | string | No | Assigned User Id |
| `description` | string | No | Appointment Description |
| `address` | string | No | Appointment Address |
| `ignoreDateRange` | boolean | No | If set to true, the minimum scheduling notice and date range would be ignored |
| `toNotify` | boolean | No | If set to false, the automations will not run |
| `ignoreFreeSlotValidation` | boolean | No | If true the time slot validation would be avoided for any appointment creation (even the ignoreDateRange) |
| `rrule` | string | No | RRULE as per the iCalendar (RFC 5545) specification for recurring events. DTSTART is not required, instance ids are calculated on the basis of startTime of the event. The rrule only be applied if ignoreFreeSlotValidation is true. |
| `calendarId` | string | Yes | Calendar Id |
| `locationId` | string | Yes | Location Id |
| `contactId` | string | Yes | Contact Id |
| `startTime` | string | Yes | Start Time |
| `endTime` | string | No | End Time |


### AppointmentSchemaResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `calendarId` | string | Yes | Calendar Id |
| `locationId` | string | Yes | Location Id |
| `contactId` | string | Yes | Contact Id |
| `startTime` | string | No | Start Time |
| `endTime` | string | No | End Time |
| `title` | string | No | Title |
| `meetingLocationType` | string | No | Meeting Location Type |
| `appointmentStatus` | string (enum: new, confirmed, cancelled, showed, noshow, invalid, active, completed) | No | - |
| `assignedUserId` | string | No | Assigned User Id |
| `address` | string | No | Appointment Address |
| `isRecurring` | boolean | No | true if the event is recurring otherwise false |
| `rrule` | string | No | RRULE as per the iCalendar (RFC 5545) specification for recurring events |
| `id` | string | Yes | Id |


### AppointmentEditSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | Title |
| `meetingLocationType` | string (enum: custom, zoom, gmeet, phone, address, ms_teams, google) | No | Meeting location type.  - If `address` is provided in the request body, the `meetingLocationType` defaults to **custom**. |
| `meetingLocationId` | string | No | The unique identifier for the meeting location. - This value can be found in `calendar.locationConfigurations`or `calendar.teamMembers[].locationConfigurations` |
| `overrideLocationConfig` | boolean | No | Flag to override location config - **false** - If only `meetingLocationId` is provided - **true** - If only `meetingLocationType` is provided  |
| `appointmentStatus` | string (enum: new, confirmed, cancelled, showed, noshow, invalid) | No | - |
| `assignedUserId` | string | No | Assigned User Id |
| `description` | string | No | Appointment Description |
| `address` | string | No | Appointment Address |
| `ignoreDateRange` | boolean | No | If set to true, the minimum scheduling notice and date range would be ignored |
| `toNotify` | boolean | No | If set to false, the automations will not run |
| `ignoreFreeSlotValidation` | boolean | No | If true the time slot validation would be avoided for any appointment creation (even the ignoreDateRange) |
| `rrule` | string | No | RRULE as per the iCalendar (RFC 5545) specification for recurring events. DTSTART is not required, instance ids are calculated on the basis of startTime of the event. The rrule only be applied if ignoreFreeSlotValidation is true. |
| `calendarId` | string | No | Calendar Id |
| `startTime` | string | No | Start Time |
| `endTime` | string | No | End Time |


### CreatedOrUpdatedBy

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `userId` | string | No | The ID of the user who created or updated the appointment |
| `source` | string | Yes | The source of the appointment |


### CalendarEventDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Event Id or Instance id for a recurring event |
| `address` | string | No | Calendar Event address |
| `title` | string | Yes | Calendar Event title |
| `calendarId` | string | Yes | Calendar ID |
| `locationId` | string | Yes | Location ID |
| `contactId` | string | Yes | Contact ID |
| `groupId` | string | Yes | Group ID |
| `appointmentStatus` | string | Yes | Appointment Status |
| `assignedUserId` | string | Yes | AssignedUser - the primary owner of an appointment |
| `users` | array<string> | Yes | Users - the secondary owners of an appointment. |
| `notes` | string | No | Notes |
| `description` | string | No | Description |
| `isRecurring` | boolean | No | true if the event is recurring otherwise false |
| `rrule` | string | No | RRULE as per the iCalendar (RFC 5545) specification for recurring events. DTSTART is not required, instance ids are calculated on the basis of startTime of the event. |
| `startTime` | object | Yes | Start Time |
| `endTime` | object | Yes | End Time |
| `dateAdded` | object | Yes | Date Added |
| `dateUpdated` | object | Yes | Date Updated |
| `assignedResources` | array<string> | No | Ids of associated resources rooms and/or equipments |
| `createdBy` | object | No | Appointment booked by metadata |
| `masterEventId` | string | No | Master event id for a recurring instance |


### GetCalendarEventsSuccessfulResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `events` | array<CalendarEventDTO> | No | - |


### BlockSlotCreateRequestDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | Title |
| `calendarId` | string | Yes | Either calendarId or assignedUserId can be set, not both. |
| `assignedUserId` | string | No | Either calendarId or assignedUserId can be set, not both. |
| `locationId` | string | Yes | Location Id |
| `startTime` | string | No | Start Time |
| `endTime` | string | No | End Time |


### BlockedSlotSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | Id |
| `locationId` | string | Yes | Location Id |
| `title` | string | Yes | Title |
| `startTime` | object | Yes | Start Time |
| `endTime` | object | Yes | End Time |
| `calendarId` | string | No | Calendar id |
| `assignedUserId` | string | No | Assigned User Id |


### BlockSlotEditRequestDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | Title |
| `calendarId` | string | Yes | Either calendarId or assignedUserId can be set, not both. |
| `assignedUserId` | string | No | Either calendarId or assignedUserId can be set, not both. |
| `locationId` | string | Yes | Location Id |
| `startTime` | string | No | Start Time |
| `endTime` | string | No | End Time |


### SlotsSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `slots` | array<string> | Yes | - |


### CalendarNotification

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: email) | No | Calendar Notification |
| `shouldSendToContact` | boolean | Yes | - |
| `shouldSendToGuest` | boolean | Yes | - |
| `shouldSendToUser` | boolean | Yes | - |
| `shouldSendToSelectedUsers` | boolean | Yes | - |
| `selectedUsers` | string | Yes | Comma separated emails |


### LocationConfiguration

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `kind` | string (enum: custom, zoom_conference, google_conference, inbound_call, outbound_call, physical, booker, ms_teams_conference) | Yes | Type of meeting location. zoom_conference/google_conference/ms_teams_conference is not supported in event calendar type |
| `location` | string | No | Address for meeting location. Not applicable on "zoom_conference", "google_conference" and "ms_teams_conference" kind |


### TeamMember

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `userId` | string | Yes | - |
| `priority` | number (enum: 0, 0.5, 1) | No | - |
| `meetingLocationType` | string (enum: custom, zoom, gmeet, phone, address, teams, booker) | No | 🚨 Deprecated! Use `locationConfigurations.kind` instead. |
| `meetingLocation` | string | No | 🚨 Deprecated! Use `locationConfigurations.location` instead. |
| `isPrimary` | boolean | No | Marks a user as primary. This property is required in case of collective booking calendars. Only one user can be primary. |
| `locationConfigurations` | array<LocationConfiguration> | No | Meeting location configuration for event calendar. - *Multiple locations are allowed only when one team member is selected.* - *For **Class booking** and **Collective** calendars, only one location configuration is allowed for each team member.* |


### Hour

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `openHour` | number | Yes | - |
| `openMinute` | number | Yes | - |
| `closeHour` | number | Yes | - |
| `closeMinute` | number | Yes | - |


### OpenHour

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `daysOfTheWeek` | array<number> | Yes | - |
| `hours` | array<Hour> | Yes | - |


### Recurring

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `freq` | string (enum: DAILY, WEEKLY, MONTHLY) | No | - |
| `count` | number | No | Number of recurrences |
| `bookingOption` | string (enum: skip, continue, book_next) | No | This setting contols what to do incase a recurring slot is unavailable |
| `bookingOverlapDefaultStatus` | string (enum: confirmed, new) | No | This setting contols what to do incase a recurring slot is unavailable |


### Availability

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `date` | string | Yes | Formulate the date string in the format of `<YYYY-MM-DD in local timezone>T00:00:00.000Z`. |
| `hours` | array<Hour> | Yes | - |
| `deleted` | boolean | No | - |


### LookBusyConfiguration

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `enabled` | boolean | Yes | Apply Look Busy |
| `LookBusyPercentage` | number | Yes | Percentage of slots that will be hidden |


### CalendarCreateDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `isActive` | boolean | No | Should the created calendar be active or draft |
| `notifications` | array<CalendarNotification> | No | 🚨 Deprecated! Please use 'Calendar Notifications APIs' instead. |
| `locationId` | string | Yes | - |
| `groupId` | string | No | Group Id |
| `teamMembers` | array<TeamMember> | No | Team members are required for calendars of type: Round Robin, Collective, Class, Service. Personal calendar must have exactly one team member. |
| `eventType` | string (enum: RoundRobin_OptimizeForAvailability, RoundRobin_OptimizeForEqualDistribution) | No | - |
| `name` | string | Yes | - |
| `description` | string | No | - |
| `slug` | string | No | - |
| `widgetSlug` | string | No | - |
| `calendarType` | string (enum: round_robin, event, class_booking, collective, service_booking, personal) | No | - |
| `widgetType` | string (enum: default, classic) | No | Calendar widget type. Choose "default" for "neo" and "classic" for "classic" layout. |
| `eventTitle` | string | No | - |
| `eventColor` | string | No | - |
| `meetingLocation` | string | No | 🚨 Deprecated! Use `locationConfigurations.location` or `teamMembers[].locationConfigurations.location` instead. |
| `locationConfigurations` | array<LocationConfiguration> | No | Meeting location configuration for event calendar |
| `slotDuration` | number | No | This controls the duration of the meeting |
| `slotDurationUnit` | string (enum: mins, hours) | No | Unit for slot duration. |
| `slotInterval` | number | No | Slot interval reflects the amount of time the between booking slots that will be shown in the calendar. |
| `slotIntervalUnit` | string (enum: mins, hours) | No | Unit for slot interval. |
| `slotBuffer` | number | No | Slot-Buffer is additional time that can be added after an appointment, allowing for extra time to wrap up |
| `slotBufferUnit` | string (enum: mins, hours) | No | Unit for slot buffer. |
| `preBuffer` | number | No | Pre-Buffer is additional time that can be added before an appointment, allowing for extra time to get ready |
| `preBufferUnit` | string (enum: mins, hours) | No | Unit for pre-buffer. |
| `appoinmentPerSlot` | number | No | Maximum bookings per slot (per user). Maximum seats per slot in case of Class Booking Calendar. |
| `appoinmentPerDay` | number | No | Number of appointments that can be booked for a given day |
| `allowBookingAfter` | number | No | Minimum scheduling notice for events |
| `allowBookingAfterUnit` | string (enum: hours, days, weeks, months) | No | Unit for minimum scheduling notice |
| `allowBookingFor` | number | No | Minimum number of days/weeks/months for which to allow booking events |
| `allowBookingForUnit` | string (enum: days, weeks, months) | No | Unit for controlling the duration for which booking would be allowed for |
| `openHours` | array<OpenHour> | No | This is only to set the standard availability. For custom availability, use the availabilities property |
| `enableRecurring` | boolean | No | Enable recurring appointments for the calendars. Please note that only one member should be added in the calendar to enable this |
| `recurring` | Recurring | No | - |
| `formId` | string | No | - |
| `stickyContact` | boolean | No | - |
| `isLivePaymentMode` | boolean | No | - |
| `autoConfirm` | boolean | No | - |
| `shouldSendAlertEmailsToAssignedMember` | boolean | No | - |
| `alertEmail` | string | No | - |
| `googleInvitationEmails` | boolean | No | - |
| `allowReschedule` | boolean | No | - |
| `allowCancellation` | boolean | No | - |
| `shouldAssignContactToTeamMember` | boolean | No | - |
| `shouldSkipAssigningContactForExisting` | boolean | No | - |
| `notes` | string | No | - |
| `pixelId` | string | No | - |
| `formSubmitType` | string (enum: RedirectURL, ThankYouMessage) | No | - |
| `formSubmitRedirectURL` | string | No | - |
| `formSubmitThanksMessage` | string | No | - |
| `availabilityType` | number (enum: 0, 1) | No | Determines which availability type to consider: - **1**: Only custom availabilities will be used. - **0**: Only open hours will be used. - **null**: Both custom availabilities and open hours will be considered. |
| `availabilities` | array<Availability> | No | This is only to set the custom availability. For standard availability, use the openHours property |
| `guestType` | string (enum: count_only, collect_detail) | No | - |
| `consentLabel` | string | No | - |
| `calendarCoverImage` | string | No | - |
| `lookBusyConfig` | object | No | Look Busy Configuration |


### LocationConfigurationResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `kind` | string (enum: custom, zoom_conference, google_conference, inbound_call, outbound_call, physical, booker, ms_teams_conference) | Yes | Type of meeting location. zoom_conference/google_conference/ms_teams_conference is not supported in event calendar type |
| `location` | string | No | Address for meeting location. Not applicable on "zoom_conference", "google_conference" and "ms_teams_conference" kind |
| `meetingId` | string | No | Unique ID used to select a specific meeting location |


### TeamMemberResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `userId` | string | Yes | - |
| `priority` | number (enum: 0, 0.5, 1) | No | - |
| `meetingLocationType` | string (enum: custom, zoom, gmeet, phone, address, teams, booker) | No | 🚨 Deprecated! Use `locationConfigurations.kind` instead. |
| `meetingLocation` | string | No | 🚨 Deprecated! Use `locationConfigurations.location` instead. |
| `isPrimary` | boolean | No | Marks a user as primary. This property is required in case of collective booking calendars. Only one user can be primary. |
| `locationConfigurations` | array<LocationConfigurationResponse> | No | Meeting location configurations |


### CalendarDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `isActive` | boolean | No | Should the created calendar be active or draft |
| `notifications` | array<CalendarNotification> | No | 🚨 Deprecated! Please use 'Calendar Notifications APIs' instead. |
| `locationId` | string | Yes | - |
| `groupId` | string | No | Group Id |
| `teamMembers` | array<TeamMemberResponse> | No | Team members are for calendars of type: Round Robin, Collective, Class, Service. Personal calendar must have exactly one team member. |
| `eventType` | string (enum: RoundRobin_OptimizeForAvailability, RoundRobin_OptimizeForEqualDistribution) | No | - |
| `name` | string | Yes | - |
| `description` | string | No | - |
| `slug` | string | No | - |
| `widgetSlug` | string | No | - |
| `calendarType` | string (enum: round_robin, event, class_booking, collective, service_booking, personal) | No | - |
| `widgetType` | string (enum: default, classic) | No | Calendar widget type. Choose "default" for "neo" and "classic" for "classic" layout. |
| `eventTitle` | string | No | - |
| `eventColor` | string | No | - |
| `meetingLocation` | string | No | 🚨 Deprecated! Use `locationConfigurations.location` or `teamMembers[].locationConfigurations.location` instead. |
| `locationConfigurations` | array<LocationConfigurationResponse> | No | Meeting location configuration for event calendar |
| `slotDuration` | number | No | This controls the duration of the meeting |
| `slotDurationUnit` | string (enum: mins, hours) | No | Unit for slot duration. |
| `slotInterval` | number | No | Slot interval reflects the amount of time the between booking slots that will be shown in the calendar. |
| `slotIntervalUnit` | string (enum: mins, hours) | No | Unit for slot interval. |
| `slotBuffer` | number | No | Slot-Buffer is additional time that can be added after an appointment, allowing for extra time to wrap up |
| `slotBufferUnit` | string (enum: mins, hours) | No | Unit for slot buffer. |
| `preBuffer` | number | No | Pre-Buffer is additional time that can be added before an appointment, allowing for extra time to get ready |
| `preBufferUnit` | string (enum: mins, hours) | No | Unit for pre-buffer. |
| `appoinmentPerSlot` | number | No | Maximum bookings per slot (per user). Maximum seats per slot in case of Class Booking Calendar. |
| `appoinmentPerDay` | number | No | Number of appointments that can be booked for a given day |
| `allowBookingAfter` | number | No | Minimum scheduling notice for events |
| `allowBookingAfterUnit` | string (enum: hours, days, weeks, months) | No | Unit for minimum scheduling notice |
| `allowBookingFor` | number | No | Minimum number of days/weeks/months for which to allow booking events |
| `allowBookingForUnit` | string (enum: days, weeks, months) | No | Unit for controlling the duration for which booking would be allowed for |
| `openHours` | array<OpenHour> | No | This is only to set the standard availability. For custom availability, use the availabilities property |
| `enableRecurring` | boolean | No | Enable recurring appointments for the calendars. Please note that only one member should be added in the calendar to enable this |
| `recurring` | Recurring | No | - |
| `formId` | string | No | - |
| `stickyContact` | boolean | No | - |
| `isLivePaymentMode` | boolean | No | - |
| `autoConfirm` | boolean | No | - |
| `shouldSendAlertEmailsToAssignedMember` | boolean | No | - |
| `alertEmail` | string | No | - |
| `googleInvitationEmails` | boolean | No | - |
| `allowReschedule` | boolean | No | - |
| `allowCancellation` | boolean | No | - |
| `shouldAssignContactToTeamMember` | boolean | No | - |
| `shouldSkipAssigningContactForExisting` | boolean | No | - |
| `notes` | string | No | - |
| `pixelId` | string | No | - |
| `formSubmitType` | string (enum: RedirectURL, ThankYouMessage) | No | - |
| `formSubmitRedirectURL` | string | No | - |
| `formSubmitThanksMessage` | string | No | - |
| `availabilityType` | number (enum: 0, 1) | No | Determines which availability type to consider: - **1**: Only custom availabilities will be used. - **0**: Only open hours will be used. - **null**: Both custom availabilities and open hours will be considered. |
| `availabilities` | array<Availability> | No | This is only to set the custom availability. For standard availability, use the openHours property |
| `guestType` | string (enum: count_only, collect_detail) | No | - |
| `consentLabel` | string | No | - |
| `calendarCoverImage` | string | No | - |
| `lookBusyConfig` | object | No | Look Busy Configuration |
| `id` | string | Yes | - |


### CalendarsGetSuccessfulResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `calendars` | array<CalendarDTO> | No | - |


### CalendarByIdSuccessfulResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `calendar` | CalendarDTO | Yes | - |


### UpdateAvailability

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `date` | string | Yes | Formulate the date string in the format of `<YYYY-MM-DD in local timezone>T00:00:00.000Z`. |
| `hours` | array<Hour> | Yes | - |
| `deleted` | boolean | No | - |
| `id` | string | No | The ID of the custom availability object. It is required while updating or deleting the existing custom date availability |


### CalendarUpdateDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `notifications` | array<CalendarNotification> | No | 🚨 Deprecated! Please use 'Calendar Notifications APIs' instead. |
| `groupId` | string | No | Group Id |
| `teamMembers` | array<TeamMember> | No | Team members are required for calendars of type: Round Robin, Collective, Class, Service. Personal calendar must have exactly one team member. |
| `eventType` | string (enum: RoundRobin_OptimizeForAvailability, RoundRobin_OptimizeForEqualDistribution) | No | - |
| `name` | string | No | - |
| `description` | string | No | - |
| `slug` | string | No | - |
| `widgetSlug` | string | No | - |
| `widgetType` | string (enum: default, classic) | No | Calendar widget type. Choose "default" for "neo" and "classic" for "classic" layout. |
| `eventTitle` | string | No | - |
| `eventColor` | string | No | - |
| `locationConfigurations` | array<LocationConfiguration> | No | Meeting location configuration for event calendar |
| `meetingLocation` | string | No | 🚨 Deprecated! Use `locationConfigurations.location` or `teamMembers[].locationConfigurations.location` instead. |
| `slotDuration` | number | No | This controls the duration of the meeting |
| `slotDurationUnit` | string (enum: mins, hours) | No | Unit for slot duration. |
| `preBufferUnit` | string (enum: mins, hours) | No | Unit for pre-buffer. |
| `slotInterval` | number | No | Slot interval reflects the amount of time the between booking slots that will be shown in the calendar. |
| `slotIntervalUnit` | string (enum: mins, hours) | No | Unit for slot interval. |
| `slotBuffer` | number | No | Slot-Buffer is additional time that can be added after an appointment, allowing for extra time to wrap up |
| `preBuffer` | number | No | Pre-Buffer is additional time that can be added before an appointment, allowing for extra time to get ready |
| `appoinmentPerSlot` | number | No | - |
| `appoinmentPerDay` | number | No | Number of appointments that can be booked for a given day |
| `allowBookingAfter` | number | No | Minimum scheduling notice for events |
| `allowBookingAfterUnit` | string (enum: hours, days, weeks, months) | No | Unit for minimum scheduling notice |
| `allowBookingFor` | number | No | Minimum number of days/weeks/months for which to allow booking events |
| `allowBookingForUnit` | string (enum: days, weeks, months) | No | Unit for controlling the duration for which booking would be allowed for |
| `openHours` | array<OpenHour> | No | - |
| `enableRecurring` | boolean | No | Enable recurring appointments for the calendars. Please note that only one member should be added in the calendar to enable this |
| `recurring` | Recurring | No | - |
| `formId` | string | No | - |
| `stickyContact` | boolean | No | - |
| `isLivePaymentMode` | boolean | No | - |
| `autoConfirm` | boolean | No | - |
| `shouldSendAlertEmailsToAssignedMember` | boolean | No | - |
| `alertEmail` | string | No | - |
| `googleInvitationEmails` | boolean | No | - |
| `allowReschedule` | boolean | No | - |
| `allowCancellation` | boolean | No | - |
| `shouldAssignContactToTeamMember` | boolean | No | - |
| `shouldSkipAssigningContactForExisting` | boolean | No | - |
| `notes` | string | No | - |
| `pixelId` | string | No | - |
| `formSubmitType` | string (enum: RedirectURL, ThankYouMessage) | No | - |
| `formSubmitRedirectURL` | string | No | - |
| `formSubmitThanksMessage` | string | No | - |
| `availabilityType` | number (enum: 0, 1) | No | Determines which availability type to consider: - **1**: Only custom availabilities will be used. - **0**: Only open hours will be used. - **null**: Both the custom availabilities and open hours will be considered. |
| `availabilities` | array<UpdateAvailability> | No | This is only to set the custom availability. For standard availability, use the openHours property |
| `guestType` | string (enum: count_only, collect_detail) | No | - |
| `consentLabel` | string | No | - |
| `calendarCoverImage` | string | No | - |
| `lookBusyConfig` | object | No | Look Busy Configuration |
| `isActive` | boolean | No | - |


### CalendarDeleteSuccessfulResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Success |


### GetCalendarEventSuccessfulResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `event` | CalendarEventDTO | No | - |


### DeleteAppointmentSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### DeleteEventSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `succeeded` | boolean | No | - |


### NoteCreatedBySchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `name` | string | No | - |


### GetNoteSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | No | - |
| `body` | string | No | - |
| `userId` | string | No | - |
| `dateAdded` | string | No | - |
| `contactId` | string | No | - |
| `createdBy` | NoteCreatedBySchema | No | - |


### GetNotesListSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `notes` | array<GetNoteSchema> | No | - |
| `hasMore` | boolean | No | - |


### NotesDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `userId` | string | No | - |
| `body` | string | Yes | Note body |


### GetCreateUpdateNoteSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `note` | GetNoteSchema | No | - |


### DeleteNoteSuccessfulResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | No | - |


### CalendarResourceByIdResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location ID of the resource |
| `name` | string | Yes | Name of the resource |
| `resourceType` | string (enum: equipments, rooms) | Yes | - |
| `isActive` | boolean | Yes | Whether the resource is active |
| `description` | string | No | Description of the resource |
| `quantity` | number | No | Quantity of the resource |
| `outOfService` | number | No | Indicates if the resource is out of service |
| `capacity` | number | No | Capacity of the resource |
| `calendarIds` | array<string> | Yes | Calendar IDs |


### UpdateCalendarResourceDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | No | - |
| `name` | string | No | - |
| `description` | string | No | - |
| `quantity` | number | No | Quantity of the equipment. |
| `outOfService` | number | No | Quantity of the out of service equipment. |
| `capacity` | number | No | Capacity of the room. |
| `calendarIds` | array<string> | No | Service calendar IDs to be mapped with the resource.      One equipment can only be mapped with one service calendar.      One room can be mapped with multiple service calendars. |
| `isActive` | boolean | No | - |


### CalendarResourceResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | Location ID of the resource |
| `name` | string | Yes | Name of the resource |
| `resourceType` | string (enum: equipments, rooms) | Yes | - |
| `isActive` | boolean | Yes | Whether the resource is active |
| `description` | string | No | Description of the resource |
| `quantity` | number | No | Quantity of the resource |
| `outOfService` | number | No | Indicates if the resource is out of service |
| `capacity` | number | No | Capacity of the resource |


### ResourceDeleteResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | No | Success |


### CreateCalendarResourceDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `locationId` | string | Yes | - |
| `name` | string | Yes | - |
| `description` | string | Yes | - |
| `quantity` | number | Yes | Quantity of the equipment. |
| `outOfService` | number | Yes | Quantity of the out of service equipment. |
| `capacity` | number | Yes | Capacity of the room. |
| `calendarIds` | array<string> | Yes | Service calendar IDs to be mapped with the resource.      One equipment can only be mapped with one service calendar.      One room can be mapped with multiple service calendars. |


### SchedulesDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `timeOffset` | number | No | - |
| `unit` | string | No | - |


### CalendarNotificationResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | No | Notification ID |
| `receiverType` | string (enum: contact, guest, assignedUser, emails, phoneNumbers) | No | - |
| `additionalEmailIds` | array<string> | No | - |
| `additionalPhoneNumbers` | array<string> | No | - |
| `channel` | string (enum: email, inApp, sms, whatsapp) | No | - |
| `notificationType` | string (enum: booked, confirmation, cancellation, reminder, followup, reschedule) | No | - |
| `isActive` | boolean | No | - |
| `additionalWhatsappNumbers` | array<string> | No | - |
| `templateId` | string | No | - |
| `body` | string | No | - |
| `subject` | string | No | - |
| `afterTime` | array<SchedulesDTO> | No | - |
| `beforeTime` | array<SchedulesDTO> | No | - |
| `selectedUsers` | array<string> | No | - |
| `deleted` | boolean | No | - |


### CreateCalendarNotificationDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `receiverType` | string (enum: contact, guest, assignedUser, emails, phoneNumbers) | Yes | notification recipient type |
| `channel` | string (enum: email, inApp, sms, whatsapp) | Yes | Notification channel |
| `notificationType` | string (enum: booked, confirmation, cancellation, reminder, followup, reschedule) | Yes | Notification type |
| `isActive` | boolean | No | Is the notification active |
| `templateId` | string | No | Template ID for email notification. Not necessary for in-App notification |
| `body` | string | No | Body  for email notification. Not necessary for in-App notification |
| `subject` | string | No | Subject  for email notification. Not necessary for in-App notification |
| `afterTime` | array<SchedulesDTO> | No | Specifies the time after which the follow-up notification should be sent. This is not required for other notification types. |
| `beforeTime` | array<SchedulesDTO> | No | Specifies the time before which the reminder notification should be sent. This is not required for other notification types. |
| `additionalEmailIds` | array<string> | No | Additional email addresses to receive notifications. |
| `additionalPhoneNumbers` | array<string> | No | Additional phone numbers to receive notifications. |
| `selectedUsers` | array<string> | No | selected user for in-App notification |
| `fromAddress` | string | No | from address for email notification |
| `fromName` | string | No | from name for email/sms notification |
| `fromNumber` | string | No | from number for sms notification |


### UpdateCalendarNotificationsDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `receiverType` | string (enum: contact, guest, assignedUser, emails, phoneNumbers) | No | Notification recipient type |
| `additionalEmailIds` | array<string> | No | Additional email addresses to receive notifications. |
| `additionalPhoneNumbers` | array<string> | No | Additional phone numbers to receive notifications. |
| `selectedUsers` | array<string> | No | selected user for in-App notification |
| `channel` | string (enum: email, inApp, sms, whatsapp) | No | Notification channel |
| `notificationType` | string (enum: booked, confirmation, cancellation, reminder, followup, reschedule) | No | Notification type |
| `isActive` | boolean | No | Is the notification active |
| `deleted` | boolean | No | Marks the notification as deleted (soft delete) |
| `templateId` | string | No | Template ID for email notification |
| `body` | string | No | Body  for email notification. Not necessary for in-App notification |
| `subject` | string | No | Subject  for email notification. Not necessary for in-App notification |
| `afterTime` | array<SchedulesDTO> | No | Specifies the time after which the follow-up notification should be sent. This is not required for other notification types. |
| `beforeTime` | array<SchedulesDTO> | No | Specifies the time before which the reminder notification should be sent. This is not required for other notification types. |
| `fromAddress` | string | No | From address for email notification |
| `fromNumber` | string | No | from number for sms notification |
| `fromName` | string | No | From name for email/sms notification |


### CalendarNotificationDeleteResponseDTO

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `message` | string | Yes | Result of delete/update operation |


