# 🌊 El Kheima Beach Resort

<div align="center">

![El Kheima Beach Resort](https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1200&h=300&fit=crop)

**Private Beachfront Resort Management System**

[![Vue 3](https://img.shields.io/badge/Vue-3.4-4FC08D?logo=vue.js)](https://vuejs.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.109-009688?logo=fastapi)](https://fastapi.tiangolo.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14-336791?logo=postgresql)](https://www.postgresql.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.3-3178C6?logo=typescript)](https://www.typescriptlang.org/)
[![TailwindCSS](https://img.shields.io/badge/Tailwind-3.4-38B2AC?logo=tailwind-css)](https://tailwindcss.com/)

[Features](#-features) • [Quick Start](#-quick-start) • [Documentation](#-documentation) • [Demo](#-demo)

</div>

---

## ✨ Features

### 🏖️ Resort Management
- **120+ Luxury Rooms** - Standard, Deluxe, Suite with sea view
- **Private Beach** - Exclusive sandy beach on the Red Sea
- **Dining** - Restaurant & Cafe with 8 special packages
- **Events** - Weddings, corporate events, birthdays
- **Water Sports** - Jet ski, parasailing, diving, snorkeling
- **Wellness** - Yoga and Zumba classes

### 💻 Technical Features
- **Full Booking System** - Real-time availability
- **Payment Integration** - Secure payment processing
- **Admin Dashboard** - Complete management panel
- **Bilingual** - English & Arabic (RTL support)
- **Responsive** - Mobile, tablet, desktop
- **SEO Optimized** - Schema.org, meta tags
- **Performance** - Lighthouse 90+ score

---

## 🚀 Quick Start

### Prerequisites
```bash
Node.js 18+
Python 3.9+
PostgreSQL 14+
```

### 1️⃣ Clone Repository
```bash
git clone https://github.com/yourusername/el-kheima-resort.git
cd el-kheima-resort
```

### 2️⃣ Backend Setup
```bash
cd backend

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate  # Windows

# Install dependencies
pip install -r requirements.txt

# Setup database
psql -U postgres -c "CREATE DATABASE alkhayma_db;"
psql -U postgres -d alkhayma_db -f migrations/create_events_table.sql

# Seed data (23 products/events)
chmod +x seed_database.sh
./seed_database.sh

# Configure environment
cp .env.example .env
# Edit .env with your settings

# Start server
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

✅ Backend: http://localhost:8000

### 3️⃣ Frontend Setup
```bash
cd frontend

# Install dependencies
npm install

# Configure environment
cp .env.example .env
# Edit .env: VITE_API_URL=http://localhost:8000

# Start dev server
npm run dev
```

✅ Frontend: http://localhost:5173

---

## 📊 Database Content

### Products (17 items)
- **Restaurant** (5): Pizza, Candlelight Dinner, Romantic Setup, Dinner for Two, Pasta Combo
- **Cafe** (3): Morning Coffee, Sunset Drink, Hookah Lounge
- **Water Sports** (6): Jet Ski, Parasailing, Banana Boat, Snorkeling, Diving, Kayaking
- **Beach Entry** (3): Day Pass, VIP Cabana, Family Package

### Events (6 items)
- Wedding, Corporate, Birthday, Special Occasion, Yoga, Zumba

---

## 🏗️ Tech Stack

### Frontend
| Technology | Version | Purpose |
|------------|---------|---------|
| Vue 3 | 3.4.x | Framework |
| TypeScript | 5.3.x | Type safety |
| Vite | 5.0.x | Build tool |
| TailwindCSS | 3.4.x | Styling |
| Vue Router | 4.2.x | Routing |
| Pinia | 2.1.x | State management |
| Axios | 1.6.x | HTTP client |

### Backend
| Technology | Version | Purpose |
|------------|---------|---------|
| FastAPI | 0.109.x | Web framework |
| Python | 3.9+ | Language |
| PostgreSQL | 14+ | Database |
| SQLAlchemy | 2.0.x | ORM |
| Alembic | 1.13.x | Migrations |
| JWT | - | Authentication |

---

## 📁 Project Structure

```
el-kheima-resort/
├── frontend/                 # Vue 3 Frontend
│   ├── src/
│   │   ├── api/             # API clients
│   │   ├── components/      # Vue components
│   │   ├── views/           # Pages
│   │   ├── stores/          # Pinia stores
│   │   ├── router/          # Vue Router
│   │   └── types/           # TypeScript types
│   └── package.json
│
├── backend/                  # FastAPI Backend
│   ├── app/
│   │   ├── api/             # API endpoints
│   │   ├── models/          # SQLAlchemy models
│   │   ├── schemas/         # Pydantic schemas
│   │   └── core/            # Core functionality
│   ├── migrations/          # Database migrations
│   └── requirements.txt
│
├── docs/                     # Documentation
├── .gitignore
├── README.md
└── LICENSE
```

---

## 🔗 API Endpoints

### Products
```http
GET    /api/products              # Get all products
GET    /api/products?type=restaurant
GET    /api/products/{id}         # Get single product
```

### Events
```http
GET    /api/events                # Get all events
GET    /api/events?category=wedding
GET    /api/events/{id}           # Get single event
```

### Bookings
```http
POST   /api/bookings              # Create booking
GET    /api/bookings/my-bookings  # Get user bookings
```

📖 **Full API docs:** [backend/API_ENDPOINTS.md](backend/API_ENDPOINTS.md)

---

## 🎯 Pages

| Page | Route | Description |
|------|-------|-------------|
| Home | `/` | Hero, features, reviews |
| Packages | `/packages` | Restaurant & Cafe packages |
| Activities | `/activities` | Water sports & Beach entry |
| Events | `/events` | Weddings, corporate, birthday |
| Restaurant | `/restaurant` | Menu & special offers |
| Rooms | `/rooms` | Room types & booking |
| Gallery | `/gallery` | Photo gallery |
| About | `/about` | Resort story & location |
| Contact | `/contact` | Contact form & map |
| Dashboard | `/dashboard` | Admin panel |

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [QUICK_START.md](QUICK_START.md) | 5-minute setup guide |
| [API_ENDPOINTS.md](backend/API_ENDPOINTS.md) | Complete API documentation |
| [FRONTEND_BACKEND_INTEGRATION.md](FRONTEND_BACKEND_INTEGRATION.md) | Integration guide |
| [DATABASE_API_INTEGRATION_REPORT.md](DATABASE_API_INTEGRATION_REPORT.md) | Database report |

---

## 🧪 Testing

### Backend Tests
```bash
cd backend
pytest
```

### Frontend Tests
```bash
cd frontend
npm run test
```

### API Testing
```bash
# Test products
curl http://localhost:8000/api/products?type=restaurant

# Test events
curl http://localhost:8000/api/events?category=wedding
```

---

## 🚀 Deployment

### Production Build

#### Frontend
```bash
cd frontend
npm run build
# Output: dist/
```

#### Backend
```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --host 0.0.0.0 --port 8000
```

### Docker Deployment
```bash
docker-compose up -d
```

### Environment Variables

#### Frontend (.env)
```env
VITE_API_URL=https://api.elkheimaresort.com
VITE_WHATSAPP_NUMBER=+201234567890
```

#### Backend (.env)
```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=alkhayma_db
DB_USER=postgres
DB_PASSWORD=your_password
SECRET_KEY=your_secret_key
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- [Vue.js](https://vuejs.org/) - Progressive JavaScript Framework
- [FastAPI](https://fastapi.tiangolo.com/) - Modern Python web framework
- [TailwindCSS](https://tailwindcss.com/) - Utility-first CSS framework
- [PostgreSQL](https://www.postgresql.org/) - Advanced open source database
- [Unsplash](https://unsplash.com/) - Beautiful free images

---

## 📞 Support

For support, email support@elkheimaresort.com or join our community.

---

<div align="center">

**Made with ❤️ by El Kheima Beach Resort Team**

[Documentation](QUICK_START.md) • [API Docs](backend/API_ENDPOINTS.md) • [Live Demo](#)

⭐ Star us on GitHub — it helps!

</div>
