# Frontend-Backend Integration Guide

## Overview
هذا الدليل يوضح كيفية ربط جميع صفحات الـ Frontend مع الـ Backend APIs بشكل صحيح.

---

## 1. Packages Page (`/packages`)

### Frontend Component
`frontend/src/views/Packages.vue`

### Required Data
- **Restaurant Packages** (5 items)
- **Cafe Packages** (3 items)

### API Integration

```typescript
// Get all packages
const packages = await productsApi.getAll({ 
  type: 'restaurant', // or 'cafe'
  is_active: true 
})

// Book a package
const booking = await bookingsApi.create({
  product_id: pkg.id,
  booking_type: pkg.type,
  booking_date: '2024-03-01T19:00:00',
  guests: 2,
  total_price: pkg.price * guests,
  guest_name: 'John Doe',
  guest_email: 'john@example.com',
  guest_phone: '+201234567890'
})
```

### Database Products
| ID | Name | Type | Price |
|----|------|------|-------|
| 1 | Pizza Night Offer | restaurant | 250 EGP |
| 2 | Candlelight Beach Dinner | restaurant | 650 EGP |
| 3 | Sunset Romantic Setup | restaurant | 800 EGP |
| 4 | Romantic Dinner for Two | restaurant | 500 EGP |
| 5 | Pasta + Drink Combo | restaurant | 180 EGP |
| 6 | Morning Coffee Package | cafe | 80 EGP |
| 7 | Sunset Drink Offer | cafe | 120 EGP |
| 8 | Hookah & Lounge | cafe | 150 EGP |

---

## 2. Activities Page (`/activities`)

### Frontend Component
`frontend/src/views/Activities.vue`

### Required Data
- **Water Sports** (6 items)
- **Beach Entry** (3 items)

### API Integration

```typescript
// Get all activities
const activities = await productsApi.getAll({ 
  is_active: true 
})

// Filter by type
const waterSports = activities.filter(a => a.type === 'water_sports')
const beachEntry = activities.filter(a => a.type === 'beach_entry')

// Book an activity
const booking = await bookingsApi.create({
  product_id: activity.id,
  booking_type: activity.type,
  booking_date: '2024-03-01T10:00:00',
  guests: 2,
  total_price: activity.price * guests,
  guest_name: 'John Doe',
  guest_email: 'john@example.com',
  guest_phone: '+201234567890'
})
```

### Database Products
| ID | Name | Type | Price |
|----|------|------|-------|
| 9 | Jet Ski Adventure | water_sports | 200 EGP |
| 10 | Parasailing Experience | water_sports | 300 EGP |
| 11 | Banana Boat Ride | water_sports | 150 EGP |
| 12 | Snorkeling Trip | water_sports | 250 EGP |
| 13 | Scuba Diving | water_sports | 400 EGP |
| 14 | Kayaking | water_sports | 100 EGP |
| 15 | Beach Day Pass | beach_entry | 100 EGP |
| 16 | VIP Beach Cabana | beach_entry | 500 EGP |
| 17 | Family Beach Package | beach_entry | 300 EGP |

---

## 3. Events Page (`/events`)

### Frontend Component
`frontend/src/views/Events.vue`

### Required Data
- **Wedding Events**
- **Corporate Events**
- **Birthday Parties**
- **Special Occasions**
- **Yoga Classes**
- **Zumba Classes**

### API Integration

```typescript
// Get all events
const events = await eventsApi.getAll({ 
  is_active: true 
})

// Filter by category
const weddings = await eventsApi.getAll({ 
  category: 'wedding',
  is_active: true 
})

// Book an event
const booking = await bookingsApi.create({
  event_id: event.id,
  booking_type: 'event',
  booking_date: '2024-03-15T18:00:00',
  guests: 50,
  total_price: event.price,
  guest_name: 'John Doe',
  guest_email: 'john@example.com',
  guest_phone: '+201234567890',
  special_requests: 'Need DJ and photographer'
})
```

### Database Events
| ID | Name | Category | Price |
|----|------|----------|-------|
| 1 | Wedding Celebration | wedding | 5000 EGP |
| 2 | Corporate Event | corporate | 3000 EGP |
| 3 | Birthday Party | birthday | 1500 EGP |
| 4 | Special Occasion | special | 2000 EGP |
| 5 | Morning Yoga | yoga | 25 EGP |
| 6 | Evening Zumba | zumba | 20 EGP |

---

## 4. Restaurant Page (`/restaurant`)

### Frontend Component
`frontend/src/views/Restaurant.vue`

### Integration
يستخدم نفس الـ products API مع `type=restaurant`

```typescript
const restaurantOffers = await productsApi.getAll({ 
  type: 'restaurant',
  is_active: true 
})
```

---

## 5. Rooms Page (`/rooms`)

### Frontend Component
`frontend/src/views/Rooms.vue`

### API Integration

```typescript
// Get all rooms
const rooms = await roomsApi.getAll({ 
  is_available: true 
})

// Filter by type
const deluxeRooms = await roomsApi.getAll({ 
  room_type: 'deluxe',
  is_available: true 
})

// Book a room
const booking = await bookingsApi.create({
  room_id: room.id,
  booking_type: 'room',
  check_in: '2024-03-01',
  check_out: '2024-03-05',
  guests: 2,
  total_price: room.price_per_night * nights,
  guest_name: 'John Doe',
  guest_email: 'john@example.com',
  guest_phone: '+201234567890'
})
```

---

## API Client Setup

### Create API Client (`frontend/src/api/client.ts`)

```typescript
import axios from 'axios'

const apiClient = axios.create({
  baseURL: import.meta.env.VITE_API_URL || 'http://localhost:8000/api',
  headers: {
    'Content-Type': 'application/json'
  }
})

// Add auth token if exists
apiClient.interceptors.request.use(config => {
  const token = localStorage.getItem('token')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

export default apiClient
```

### Products API (`frontend/src/api/products.ts`)

```typescript
import apiClient from './client'

export const productsApi = {
  getAll: async (params?: { type?: string; is_active?: boolean }) => {
    const { data } = await apiClient.get('/products', { params })
    return data
  },
  
  getById: async (id: number) => {
    const { data } = await apiClient.get(`/products/${id}`)
    return data
  }
}
```

### Events API (`frontend/src/api/events.ts`)

```typescript
import apiClient from './client'

export const eventsApi = {
  getAll: async (params?: { category?: string; is_active?: boolean }) => {
    const { data } = await apiClient.get('/events', { params })
    return data
  },
  
  getById: async (id: number) => {
    const { data } = await apiClient.get(`/events/${id}`)
    return data
  }
}
```

### Bookings API (`frontend/src/api/bookings.ts`)

```typescript
import apiClient from './client'

export const bookingsApi = {
  create: async (bookingData: any) => {
    const { data } = await apiClient.post('/bookings', bookingData)
    return data
  },
  
  getMyBookings: async () => {
    const { data } = await apiClient.get('/bookings/my-bookings')
    return data
  }
}
```

---

## Environment Variables

### Frontend (`.env`)
```env
VITE_API_URL=http://localhost:8000/api
VITE_WHATSAPP_NUMBER=+201234567890
```

### Backend (`.env`)
```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=alkhayma_db
DB_USER=postgres
DB_PASSWORD=your_password
SECRET_KEY=your_secret_key
```

---

## Setup Instructions

### 1. Setup Backend

```bash
cd backend

# Install dependencies
pip install -r requirements.txt

# Setup database
psql -U postgres -c "CREATE DATABASE alkhayma_db;"

# Run migrations
psql -U postgres -d alkhayma_db -f migrations/create_events_table.sql

# Seed database
./seed_database.sh

# Start server
uvicorn main:app --reload
```

### 2. Setup Frontend

```bash
cd frontend

# Install dependencies
npm install

# Start dev server
npm run dev
```

### 3. Test Integration

```bash
# Test products API
curl http://localhost:8000/api/products?type=restaurant

# Test events API
curl http://localhost:8000/api/events?category=wedding

# Test booking
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

---

## Booking Flow

### 1. User selects product/event
```typescript
function bookPackage(pkg: Product) {
  selectedProduct.value = pkg
  showBookingModal.value = true
}
```

### 2. User fills booking form
- Name
- Email
- Phone
- Date & Time
- Number of guests
- Special requests (optional)

### 3. Submit booking
```typescript
async function confirmBooking() {
  try {
    const booking = await bookingsApi.create({
      product_id: selectedProduct.value.id,
      booking_type: selectedProduct.value.type,
      booking_date: bookingDate.value,
      guests: guestCount.value,
      total_price: calculateTotal(),
      guest_name: guestInfo.name,
      guest_email: guestInfo.email,
      guest_phone: guestInfo.phone,
      special_requests: specialRequests.value
    })
    
    // Show success message
    showSuccessModal.value = true
    lastBookingId.value = booking.id
  } catch (error) {
    // Show error message
    alert('Booking failed. Please try again.')
  }
}
```

### 4. Show confirmation
- Display booking ID
- Send confirmation email (backend)
- Show success message

---

## Testing Checklist

- [ ] Packages page loads restaurant packages
- [ ] Packages page loads cafe packages
- [ ] Activities page loads water sports
- [ ] Activities page loads beach entry
- [ ] Events page loads all event categories
- [ ] Restaurant page loads offers
- [ ] Rooms page loads available rooms
- [ ] Booking modal opens correctly
- [ ] Booking form validation works
- [ ] Booking submission succeeds
- [ ] Success modal shows booking ID
- [ ] Error handling works properly

---

## Troubleshooting

### Issue: Products not loading
**Solution:** Check if backend is running and database is seeded
```bash
curl http://localhost:8000/api/products
```

### Issue: CORS errors
**Solution:** Add CORS middleware in backend
```python
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

### Issue: Booking fails
**Solution:** Check booking schema and required fields
```bash
# Check backend logs
tail -f backend/logs/app.log
```

---

## Next Steps

1. ✅ Run database seeding: `./backend/seed_database.sh`
2. ✅ Test all API endpoints
3. ✅ Update frontend to use real API
4. ✅ Test booking flow end-to-end
5. ✅ Add error handling
6. ✅ Add loading states
7. ✅ Add success/error notifications
8. ✅ Test on mobile devices
