# 🚀 Backend Quick Start Guide

## Prerequisites
- Python 3.11+
- PostgreSQL 15
- Docker (optional)

## Setup Steps

### 1. Environment Setup
```bash
cd backend
cp .env.example .env
# Edit .env with your database credentials
```

### 2. Install Dependencies
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Database Setup

#### Option A: Using Docker
```bash
cd ..
docker-compose up -d postgres
```

#### Option B: Local PostgreSQL
```bash
psql -U postgres
CREATE DATABASE alkhayma_resort;
CREATE USER alkhayma_user WITH PASSWORD 'alkhayma_pass_2026';
GRANT ALL PRIVILEGES ON DATABASE alkhayma_resort TO alkhayma_user;
\q
```

### 4. Run Migrations
```bash
psql -U alkhayma_user -d alkhayma_resort -f ../database/schema.sql
psql -U alkhayma_user -d alkhayma_resort -f ../database/seed.sql
```

### 5. Start Server
```bash
uvicorn main:app --reload
```

Server will start at: http://localhost:8000

### 6. Test API
```bash
./test_api.sh
```

## API Documentation

Once running, visit:
- **Swagger UI**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login (returns JWT token)
- `GET /api/auth/me` - Get current user

### Rooms
- `GET /api/rooms` - List all rooms
- `GET /api/rooms/{id}` - Get room details
- `POST /api/rooms` - Create room (admin only)
- `PUT /api/rooms/{id}` - Update room (admin only)
- `DELETE /api/rooms/{id}` - Delete room (admin only)
- `GET /api/bookings/availability/rooms` - Check availability

### Products
- `GET /api/products` - List all products
- `GET /api/products/{id}` - Get product details
- `POST /api/products` - Create product (admin only)
- `PUT /api/products/{id}` - Update product (admin only)
- `DELETE /api/products/{id}` - Delete product (admin only)

### Bookings
- `GET /api/bookings` - List bookings
- `GET /api/bookings/{id}` - Get booking details
- `POST /api/bookings` - Create booking
- `PUT /api/bookings/{id}` - Update booking
- `DELETE /api/bookings/{id}` - Delete booking (admin only)

### Payments
- `GET /api/payments` - List payments
- `GET /api/payments/{id}` - Get payment details
- `POST /api/payments` - Create payment

### Reviews
- `GET /api/reviews` - List reviews
- `GET /api/reviews/{id}` - Get review details
- `POST /api/reviews` - Create review
- `PUT /api/reviews/{id}/approve` - Approve review (admin only)
- `DELETE /api/reviews/{id}` - Delete review

## Default Credentials

**Admin Account:**
- Email: admin@alkhayma.com
- Password: admin123

**Customer Account:**
- Email: customer@example.com
- Password: admin123

## Testing with cURL

### Register User
```bash
curl -X POST http://localhost:8000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "password123",
    "full_name": "John Doe",
    "phone": "+966501234567"
  }'
```

### Login
```bash
curl -X POST http://localhost:8000/api/auth/login \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=admin@alkhayma.com&password=admin123"
```

### Get Rooms (with token)
```bash
TOKEN="your_jwt_token_here"
curl -X GET http://localhost:8000/api/rooms \
  -H "Authorization: Bearer $TOKEN"
```

## Project Structure

```
backend/
├── app/
│   ├── api/              # API endpoints
│   │   ├── auth.py       # Authentication
│   │   ├── rooms.py      # Rooms CRUD
│   │   ├── products.py   # Products CRUD
│   │   ├── bookings.py   # Bookings CRUD
│   │   ├── payments.py   # Payments CRUD
│   │   ├── reviews.py    # Reviews CRUD
│   │   └── deps.py       # Dependencies
│   ├── core/             # Core functionality
│   │   ├── config.py     # Settings
│   │   ├── database.py   # DB connection
│   │   └── security.py   # Auth utilities
│   ├── models/           # SQLAlchemy models
│   └── schemas/          # Pydantic schemas
├── main.py               # FastAPI app
└── requirements.txt      # Dependencies
```

## Troubleshooting

### Database Connection Error
- Check PostgreSQL is running
- Verify credentials in `.env`
- Ensure database exists

### Import Errors
- Activate virtual environment
- Reinstall dependencies: `pip install -r requirements.txt`

### Port Already in Use
- Change port: `uvicorn main:app --port 8001`
- Or kill process: `lsof -ti:8000 | xargs kill`

## Next Steps

1. ✅ Backend API is ready
2. 🔄 Build Frontend (Vue 3)
3. 🤖 Integrate AI Chatbot
4. 🚀 Deploy to VPS
