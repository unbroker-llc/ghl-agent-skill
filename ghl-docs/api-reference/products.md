# Products API

Documentation for products API

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

### POST `/products/bulk-update`

Bulk Update Products

API to bulk update products (price, availability, collections, delete)

Operation ID: `bulkUpdate`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `BulkUpdateDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `type` | string (enum: bulk-update-price, bulk-update-availability, bulk-update-product-collection, bulk-delete-products, bulk-update-currency) | Yes | Type of bulk update operation |
| `productIds` | array<string> | Yes | Array of product IDs |
| `filters` | object | No | Filters to apply when selectAll is true |
| `price` | object | No | Price update configuration |
| `compareAtPrice` | object | No | Compare at price update configuration |
| `availability` | boolean | No | New availability status |
| `collectionIds` | array<string> | No | Array of collection IDs |
| `currency` | string | No | Currency code |


**Responses:**

- `201`: Products updated successfully
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/products/bulk-update/edit`

Bulk Edit Products and Prices

API to bulk edit products and their associated prices (max 30 entities)

Operation ID: `bulkEdit`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `BulkEditRequestDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `products` | array<BulkEditProductDto> | Yes | Array of products to update. Note: The total count includes all prices within each product. |


**Responses:**

- `201`: Products and prices updated successfully
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/products/{productId}/price`

Create Price for a Product

The "Create Price for a Product" API allows adding a new price associated with a specific product to the system. Use this endpoint to create a price with the specified details for a particular product. Ensure that the required information is provided in the request payload.

Operation ID: `create-price-for-product`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `productId` | path | string | Yes | ID of the product that needs to be used |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreatePriceDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the price. |
| `type` | string (enum: one_time, recurring) | Yes | The type of the price. |
| `currency` | string | Yes | The currency of the price. |
| `amount` | number | Yes | The amount of the price. ( min: 0 ) |
| `recurring` | object | No | The recurring details of the price (if type is recurring). |
| `description` | string | No | A brief description of the price. |
| `membershipOffers` | array<MembershipOfferDto> | No | An array of membership offers associated with the price. |
| `trialPeriod` | number | No | The trial period duration in days (if applicable). |
| `totalCycles` | number | No | The total number of billing cycles for the price. ( min: 1 ) |
| `setupFee` | number | No | The setup fee for the price. |
| `variantOptionIds` | array<string> | No | An array of variant option IDs associated with the price. |
| `compareAtPrice` | number | No | The compare at price for the price. |
| `locationId` | string | Yes | The unique identifier of the location associated with the price. |
| `userId` | string | No | The unique identifier of the user who created the price. |
| `meta` | object | No | Additional metadata associated with the price. |
| `trackInventory` | boolean | No | Need to track inventory stock quantity |
| `availableQuantity` | number | No | Available inventory stock quantity |
| `allowOutOfStockPurchases` | boolean | No | Continue selling when out of stock |
| `sku` | string | No | The unique identifier of the SKU associated with the price |
| `shippingOptions` | object | No | Shipping options of the Price |
| `isDigitalProduct` | boolean | No | Is the product a digital product |
| `digitalDelivery` | array<string> | No | Digital delivery options |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/products/{productId}/price`

List Prices for a Product

The "List Prices for a Product" API allows retrieving a paginated list of prices associated with a specific product. Customize your results by filtering prices or paginate through the list using the provided query parameters.

Operation ID: `list-prices-for-product`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `productId` | path | string | Yes | ID of the product that needs to be used |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |
| `locationId` | query | string | Yes | The unique identifier for the location. |
| `ids` | query | string | No | To filter the response only with the given price ids, Please provide with comma separated |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/products/inventory`

List Inventory

The "List Inventory API allows the user to retrieve a paginated list of inventory items. Use this endpoint to fetch details for multiple items in the inventory based on the provided query parameters.

Operation ID: `get-list-inventory`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `search` | query | string | No | Search string for Variant Search |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/products/inventory`

Update Inventory

The Update Inventory API allows the user to bulk update the inventory for multiple items. Use this endpoint to update the available quantity and out-of-stock purchase settings for multiple items in the inventory.

Operation ID: `update-inventory`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateInventoryDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `items` | array<UpdateInventoryItemDto> | Yes | Array of items to update in the inventory. |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/products/{productId}/price/{priceId}`

Get Price by ID for a Product

The "Get Price by ID for a Product" API allows retrieving information for a specific price associated with a particular product using its unique identifier. Use this endpoint to fetch details for a single price based on the provided price ID and product ID.

Operation ID: `get-price-by-id-for-product`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `productId` | path | string | Yes | ID of the product that needs to be used |
| `priceId` | path | string | Yes | ID of the price that needs to be returned |
| `locationId` | query | string | Yes | location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/products/{productId}/price/{priceId}`

Update Price by ID for a Product

The "Update Price by ID for a Product" API allows modifying information for a specific price associated with a particular product using its unique identifier. Use this endpoint to update details for a single price based on the provided price ID and product ID.

Operation ID: `update-price-by-id-for-product`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `productId` | path | string | Yes | ID of the product that needs to be used |
| `priceId` | path | string | Yes | ID of the price that needs to be returned |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdatePriceDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the price. |
| `type` | string (enum: one_time, recurring) | Yes | The type of the price. |
| `currency` | string | Yes | The currency of the price. |
| `amount` | number | Yes | The amount of the price. ( min: 0 ) |
| `recurring` | object | No | The recurring details of the price (if type is recurring). |
| `description` | string | No | A brief description of the price. |
| `membershipOffers` | array<MembershipOfferDto> | No | An array of membership offers associated with the price. |
| `trialPeriod` | number | No | The trial period duration in days (if applicable). |
| `totalCycles` | number | No | The total number of billing cycles for the price. ( min: 1 ) |
| `setupFee` | number | No | The setup fee for the price. |
| `variantOptionIds` | array<string> | No | An array of variant option IDs associated with the price. |
| `compareAtPrice` | number | No | The compare at price for the price. |
| `locationId` | string | Yes | The unique identifier of the location associated with the price. |
| `userId` | string | No | The unique identifier of the user who created the price. |
| `meta` | object | No | Additional metadata associated with the price. |
| `trackInventory` | boolean | No | Need to track inventory stock quantity |
| `availableQuantity` | number | No | Available inventory stock quantity |
| `allowOutOfStockPurchases` | boolean | No | Continue selling when out of stock |
| `sku` | string | No | The unique identifier of the SKU associated with the price |
| `shippingOptions` | object | No | Shipping options of the Price |
| `isDigitalProduct` | boolean | No | Is the product a digital product |
| `digitalDelivery` | array<string> | No | Digital delivery options |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/products/{productId}/price/{priceId}`

Delete Price by ID for a Product

The "Delete Price by ID for a Product" API allows deleting a specific price associated with a particular product using its unique identifier. Use this endpoint to remove a price from the system.

Operation ID: `delete-price-by-id-for-product`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `productId` | path | string | Yes | ID of the product that needs to be used |
| `priceId` | path | string | Yes | ID of the price that needs to be returned |
| `locationId` | query | string | Yes | location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/products/store/{storeId}/stats`

Fetch Product Store Stats

API to fetch the total number of products, included in the store, and excluded from the store and other stats

Operation ID: `get-product-store-stats`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `storeId` | path | string | Yes | Products related to the store |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `search` | query | string | No | The name of the product for searching. |
| `collectionIds` | query | string | No | Filter by product collection Ids. Supports comma separated values |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/products/store/{storeId}`

Action to include/exclude the product in store

API to update the status of products in a particular store

Operation ID: `update-store-status`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `storeId` | path | string | Yes | Products related to the store |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateProductStoreDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `action` | string (enum: include, exclude) | Yes | Action to include or exclude the product from the store |
| `productIds` | array<string> | Yes | Array of product IDs |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/products/store/{storeId}/priority`

Update product display priorities in store

API to set the display priority of products in a store

Operation ID: `update-display-priority`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `storeId` | path | string | Yes | Products related to the store |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateDisplayPriorityBodyDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `products` | array<array> | Yes | Array of products with their display priorities |


**Responses:**

- `200`: Successfully updated display priorities
- `400`: Bad Request
- `401`: Unauthorized

---

### GET `/products/collections`

Fetch Product Collections

Internal API to fetch the Product Collections

Operation ID: `get-product-collection`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |
| `altId` | query | string | Yes | Location Id |
| `altType` | query | string | Yes | The type of alt. For now it is only LOCATION |
| `collectionIds` | query | string | No | Ids of the collections separated by comma(,) for search purposes |
| `name` | query | string | No | Query to search collection based on names |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/products/collections`

Create Product Collection

Create a new Product Collection for a specific location

Operation ID: `create-product-collection`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateProductCollectionsDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | The type of alt. For now it is only LOCATION |
| `collectionId` | string | No | Unique Identifier of the Product Collection, Mongo Id |
| `name` | string | Yes | Name of the Product Collection |
| `slug` | string | Yes | Slug of the Product Collection which helps in navigation |
| `image` | string | No | The URL of the image that is going to be displayed as the collection Thumbnail |
| `seo` | object | No | The metadata information which will be displayed in SEO previews |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/products/collections/{collectionId}`

Get Details about individual product collection

Get Details about individual product collection

Operation ID: `get-product-collection-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `collectionId` | path | string | Yes | Collection Id |
| `altId` | query | string | Yes | Location Id |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/products/collections/{collectionId}`

Update Product Collection

Update a specific product collection with Id :collectionId

Operation ID: `update-product-collection`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `collectionId` | path | string | Yes | MongoId of the collection |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateProductCollectionsDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | The type of alt. For now it is only LOCATION |
| `name` | string | No | Name of the Product Collection |
| `slug` | string | No | Slug of the Product Collection which helps in navigation |
| `image` | string | No | The URL of the image that is going to be displayed as the collection Thumbnail |
| `seo` | object | No | The metadata information which will be displayed in SEO previews |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/products/collections/{collectionId}`

Delete Product Collection

Delete specific product collection with Id :collectionId

Operation ID: `delete-product-collection`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `collectionId` | path | string | Yes | MongoId of the collection |
| `altId` | query | string | Yes | Location Id |
| `altType` | query | string | Yes | The type of alt. For now it is only LOCATION |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/products/reviews`

Fetch Product Reviews

API to fetch the Product Reviews

Operation ID: `get-product-reviews`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |
| `sortField` | query | string | No | The field upon which the sort should be applied |
| `sortOrder` | query | string | No | The order of sort which should be applied for the sortField |
| `rating` | query | number | No | Key to filter the ratings  |
| `startDate` | query | string | No | The start date for filtering reviews |
| `endDate` | query | string | No | The end date for filtering reviews |
| `productId` | query | string | No | Comma-separated list of product IDs |
| `storeId` | query | string | No | Comma-separated list of store IDs |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/products/reviews/count`

Fetch Review Count as per status

API to fetch the Review Count as per status

Operation ID: `get-reviews-count`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `rating` | query | number | No | Key to filter the ratings  |
| `startDate` | query | string | No | The start date for filtering reviews |
| `endDate` | query | string | No | The end date for filtering reviews |
| `productId` | query | string | No | Comma-separated list of product IDs |
| `storeId` | query | string | No | Comma-separated list of store IDs |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/products/reviews/{reviewId}`

Update Product Reviews

Update status, reply, etc of a particular review

Operation ID: `update-product-review`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `reviewId` | path | string | Yes | Review Id |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateProductReviewDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `productId` | string | Yes | Product Id |
| `status` | string | Yes | Status of the review |
| `reply` | array<ProductReviewDto> | No | Reply of the review |
| `rating` | number | No | Rating of the product |
| `headline` | string | No | Headline of the Review |
| `detail` | string | No | Detailed Review of the product |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/products/reviews/{reviewId}`

Delete Product Review

Delete specific product review

Operation ID: `delete-product-review`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `reviewId` | path | string | Yes | Review Id |
| `altId` | query | string | Yes | Location Id or Agency Id |
| `altType` | query | string | Yes | - |
| `productId` | query | string | Yes | Product Id of the product |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/products/reviews/bulk-update`

Update Product Reviews

Update one or multiple product reviews: status, reply, etc.

Operation ID: `bulk-update-product-review`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateProductReviewsDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `reviews` | array<UpdateProductReviewObjectDto> | Yes | Array of Product Reviews |
| `status` | object | Yes | Status of the review |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/products/{productId}`

Get Product by ID

The "Get Product by ID" API allows to retrieve information for a specific product using its unique identifier. Use this endpoint to fetch details for a single product based on the provided product ID.

Operation ID: `get-product-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `productId` | path | string | Yes | ID or the slug of the product that needs to be returned |
| `locationId` | query | string | Yes | location Id |
| `sendWishlistStatus` | query | boolean | No | Parameter which will decide whether to show the wishlisting status of products |

**Responses:**

- `200`: Successful response
- `400`: Product not found
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### DELETE `/products/{productId}`

Delete Product by ID

The "Delete Product by ID" API allows deleting a specific product using its unique identifier. Use this endpoint to remove a product from the system.

Operation ID: `delete-product-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `productId` | path | string | Yes | ID or the slug of the product that needs to be returned |
| `locationId` | query | string | Yes | location Id |
| `sendWishlistStatus` | query | boolean | No | Parameter which will decide whether to show the wishlisting status of products |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### PUT `/products/{productId}`

Update Product by ID

The "Update Product by ID" API allows modifying information for a specific product using its unique identifier. Use this endpoint to update details for a single product based on the provided product ID.

Operation ID: `update-product-by-id`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `productId` | path | string | Yes | ID or the slug of the product that needs to be returned |

**Request Body (required):**

Content-Type: `application/json`

Schema: `UpdateProductDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the product. |
| `locationId` | string | Yes | The unique identifier for the location. |
| `description` | string | No | A brief description of the product. |
| `productType` | string (enum: DIGITAL, PHYSICAL, SERVICE, PHYSICAL/DIGITAL) | Yes | - |
| `image` | string | No | The URL for the product image. |
| `statementDescriptor` | string | No | The statement descriptor for the product. |
| `availableInStore` | boolean | No | Indicates whether the product is available in-store. |
| `medias` | array<ProductMediaDto> | No | An array of medias for the product. |
| `variants` | array<ProductVariantDto> | No | An array of variants for the product. |
| `collectionIds` | array<string> | No | An array of category Ids for the product |
| `isTaxesEnabled` | boolean | No | Are there any taxes attached to the product. If this is true, taxes array cannot be empty. |
| `taxes` | array<string> | No | List of ids of Taxes attached to the Product. If taxes are passed, isTaxesEnabled should be true. |
| `automaticTaxCategoryId` | string | No | Tax category ID for Automatic taxes calculation. |
| `isLabelEnabled` | boolean | No | Is the product label enabled. If this is true, label object cannot be empty. |
| `label` | object | No | Details for Product Label |
| `slug` | string | No | The slug using which the product navigation will be handled |
| `seo` | object | No | SEO data for the product that will be displayed in the preview |
| `taxInclusive` | boolean | No | Whether the taxes should be included in the purchase price |
| `prices` | array<string> | No | The prices of the product |


**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### POST `/products/`

Create Product

The "Create Product" API allows adding a new product to the system. Use this endpoint to create a product with the specified details. Ensure that the required information is provided in the request payload.

Operation ID: `create-product`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |

**Request Body (required):**

Content-Type: `application/json`

Schema: `CreateProductDto`

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the product. |
| `locationId` | string | Yes | The unique identifier for the location. |
| `description` | string | No | A brief description of the product. |
| `productType` | string (enum: DIGITAL, PHYSICAL, SERVICE, PHYSICAL/DIGITAL) | Yes | - |
| `image` | string | No | The URL for the product image. |
| `statementDescriptor` | string | No | The statement descriptor for the product. |
| `availableInStore` | boolean | No | Indicates whether the product is available in-store. |
| `medias` | array<ProductMediaDto> | No | An array of medias for the product. |
| `variants` | array<ProductVariantDto> | No | An array of variants for the product. |
| `collectionIds` | array<string> | No | An array of category Ids for the product |
| `isTaxesEnabled` | boolean | No | Are there any taxes attached to the product. If this is true, taxes array cannot be empty. |
| `taxes` | array<string> | No | List of ids of Taxes attached to the Product. If taxes are passed, isTaxesEnabled should be true. |
| `automaticTaxCategoryId` | string | No | Tax category ID for Automatic taxes calculation. |
| `isLabelEnabled` | boolean | No | Is the product label enabled. If this is true, label object cannot be empty. |
| `label` | object | No | Details for Product Label |
| `slug` | string | No | The slug using which the product navigation will be handled |
| `seo` | object | No | SEO data for the product that will be displayed in the preview |
| `taxInclusive` | boolean | No | Whether the taxes should be included in the purchase price |


**Responses:**

- `201`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

### GET `/products/`

List Products

The "List Products" API allows to retrieve a paginated list of products. Customize your results by filtering products based on name or paginate through the list using the provided query parameters. This endpoint provides a straightforward way to explore and retrieve product information.

Operation ID: `list-invoices`

**Parameters:**

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Version` | header | string | Yes | API Version |
| `limit` | query | number | No | The maximum number of items to be included in a single page of results |
| `offset` | query | number | No | The starting index of the page, indicating the position from which the results should be retrieved. |
| `locationId` | query | string | Yes | LocationId is the id of the sub-account |
| `search` | query | string | No | The name of the product for searching. |
| `collectionIds` | query | string | No | Filter by product category Ids. Supports comma separated values |
| `collectionSlug` | query | string | No | The slug value of the collection by which the collection would be searched |
| `expand` | query | array | No | Name of an entity whose data has to be fetched along with product. Possible entities are tax, stripe and paypal. If not mentioned, only ID will be returned in case of taxes |
| `productIds` | query | array | No | List of product ids to be fetched. |
| `storeId` | query | string | No | fetch and project products based on the storeId |
| `includedInStore` | query | boolean | No | Separate products by which are included in the store and which are not |
| `availableInStore` | query | boolean | No | If the product is included in the online store |
| `sortOrder` | query | string | No | The order of sort which should be applied for the date |

**Responses:**

- `200`: Successful response
- `400`: Bad Request
- `401`: Unauthorized
- `422`: Unprocessable Entity

---

## Schemas

### BulkUpdateFilters

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `collectionIds` | array<string> | No | Filter by collection IDs |
| `productType` | string | No | Filter by product type |
| `availableInStore` | boolean | No | Filter by availability status |
| `search` | string | No | Filter by search term |


### PriceUpdateField

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `type` | string (enum: INCREASE_BY_AMOUNT, REDUCE_BY_AMOUNT, SET_NEW_PRICE, INCREASE_BY_PERCENTAGE, REDUCE_BY_PERCENTAGE) | Yes | Type of price update |
| `value` | number | Yes | Value to update (amount or percentage based on type) |
| `roundToWhole` | boolean | No | Round to nearest whole number |


### BulkUpdateDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `type` | string (enum: bulk-update-price, bulk-update-availability, bulk-update-product-collection, bulk-delete-products, bulk-update-currency) | Yes | Type of bulk update operation |
| `productIds` | array<string> | Yes | Array of product IDs |
| `filters` | object | No | Filters to apply when selectAll is true |
| `price` | object | No | Price update configuration |
| `compareAtPrice` | object | No | Compare at price update configuration |
| `availability` | boolean | No | New availability status |
| `collectionIds` | array<string> | No | Array of collection IDs |
| `currency` | string | No | Currency code |


### BulkUpdateResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |


### WeightOptionsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `value` | number | Yes | Actual weight of the product |
| `unit` | string (enum: kg, lb, g, oz) | Yes | Weight unit of the product |


### PriceDimensionsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `height` | number | Yes | Height of the price |
| `width` | number | Yes | Width of the price |
| `length` | number | Yes | Length of the price |
| `unit` | string (enum: cm, in, m) | Yes | Unit of the price dimensions |


### ShippingOptionsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `weight` | object | No | Weight options of the product |
| `dimensions` | object | No | Dimensions of the product |


### RecurringDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `interval` | string (enum: day, month, week, year) | Yes | The interval at which the recurring event occurs. |
| `intervalCount` | number | Yes | The number of intervals between each occurrence of the event. |


### BulkEditPriceDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Price ID |
| `name` | string | No | Price name |
| `amount` | number | No | Price amount |
| `currency` | string | No | Price currency |
| `compareAtPrice` | number | No | Compare at price |
| `availableQuantity` | number | No | Available quantity |
| `trackInventory` | boolean | No | Track inventory |
| `allowOutOfStockPurchases` | boolean | No | Allow out of stock purchases |
| `sku` | string | No | SKU |
| `trialPeriod` | number | No | Trial period in days |
| `totalCycles` | number | No | Total billing cycles |
| `setupFee` | number | No | Setup fee |
| `shippingOptions` | object | No | Shipping options |
| `recurring` | object | No | Recurring details |


### ProductSEODto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | SEO title |
| `description` | string | No | SEO description |


### BulkEditProductDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | Product ID |
| `name` | string | No | Product name |
| `description` | string | No | Product description |
| `image` | string | No | Product image |
| `availableInStore` | boolean | No | Product availability in store |
| `prices` | array<BulkEditPriceDto> | No | Array of price variants for the product |
| `collectionIds` | array<string> | No | Collection IDs |
| `isLabelEnabled` | boolean | No | Enable product label |
| `isTaxesEnabled` | boolean | No | Enable taxes |
| `seo` | object | No | SEO metadata for the product |
| `slug` | string | No | Product URL slug |
| `automaticTaxCategoryId` | string | No | Automatic tax category ID |
| `taxInclusive` | boolean | No | Tax inclusive pricing |
| `taxes` | array<object> | No | Product taxes |
| `medias` | array<object> | No | Product media |
| `label` | object | No | Product label |


### BulkEditRequestDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `products` | array<BulkEditProductDto> | Yes | Array of products to update. Note: The total count includes all prices within each product. |


### BulkEditResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `message` | string | Yes | Success message |
| `status` | boolean | Yes | Operation status |
| `updatedCount` | number | Yes | Number of products updated |


### MembershipOfferDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `label` | string | Yes | Membership offer label |
| `value` | string | Yes | Membership offer label |
| `_id` | string | Yes | The unique identifier for the membership offer. |


### PriceMetaDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `source` | string (enum: stripe, woocommerce, shopify) | Yes | The source of the price. |
| `sourceId` | string | No | The id of the source of the price from where it is imported |
| `stripePriceId` | string | Yes | The Stripe price ID associated with the price. |
| `internalSource` | string (enum: agency_plan, funnel, membership, communities, gokollab, calendar) | Yes | The internal source of the price. |


### CreatePriceDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the price. |
| `type` | string (enum: one_time, recurring) | Yes | The type of the price. |
| `currency` | string | Yes | The currency of the price. |
| `amount` | number | Yes | The amount of the price. ( min: 0 ) |
| `recurring` | object | No | The recurring details of the price (if type is recurring). |
| `description` | string | No | A brief description of the price. |
| `membershipOffers` | array<MembershipOfferDto> | No | An array of membership offers associated with the price. |
| `trialPeriod` | number | No | The trial period duration in days (if applicable). |
| `totalCycles` | number | No | The total number of billing cycles for the price. ( min: 1 ) |
| `setupFee` | number | No | The setup fee for the price. |
| `variantOptionIds` | array<string> | No | An array of variant option IDs associated with the price. |
| `compareAtPrice` | number | No | The compare at price for the price. |
| `locationId` | string | Yes | The unique identifier of the location associated with the price. |
| `userId` | string | No | The unique identifier of the user who created the price. |
| `meta` | object | No | Additional metadata associated with the price. |
| `trackInventory` | boolean | No | Need to track inventory stock quantity |
| `availableQuantity` | number | No | Available inventory stock quantity |
| `allowOutOfStockPurchases` | boolean | No | Continue selling when out of stock |
| `sku` | string | No | The unique identifier of the SKU associated with the price |
| `shippingOptions` | object | No | Shipping options of the Price |
| `isDigitalProduct` | boolean | No | Is the product a digital product |
| `digitalDelivery` | array<string> | No | Digital delivery options |


### CreatePriceResponseDto

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


### ListPricesResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `prices` | array<DefaultPriceResponseDto> | Yes | An array of prices |
| `total` | number | Yes | - |


### InventoryItemDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the price |
| `name` | string | Yes | Name of the price/variant |
| `availableQuantity` | number | Yes | Available quantity in inventory |
| `sku` | string | Yes | SKU for the product variant |
| `allowOutOfStockPurchases` | boolean | Yes | Whether out of stock purchases are allowed |
| `product` | string | Yes | Product ID this price belongs to |
| `updatedAt` | string | Yes | Last update timestamp |
| `image` | string | No | Product image URL |
| `productName` | string | No | Product name |


### GetInventoryResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `inventory` | array<InventoryItemDto> | Yes | List of inventory items |
| `total` | object | Yes | Total count of inventory items |


### UpdateInventoryItemDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `priceId` | string | Yes | The unique identifier for the price, in MongoDB ID format. |
| `availableQuantity` | number | No | The available quantity of the item. |
| `allowOutOfStockPurchases` | boolean | No | Whether to continue selling the item when out of stock. |


### UpdateInventoryDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `items` | array<UpdateInventoryItemDto> | Yes | Array of items to update in the inventory. |


### UpdateInventoryResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |


### GetPriceResponseDto

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


### UpdatePriceDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the price. |
| `type` | string (enum: one_time, recurring) | Yes | The type of the price. |
| `currency` | string | Yes | The currency of the price. |
| `amount` | number | Yes | The amount of the price. ( min: 0 ) |
| `recurring` | object | No | The recurring details of the price (if type is recurring). |
| `description` | string | No | A brief description of the price. |
| `membershipOffers` | array<MembershipOfferDto> | No | An array of membership offers associated with the price. |
| `trialPeriod` | number | No | The trial period duration in days (if applicable). |
| `totalCycles` | number | No | The total number of billing cycles for the price. ( min: 1 ) |
| `setupFee` | number | No | The setup fee for the price. |
| `variantOptionIds` | array<string> | No | An array of variant option IDs associated with the price. |
| `compareAtPrice` | number | No | The compare at price for the price. |
| `locationId` | string | Yes | The unique identifier of the location associated with the price. |
| `userId` | string | No | The unique identifier of the user who created the price. |
| `meta` | object | No | Additional metadata associated with the price. |
| `trackInventory` | boolean | No | Need to track inventory stock quantity |
| `availableQuantity` | number | No | Available inventory stock quantity |
| `allowOutOfStockPurchases` | boolean | No | Continue selling when out of stock |
| `sku` | string | No | The unique identifier of the SKU associated with the price |
| `shippingOptions` | object | No | Shipping options of the Price |
| `isDigitalProduct` | boolean | No | Is the product a digital product |
| `digitalDelivery` | array<string> | No | Digital delivery options |


### UpdatePriceResponseDto

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


### DeletePriceResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | returns true if the price is successfully deleted |


### GetProductStatsResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `totalProducts` | number | Yes | Total number of products |
| `includedInStore` | number | Yes | Number of products included in the store |
| `excludedFromStore` | number | Yes | Number of products excluded from the store |


### UpdateProductStoreDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `action` | string (enum: include, exclude) | Yes | Action to include or exclude the product from the store |
| `productIds` | array<string> | Yes | Array of product IDs |


### UpdateProductStoreResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |


### UpdateDisplayPriorityBodyDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `products` | array<array> | Yes | Array of products with their display priorities |


### ListCollectionResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | array<array> | Yes | Array of Collections |
| `total` | number | Yes | The total count of the collections present, which is useful to calculate the pagination |


### ProductCategories

| Property | Type | Required | Description |
|----------|------|----------|-------------|


### DefaultCollectionResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | object | Yes | Collection Data |
| `status` | boolean | Yes | Status of the operation |


### CollectionSEODto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | No | The title which will be displayed as an SEO format |
| `description` | string | No | The description which would be displayed in preview purposes |


### CreateProductCollectionsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | The type of alt. For now it is only LOCATION |
| `collectionId` | string | No | Unique Identifier of the Product Collection, Mongo Id |
| `name` | string | Yes | Name of the Product Collection |
| `slug` | string | Yes | Slug of the Product Collection which helps in navigation |
| `image` | string | No | The URL of the image that is going to be displayed as the collection Thumbnail |
| `seo` | object | No | The metadata information which will be displayed in SEO previews |


### CollectionSchema

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the collection |
| `altId` | string | Yes | Location Id to which the collection is associated |
| `name` | string | Yes | Name of the collection |
| `slug` | string | Yes | Slug of the collection with which navigation is established. Special Characters and spacing is not allowed and should be unique |
| `image` | string | Yes | The URL of the image that is going to be displayed as the collection Thumbnail |
| `seo` | object | Yes | The information which will be displayed in SEO previews |
| `createdAt` | string | Yes | Date at which the collection was created |


### CreateCollectionResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | object | Yes | created Collection |


### UpdateProductCollectionsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id |
| `altType` | string (enum: location) | Yes | The type of alt. For now it is only LOCATION |
| `name` | string | No | Name of the Product Collection |
| `slug` | string | No | Slug of the Product Collection which helps in navigation |
| `image` | string | No | The URL of the image that is going to be displayed as the collection Thumbnail |
| `seo` | object | No | The metadata information which will be displayed in SEO previews |


### UpdateProductCollectionResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |


### DeleteProductCollectionResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |


### ListProductReviewsResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | array<array> | Yes | Array of Collections |
| `total` | number | Yes | The total count of the collections present, which is useful to calculate the pagination |


### CountReviewsByStatusResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `data` | array<array> | Yes | Array of review status counts |


### UserDetailsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | Name of the customer |
| `email` | string | Yes | Email of the customer |
| `phone` | string | No | Phone no of the customer |
| `isCustomer` | boolean | No | Is the person an admin or customer |


### ProductReviewDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `headline` | string | Yes | Headline of the Review |
| `comment` | string | Yes | Detailed Review of the product |
| `user` | object | Yes | User who is giving the review/reply |


### UpdateProductReviewDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `productId` | string | Yes | Product Id |
| `status` | string | Yes | Status of the review |
| `reply` | array<ProductReviewDto> | No | Reply of the review |
| `rating` | number | No | Rating of the product |
| `headline` | string | No | Headline of the Review |
| `detail` | string | No | Detailed Review of the product |


### UpdateProductReviewsResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |


### UpdateProductReviewObjectDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `reviewId` | string | Yes | Review Id |
| `productId` | string | Yes | Product Id |
| `storeId` | string | Yes | Store Id |


### UpdateProductReviewsDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `altId` | string | Yes | Location Id or Agency Id |
| `altType` | string (enum: location) | Yes | - |
| `reviews` | array<UpdateProductReviewObjectDto> | Yes | Array of Product Reviews |
| `status` | object | Yes | Status of the review |


### DeleteProductReviewResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | Status of api action |
| `message` | string | No | Success message |


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


### ProductLabelDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `title` | string | Yes | The content for the product label. |
| `startDate` | string | No | Start date in YYYY-MM-DDTHH:mm:ssZ format |
| `endDate` | string | No | Start date in YYYY-MM-DDTHH:mm:ssZ format |


### GetProductResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the product. |
| `description` | string | No | product description |
| `variants` | array<ProductVariantDto> | No | An array of variants for the product. |
| `locationId` | string | Yes | The unique identifier for the location. |
| `name` | string | Yes | The name of the product. |
| `productType` | string | Yes | The type of the product (e.g., PHYSICAL). |
| `availableInStore` | boolean | No | Indicates whether the product is available in-store. |
| `createdAt` | string | Yes | The creation timestamp of the product. |
| `updatedAt` | string | Yes | The last update timestamp of the product. |
| `statementDescriptor` | string | No | The statement descriptor for the product. |
| `image` | string | No | The URL for the product image. |
| `collectionIds` | array<string> | No | An array of category Ids for the product |
| `isTaxesEnabled` | boolean | No | The field indicates whether taxes are enabled for the product or not. |
| `taxes` | array<string> | No | An array of ids of Taxes attached to the Product. If the expand query includes tax, the taxes will be of type `ProductTaxDto`. Please refer to the `ProductTaxDto` for additional details. |
| `automaticTaxCategoryId` | string | No | Tax category ID for Automatic taxes calculation. |
| `label` | object | No | The Product label details |
| `slug` | string | No | The slug of the product by which the product will be navigated |


### DeleteProductResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `status` | boolean | Yes | returns true if the product is successfully deleted |


### ProductMediaDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `id` | string | Yes | The unique identifier for the media. |
| `title` | string | No | The title of the media file. |
| `url` | string | Yes | The URL where the media file is stored. |
| `type` | string (enum: image, video) | Yes | The type of the media file (e.g., image, video will be supporting soon). |
| `isFeatured` | boolean | No | Indicates whether the media is featured. |
| `priceIds` | array<array> | No | Mongo ObjectIds of the prices for which the media is assigned |


### CreateProductDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the product. |
| `locationId` | string | Yes | The unique identifier for the location. |
| `description` | string | No | A brief description of the product. |
| `productType` | string (enum: DIGITAL, PHYSICAL, SERVICE, PHYSICAL/DIGITAL) | Yes | - |
| `image` | string | No | The URL for the product image. |
| `statementDescriptor` | string | No | The statement descriptor for the product. |
| `availableInStore` | boolean | No | Indicates whether the product is available in-store. |
| `medias` | array<ProductMediaDto> | No | An array of medias for the product. |
| `variants` | array<ProductVariantDto> | No | An array of variants for the product. |
| `collectionIds` | array<string> | No | An array of category Ids for the product |
| `isTaxesEnabled` | boolean | No | Are there any taxes attached to the product. If this is true, taxes array cannot be empty. |
| `taxes` | array<string> | No | List of ids of Taxes attached to the Product. If taxes are passed, isTaxesEnabled should be true. |
| `automaticTaxCategoryId` | string | No | Tax category ID for Automatic taxes calculation. |
| `isLabelEnabled` | boolean | No | Is the product label enabled. If this is true, label object cannot be empty. |
| `label` | object | No | Details for Product Label |
| `slug` | string | No | The slug using which the product navigation will be handled |
| `seo` | object | No | SEO data for the product that will be displayed in the preview |
| `taxInclusive` | boolean | No | Whether the taxes should be included in the purchase price |


### CreateProductResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the product. |
| `description` | string | No | product description |
| `variants` | array<ProductVariantDto> | No | An array of variants for the product. |
| `locationId` | string | Yes | The unique identifier for the location. |
| `name` | string | Yes | The name of the product. |
| `productType` | string | Yes | The type of the product (e.g., PHYSICAL). |
| `availableInStore` | boolean | No | Indicates whether the product is available in-store. |
| `createdAt` | string | Yes | The creation timestamp of the product. |
| `updatedAt` | string | Yes | The last update timestamp of the product. |
| `statementDescriptor` | string | No | The statement descriptor for the product. |
| `image` | string | No | The URL for the product image. |
| `collectionIds` | array<string> | No | An array of category Ids for the product |
| `isTaxesEnabled` | boolean | No | The field indicates whether taxes are enabled for the product or not. |
| `taxes` | array<string> | No | An array of ids of Taxes attached to the Product. If the expand query includes tax, the taxes will be of type `ProductTaxDto`. Please refer to the `ProductTaxDto` for additional details. |
| `automaticTaxCategoryId` | string | No | Tax category ID for Automatic taxes calculation. |
| `label` | object | No | The Product label details |
| `slug` | string | No | The slug of the product by which the product will be navigated |


### UpdateProductDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | string | Yes | The name of the product. |
| `locationId` | string | Yes | The unique identifier for the location. |
| `description` | string | No | A brief description of the product. |
| `productType` | string (enum: DIGITAL, PHYSICAL, SERVICE, PHYSICAL/DIGITAL) | Yes | - |
| `image` | string | No | The URL for the product image. |
| `statementDescriptor` | string | No | The statement descriptor for the product. |
| `availableInStore` | boolean | No | Indicates whether the product is available in-store. |
| `medias` | array<ProductMediaDto> | No | An array of medias for the product. |
| `variants` | array<ProductVariantDto> | No | An array of variants for the product. |
| `collectionIds` | array<string> | No | An array of category Ids for the product |
| `isTaxesEnabled` | boolean | No | Are there any taxes attached to the product. If this is true, taxes array cannot be empty. |
| `taxes` | array<string> | No | List of ids of Taxes attached to the Product. If taxes are passed, isTaxesEnabled should be true. |
| `automaticTaxCategoryId` | string | No | Tax category ID for Automatic taxes calculation. |
| `isLabelEnabled` | boolean | No | Is the product label enabled. If this is true, label object cannot be empty. |
| `label` | object | No | Details for Product Label |
| `slug` | string | No | The slug using which the product navigation will be handled |
| `seo` | object | No | SEO data for the product that will be displayed in the preview |
| `taxInclusive` | boolean | No | Whether the taxes should be included in the purchase price |
| `prices` | array<string> | No | The prices of the product |


### UpdateProductResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the product. |
| `description` | string | No | product description |
| `variants` | array<ProductVariantDto> | No | An array of variants for the product. |
| `locationId` | string | Yes | The unique identifier for the location. |
| `name` | string | Yes | The name of the product. |
| `productType` | string | Yes | The type of the product (e.g., PHYSICAL). |
| `availableInStore` | boolean | No | Indicates whether the product is available in-store. |
| `createdAt` | string | Yes | The creation timestamp of the product. |
| `updatedAt` | string | Yes | The last update timestamp of the product. |
| `statementDescriptor` | string | No | The statement descriptor for the product. |
| `image` | string | No | The URL for the product image. |
| `collectionIds` | array<string> | No | An array of category Ids for the product |
| `isTaxesEnabled` | boolean | No | The field indicates whether taxes are enabled for the product or not. |
| `taxes` | array<string> | No | An array of ids of Taxes attached to the Product. If the expand query includes tax, the taxes will be of type `ProductTaxDto`. Please refer to the `ProductTaxDto` for additional details. |
| `automaticTaxCategoryId` | string | No | Tax category ID for Automatic taxes calculation. |
| `label` | object | No | The Product label details |
| `slug` | string | No | The slug of the product by which the product will be navigated |


### DefaultProductResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `_id` | string | Yes | The unique identifier for the product. |
| `description` | string | No | product description |
| `variants` | array<ProductVariantDto> | No | An array of variants for the product. |
| `locationId` | string | Yes | The unique identifier for the location. |
| `name` | string | Yes | The name of the product. |
| `productType` | string | Yes | The type of the product (e.g., PHYSICAL). |
| `availableInStore` | boolean | No | Indicates whether the product is available in-store. |
| `createdAt` | string | Yes | The creation timestamp of the product. |
| `updatedAt` | string | Yes | The last update timestamp of the product. |
| `statementDescriptor` | string | No | The statement descriptor for the product. |
| `image` | string | No | The URL for the product image. |
| `collectionIds` | array<string> | No | An array of category Ids for the product |
| `isTaxesEnabled` | boolean | No | The field indicates whether taxes are enabled for the product or not. |
| `taxes` | array<string> | No | An array of ids of Taxes attached to the Product. If the expand query includes tax, the taxes will be of type `ProductTaxDto`. Please refer to the `ProductTaxDto` for additional details. |
| `automaticTaxCategoryId` | string | No | Tax category ID for Automatic taxes calculation. |
| `label` | object | No | The Product label details |
| `slug` | string | No | The slug of the product by which the product will be navigated |


### ListProductsStats

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `total` | number | Yes | Total number of products |


### ListProductsResponseDto

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `products` | array<DefaultProductResponseDto> | Yes | An array of products |
| `total` | array<ListProductsStats> | Yes | list products status |


