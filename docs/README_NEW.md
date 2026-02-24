# 🌊 El Kheima Beach Resort - Complete Luxury Resort Website

<div align="center">

**Private Beachfront Resort for Couples & Families**

[![Vue 3](https://img.shields.io/badge/Vue-3.4-4FC08D?logo=vue.js)](https://vuejs.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.109-009688?logo=fastapi)](https://fastapi.tiangolo.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14-336791?logo=postgresql)](https://www.postgresql.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.3-3178C6?logo=typescript)](https://www.typescriptlang.org/)
[![TailwindCSS](https://img.shields.io/badge/Tailwind-3.4-38B2AC?logo=tailwind-css)](https://tailwindcss.com/)

[Quick Start](#-quick-start) • [Documentation](#-documentation) • [API Docs](backend/API_ENDPOINTS.md)

</div>

---

## ✨ Features

### 🏖️ Resort Features
- **120+ Luxury Rooms** - Standard, Deluxe, and Suite options
- **Private Beach Access** - Exclusive beachfront with water sports
- **Fine Dining** - Restaurant & Cafe with 8 special packages
- **Events & Celebrations** - Weddings, corporate events, birthdays
- **Water Sports** - 6 activities: Jet ski, parasailing, diving, snorkeling
- **Wellness** - Yoga and Zumba classes

### 💻 Technical Features
- **Full Booking System** - Real-time availability and reservations
- **Payment Integration** - Secure payment processing
- **Admin Dashboard** - Complete management system
- **Bilingual Support** - English & Arabic (RTL)
- **Responsive Design** - Mobile, tablet, and desktop
- **SEO Optimized** - Schema.org markup, meta tags
- **Performance** - Lighthouse score 90+
- **Security** - JWT authentication, HTTPS

---

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- Python 3.9+
- PostgreSQL 14+

### 1️⃣ Backend Setup (2 minutes)
```bash
cd backend

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac

# Install dependencies
pip install -r requirements.txt

# Create database
psql -U postgres -c "CREATE DATABASE alkhayma_db;"

# Run migrations
psql -U postgres -d alkhayma_db -f migrations/create_events_table.sql

# Seed database (23 products/events)
chmod +x seed_database.sh
./seed_database.sh

# Start server
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

✅ Backend: http://localhost:8000

### 2️⃣ Frontend Setup (1 minute)
```bash
cd frontend

# Install dependencies
npm install

# Create .env
echo "VITE_API_URL=http://localhost:8000" > .env

# Start dev server
npm run dev
```

✅ Frontend: http://localhost:5173

📖 **Full guide:** [QUICK_START.md](QUICK_START.md)

---

## 📊 Database Content

### Products (17 items)

#### 🍽️ Restaurant (5)
- Pizza Night Offer - 250 EGP
- Candlelight Beach Dinner - 650 EGP
- Sunset Romantic Setup - 800 EGP
- Romantic Dinner for Two - 500 EGP
- Pasta + Drink Combo - 180 EGP

#### ☕ Cafe (3)
- Morning Coffee Package - 80 EGP
- Sunset Drink Offer - 120 EGP
- Hookah & Lounge - 150 EGP

#### 🏄 Water Sports (6)
- Jet Ski Adventure - 200 EGP
- Parasailing - 300 EGP
- Banana Boat - 150 EGP
- Snorkeling - 250 EGP
- Scuba Diving - 400 EGP
- Kayaking - 100 EGP

#### 🏖️ Beach Entry (3)
- Beach Day Pass - 100 EGP
- VIP Cabana - 500 EGP
- Family Package - 300 EGP

### Events (6 items)
- Wedding - 5000 EGP
- Corporate - 3000 EGP
- Birthday - 1500 EGP
- Special Occasion - 2000 EGP
- Yoga - 25 EGP
- Zumba - 20 EGP

---

## 🏗️ Tech Stack

### Frontend
- Vue 3 + TypeScript
- Vite + TailwindCSS
- Vue Router + Pinia
- Axios + Vue I18n

### Backend
- FastAPI + Python 3.9+
- PostgreSQL + SQLAlchemy
- JWT + Alembic
- Uvicorn

---

## 🔗 API Endpoints

### Products
```http
GET /api/products?type=restaurant
GET /api/products?type=water_sports
```

### Events
```http
GET /api/events?category=wedding
GET /api/events?category=yoga
```

### Bookings
```http
POST /api/bookings
GET /api/bookings/my-bookings
```

📖 **Full API docs:** [backend/API_ENDPOINTS.md](backend/API_ENDPOINTS.md)

---

## 🎯 Pages

| Page | Route | Status |
|------|-------|--------|
| Home | `/` | ✅ |
| Packages | `/packages` | ✅ |
| Activities | `/activities` | ✅ |
| Events | `/events` | ✅ |
| Restaurant | `/restaurant` | ✅ |
| Rooms | `/rooms` | ✅ |
| Gallery | `/gallery` | ✅ |
| About | `/about` | ✅ |
| Contact | `/contact` | ✅ |
| Dashboard | `/dashboard` | ✅ |

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [QUICK_START.md](QUICK_START.md) | 5-minute setup guide |
| [DATABASE_API_INTEGRATION_REPORT.md](DATABASE_API_INTEGRATION_REPORT.md) | Integration report |
| [FRONTEND_BACKEND_INTEGRATION.md](FRONTEND_BACKEND_INTEGRATION.md) | Integration guide |
| [backend/API_ENDPOINTS.md](backend/API_ENDPOINTS.md) | API documentation |

---

## 🚀 Deployment

### Production Build
```bash
# Frontend
cd frontend && npm run build

# Backend
cd backend && uvicorn main:app --host 0.0.0.0 --port 8000
```

### Docker
```bash
docker-compose up -d
```

---

## 📝 License

MIT License - see [LICENSE](LICENSE)

---

<div align="center">

**Made with ❤️ by El Kheima Beach Resort Team**

[Documentation](QUICK_START.md) • [API](backend/API_ENDPOINTS.md) • [Support](mailto:support@elkheimaresort.com)

</div>
