# El Kheima Beach Resort - API Endpoints Documentation

## Base URL
```
http://localhost:8000/api
```

## Authentication
Most endpoints require JWT token in Authorization header:
```
Authorization: Bearer <token>
```

---

## 1. Products API

### Get All Products
```http
GET /products
```

**Query Parameters:**
- `skip` (int, default: 0) - Pagination offset
- `limit` (int, default: 100) - Max results
- `type` (string, optional) - Filter by type: `restaurant`, `cafe`, `water_sports`, `beach_entry`
- `is_active` (bool, default: true) - Filter active products

**Response:**
```json
[
  {
    "id": 1,
    "name": "Pizza Night Offer",
    "name_ar": "ليلة البيتزا",
    "description": "Large Pizza + Soft Drinks + Salad",
    "description_ar": "بيتزا كبيرة + مشروبات غازية + سلطة",
    "type": "restaurant",
    "price": 250.00,
    "image_url": "https://...",
    "duration": 90,
    "is_active": true,
    "created_at": "2024-02-24T10:00:00",
    "updated_at": "2024-02-24T10:00:00"
  }
]
```

### Get Single Product
```http
GET /products/{product_id}
```

### Create Product (Admin)
```http
POST /products
```

**Body:**
```json
{
  "name": "Product Name",
  "name_ar": "اسم المنتج",
  "description": "Description",
  "description_ar": "الوصف",
  "type": "restaurant",
  "price": 100.00,
  "image_url": "https://...",
  "duration": 60,
  "is_active": true
}
```

### Update Product (Admin)
```http
PUT /products/{product_id}
```

### Delete Product (Admin)
```http
DELETE /products/{product_id}
```

---

## 2. Events API

### Get All Events
```http
GET /events
```

**Query Parameters:**
- `skip` (int, default: 0) - Pagination offset
- `limit` (int, default: 100) - Max results
- `category` (string, optional) - Filter by category: `wedding`, `corporate`, `birthday`, `special`, `yoga`, `zumba`
- `is_active` (bool, default: true) - Filter active events

**Response:**
```json
[
  {
    "id": 1,
    "name": "Wedding Celebration",
    "name_ar": "حفل زفاف",
    "description": "Celebrate your special day...",
    "description_ar": "احتفل بيومك الخاص...",
    "category": "wedding",
    "price": 5000.00,
    "image_url": "https://...",
    "duration": 300,
    "schedule_time": null,
    "schedule_days": null,
    "max_guests": 200,
    "location": "Private Beach",
    "location_ar": "الشاطئ الخاص",
    "is_active": true,
    "created_at": "2024-02-24T10:00:00",
    "updated_at": "2024-02-24T10:00:00"
  }
]
```

### Get Single Event
```http
GET /events/{event_id}
```

### Create Event (Admin)
```http
POST /events
```

### Update Event (Admin)
```http
PUT /events/{event_id}
```

### Delete Event (Admin)
```http
DELETE /events/{event_id}
```

---

## 3. Bookings API

### Create Booking
```http
POST /bookings
```

**Body:**
```json
{
  "product_id": 1,
  "booking_type": "restaurant",
  "booking_date": "2024-03-01T19:00:00",
  "guests": 2,
  "total_price": 500.00,
  "guest_name": "John Doe",
  "guest_email": "john@example.com",
  "guest_phone": "+201234567890",
  "special_requests": "Window seat please"
}
```

**Response:**
```json
{
  "id": 123,
  "product_id": 1,
  "booking_type": "restaurant",
  "booking_date": "2024-03-01T19:00:00",
  "guests": 2,
  "total_price": 500.00,
  "status": "pending",
  "guest_name": "John Doe",
  "guest_email": "john@example.com",
  "guest_phone": "+201234567890",
  "special_requests": "Window seat please",
  "created_at": "2024-02-24T10:00:00"
}
```

### Get User Bookings
```http
GET /bookings/my-bookings
```

### Get All Bookings (Admin)
```http
GET /bookings
```

**Query Parameters:**
- `skip` (int)
- `limit` (int)
- `status` (string): `pending`, `confirmed`, `cancelled`, `completed`
- `booking_type` (string)

### Update Booking Status (Admin)
```http
PUT /bookings/{booking_id}/status
```

**Body:**
```json
{
  "status": "confirmed"
}
```

---

## 4. Rooms API

### Get All Rooms
```http
GET /rooms
```

**Query Parameters:**
- `skip` (int)
- `limit` (int)
- `room_type` (string): `standard`, `deluxe`, `suite`
- `is_available` (bool)

### Get Single Room
```http
GET /rooms/{room_id}
```

### Create Room (Admin)
```http
POST /rooms
```

### Update Room (Admin)
```http
PUT /rooms/{room_id}
```

---

## 5. Reviews API

### Get All Reviews
```http
GET /reviews
```

### Create Review
```http
POST /reviews
```

**Body:**
```json
{
  "booking_id": 123,
  "rating": 5,
  "comment": "Amazing experience!",
  "comment_ar": "تجربة رائعة!"
}
```

---

## 6. Payments API

### Create Payment
```http
POST /payments
```

**Body:**
```json
{
  "booking_id": 123,
  "amount": 500.00,
  "payment_method": "credit_card",
  "transaction_id": "txn_123456"
}
```

### Get Payment Status
```http
GET /payments/{payment_id}
```

---

## Product Types

| Type | Description | Used In |
|------|-------------|---------|
| `restaurant` | Restaurant packages | Packages page |
| `cafe` | Cafe packages | Packages page |
| `water_sports` | Water sports activities | Activities page |
| `beach_entry` | Beach entry tickets | Activities page |

## Event Categories

| Category | Description | Used In |
|----------|-------------|---------|
| `wedding` | Wedding celebrations | Events page |
| `corporate` | Corporate events | Events page |
| `birthday` | Birthday parties | Events page |
| `special` | Special occasions | Events page |
| `yoga` | Yoga classes | Events page |
| `zumba` | Zumba classes | Events page |

---

## Error Responses

### 400 Bad Request
```json
{
  "detail": "Invalid input data"
}
```

### 401 Unauthorized
```json
{
  "detail": "Not authenticated"
}
```

### 404 Not Found
```json
{
  "detail": "Product not found"
}
```

### 500 Internal Server Error
```json
{
  "detail": "Internal server error"
}
```

---

## Testing Endpoints

### Test Products API
```bash
# Get all restaurant packages
curl http://localhost:8000/api/products?type=restaurant

# Get all water sports
curl http://localhost:8000/api/products?type=water_sports

# Get all cafe packages
curl http://localhost:8000/api/products?type=cafe
```

### Test Events API
```bash
# Get all wedding events
curl http://localhost:8000/api/events?category=wedding

# Get all yoga classes
curl http://localhost:8000/api/events?category=yoga
```

### Test Booking
```bash
curl -X POST http://localhost:8000/api/bookings \
  -H "Content-Type: application/json" \
  -d '{
    "product_id": 1,
    "booking_type": "restaurant",
    "booking_date": "2024-03-01T19:00:00",
    "guests": 2,
    "total_price": 500.00,
    "guest_name": "John Doe",
    "guest_email": "john@example.com",
    "guest_phone": "+201234567890"
  }'
```
