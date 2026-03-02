# Payments API

Documentation for payments API

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

### POST `/payments/integrations/provider/whitelabel`

Create White-label Integration Provider

The "Create White-label Integration Provider" API allows adding a new payment provider integration to the system which is built on top of Authorize.net or NMI. Use this endpoint to create a integration provider with the specified details. Ensure that the required information is provided in the request payload. This endpoint can be only invoked using marketplace-app token

Operation ID: `create-integration provider`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateWhiteLabelIntegrationProviderDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `uniqueName` | string | Yes | A unique name given to the integration provider, uniqueName must start and end with a character. Only lowercase characters and hyphens (-) are supported |
| `title` | string | Yes | The title or name of the integration provider. |
| `provider` | string (enum: authorize-net, nmi) | Yes | The type of payment provider associated with the integration provider. |
| `description` | string | Yes | A brief description providing additional information about the integration provider. |
| `imageUrl` | string | Yes | The URL to an image representing the integration provider. The imageUrl should start with "https://" and ensure that this URL is publicly accessible. |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/integrations/provider/whitelabel`

List White-label Integration Providers

The "List White-label Integration Providers" API allows to retrieve a paginated list of integration providers. Customize your results by filtering whitelabel integration providers(which are built directly on top of Authorize.net or NMI) based on name or paginate through the list using the provided query parameters. This endpoint provides a straightforward way to explore and retrieve integration provider information.

Operation ID: `list-integration-providers`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | location Id / company Id based on altType |
| `altType` | query | string | Yes | Alt Type |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/orders`

List Orders

The "List Orders" API allows to retrieve a paginated list of orders. Customize your results by filtering orders based on name, alt type, order status, payment mode, date range, type of source, contact, funnel products or paginate through the list using the provided query parameters. This endpoint provides a straightforward way to explore and retrieve order information.

Operation ID: `list-orders`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | No | LocationId is the id of the sub-account. |
| `altId` | query | string | Yes | AltId is the unique identifier e.g: location id. |
| `altType` | query | string | Yes | AltType is the type of identifier. |
| `status` | query | string | No | Order status. |
| `paymentMode` | query | string | No | Mode of payment. |
| `startAt` | query | string | No | Starting interval of orders. |
| `endAt` | query | string | No | Closing interval of orders. |
| `search` | query | string | No | The name of the order for searching. |
| `contactId` | query | string | No | Contact id for filtering of orders. |
| `funnelProductIds` | query | string | No | Funnel product ids separated by comma. |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/orders/{orderId}`

Get Order by ID

The "Get Order by ID" API allows to retrieve information for a specific order using its unique identifier. Use this endpoint to fetch details for a single order based on the provided order ID.

Operation ID: `get-order-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `orderId` | path | string | Yes | ID of the order that needs to be returned |
| `locationId` | query | string | No | LocationId is the id of the sub-account. |
| `altId` | query | string | Yes | AltId is the unique identifier e.g: location id. |

**Responses:**

- `200`: Successful response
- `400`: Order not found
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/payments/orders/{orderId}/record-payment`

Record Order Payment

The "Record Order Payment" API allows to record a payment for an order. Use this endpoint to record payment for an order and update the order status to "Paid".

Operation ID: `record-order-payment`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `orderId` | path | string | Yes | MongoDB Order ID |

**Request Body (required):**

Content-Type: `application/json`

Schema: `PostRecordOrderPaymentBody`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `mode` | string (enum: cash, card, cheque, bank_transfer, other) | Yes | manual payment method |
| `card` | object | No | Details of Card if used for payment |
| `cheque` | object | No | Details of the Cheque if used for payment |
| `notes` | string | No | Any note to be recorded with the transaction |
| `amount` | number | No | Amount to be paid against the invoice. |
| `meta` | object | No | Meta data to be recorded with the transaction |
| `isPartialPayment` | boolean | No | Indicates if the order is intended to be a partial payment. |


**Responses:**

- `200`: Successful response
- `400`: Order not found
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/payments/orders/migrate-order-ps`

migration Endpoint for Order Payment Status

Process to migrate all the older orders and based on the statuses introduce the payment statuses as well

Operation ID: `post-migrate-order-payment-status`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | No | LocationId is the id of the sub-account. |
| `altId` | query | string | Yes | AltId is the unique identifier e.g: location id. |

**Responses:**

- `201`: 
- `400`: Bad Request
- `401`: Unauthorized

---

### POST `/payments/orders/{orderId}/fulfillments`

Create order fulfillment

The "Order Fulfillment" API facilitates the process of fulfilling an order.

Operation ID: `create-order-fulfillment`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `orderId` | path | string | Yes | ID of the order that needs to be returned |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateFulfillmentDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `trackings` | array<FulfillmentTracking> | Yes | Fulfillment tracking information |
| `items` | array<FulfillmentItems> | Yes | Fulfilled items |
| `notifyCustomer` | boolean | Yes | Need to send a notification to customer |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/orders/{orderId}/fulfillments`

List fulfillment

List all fulfillment history of an order

Operation ID: `list-order-fulfillment`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `orderId` | path | string | Yes | ID of the order that needs to be returned |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/orders/{orderId}/notes`

List Order Notes

List all notes of an order

Operation ID: `list-order-notes`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `orderId` | path | string | Yes | ID of the order that needs to be returned |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/transactions`

List Transactions

The "List Transactions" API allows to retrieve a paginated list of transactions. Customize your results by filtering transactions based on name, alt type, transaction status, payment mode, date range, type of source, contact, subscription id, entity id or paginate through the list using the provided query parameters. This endpoint provides a straightforward way to explore and retrieve transaction information.

Operation ID: `list-transactions`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | No | LocationId is the id of the sub-account. |
| `altId` | query | string | Yes | AltId is the unique identifier e.g: location id. |
| `altType` | query | string | Yes | AltType is the type of identifier. |
| `paymentMode` | query | string | No | Mode of payment. |
| `startAt` | query | string | No | Starting interval of transactions. |
| `endAt` | query | string | No | Closing interval of transactions. |
| `entitySourceType` | query | string | No | Source of the transactions. |
| `entitySourceSubType` | query | string | No | Source sub-type of the transactions. |
| `search` | query | string | No | The name of the transaction for searching. |
| `subscriptionId` | query | string | No | Subscription id for filtering of transactions. |
| `entityId` | query | string | No | Entity id for filtering of transactions. |
| `contactId` | query | string | No | Contact id for filtering of transactions. |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/transactions/{transactionId}`

Get Transaction by ID

The "Get Transaction by ID" API allows to retrieve information for a specific transaction using its unique identifier. Use this endpoint to fetch details for a single transaction based on the provided transaction ID.

Operation ID: `get-transaction-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `transactionId` | path | string | Yes | ID of the transaction that needs to be returned |
| `locationId` | query | string | No | LocationId is the id of the sub-account. |
| `altId` | query | string | Yes | AltId is the unique identifier e.g: location id. |
| `altType` | query | string | Yes | AltType is the type of identifier. |

**Responses:**

- `200`: Successful response
- `400`: Transaction not found
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/subscriptions`

List Subscriptions

The "List Subscriptions" API allows to retrieve a paginated list of subscriptions. Customize your results by filtering subscriptions based on name, alt type, subscription status, payment mode, date range, type of source, contact, subscription id, entity id, contact or paginate through the list using the provided query parameters. This endpoint provides a straightforward way to explore and retrieve subscription information.

Operation ID: `list-subscriptions`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | AltId is the unique identifier e.g: location id. |
| `altType` | query | string | Yes | AltType is the type of identifier. |
| `entityId` | query | string | No | Entity id for filtering of subscriptions. |
| `paymentMode` | query | string | No | Mode of payment. |
| `startAt` | query | string | No | Starting interval of subscriptions. |
| `endAt` | query | string | No | Closing interval of subscriptions. |
| `entitySourceType` | query | string | No | Source of the subscriptions. |
| `search` | query | string | No | The name of the subscription for searching. |
| `contactId` | query | string | No | Contact ID for the subscription |
| `id` | query | string | No | Subscription id for filtering of subscriptions. |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/subscriptions/{subscriptionId}`

Get Subscription by ID

The "Get Subscription by ID" API allows to retrieve information for a specific subscription using its unique identifier. Use this endpoint to fetch details for a single subscription based on the provided subscription ID.

Operation ID: `get-subscription-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `subscriptionId` | path | string | Yes | ID of the subscription that needs to be returned |
| `altId` | query | string | Yes | AltId is the unique identifier e.g: location id. |
| `altType` | query | string | Yes | AltType is the type of identifier. |

**Responses:**

- `200`: Successful response
- `400`: Subscription not found
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/coupon/list`

List Coupons

The "List Coupons" API allows you to retrieve a list of all coupons available in your location. Use this endpoint to view all promotional offers and special discounts for your customers.

Operation ID: `list-coupons`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id |
| `altType` | query | string | Yes | Alt Type |
| `limit` | query | number | No | Maximum number of coupons to return |
| `offset` | query | number | No | Number of coupons to skip for pagination |
| `status` | query | string | No | Filter coupons by status |
| `search` | query | string | No | Search term to filter coupons by name or code |

**Responses:**

- `200`: Successful response
- `422`: Unprocessable Entity

---

### POST `/payments/coupon`

Create Coupon

The "Create Coupon" API allows you to create a new promotional coupon with customizable parameters such as discount amount, validity period, usage limits, and applicable products. Use this endpoint to set up promotional offers and special discounts for your customers.

Operation ID: `create-coupon`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateCouponParams`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | Coupon Name |
| `code` | string | Yes | Coupon Code |
| `discountType` | string (enum: percentage, amount) | Yes | Discount Type |
| `discountValue` | number | Yes | Discount Value |
| `startDate` | string | Yes | Start date in YYYY-MM-DDTHH:mm:ssZ format |
| `endDate` | string | No | End date in YYYY-MM-DDTHH:mm:ssZ format |
| `usageLimit` | number | No | Max number of times coupon can be used |
| `productIds` | array<string> | No | Product Ids |
| `applyToFuturePayments` | boolean | No | Is Coupon applicable on upcoming subscription transactions |
| `applyToFuturePaymentsConfig` | object | No | If coupon is applicable on upcoming subscription transactions, how many months should it be applicable for a subscription |
| `limitPerCustomer` | boolean | No | Limits whether a coupon can be redeemed only once per customer. |


**Responses:**

- `201`: Successful response
- `422`: Unprocessable Entity

---

### PUT `/payments/coupon`

Update Coupon

The "Update Coupon" API enables you to modify existing coupon details such as discount values, validity periods, usage limits, and other promotional parameters. Use this endpoint to adjust or extend promotional offers for your customers.

Operation ID: `update-coupon`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateCouponParams`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | Coupon Name |
| `code` | string | Yes | Coupon Code |
| `discountType` | string (enum: percentage, amount) | Yes | Discount Type |
| `discountValue` | number | Yes | Discount Value |
| `startDate` | string | Yes | Start date in YYYY-MM-DDTHH:mm:ssZ format |
| `endDate` | string | No | End date in YYYY-MM-DDTHH:mm:ssZ format |
| `usageLimit` | number | No | Max number of times coupon can be used |
| `productIds` | array<string> | No | Product Ids |
| `applyToFuturePayments` | boolean | No | Is Coupon applicable on upcoming subscription transactions |
| `applyToFuturePaymentsConfig` | object | No | If coupon is applicable on upcoming subscription transactions, how many months should it be applicable for a subscription |
| `limitPerCustomer` | boolean | No | Limits whether a coupon can be redeemed only once per customer. |
| `id` | string | Yes | Coupon Id |


**Responses:**

- `200`: Successful response
- `422`: Unprocessable Entity

---

### DELETE `/payments/coupon`

Delete Coupon

The "Delete Coupon" API allows you to permanently remove a coupon from your system using its unique identifier. Use this endpoint to discontinue promotional offers or clean up unused coupons. Note that this action cannot be undone.

Operation ID: `delete-coupon`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `DeleteCouponParams`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | Alt Type |
| `id` | string | Yes | Coupon Id |


**Responses:**

- `200`: Successful response
- `422`: Unprocessable Entity

---

### GET `/payments/coupon`

Fetch Coupon

The "Get Coupon Details" API enables you to retrieve comprehensive information about a specific coupon using either its unique identifier or promotional code. Use this endpoint to view coupon parameters, usage statistics, validity periods, and other promotional details.

Operation ID: `get-coupon`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id |
| `altType` | query | string | Yes | Alt Type |
| `id` | query | string | Yes | Coupon id |
| `code` | query | string | Yes | Coupon code |

**Responses:**

- `200`: Successful response
- `422`: Unprocessable Entity

---

### POST `/payments/custom-provider/provider`

Create new integration

API to create a new association for an app and location

Operation ID: `create-integration`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateCustomProvidersDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the custom provider |
| `description` | string | Yes | Description of payment gateway. Shown on the payments integrations page as subtext |
| `paymentsUrl` | string | Yes | This url will be loaded in iFrame to start a payment session. |
| `queryUrl` | string | Yes | The url used for querying payments related events. Ex. verify, refund, subscription etc. |
| `imageUrl` | string | Yes | Public image url for logo of the payment gateway displayed on the payments integrations page. |
| `supportsSubscriptionSchedule` | boolean | Yes | Whether the config supports subscription schedule or not. true represents config supports subscription schedule |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/payments/custom-provider/provider`

Deleting an existing integration

API to delete an association for an app and location

Operation ID: `delete-integration`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/payments/custom-provider/connect`

Fetch given provider config

API for fetching an existing payment config for given location

Operation ID: `fetch-config`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location id |

**Responses:**

- `200`: Successful response
- `400`: No such config exists for given locationId and marketplaceAppId
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/payments/custom-provider/connect`

Create new provider config

API to create a new payment config for given location

Operation ID: `create-config`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `ConnectCustomProvidersConfigDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `live` | object | Yes | Live config containing api-key and publishable key for live payments |
| `test` | object | Yes | Test config containing api-key and publishable-key for test payments |


**Responses:**

- `200`: Successful response
- `400`: No such config exists for given locationId and marketplaceAppId
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/payments/custom-provider/disconnect`

Disconnect existing provider config

API to disconnect an existing payment config for given location

Operation ID: `disconnect-config`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `locationId` | query | string | Yes | Location id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `DeleteCustomProvidersConfigDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `liveMode` | boolean | Yes | Whether the config is for test mode or live mode. true represents config is for live payments |


**Responses:**

- `200`: Successful response
- `400`: No such config exists for given locationId and marketplaceAppId
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/payments/custom-provider/capabilities`

Custom-provider marketplace app update capabilities

Toggle capabilities for the marketplace app tied to the OAuth client

Operation ID: `custom-provider-marketplace-app-update-capabilities`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateCustomProviderCapabilitiesDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `supportsSubscriptionSchedules` | boolean | Yes | Whether the marketplace app supports subscription schedules or not |
| `companyId` | string | No | Company id. Mandatory if locationId is not provided |
| `locationId` | string | No | Location / Sub-account id. Mandatory if companyId is not provided |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### CreateWhiteLabelIntegrationProviderDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `uniqueName` | string | Yes | A unique name given to the integration provider, uniqueName must start and end with a character. Only lowercase characters and hyphens (-) are supported |
| `title` | string | Yes | The title or name of the integration provider. |
| `provider` | string (enum: authorize-net, nmi) | Yes | The type of payment provider associated with the integration provider. |
| `description` | string | Yes | A brief description providing additional information about the integration provider. |
| `imageUrl` | string | Yes | The URL to an image representing the integration provider. The imageUrl should start with "https://" and ensure that this URL is publicly accessible. |


### CreateWhitelabelIntegrationResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier of the integration provider. |
| `altId` | string | Yes | The altId / locationId of the integration provider. |
| `altType` | string | Yes | The altType of the integration provider. |
| `title` | string | Yes | The title or name of the integration provider. |
| `route` | string | Yes | The route name associated with the integration provider. |
| `provider` | string | Yes | The payment provider associated with the integration provider. |
| `description` | string | Yes | A brief description providing additional information about the integration provider. |
| `imageUrl` | string | Yes | The URL to an image representing the integration provider. |
| `createdAt` | string | Yes | The timestamp when the integration provider was created. |
| `updatedAt` | string | Yes | The timestamp when the integration provider was last updated. |


### IntegrationProviderSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier of the integration provider. |
| `altId` | string | Yes | The altId / locationId of the integration provider. |
| `altType` | string | Yes | The altType of the integration provider. |
| `title` | string | Yes | The title or name of the integration provider. |
| `route` | string | Yes | The route name associated with the integration provider. |
| `provider` | string | Yes | The payment provider associated with the integration provider. |
| `description` | string | Yes | A brief description providing additional information about the integration provider. |
| `imageUrl` | string | Yes | The URL to an image representing the integration provider. |
| `createdAt` | string | Yes | The timestamp when the integration provider was created. |
| `updatedAt` | string | Yes | The timestamp when the integration provider was last updated. |


### ListWhitelabelIntegrationProviderResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `providers` | object | Yes | list of integration provider. |


### OrderResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the order. |
| `altId` | string | Yes | AltId is the unique identifier eg: location id. |
| `altType` | string | Yes | AltType is the type of identifier. |
| `contactId` | string | No | Contact id corresponding to the order. |
| `contactName` | string | No | Contact name corresponding to the order. |
| `contactEmail` | string | No | Contact email corresponding to the order. |
| `currency` | string | No | Currency in which order was created. |
| `amount` | number | No | Order value. |
| `subtotal` | number | No | Order sub-total value. |
| `discount` | number | No | Discount value on order. |
| `status` | string | Yes | The status of the order (e.g., completed). |
| `liveMode` | boolean | No | Order is in live / test mode. |
| `totalProducts` | number | No | Total products in an order. |
| `sourceType` | string | Yes | Source type of order (eg: funnel). |
| `sourceName` | string | No | Source name for the order. |
| `sourceId` | string | No | Source id for the order. |
| `sourceMeta` | object | No | Meta content for the source of order. |
| `couponCode` | string | No | Coupon code for the order. |
| `createdAt` | string | Yes | The creation timestamp of the order. |
| `updatedAt` | string | Yes | The last update timestamp of the order. |
| `sourceSubType` | string | No | Source sub-type for the order. |
| `fulfillmentStatus` | string | No | Fulfillment status of the order. |
| `onetimeProducts` | number | No | Total one time products in an order. |
| `recurringProducts` | number | No | Total recurring time products in an order. |


### ListOrdersResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | array<OrderResponseSchema> | Yes | An array of orders |
| `totalCount` | number | Yes | total orders count |


### AmountSummary

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `subtotal` | number | Yes | Order sub-total value. |
| `discount` | number | No | Discount value on order. |


### OrderSource

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: funnel, website, invoice, calendar, text2Pay, document_contracts, membership, mobile_app, ...) | Yes | - |
| `subType` | string (enum: one_step_order_form, two_step_order_form, upsell, tap_to_pay, card_payment, store, contact_view, email_campaign, ...) | No | - |
| `id` | string | Yes | - |
| `name` | string | No | - |
| `meta` | object | No | - |


### GetOrderResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the order. |
| `altId` | string | Yes | AltId is the unique identifier eg: location id. |
| `altType` | string | Yes | AltType is the type of identifier. |
| `contactId` | string | No | Contact id corresponding to the order. |
| `currency` | string | No | Currency in which order was created. |
| `amount` | number | No | Order value. |
| `status` | string | Yes | The status of the order (e.g., completed). |
| `liveMode` | boolean | No | Order is in live / test mode. |
| `createdAt` | string | Yes | The creation timestamp of the order. |
| `updatedAt` | string | Yes | The last update timestamp of the order. |
| `fulfillmentStatus` | string | No | Fulfillment status of the order. |
| `contactSnapshot` | object | No | Contact details of the order. |
| `amountSummary` | object | No | Amount details of the order. |
| `source` | object | No | Source details of the order. |
| `items` | array<string> | No | Item details of the order. |
| `coupon` | object | No | Coupon details of the order. |
| `trackingId` | string | No | Tracking id of the order. |
| `fingerprint` | string | No | Fingerprint id of the order. |
| `meta` | object | No | Meta details of the order. |
| `markAsTest` | boolean | No | Is test order. |
| `traceId` | string | No | Trace id of the order. |
| `automaticTaxesCalculated` | boolean | No | Automatic taxes applied for the Order |
| `taxCalculationProvider` | object | No | Provider name for automatic tax calculation |


### CardDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: visa, mastercard, other) | Yes | - |
| `last4` | string | Yes | Last 4 digit of the card |


### ChequeDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `number` | string | Yes | check number |


### PostRecordOrderPaymentBody

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | location Id / company Id based on altType |
| `altType` | string (enum: location) | Yes | Alt Type |
| `mode` | string (enum: cash, card, cheque, bank_transfer, other) | Yes | manual payment method |
| `card` | object | No | Details of Card if used for payment |
| `cheque` | object | No | Details of the Cheque if used for payment |
| `notes` | string | No | Any note to be recorded with the transaction |
| `amount` | number | No | Amount to be paid against the invoice. |
| `meta` | object | No | Meta data to be recorded with the transaction |
| `isPartialPayment` | boolean | No | Indicates if the order is intended to be a partial payment. |


### PostRecordOrderPaymentResponse

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Success status of the request |


### FulfillmentTracking

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `trackingNumber` | string | No | Tracking number provided by the shipping carrier |
| `shippingCarrier` | string | No | Shipping carrier name |
| `trackingUrl` | string | No | Tracking URL |


### FulfillmentItems

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `priceId` | string | Yes | The id of product price |
| `qty` | number | Yes | The no of quantity of the item |


### CreateFulfillmentDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `trackings` | array<FulfillmentTracking> | Yes | Fulfillment tracking information |
| `items` | array<FulfillmentItems> | Yes | Fulfilled items |
| `notifyCustomer` | boolean | Yes | Need to send a notification to customer |


### ProductVariantOptionDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | The unique identifier for the option. |
| `name` | string | Yes | The name of the option. |


### ProductVariantDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | A unique identifier for the variant. |
| `name` | string | Yes | The name of the variant. |
| `options` | array<ProductVariantOptionDto> | Yes | An array of options for the variant. |


### ProductMediaDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | The unique identifier for the media. |
| `title` | string | No | The title of the media file. |
| `url` | string | Yes | The URL where the media file is stored. |
| `type` | string (enum: image, video) | Yes | The type of the media file (e.g., image, video will be supporting soon). |
| `isFeatured` | boolean | No | Indicates whether the media is featured. |
| `priceIds` | array<array> | No | Mongo ObjectIds of the prices for which the media is assigned |


### ProductLabelDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | The content for the product label. |
| `startDate` | string | No | Start date in YYYY-MM-DDTHH:mm:ssZ format |
| `endDate` | string | No | Start date in YYYY-MM-DDTHH:mm:ssZ format |


### ProductSEODto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | SEO title of the product which will be displayed in the preview |
| `description` | string | No | SEO Description for the product which will be displayed in the preview |


### DefaultProductResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the product. |
| `description` | string | No | product description |
| `variants` | array<ProductVariantDto> | No | An array of variants for the product. |
| `medias` | array<ProductMediaDto> | No | An array of medias for the product. |
| `locationId` | string | Yes | The unique identifier for the location. |
| `name` | string | Yes | The name of the product. |
| `productType` | string | Yes | The type of the product (e.g., PHYSICAL). |
| `availableInStore` | boolean | No | Indicates whether the product is available in-store. |
| `userId` | string | No | The unique identifier for the user who created the product. |
| `createdAt` | string | Yes | The creation timestamp of the product. |
| `updatedAt` | string | Yes | The last update timestamp of the product. |
| `statementDescriptor` | string | No | The statement descriptor for the product. |
| `image` | string | No | The URL for the product image. |
| `collectionIds` | array<string> | No | An array of category Ids for the product |
| `isTaxesEnabled` | boolean | No | The field indicates whether taxes are enabled for the product or not. |
| `taxes` | array<string> | No | An array of ids of Taxes attached to the Product. If the expand query includes tax, the taxes will be of type `ProductTaxDto`. Please refer to the `ProductTaxDto` for additional details. |
| `automaticTaxCategoryId` | string | No | Tax category ID for Automatic taxes calculation. |
| `isLabelEnabled` | boolean | No | A boolean representing whether a product label is enabled or not |
| `label` | object | No | The Product label details |
| `slug` | string | No | The slug of the product by which the product will be navigated |
| `seo` | object | No | The SEO information for the product requested |


### MembershipOfferDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `label` | string | Yes | Membership offer label |
| `value` | string | Yes | Membership offer label |
| `_id` | string | Yes | The unique identifier for the membership offer. |


### RecurringDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `interval` | string (enum: day, month, week, year) | Yes | The interval at which the recurring event occurs. |
| `intervalCount` | number | Yes | The number of intervals between each occurrence of the event. |


### DefaultPriceResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the price. |
| `membershipOffers` | array<MembershipOfferDto> | No | An array of membership offers associated with the price. |
| `variantOptionIds` | array<string> | No | An array of variant option IDs associated with the price. |
| `locationId` | string | No | The unique identifier for the location. |
| `product` | string | No | The unique identifier for the associated product. |
| `userId` | string | No | The unique identifier for the user. |
| `name` | string | Yes | The name of the price. |
| `type` | string (enum: one_time, recurring) | Yes | The type of the price (e.g., one_time). |
| `currency` | string | Yes | The currency code for the price. |
| `amount` | number | Yes | The amount of the price. |
| `recurring` | object | No | The recurring details of the price (if type is recurring). |
| `createdAt` | string | No | The creation timestamp of the price. |
| `updatedAt` | string | No | The last update timestamp of the price. |
| `compareAtPrice` | number | No | The compare-at price for comparison purposes. |
| `trackInventory` | boolean | No | Indicates whether inventory tracking is enabled. |
| `availableQuantity` | number | No | Available inventory stock quantity |
| `allowOutOfStockPurchases` | boolean | No | Continue selling when out of stock |


### FulfilledItem

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The id of product price |
| `name` | string | Yes | Name |
| `product` | object | Yes | Product details |
| `price` | object | Yes | Price details |
| `qty` | number | Yes | The no of quantity of the current fulfilled item |


### FulfillmentSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `trackings` | array<FulfillmentTracking> | Yes | Fulfillment tracking information |
| `_id` | string | Yes | The unique identifier for the fulfillment item. |
| `items` | array<FulfilledItem> | Yes | Fulfilled items |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### CreateFulfillmentResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `data` | object | Yes | fulfillment data |


### ListFulfillmentResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `data` | array<FulfillmentSchema> | Yes | An array of fulfilled items |


### TxnResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the transaction. |
| `altId` | string | Yes | AltId is the unique identifier eg: location id. |
| `altType` | string | Yes | AltType is the type of identifier. |
| `contactId` | string | No | Contact id corresponding to the transaction. |
| `mergedFromContactId` | string | No | ID of the contact that was merged from. |
| `contactName` | string | No | Contact name corresponding to the transaction. |
| `contactEmail` | string | No | Contact email corresponding to the transaction. |
| `currency` | string | No | Currency in which transaction occurred. |
| `amount` | number | No | Transaction value. |
| `status` | object | Yes | The status of the transaction (e.g., succeeded). |
| `liveMode` | boolean | No | Transaction is in live / test mode. |
| `entityType` | string | No | Entity type of transaction (eg: order). |
| `entityId` | string | No | Entity id for the transaction. e.g: order id |
| `entitySourceType` | string | Yes | Entity source type of transaction (eg: funnel). |
| `entitySourceSubType` | string | No | Entity source sub-type of the transactions. |
| `entitySourceName` | string | No | Entity source name for the transaction. |
| `entitySourceId` | string | No | Entity source id for the transaction. |
| `entitySourceMeta` | object | No | Meta content for the entity source of transaction. |
| `subscriptionId` | string | No | Subscription id for transaction. |
| `chargeId` | string | No | Charge id for transaction. |
| `chargeSnapshot` | object | No | Charge snapshot of transaction. |
| `paymentProviderType` | string | No | Payment provider for transaction. |
| `paymentProviderConnectedAccount` | string | No | Payment provider  account id for transaction. |
| `ipAddress` | string | No | Ip address from where transaction was initiated. |
| `createdAt` | string | Yes | The creation timestamp of the transaction. |
| `updatedAt` | string | Yes | The update timestamp of the transaction. |
| `amountRefunded` | number | No | Transaction amount refunded. |
| `paymentMethod` | object | No | Transaction payment method details. |
| `fulfilledAt` | string | Yes | The charged timestamp of the transaction. |


### ListTxnsResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | array<TxnResponseSchema> | Yes | An array of transactions |
| `totalCount` | number | Yes | total transactions count |


### GetTxnResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the transaction. |
| `altType` | string | Yes | AltType is the type of identifier. |
| `altId` | string | Yes | AltId is the unique identifier eg: location id. |
| `contactId` | string | No | Contact id corresponding to the transaction. |
| `contactSnapshot` | object | No | Contact details of the transaction. |
| `currency` | string | No | Currency in which transaction was made. |
| `amount` | number | No | Transaction value. |
| `status` | object | No | Transaction status. |
| `liveMode` | boolean | No | Transaction is in live / test mode. |
| `createdAt` | string | Yes | The creation timestamp of the transaction. |
| `updatedAt` | string | Yes | The last update timestamp of the transaction. |
| `entityType` | string | No | Entity type of transaction (eg: order). |
| `entityId` | string | No | Entity id for the transaction. e.g: order id |
| `entitySource` | object | No | Entity source details for the transaction. |
| `chargeId` | string | No | Charge id for transaction. |
| `chargeSnapshot` | object | No | Charge snapshot of transaction. |
| `invoiceId` | string | No | Invoice id for the transaction. |
| `subscriptionId` | string | No | Subscription id for transaction. |
| `paymentProvider` | object | No | Payment provider details of the transaction. |
| `ipAddress` | string | No | Ip address from where transaction was initiated. |
| `meta` | object | No | Meta details of the transaction. |
| `markAsTest` | boolean | No | Is test transaction. |
| `isParent` | boolean | No | Is parent transaction. |
| `amountRefunded` | number | No | Transaction amount refunded. |
| `receiptId` | string | No | Receipt id for transaction. |
| `qboSynced` | boolean | No | Is transaction qbo synced. |
| `qboResponse` | object | No | Qbo details of the transaction. |
| `traceId` | string | No | Trace id of the transaction. |
| `mergedFromContactId` | string | No | ID of the contact that was merged from. |


### SubscriptionResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the subscription. |
| `altId` | string | Yes | AltId is the unique identifier eg: location id. |
| `altType` | string (enum: location) | Yes | AltType is the type of identifier. |
| `contactId` | string | No | Contact id corresponding to the subscription. |
| `contactName` | string | No | Contact name corresponding to the subscription. |
| `contactEmail` | string | No | Contact email corresponding to the subscription. |
| `currency` | string | No | Currency in which subscription occurred. |
| `amount` | number | No | Subscription value. |
| `status` | object | Yes | The status of the subscription (e.g., succeeded). |
| `liveMode` | boolean | No | Subscription is in live / test mode. |
| `entityType` | string | No | Entity type of subscription (eg: order). |
| `entityId` | string | No | Entity id for the subscription. e.g: order id |
| `entitySourceType` | string | Yes | Entity source type of subscription (eg: funnel). |
| `entitySourceName` | string | No | Entity source name for the subscription. |
| `entitySourceId` | string | No | Entity source id for the subscription. |
| `entitySourceMeta` | object | No | Meta content for the entity source of subscription. |
| `subscriptionId` | string | No | Subscription id for subscription. |
| `subscriptionSnapshot` | object | No | Snapshot of subscription. |
| `paymentProviderType` | string | No | Payment provider for subscription. |
| `paymentProviderConnectedAccount` | string | No | Payment provider connected account id for subscription. |
| `ipAddress` | string | No | Ip address from where subscription was initiated. |
| `createdAt` | string | Yes | The creation timestamp of the subscription. |
| `updatedAt` | string | Yes | The update timestamp of the subscription. |


### ListSubscriptionResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | array<SubscriptionResponseSchema> | Yes | An array of subscriptions |
| `totalCount` | number | Yes | total subscriptions count |


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


### ScheduleOptionsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `executeAt` | string | No | - |
| `rrule` | CustomRRuleOptionsDto | No | - |


### GetSubscriptionResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the subscription. |
| `altType` | object | Yes | AltType is the type of identifier. |
| `altId` | string | Yes | AltId is the unique identifier eg: location id. |
| `contactId` | string | No | Contact id corresponding to the subscription. |
| `contactSnapshot` | object | No | Contact details of the subscriber. |
| `coupon` | object | No | Coupon details of the subscription. |
| `currency` | string | No | Currency in which subscription was made. |
| `amount` | number | No | Subscription value. |
| `status` | object | No | Subscription status. |
| `liveMode` | boolean | No | Subscription is in live / test mode. |
| `entityType` | string | No | Entity type of subscription (eg: order). |
| `entityId` | string | No | Entity id for the subscription. e.g: order id |
| `entitySource` | object | No | Entity source details for the subscription. |
| `subscriptionId` | string | No | Subscription id for subscription. |
| `subscriptionSnapshot` | object | No | Snapshot of subscription. |
| `paymentProvider` | object | No | Payment provider details for the subscription. |
| `ipAddress` | string | No | Ip address from where subscription was initiated. |
| `createdAt` | string | Yes | The creation timestamp of the subscription. |
| `updatedAt` | string | Yes | The last update timestamp of the subscription. |
| `meta` | object | No | Meta details of the subscription. |
| `markAsTest` | boolean | No | Is test subscription. |
| `schedule` | object | No | Scedule details for the subscription. |
| `autoPayment` | object | No | Auto payment details of the subscription. |
| `recurringProduct` | object | No | Recurring product details of the subscription. |
| `canceledAt` | string | No | Cancellation timestamp of the subscription. |
| `canceledBy` | string | No | User id who cancelled the subscription. |
| `traceId` | string | No | Trace id of the subscription. |


### ApplyToFuturePaymentsConfigDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: forever, fixed) | Yes | Type of future payments configuration |
| `duration` | number | No | Duration value for fixed type configurations |
| `durationType` | string | No | Duration type for fixed configurations (e.g. months) |


### CouponDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Unique MongoDB identifier for the coupon |
| `usageCount` | number | Yes | Number of times the coupon has been used |
| `limitPerCustomer` | number | Yes | Maximum number of times a customer can use this coupon (0 for unlimited) |
| `altId` | string | Yes | Location Id |
| `altType` | string | Yes | Type of entity |
| `name` | string | Yes | Display name of the coupon |
| `code` | string | Yes | Redemption code for the coupon |
| `discountType` | string (enum: percentage, amount) | Yes | Type of discount (percentage or amount) |
| `discountValue` | number | Yes | Value of the discount (percentage or fixed amount) |
| `status` | string (enum: scheduled, active, expired) | Yes | Current status of the coupon |
| `startDate` | string | Yes | Date when the coupon becomes active |
| `endDate` | string | No | End date when the coupon expires |
| `applyToFuturePayments` | boolean | Yes | Indicates if the coupon applies to future recurring payments |
| `applyToFuturePaymentsConfig` | object | Yes | Configuration for how the coupon applies to future payments |
| `userId` | string | No | User ID associated with the coupon (if applicable) |
| `createdAt` | string | Yes | Creation timestamp |
| `updatedAt` | string | Yes | Last update timestamp |


### ListCouponsResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | array<CouponDto> | Yes | Array of coupon objects |
| `totalCount` | number | Yes | Total number of coupons matching the query criteria |
| `traceId` | string | Yes | Unique identifier for tracing this API request |


### ApplyToFuturePaymentsConfig

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: forever, fixed) | Yes | Type of the config |
| `duration` | number | Yes | Duration the coupon to be applied in a subscription |
| `durationType` | string (enum: months) | Yes | Type of the duration |


### CreateCouponParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | Coupon Name |
| `code` | string | Yes | Coupon Code |
| `discountType` | string (enum: percentage, amount) | Yes | Discount Type |
| `discountValue` | number | Yes | Discount Value |
| `startDate` | string | Yes | Start date in YYYY-MM-DDTHH:mm:ssZ format |
| `endDate` | string | No | End date in YYYY-MM-DDTHH:mm:ssZ format |
| `usageLimit` | number | No | Max number of times coupon can be used |
| `productIds` | array<string> | No | Product Ids |
| `applyToFuturePayments` | boolean | No | Is Coupon applicable on upcoming subscription transactions |
| `applyToFuturePaymentsConfig` | object | No | If coupon is applicable on upcoming subscription transactions, how many months should it be applicable for a subscription |
| `limitPerCustomer` | boolean | No | Limits whether a coupon can be redeemed only once per customer. |


### CreateCouponResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Unique MongoDB identifier for the coupon |
| `usageCount` | number | Yes | Number of times the coupon has been used |
| `limitPerCustomer` | number | Yes | Maximum number of times a customer can use this coupon (0 for unlimited) |
| `altId` | string | Yes | Location Id |
| `altType` | string | Yes | Type of entity |
| `name` | string | Yes | Display name of the coupon |
| `code` | string | Yes | Redemption code for the coupon |
| `discountType` | string (enum: percentage, amount) | Yes | Type of discount (percentage or amount) |
| `discountValue` | number | Yes | Value of the discount (percentage or fixed amount) |
| `status` | string (enum: scheduled, active, expired) | Yes | Current status of the coupon |
| `startDate` | string | Yes | Date when the coupon becomes active |
| `endDate` | string | No | End date when the coupon expires |
| `applyToFuturePayments` | boolean | Yes | Indicates if the coupon applies to future recurring payments |
| `applyToFuturePaymentsConfig` | object | Yes | Configuration for how the coupon applies to future payments |
| `userId` | string | No | User ID associated with the coupon (if applicable) |
| `createdAt` | string | Yes | Creation timestamp |
| `updatedAt` | string | Yes | Last update timestamp |
| `traceId` | string | Yes | Unique identifier for tracing this API request |


### UpdateCouponParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | Alt Type |
| `name` | string | Yes | Coupon Name |
| `code` | string | Yes | Coupon Code |
| `discountType` | string (enum: percentage, amount) | Yes | Discount Type |
| `discountValue` | number | Yes | Discount Value |
| `startDate` | string | Yes | Start date in YYYY-MM-DDTHH:mm:ssZ format |
| `endDate` | string | No | End date in YYYY-MM-DDTHH:mm:ssZ format |
| `usageLimit` | number | No | Max number of times coupon can be used |
| `productIds` | array<string> | No | Product Ids |
| `applyToFuturePayments` | boolean | No | Is Coupon applicable on upcoming subscription transactions |
| `applyToFuturePaymentsConfig` | object | No | If coupon is applicable on upcoming subscription transactions, how many months should it be applicable for a subscription |
| `limitPerCustomer` | boolean | No | Limits whether a coupon can be redeemed only once per customer. |
| `id` | string | Yes | Coupon Id |


### DeleteCouponParams

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | Alt Type |
| `id` | string | Yes | Coupon Id |


### DeleteCouponResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Indicates whether the delete was successful |
| `traceId` | string | Yes | Unique identifier for tracing this API request |


### CreateCustomProvidersDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the custom provider |
| `description` | string | Yes | Description of payment gateway. Shown on the payments integrations page as subtext |
| `paymentsUrl` | string | Yes | This url will be loaded in iFrame to start a payment session. |
| `queryUrl` | string | Yes | The url used for querying payments related events. Ex. verify, refund, subscription etc. |
| `imageUrl` | string | Yes | Public image url for logo of the payment gateway displayed on the payments integrations page. |
| `supportsSubscriptionSchedule` | boolean | Yes | Whether the config supports subscription schedule or not. true represents config supports subscription schedule |


### CreateCustomProvidersResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the custom provider |
| `description` | string | Yes | Description of payment gateway. Shown on the payments integrations page as subtext |
| `paymentsUrl` | string | Yes | This url will be loaded in iFrame to start a payment session. |
| `queryUrl` | string | Yes | The url used for querying payments related events. Ex. verify, refund, subscription etc. |
| `imageUrl` | string | Yes | Public image url for logo of the payment gateway displayed on the payments integrations page. |
| `_id` | string | Yes | The unique identifier for the custom provider. |
| `locationId` | string | Yes | Location id |
| `marketplaceAppId` | string | Yes | The application id of marketplace |
| `paymentProvider` | object | No | Payment provider details. |
| `deleted` | boolean | Yes | Whether the config is deleted or not. true represents config is deleted |
| `createdAt` | string | Yes | The creation timestamp of the custom provider. |
| `updatedAt` | string | Yes | The last update timestamp of the custom provider. |
| `traceId` | string | No | Trace id of the custom provider. |


### DeleteCustomProvidersResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Whether the custom provider config is disconnect or not. true represents config is disconnect |


### GetCustomProvidersResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the custom provider |
| `description` | string | Yes | Description of payment gateway. Shown on the payments integrations page as subtext |
| `paymentsUrl` | string | Yes | This url will be loaded in iFrame to start a payment session. |
| `queryUrl` | string | Yes | The url used for querying payments related events. Ex. verify, refund, subscription etc. |
| `imageUrl` | string | Yes | Public image url for logo of the payment gateway displayed on the payments integrations page. |
| `_id` | string | Yes | The unique identifier for the custom provider. |
| `locationId` | string | Yes | Location id |
| `marketplaceAppId` | string | Yes | The application id of marketplace |
| `paymentProvider` | object | No | Payment provider details. |
| `deleted` | boolean | Yes | Whether the config is deleted or not. true represents config is deleted |
| `createdAt` | string | Yes | The creation timestamp of the custom provider. |
| `updatedAt` | string | Yes | The last update timestamp of the custom provider. |
| `traceId` | string | No | Trace id of the custom provider. |


### CustomProviderKeys

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `apiKey` | string | Yes | Api-key for custom payment provider config |
| `publishableKey` | string | Yes | Publishable-key for custom payment provider config |


### ConnectCustomProvidersConfigDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `live` | object | Yes | Live config containing api-key and publishable key for live payments |
| `test` | object | Yes | Test config containing api-key and publishable-key for test payments |


### ConnectCustomProvidersResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the custom provider |
| `description` | string | Yes | Description of payment gateway. Shown on the payments integrations page as subtext |
| `paymentsUrl` | string | Yes | This url will be loaded in iFrame to start a payment session. |
| `queryUrl` | string | Yes | The url used for querying payments related events. Ex. verify, refund, subscription etc. |
| `imageUrl` | string | Yes | Public image url for logo of the payment gateway displayed on the payments integrations page. |
| `_id` | string | Yes | The unique identifier for the custom provider. |
| `locationId` | string | Yes | Location id |
| `marketplaceAppId` | string | Yes | The application id of marketplace |
| `paymentProvider` | object | No | Payment provider details. |
| `deleted` | boolean | Yes | Whether the config is deleted or not. true represents config is deleted |
| `createdAt` | string | Yes | The creation timestamp of the custom provider. |
| `updatedAt` | string | Yes | The last update timestamp of the custom provider. |
| `traceId` | string | No | Trace id of the custom provider. |


### DeleteCustomProvidersConfigDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `liveMode` | boolean | Yes | Whether the config is for test mode or live mode. true represents config is for live payments |


### DisconnectCustomProvidersResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Whether the custom provider config is disconnect or not. true represents config is disconnect |


### UpdateCustomProviderCapabilitiesDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `supportsSubscriptionSchedules` | boolean | Yes | Whether the marketplace app supports subscription schedules or not |
| `companyId` | string | No | Company id. Mandatory if locationId is not provided |
| `locationId` | string | No | Location / Sub-account id. Mandatory if companyId is not provided |


### UpdateCustomProviderCapabilitiesResponseSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `success` | boolean | Yes | Whether the custom provider capabilities are updated or not. true represents capabilities are updated |


