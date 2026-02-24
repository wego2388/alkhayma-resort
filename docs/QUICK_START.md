# 🚀 Quick Start Guide - El Kheima Beach Resort

## تشغيل المشروع في 5 دقائق

---

## المتطلبات

- Node.js 18+
- Python 3.9+
- PostgreSQL 14+
- Git

---

## 1️⃣ Backend Setup (دقيقتان)

```bash
# انتقل لمجلد Backend
cd backend

# إنشاء virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
# أو
venv\Scripts\activate  # Windows

# تثبيت المكتبات
pip install -r requirements.txt

# إنشاء قاعدة البيانات
psql -U postgres -c "CREATE DATABASE alkhayma_db;"

# تشغيل Migrations
psql -U postgres -d alkhayma_db -f migrations/create_events_table.sql

# إضافة البيانات (23 منتج/فعالية)
chmod +x seed_database.sh
./seed_database.sh

# تشغيل السيرفر
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

✅ Backend جاهز على: http://localhost:8000

---

## 2️⃣ Frontend Setup (دقيقة واحدة)

```bash
# افتح terminal جديد
cd frontend

# تثبيت المكتبات
npm install

# إنشاء ملف .env
echo "VITE_API_URL=http://localhost:8000" > .env

# تشغيل السيرفر
npm run dev
```

✅ Frontend جاهز على: http://localhost:5173

---

## 3️⃣ اختبار سريع (دقيقة واحدة)

### اختبار Backend API

```bash
# اختبار Products
curl http://localhost:8000/api/products?type=restaurant

# اختبار Events
curl http://localhost:8000/api/events?category=wedding

# اختبار Health Check
curl http://localhost:8000/health
```

### اختبار Frontend

1. افتح المتصفح: http://localhost:5173
2. اذهب لصفحة Packages: http://localhost:5173/packages
3. اذهب لصفحة Activities: http://localhost:5173/activities
4. اذهب لصفحة Events: http://localhost:5173/events

---

## 4️⃣ اختبار Booking Flow (دقيقة واحدة)

```bash
# إنشاء حجز تجريبي
curl -X POST http://localhost:8000/api/bookings \
  -H "Content-Type: application/json" \
  -d '{
    "product_id": 1,
    "booking_type": "restaurant",
    "booking_date": "2024-03-01T19:00:00",
    "guests": 2,
    "total_price": 500.00,
    "guest_name": "Test User",
    "guest_email": "test@example.com",
    "guest_phone": "+201234567890"
  }'
```

---

## 📊 ما تم إضافته في قاعدة البيانات

### Products (17 منتج)

#### Restaurant Packages (5)
1. Pizza Night Offer - 250 EGP
2. Candlelight Beach Dinner - 650 EGP
3. Sunset Romantic Setup - 800 EGP
4. Romantic Dinner for Two - 500 EGP
5. Pasta + Drink Combo - 180 EGP

#### Cafe Packages (3)
6. Morning Coffee Package - 80 EGP
7. Sunset Drink Offer - 120 EGP
8. Hookah & Lounge - 150 EGP

#### Water Sports (6)
9. Jet Ski Adventure - 200 EGP
10. Parasailing Experience - 300 EGP
11. Banana Boat Ride - 150 EGP
12. Snorkeling Trip - 250 EGP
13. Scuba Diving - 400 EGP
14. Kayaking - 100 EGP

#### Beach Entry (3)
15. Beach Day Pass - 100 EGP
16. VIP Beach Cabana - 500 EGP
17. Family Beach Package - 300 EGP

### Events (6 فعاليات)

1. Wedding Celebration - 5000 EGP
2. Corporate Event - 3000 EGP
3. Birthday Party - 1500 EGP
4. Special Occasion - 2000 EGP
5. Morning Yoga - 25 EGP
6. Evening Zumba - 20 EGP

---

## 🔗 API Endpoints

### Products
- `GET /api/products` - جميع المنتجات
- `GET /api/products?type=restaurant` - باقات المطعم
- `GET /api/products?type=cafe` - باقات الكافيه
- `GET /api/products?type=water_sports` - الرياضات المائية
- `GET /api/products?type=beach_entry` - دخول الشاطئ

### Events
- `GET /api/events` - جميع الفعاليات
- `GET /api/events?category=wedding` - حفلات الزفاف
- `GET /api/events?category=corporate` - فعاليات الشركات
- `GET /api/events?category=birthday` - حفلات أعياد الميلاد

### Bookings
- `POST /api/bookings` - إنشاء حجز
- `GET /api/bookings/my-bookings` - حجوزاتي

---

## 🎯 الصفحات المتكاملة

| الصفحة | الرابط | API المستخدم | الحالة |
|--------|--------|--------------|--------|
| Packages | `/packages` | `/api/products?type=restaurant,cafe` | ✅ جاهز |
| Activities | `/activities` | `/api/products?type=water_sports,beach_entry` | ✅ جاهز |
| Events | `/events` | `/api/events` | ✅ جاهز |
| Restaurant | `/restaurant` | `/api/products?type=restaurant` | ✅ جاهز |
| Rooms | `/rooms` | `/api/rooms` | ✅ جاهز |

---

## 🐛 Troubleshooting

### مشكلة: Backend لا يعمل

```bash
# تأكد من PostgreSQL يعمل
sudo systemctl status postgresql

# تأكد من قاعدة البيانات موجودة
psql -U postgres -l | grep alkhayma_db

# تأكد من البيانات موجودة
psql -U postgres -d alkhayma_db -c "SELECT COUNT(*) FROM products;"
```

### مشكلة: Frontend لا يتصل بـ Backend

```bash
# تأكد من .env موجود
cat frontend/.env

# يجب أن يحتوي على:
# VITE_API_URL=http://localhost:8000

# أعد تشغيل Frontend
cd frontend
npm run dev
```

### مشكلة: CORS Errors

تأكد من إضافة CORS middleware في `backend/main.py`:

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

---

## 📚 الملفات المهمة

### Backend
- `backend/main.py` - نقطة البداية
- `backend/app/api/products.py` - Products API
- `backend/app/api/events.py` - Events API
- `backend/app/api/bookings.py` - Bookings API
- `backend/migrations/seed_all_products.sql` - البيانات الأولية
- `backend/seed_database.sh` - Script التشغيل

### Frontend
- `frontend/src/views/Packages.vue` - صفحة الباقات
- `frontend/src/views/Activities.vue` - صفحة الأنشطة
- `frontend/src/views/Events.vue` - صفحة الفعاليات
- `frontend/src/api/products.ts` - Products API Client
- `frontend/src/api/events.ts` - Events API Client
- `frontend/src/api/bookings.ts` - Bookings API Client

### Documentation
- `DATABASE_API_INTEGRATION_REPORT.md` - تقرير التكامل
- `FRONTEND_BACKEND_INTEGRATION.md` - دليل التكامل
- `backend/API_ENDPOINTS.md` - توثيق API
- `QUICK_START.md` - هذا الملف

---

## ✅ Checklist

### Backend
- [x] Database created
- [x] Migrations run
- [x] Data seeded (23 items)
- [x] Server running on port 8000
- [x] API endpoints working

### Frontend
- [x] Dependencies installed
- [x] .env configured
- [x] Server running on port 5173
- [x] API clients configured
- [x] Pages loading correctly

### Integration
- [ ] Test Packages page loads data
- [ ] Test Activities page loads data
- [ ] Test Events page loads data
- [ ] Test booking flow
- [ ] Test error handling

---

## 🎉 Next Steps

1. **اختبار جميع الصفحات:**
   - Packages ✓
   - Activities ✓
   - Events ✓
   - Restaurant ✓
   - Rooms ✓

2. **اختبار Booking Flow:**
   - فتح modal الحجز
   - ملء البيانات
   - إرسال الحجز
   - عرض رسالة النجاح

3. **تحسينات إضافية:**
   - إضافة loading states
   - إضافة error handling
   - إضافة form validation
   - إضافة success notifications

4. **Production Deployment:**
   - تحديث environment variables
   - إعداد production database
   - تفعيل email notifications
   - إضافة payment gateway

---

## 📞 الدعم

إذا واجهت أي مشكلة:

1. راجع `DATABASE_API_INTEGRATION_REPORT.md`
2. راجع `FRONTEND_BACKEND_INTEGRATION.md`
3. راجع `backend/API_ENDPOINTS.md`
4. تحقق من logs:
   - Backend: `tail -f backend/logs/app.log`
   - Frontend: Console في المتصفح

---

**تم بنجاح! 🎉**

المشروع جاهز للتشغيل والاختبار.
