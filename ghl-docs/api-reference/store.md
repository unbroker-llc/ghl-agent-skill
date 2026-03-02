# Store API

Documentation for store API

Version: 1.0

## Base URL

- https://services.leadconnectorhq.com

## Authentication

- **bearer**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Location-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Sub-Account (OR) Private Integration Token of Sub-Account.
- **Agency-Access**: http (bearer) [JWT] — Use the Access Token generated with user type as Agency (OR) Private Integration Token of Agency.

## Endpoints

### POST `/store/shipping-zone`

Create Shipping Zone

The "Create Shipping Zone" API allows adding a new shipping zone.

Operation ID: `create-shipping-zone`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateShippingZoneDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the shipping zone |
| `countries` | array<ShippingZoneCountryDto> | Yes | List of countries that are available |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/store/shipping-zone`

List Shipping Zones

The "List Shipping Zone" API allows to retrieve a list of shipping zone.

Operation ID: `list-shipping-zones`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |
| `withShippingRate` | query | boolean | No | Include shipping rates array |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/store/shipping-zone/{shippingZoneId}`

Get Shipping Zone

The "List Shipping Zone" API allows to retrieve a paginated list of shipping zone.

Operation ID: `get-shipping-zones`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingZoneId` | path | string | Yes | ID of the item that needs to be returned |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `withShippingRate` | query | boolean | No | Include shipping rates array |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/store/shipping-zone/{shippingZoneId}`

Update Shipping Zone

The "update Shipping Zone" API allows update a shipping zone to the system. 

Operation ID: `update-shipping-zone`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingZoneId` | path | string | Yes | ID of the item that needs to be returned |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateShippingZoneDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | No | Location Id or Agency Id |
| `altType` | string (enum: location) | No | - |
| `name` | string | No | Name of the shipping zone |
| `countries` | array<ShippingZoneCountryDto> | No | List of countries that are available |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/store/shipping-zone/{shippingZoneId}`

Delete shipping zone

Delete specific shipping zone with Id :shippingZoneId

Operation ID: `delete-shipping-zone`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingZoneId` | path | string | Yes | ID of the item that needs to be returned |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/store/shipping-zone/shipping-rates`

Get available shipping rates

This return available shipping rates for country based on order amount

Operation ID: `get-available-shipping-zones`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |

**Request Body (required):**

Content-Type: `application/json`

Schema: `GetAvailableShippingRates`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `country` | string (enum: US, CA, AF, AX, AL, DZ, AS, AD, ...) | Yes | Country code of the customer |
| `address` | object | No | Address of the customer |
| `amountAvailable` | string (enum: AF, AX, AL, DZ, AS, AD, AO, AI, ...) | No | it will not calculate the order amount form backend if it is true |
| `totalOrderAmount` | number | Yes | The amount of the price. ( min: 0.01 ) |
| `weightAvailable` | boolean | No | Flag to pass when the weight is already calculated and should not calculate again |
| `totalOrderWeight` | number | Yes | Estimated weight of the order calculated from the order creation side in kg(s) |
| `source` | object | Yes | Source of the order |
| `products` | array<ProductItem> | Yes | An array of price IDs and quantity |
| `couponCode` | string | No | Coupon code |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/store/shipping-zone/{shippingZoneId}/shipping-rate`

Create Shipping Rate

The "Create Shipping Rate" API allows adding a new shipping rate.

Operation ID: `create-shipping-rate`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingZoneId` | path | string | Yes | ID of the item that needs to be returned |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateShippingRateDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the shipping zone |
| `description` | string | No | Delivery description |
| `currency` | string | Yes | The currency of the amount of the rate / handling fee |
| `amount` | number | Yes | The amount of the shipping rate if it is normal rate (0 means free ). Fixed Handling fee if it is a carrier rate (it will add to the carrier rate). |
| `conditionType` | string (enum: none, price, weight) | Yes | Type of condition to provide the conditional pricing |
| `minCondition` | number | Yes | Minimum condition for applying this price. set 0 or null if there is no minimum |
| `maxCondition` | number | Yes | Maximum condition for applying this price. set 0 or null if there is no maximum |
| `isCarrierRate` | boolean | No | is this a carrier rate |
| `shippingCarrierId` | string | Yes | Shipping carrier id |
| `percentageOfRateFee` | number | No | Percentage of rate fee if it is a carrier rate. |
| `shippingCarrierServices` | array<ShippingCarrierServiceDto> | No | An array of items |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/store/shipping-zone/{shippingZoneId}/shipping-rate`

List Shipping Rates

The "List Shipping Rate" API allows to retrieve a list of shipping rate.

Operation ID: `list-shipping-rates`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingZoneId` | path | string | Yes | ID of the item that needs to be returned |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/store/shipping-zone/{shippingZoneId}/shipping-rate/{shippingRateId}`

Get Shipping Rate

The "List Shipping Rate" API allows to retrieve a paginated list of shipping rate.

Operation ID: `get-shipping-rates`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingZoneId` | path | string | Yes | ID of the shipping zone |
| `shippingRateId` | path | string | Yes | ID of the shipping rate that needs to be returned |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/store/shipping-zone/{shippingZoneId}/shipping-rate/{shippingRateId}`

Update Shipping Rate

The "update Shipping Rate" API allows update a shipping rate to the system. 

Operation ID: `update-shipping-rate`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingZoneId` | path | string | Yes | ID of the shipping zone |
| `shippingRateId` | path | string | Yes | ID of the shipping rate that needs to be returned |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateShippingRateDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | No | Location Id or Agency Id |
| `altType` | string (enum: location) | No | - |
| `name` | string | No | Name of the shipping zone |
| `description` | string | No | Delivery description |
| `currency` | string | No | The currency of the amount of the rate / handling fee |
| `amount` | number | No | The amount of the shipping rate if it is normal rate (0 means free ). Fixed Handling fee if it is a carrier rate (it will add to the carrier rate). |
| `conditionType` | string (enum: none, price, weight) | No | Type of condition to provide the conditional pricing |
| `minCondition` | number | No | Minimum condition for applying this price. set 0 or null if there is no minimum |
| `maxCondition` | number | No | Maximum condition for applying this price. set 0 or null if there is no maximum |
| `isCarrierRate` | boolean | No | is this a carrier rate |
| `shippingCarrierId` | string | No | Shipping carrier id |
| `percentageOfRateFee` | number | No | Percentage of rate fee if it is a carrier rate. |
| `shippingCarrierServices` | array<ShippingCarrierServiceDto> | No | An array of items |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/store/shipping-zone/{shippingZoneId}/shipping-rate/{shippingRateId}`

Delete shipping rate

Delete specific shipping rate with Id :shippingRateId

Operation ID: `delete-shipping-rate`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingZoneId` | path | string | Yes | ID of the shipping zone |
| `shippingRateId` | path | string | Yes | ID of the shipping rate that needs to be returned |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/store/shipping-carrier`

Create Shipping Carrier

The "Create Shipping Carrier" API allows adding a new shipping carrier.

Operation ID: `create-shipping-carrier`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateShippingCarrierDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the shipping carrier |
| `callbackUrl` | string | Yes | The URL endpoint that GHL needs to retrieve shipping rates. This must be a public URL. |
| `services` | array<ShippingCarrierServiceDto> | No | An array of available shipping carrier services |
| `allowsMultipleServiceSelection` | boolean | No | The seller can choose multiple services while creating shipping rates if this is true. |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/store/shipping-carrier`

List Shipping Carriers

The "List Shipping Carrier" API allows to retrieve a list of shipping carrier.

Operation ID: `list-shipping-carriers`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/store/shipping-carrier/{shippingCarrierId}`

Get Shipping Carrier

The "List Shipping Carrier" API allows to retrieve a paginated list of shipping carrier.

Operation ID: `get-shipping-carriers`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingCarrierId` | path | string | Yes | ID of the shipping carrier that needs to be returned |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/store/shipping-carrier/{shippingCarrierId}`

Update Shipping Carrier

The "update Shipping Carrier" API allows update a shipping carrier to the system. 

Operation ID: `update-shipping-carrier`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingCarrierId` | path | string | Yes | ID of the shipping carrier that needs to be returned |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateShippingCarrierDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | No | Location Id or Agency Id |
| `altType` | string (enum: location) | No | - |
| `name` | string | No | Name of the shipping carrier |
| `callbackUrl` | string | No | The URL endpoint that GHL needs to retrieve shipping rates. This must be a public URL. |
| `services` | array<ShippingCarrierServiceDto> | No | An array of available shipping carrier services |
| `allowsMultipleServiceSelection` | boolean | No | The seller can choose multiple services while creating shipping rates if this is true. |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/store/shipping-carrier/{shippingCarrierId}`

Delete shipping carrier

Delete specific shipping carrier with Id :shippingCarrierId

Operation ID: `delete-shipping-carrier`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `shippingCarrierId` | path | string | Yes | ID of the shipping carrier that needs to be returned |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/store/store-setting`

Create/Update Store Settings

Create or update store settings by altId and altType.

Operation ID: `create-store-setting`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateStoreSettingDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `shippingOrigin` | object | Yes | Shipping origin address |
| `storeOrderNotification` | object | No | Store order notification email |
| `storeOrderFulfillmentNotification` | object | No | Store order fulfillment notification email |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/store/store-setting`

Get Store Settings

Get store settings by altId and altType.

Operation ID: `get-store-settings`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Authorization` | header | string | Yes | Access Token |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### ShippingZoneCountryStateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `code` | string (enum: AL, AK, AS, AZ, AR, AA, AE, AP, ...) | Yes | State code |


### ShippingZoneCountryDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `code` | number (enum: US,CA,AF,AX,AL,DZ,AS,AD,AO,AI,AQ,AG,AR,AM,AW,AU,AT,AZ,BS,BH,BD,BB,BY,BE,BZ,BJ,BM,BT,BO,BA,BW,BV,BR,IO,BN,BG,BF,BI,KH,CM,CV,KY,CF,TD,CL,CN,CX,CC,CO,KM,CG,CD,CK,CR,CI,HR,CU,CY,CZ,DK,DJ,DM,DO,EC,EG,SV,GQ,ER,EE,ET,FK,FO,FJ,FI,FR,GF,PF,TF,GA,GM,GE,DE,GH,GI,GR,GL,GD,GP,GU,GT,GG,GN,GW,GY,HT,HM,VA,HN,HK,HU,IS,IN,ID,IR,IQ,IE,IM,IL,IT,JM,JP,JE,JO,KZ,KE,KI,KP,XK,KW,KG,LA,LV,LB,LS,LR,LY,LI,LT,LU,MO,MK,MG,MW,MY,MV,ML,MT,MH,MQ,MR,MU,YT,MX,FM,MD,MC,MN,ME,MS,MA,MZ,MM,NA,NR,NP,NL,AN,NC,NZ,NI,NE,NG,NU,NF,MP,NO,OM,PK,PW,PS,PA,PG,PY,PE,PH,PN,PL,PT,PR,QA,RE,RO,RU,RW,SH,KN,LC,MF,PM,VC,WS,SM,ST,SA,SN,RS,SC,SL,SG,SX,SK,SI,SB,SO,ZA,GS,KR,ES,LK,SD,SR,SJ,SZ,SE,CH,SY,TW,TJ,TZ,TH,TL,TG,TK,TO,TT,TN,TR,TM,TC,TV,UG,UA,AE,GB,UM,UY,UZ,VU,VE,VN,VG,VI,WF,EH,YE,ZM,ZW) | Yes | Country code |
| `states` | array<ShippingZoneCountryStateDto> | No | List of states that are available. If states is empty, then all states are available |


### CreateShippingZoneDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the shipping zone |
| `countries` | array<ShippingZoneCountryDto> | Yes | List of countries that are available |


### ShippingCarrierServiceDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | Name of the shipping carrier service |
| `value` | string | Yes | Value of the shipping carrier service |


### ShippingRateSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the shipping zone |
| `description` | string | No | Delivery description |
| `currency` | string | Yes | The currency of the amount of the rate / handling fee |
| `amount` | number | Yes | The amount of the shipping rate if it is normal rate (0 means free ). Fixed Handling fee if it is a carrier rate (it will add to the carrier rate). |
| `conditionType` | string (enum: none, price, weight) | Yes | Type of condition to provide the conditional pricing |
| `minCondition` | number | Yes | Minimum condition for applying this price. set 0 or null if there is no minimum |
| `maxCondition` | number | Yes | Maximum condition for applying this price. set 0 or null if there is no maximum |
| `isCarrierRate` | boolean | No | is this a carrier rate |
| `shippingCarrierId` | string | Yes | Shipping carrier id |
| `percentageOfRateFee` | number | No | Percentage of rate fee if it is a carrier rate. |
| `shippingCarrierServices` | array<ShippingCarrierServiceDto> | No | An array of items |
| `_id` | string | Yes | The unique identifier for the product. |
| `shippingZoneId` | string | Yes | The unique identifier for the shipping zone. |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### ShippingZoneSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the shipping zone |
| `countries` | array<ShippingZoneCountryDto> | Yes | List of countries that are available |
| `_id` | string | Yes | The unique identifier for the product. |
| `shippingRates` | array<ShippingRateSchema> | No | Array of shipping rates under this shipping zone |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### CreateShippingZoneResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping zone data |


### ListShippingZoneResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `total` | number | Yes | Total number of items |
| `data` | array<ShippingZoneSchema> | Yes | An array of items |


### GetShippingZoneResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping zone data |


### UpdateShippingZoneDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | No | Location Id or Agency Id |
| `altType` | string (enum: location) | No | - |
| `name` | string | No | Name of the shipping zone |
| `countries` | array<ShippingZoneCountryDto> | No | List of countries that are available |


### UpdateShippingZoneResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping zone data |


### DeleteShippingZoneResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |


### ContactAddress

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | No | Name of the customer |
| `companyName` | string | No | Name of the Company |
| `addressLine1` | string | No | Address line 1 of the customer |
| `country` | string (enum: US, CA, AF, AX, AL, DZ, AS, AD, ...) | Yes | Country code of the customer |
| `state` | string (enum: AL, AK, AS, AZ, AR, AA, AE, AP, ...) | No | State code of the customer |
| `city` | string | No | City of the customer |
| `zip` | string | No | Zip code of the customer |
| `phone` | string | No | Phone number of the customer |
| `email` | string | No | Email of the customer |


### OrderSource

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: funnel, website, invoice, calendar, text2Pay, document_contracts, membership, mobile_app, ...) | Yes | Source of order |
| `subType` | string (enum: one_step_order_form, two_step_order_form, upsell, tap_to_pay, card_payment, store, contact_view, email_campaign, ...) | No | Source subtype of order |


### ProductItem

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | id of product |
| `qty` | number | Yes | No of quantities |


### GetAvailableShippingRates

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `country` | string (enum: US, CA, AF, AX, AL, DZ, AS, AD, ...) | Yes | Country code of the customer |
| `address` | object | No | Address of the customer |
| `amountAvailable` | string (enum: AF, AX, AL, DZ, AS, AD, AO, AI, ...) | No | it will not calculate the order amount form backend if it is true |
| `totalOrderAmount` | number | Yes | The amount of the price. ( min: 0.01 ) |
| `weightAvailable` | boolean | No | Flag to pass when the weight is already calculated and should not calculate again |
| `totalOrderWeight` | number | Yes | Estimated weight of the order calculated from the order creation side in kg(s) |
| `source` | object | Yes | Source of the order |
| `products` | array<ProductItem> | Yes | An array of price IDs and quantity |
| `couponCode` | string | No | Coupon code |


### AvailableShippingRate

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | Name of the shipping zone |
| `description` | string | No | Delivery description |
| `currency` | string | Yes | The currency of the amount of the rate / handling fee |
| `amount` | number | Yes | The amount of the shipping rate if it is normal rate (0 means free ). Fixed Handling fee if it is a carrier rate (it will add to the carrier rate). |
| `isCarrierRate` | boolean | No | is this a carrier rate |
| `shippingCarrierId` | string | Yes | Shipping carrier id |
| `percentageOfRateFee` | number | No | Percentage of rate fee if it is a carrier rate. |
| `shippingCarrierServices` | array<ShippingCarrierServiceDto> | No | An array of items |
| `_id` | string | Yes | The unique identifier for the product. |
| `shippingZoneId` | string | Yes | The unique identifier for the shipping zone. |


### GetAvailableShippingRatesResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | array<AvailableShippingRate> | Yes | Shipping rate data |


### CreateShippingRateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the shipping zone |
| `description` | string | No | Delivery description |
| `currency` | string | Yes | The currency of the amount of the rate / handling fee |
| `amount` | number | Yes | The amount of the shipping rate if it is normal rate (0 means free ). Fixed Handling fee if it is a carrier rate (it will add to the carrier rate). |
| `conditionType` | string (enum: none, price, weight) | Yes | Type of condition to provide the conditional pricing |
| `minCondition` | number | Yes | Minimum condition for applying this price. set 0 or null if there is no minimum |
| `maxCondition` | number | Yes | Maximum condition for applying this price. set 0 or null if there is no maximum |
| `isCarrierRate` | boolean | No | is this a carrier rate |
| `shippingCarrierId` | string | Yes | Shipping carrier id |
| `percentageOfRateFee` | number | No | Percentage of rate fee if it is a carrier rate. |
| `shippingCarrierServices` | array<ShippingCarrierServiceDto> | No | An array of items |


### CreateShippingRateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping zone data |


### ListShippingRateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `total` | number | Yes | Total number of items |
| `data` | array<ShippingRateSchema> | Yes | An array of items |


### GetShippingRateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping zone data |


### UpdateShippingRateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | No | Location Id or Agency Id |
| `altType` | string (enum: location) | No | - |
| `name` | string | No | Name of the shipping zone |
| `description` | string | No | Delivery description |
| `currency` | string | No | The currency of the amount of the rate / handling fee |
| `amount` | number | No | The amount of the shipping rate if it is normal rate (0 means free ). Fixed Handling fee if it is a carrier rate (it will add to the carrier rate). |
| `conditionType` | string (enum: none, price, weight) | No | Type of condition to provide the conditional pricing |
| `minCondition` | number | No | Minimum condition for applying this price. set 0 or null if there is no minimum |
| `maxCondition` | number | No | Maximum condition for applying this price. set 0 or null if there is no maximum |
| `isCarrierRate` | boolean | No | is this a carrier rate |
| `shippingCarrierId` | string | No | Shipping carrier id |
| `percentageOfRateFee` | number | No | Percentage of rate fee if it is a carrier rate. |
| `shippingCarrierServices` | array<ShippingCarrierServiceDto> | No | An array of items |


### UpdateShippingRateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping zone data |


### DeleteShippingRateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |


### CreateShippingCarrierDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the shipping carrier |
| `callbackUrl` | string | Yes | The URL endpoint that GHL needs to retrieve shipping rates. This must be a public URL. |
| `services` | array<ShippingCarrierServiceDto> | No | An array of available shipping carrier services |
| `allowsMultipleServiceSelection` | boolean | No | The seller can choose multiple services while creating shipping rates if this is true. |


### ShippingCarrierSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `name` | string | Yes | Name of the shipping carrier |
| `callbackUrl` | string | Yes | The URL endpoint that GHL needs to retrieve shipping rates. This must be a public URL. |
| `services` | array<ShippingCarrierServiceDto> | No | An array of available shipping carrier services |
| `allowsMultipleServiceSelection` | boolean | No | The seller can choose multiple services while creating shipping rates if this is true. |
| `_id` | string | Yes | The unique identifier for the product. |
| `marketplaceAppId` | string | Yes | The unique identifier for the marketplace app. |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### CreateShippingCarrierResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping carrier data |


### ListShippingCarrierResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | array<ShippingCarrierSchema> | Yes | An array of items |


### GetShippingCarrierResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping carrier data |


### UpdateShippingCarrierDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | No | Location Id or Agency Id |
| `altType` | string (enum: location) | No | - |
| `name` | string | No | Name of the shipping carrier |
| `callbackUrl` | string | No | The URL endpoint that GHL needs to retrieve shipping rates. This must be a public URL. |
| `services` | array<ShippingCarrierServiceDto> | No | An array of available shipping carrier services |
| `allowsMultipleServiceSelection` | boolean | No | The seller can choose multiple services while creating shipping rates if this is true. |


### UpdateShippingCarrierResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping carrier data |


### DeleteShippingCarrierResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |


### StoreShippingOriginDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | Name of the store / company |
| `country` | number (enum: US,CA,AF,AX,AL,DZ,AS,AD,AO,AI,AQ,AG,AR,AM,AW,AU,AT,AZ,BS,BH,BD,BB,BY,BE,BZ,BJ,BM,BT,BO,BA,BW,BV,BR,IO,BN,BG,BF,BI,KH,CM,CV,KY,CF,TD,CL,CN,CX,CC,CO,KM,CG,CD,CK,CR,CI,HR,CU,CY,CZ,DK,DJ,DM,DO,EC,EG,SV,GQ,ER,EE,ET,FK,FO,FJ,FI,FR,GF,PF,TF,GA,GM,GE,DE,GH,GI,GR,GL,GD,GP,GU,GT,GG,GN,GW,GY,HT,HM,VA,HN,HK,HU,IS,IN,ID,IR,IQ,IE,IM,IL,IT,JM,JP,JE,JO,KZ,KE,KI,KP,XK,KW,KG,LA,LV,LB,LS,LR,LY,LI,LT,LU,MO,MK,MG,MW,MY,MV,ML,MT,MH,MQ,MR,MU,YT,MX,FM,MD,MC,MN,ME,MS,MA,MZ,MM,NA,NR,NP,NL,AN,NC,NZ,NI,NE,NG,NU,NF,MP,NO,OM,PK,PW,PS,PA,PG,PY,PE,PH,PN,PL,PT,PR,QA,RE,RO,RU,RW,SH,KN,LC,MF,PM,VC,WS,SM,ST,SA,SN,RS,SC,SL,SG,SX,SK,SI,SB,SO,ZA,GS,KR,ES,LK,SD,SR,SJ,SZ,SE,CH,SY,TW,TJ,TZ,TH,TL,TG,TK,TO,TT,TN,TR,TM,TC,TV,UG,UA,AE,GB,UM,UY,UZ,VU,VE,VN,VG,VI,WF,EH,YE,ZM,ZW) | Yes | Country code |
| `state` | string (enum: AL, AK, AS, AZ, AR, AA, AE, AP, ...) | No | State code |
| `city` | string | Yes | City name |
| `street1` | string | Yes | Street address line 1 |
| `street2` | string | No | Street address line 2 |
| `zip` | string | Yes | Zip code |
| `phone` | string | No | Business Phone Number |
| `email` | string | No | Email |


### StoreOrderNotificationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `enabled` | boolean | Yes | Store order notification enabled |
| `subject` | string | Yes | Store order email subject |
| `emailTemplateId` | string | Yes | Email Template Id |
| `defaultEmailTemplateId` | string | Yes | Default Email Template Id |


### StoreOrderFulfillmentNotificationDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `enabled` | boolean | Yes | Store order fulfillment notification enabled |
| `subject` | string | Yes | Store order fulfillment email subject |
| `emailTemplateId` | string | Yes | Email Template Id |
| `defaultEmailTemplateId` | string | Yes | Default Email Template Id |


### CreateStoreSettingDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `shippingOrigin` | object | Yes | Shipping origin address |
| `storeOrderNotification` | object | No | Store order notification email |
| `storeOrderFulfillmentNotification` | object | No | Store order fulfillment notification email |


### StoreSettingSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `shippingOrigin` | object | Yes | Shipping origin address |
| `storeOrderNotification` | object | No | Store order notification email |
| `storeOrderFulfillmentNotification` | object | No | Store order fulfillment notification email |
| `_id` | string | Yes | The unique identifier for the settings. |
| `createdAt` | string | Yes | created at |
| `updatedAt` | string | Yes | updated at |


### CreateStoreSettingResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping carrier data |


### GetStoreSettingResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |
| `data` | object | Yes | Shipping carrier data |


