# 🚀 تشغيل المشروع - Quick Start

## الطريقة السريعة

```bash
cd /home/wego/Desktop/alkhayma-resort-final
./run.sh
```

## الخطوات اليدوية

### 1. تشغيل قاعدة البيانات (PostgreSQL)
```bash
# قاعدة البيانات تعمل بالفعل في Docker:
docker ps | grep alkhayma_db
```

### 2. تشغيل Backend
```bash
cd backend
source venv/bin/activate
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

### 3. تشغيل Frontend (في terminal جديد)
```bash
cd frontend
npm run dev
```

## 🌐 الوصول للتطبيق

- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:8000
- **API Docs**: http://localhost:8000/docs

## 🔐 تسجيل الدخول

- **Admin**: admin@alkhayma.com / admin123
- **Customer**: customer@example.com / admin123

## ✅ الحالة الحالية

- ✅ PostgreSQL يعمل في Docker
- ✅ قاعدة البيانات جاهزة مع البيانات
- ✅ Backend جاهز
- ✅ Frontend جاهز

## 🛑 إيقاف المشروع

اضغط `Ctrl+C` في كل terminal

أو:
```bash
pkill -f uvicorn
pkill -f "npm run dev"
```

## 📝 ملاحظات

- قاعدة البيانات تعمل على: localhost:5432
- Backend يعمل على: localhost:8000
- Frontend يعمل على: localhost:5173
