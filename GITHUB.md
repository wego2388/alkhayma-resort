# 🚀 رفع المشروع على GitHub

## ✅ المشروع جاهز!

تم تجهيز المشروع بالكامل مع:
- ✅ Git repository initialized
- ✅ .gitignore configured
- ✅ Initial commit created
- ✅ 121 ملف جاهز للرفع

---

## 📋 خطوات الرفع على GitHub

### 1️⃣ إنشاء Repository جديد

اذهب إلى: **https://github.com/new**

- Repository name: `alkhayma-resort`
- Description: `Al Khayma Resort Management System - FastAPI + Vue 3`
- Public أو Private (اختر حسب رغبتك)
- **لا تضف** README أو .gitignore أو license

اضغط **Create repository**

---

### 2️⃣ ربط المشروع بـ GitHub

افتح Terminal في مجلد المشروع وشغل:

```bash
cd /home/wego/Desktop/alkhayma-resort-final

# استبدل YOUR_USERNAME باسم المستخدم الخاص بك
git remote add origin https://github.com/YOUR_USERNAME/alkhayma-resort.git

# تغيير اسم الفرع إلى main
git branch -M main

# رفع المشروع
git push -u origin main
```

---

### 3️⃣ إذا طلب منك تسجيل الدخول

**الطريقة 1: Personal Access Token (موصى بها)**

1. اذهب إلى: https://github.com/settings/tokens
2. اضغط **Generate new token (classic)**
3. اختر الصلاحيات: `repo` (كل الصلاحيات)
4. اضغط **Generate token**
5. انسخ الـ token
6. استخدمه كـ password عند الرفع

**الطريقة 2: SSH**

```bash
# إنشاء SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# نسخ المفتاح
cat ~/.ssh/id_ed25519.pub

# أضفه في GitHub Settings > SSH Keys
```

ثم استخدم SSH URL:
```bash
git remote set-url origin git@github.com:YOUR_USERNAME/alkhayma-resort.git
git push -u origin main
```

---

## 📊 معلومات المشروع

- **Total Files**: 121 ملف
- **Total Commits**: 2
- **Branch**: main
- **Size**: ~2-3 MB

---

## 🔄 تحديثات مستقبلية

بعد أي تعديل:

```bash
git add .
git commit -m "وصف التعديل"
git push
```

---

## 📝 ملاحظات

1. ملف `.env` **لن يُرفع** (موجود في .gitignore)
2. مجلد `node_modules` **لن يُرفع**
3. مجلد `venv` **لن يُرفع**
4. قاعدة البيانات **لن تُرفع**

---

## ✅ جاهز للرفع!

المشروع جاهز 100% - فقط اتبع الخطوات أعلاه 🚀
