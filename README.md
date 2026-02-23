# 🏖️ Al Khayma Resort Management System

A complete resort management system with bilingual support (Arabic/English) built with FastAPI, Vue 3, and PostgreSQL.

## 🚀 Features

### Core Features
- **Bilingual Support**: Full Arabic and English interface with RTL/LTR support
- **Smart Booking System**: Rooms, restaurant, cafe, activities, beach, water sports
- **User Authentication**: JWT-based secure authentication
- **Payment Integration**: Secure payment processing
- **Review System**: Customer feedback and ratings
- **Admin Dashboard**: Complete management interface
- **Responsive Design**: Mobile-first approach with Tailwind CSS

### Booking Types
1. **Room Bookings** - Hotel room reservations with date range
2. **Restaurant** - Food ordering from restaurant menu
3. **Cafe** - Beverages and snacks ordering
4. **Water Sports** - Jet ski, scuba diving, etc.
5. **Activities** - Spa, desert safari, boat tours
6. **Beach** - Beach volleyball and other beach activities

## 🛠️ Tech Stack

### Backend
- FastAPI (Python 3.11+)
- PostgreSQL 15
- SQLAlchemy ORM
- Pydantic validation
- JWT authentication
- Bcrypt password hashing

### Frontend
- Vue 3 + Composition API
- TypeScript
- Tailwind CSS
- Vue Router
- Pinia (State Management)
- Vue I18n (Internationalization)
- Axios (HTTP Client)

### DevOps
- Docker & Docker Compose
- Nginx (Production)
- PostgreSQL Container

## 📋 Prerequisites

- Docker & Docker Compose (Recommended)
- Python 3.11+ (For local development)
- Node.js 18+ (For local development)
- PostgreSQL 15 (For local development)

## 🔧 Quick Start with Docker

### 1. Clone and Setup
```bash
cd alkhayma-resort-final
```

### 2. Start All Services
```bash
docker-compose up -d
```

The services will be available at:
- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:8000
- **API Docs**: http://localhost:8000/docs
- **PostgreSQL**: localhost:5432

### 3. Initialize Database
```bash
# Database is auto-initialized with schema and seed data
# Check logs: docker-compose logs postgres
```

### 4. Access the Application
- Open http://localhost:5173
- Login with: admin@alkhayma.com / admin123

## 🔧 Manual Setup (Without Docker)

### Backend Setup
```bash
cd backend
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt

# Setup database
psql -U postgres
CREATE DATABASE alkhayma_resort;
CREATE USER alkhayma_user WITH PASSWORD 'alkhayma_pass_2026';
GRANT ALL PRIVILEGES ON DATABASE alkhayma_resort TO alkhayma_user;
\q

# Run migrations
psql -U alkhayma_user -d alkhayma_resort -f ../database/schema.sql
psql -U alkhayma_user -d alkhayma_resort -f ../database/seed.sql

# Start server
uvicorn main:app --reload
```

### Frontend Setup
```bash
cd frontend
npm install
npm run dev
```

## 📁 Project Structure

```
alkhayma-resort-final/
├── backend/                 # FastAPI backend
│   ├── app/
│   │   ├── api/            # API endpoints
│   │   │   ├── auth.py     # Authentication
│   │   │   ├── rooms.py    # Rooms CRUD
│   │   │   ├── products.py # Products CRUD
│   │   │   ├── bookings.py # Bookings CRUD
│   │   │   ├── payments.py # Payments CRUD
│   │   │   └── reviews.py  # Reviews CRUD
│   │   ├── models/         # SQLAlchemy models
│   │   ├── schemas/        # Pydantic schemas
│   │   ├── services/       # Business logic
│   │   └── core/           # Config, DB, Security
│   ├── main.py             # FastAPI app
│   ├── requirements.txt    # Python dependencies
│   └── Dockerfile          # Backend container
├── frontend/               # Vue 3 frontend
│   ├── src/
│   │   ├── api/           # API client
│   │   ├── components/    # Vue components
│   │   │   ├── Navbar.vue
│   │   │   ├── Footer.vue
│   │   │   ├── RoomCard.vue
│   │   │   └── ProductCard.vue
│   │   ├── views/         # Page views
│   │   │   ├── Home.vue
│   │   │   ├── Rooms.vue
│   │   │   ├── RoomDetail.vue
│   │   │   ├── Restaurant.vue
│   │   │   ├── Activities.vue
│   │   │   ├── Login.vue
│   │   │   ├── Register.vue
│   │   │   ├── Account.vue
│   │   │   ├── Dashboard.vue
│   │   │   ├── About.vue
│   │   │   └── Contact.vue
│   │   ├── router/        # Vue Router
│   │   ├── stores/        # Pinia stores
│   │   ├── locales/       # i18n translations
│   │   └── types/         # TypeScript types
│   ├── package.json       # Node dependencies
│   └── Dockerfile         # Frontend container
├── database/              # Database files
│   ├── schema.sql         # Database schema
│   └── seed.sql           # Seed data
└── docker-compose.yml     # Docker orchestration
```

## 🔐 Default Credentials

### Admin Account
- **Email**: admin@alkhayma.com
- **Password**: admin123
- **Role**: admin

### Customer Account
- **Email**: customer@example.com
- **Password**: admin123
- **Role**: customer

## 🌐 API Documentation

Once the backend is running, visit:
- **Swagger UI**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc

### Main Endpoints

#### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login (returns JWT)
- `GET /api/auth/me` - Get current user

#### Rooms
- `GET /api/rooms` - List all rooms
- `GET /api/rooms/{id}` - Get room details
- `POST /api/rooms` - Create room (admin)
- `PUT /api/rooms/{id}` - Update room (admin)
- `DELETE /api/rooms/{id}` - Delete room (admin)

#### Products (Restaurant, Cafe, Activities)
- `GET /api/products` - List all products
- `GET /api/products/{id}` - Get product details
- `POST /api/products` - Create product (admin)
- `PUT /api/products/{id}` - Update product (admin)
- `DELETE /api/products/{id}` - Delete product (admin)

#### Bookings
- `GET /api/bookings` - List bookings
- `GET /api/bookings/{id}` - Get booking details
- `POST /api/bookings` - Create booking
- `PUT /api/bookings/{id}` - Update booking
- `GET /api/bookings/availability/rooms` - Check room availability

#### Payments
- `GET /api/payments` - List payments
- `POST /api/payments` - Process payment

#### Reviews
- `GET /api/reviews` - List reviews
- `POST /api/reviews` - Create review
- `PUT /api/reviews/{id}/approve` - Approve review (admin)

## 📱 Frontend Features

### Pages
1. **Home** - Hero section with features
2. **Rooms** - Room listing with filters
3. **Room Detail** - Room details with booking form
4. **Restaurant** - Food menu with ordering
5. **Activities** - Activities and water sports
6. **About** - About the resort
7. **Contact** - Contact form
8. **Login/Register** - Authentication
9. **Account** - User bookings and profile
10. **Dashboard** - Admin panel (admin only)

### Components
- **Navbar** - Responsive navigation with auth & i18n
- **Footer** - Footer with links
- **RoomCard** - Room display card
- **ProductCard** - Product display card

### State Management (Pinia)
- **auth** - Authentication state
- **app** - App state (locale, RTL)

## 🌍 Internationalization

### Supported Languages
- English (en) - LTR
- Arabic (ar) - RTL

### Features
- Dynamic locale switching
- Persistent locale preference
- RTL/LTR automatic layout
- Bilingual content (rooms, products)

## 🚀 Deployment

### VPS Requirements (Met ✅)
- 8 vCPU cores
- 8GB RAM
- 100GB NVMe
- 8TB bandwidth

### Production Deployment

1. **Update Environment Variables**
```bash
# backend/.env
DATABASE_URL=postgresql://user:pass@host:5432/db
SECRET_KEY=your-production-secret-key-min-32-chars
ENVIRONMENT=production

# frontend/.env
VITE_API_URL=https://api.yourdomain.com
```

2. **Build and Deploy**
```bash
docker-compose -f docker-compose.prod.yml up -d
```

3. **Setup Nginx Reverse Proxy**
```nginx
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://localhost:5173;
    }

    location /api {
        proxy_pass http://localhost:8000;
    }
}
```

4. **Setup SSL with Let's Encrypt**
```bash
certbot --nginx -d yourdomain.com
```

## 🧪 Testing

### Backend Tests
```bash
cd backend
./test_setup.sh
./test_api.sh
```

### Frontend Tests
```bash
cd frontend
npm run dev
# Open http://localhost:5173
```

## 📊 Database Schema

### Tables
- **users** - User accounts
- **rooms** - Hotel rooms (bilingual)
- **products** - Services (bilingual)
- **bookings** - All reservations
- **payments** - Payment transactions
- **reviews** - Customer reviews (bilingual)

## 🔒 Security Features

- JWT token authentication
- Bcrypt password hashing
- CORS protection
- SQL injection prevention (SQLAlchemy ORM)
- XSS protection
- Role-based access control

## 📝 Development

### Backend Development
```bash
cd backend
source venv/bin/activate
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### Frontend Development
```bash
cd frontend
npm run dev
```

### Database Migrations
```bash
# Reset database
psql -U alkhayma_user -d alkhayma_resort -f database/schema.sql
psql -U alkhayma_user -d alkhayma_resort -f database/seed.sql
```

## 🐛 Troubleshooting

### Database Connection Error
- Check PostgreSQL is running
- Verify credentials in `.env`
- Ensure database exists

### Port Already in Use
```bash
# Backend
lsof -ti:8000 | xargs kill

# Frontend
lsof -ti:5173 | xargs kill
```

### Docker Issues
```bash
docker-compose down
docker-compose up -d --build
```

## 📚 Documentation

- Backend: `backend/QUICKSTART.md`
- Frontend: `frontend/QUICKSTART.md`
- API: http://localhost:8000/docs

## 🎯 Next Steps

- [ ] Add AI Chatbot integration
- [ ] Implement payment gateway (Stripe/PayPal)
- [ ] Add email notifications
- [ ] Implement real-time availability
- [ ] Add image upload functionality
- [ ] Create mobile app (React Native)

## 📄 License

Proprietary - Al Khayma Resort

## 👥 Support

For support, email: support@alkhayma.com

---

**Built with ❤️ for Al Khayma Resort**
