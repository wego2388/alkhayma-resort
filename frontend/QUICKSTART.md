# 🎨 Frontend Quick Start Guide

## Prerequisites
- Node.js 18+
- npm or yarn

## Setup Steps

### 1. Install Dependencies
```bash
cd frontend
npm install
```

### 2. Configure Environment
```bash
# .env file already created with:
VITE_API_URL=http://localhost:8000
```

### 3. Start Development Server
```bash
npm run dev
```

Frontend will start at: http://localhost:5173

### 4. Build for Production
```bash
npm run build
```

## Project Structure

```
frontend/
├── src/
│   ├── api/              # API client & endpoints
│   │   ├── client.ts     # Axios instance
│   │   ├── auth.ts       # Auth API
│   │   ├── rooms.ts      # Rooms API
│   │   ├── products.ts   # Products API
│   │   └── bookings.ts   # Bookings API
│   ├── components/       # Vue components
│   │   ├── Navbar.vue    # Navigation
│   │   ├── Footer.vue    # Footer
│   │   └── RoomCard.vue  # Room card
│   ├── views/            # Page views
│   │   ├── Home.vue      # Homepage
│   │   ├── Rooms.vue     # Rooms listing
│   │   ├── Login.vue     # Login page
│   │   └── ...           # Other pages
│   ├── router/           # Vue Router
│   │   └── index.ts      # Routes config
│   ├── stores/           # Pinia stores
│   │   ├── auth.ts       # Auth state
│   │   └── app.ts        # App state (i18n)
│   ├── locales/          # i18n translations
│   │   ├── messages.ts   # EN/AR messages
│   │   └── index.ts      # i18n config
│   ├── types/            # TypeScript types
│   │   └── index.ts      # Type definitions
│   ├── assets/           # Static assets
│   │   └── main.css      # Global styles
│   ├── App.vue           # Root component
│   └── main.ts           # Entry point
├── index.html            # HTML template
├── vite.config.ts        # Vite config
├── tailwind.config.js    # Tailwind config
├── tsconfig.json         # TypeScript config
└── package.json          # Dependencies
```

## Features Implemented

### ✅ Core Setup
- Vue 3 with Composition API
- TypeScript for type safety
- Vite for fast development
- Tailwind CSS for styling

### ✅ State Management
- Pinia stores (auth, app)
- Persistent authentication
- Locale management

### ✅ Routing
- Vue Router with lazy loading
- Protected routes (auth required)
- Admin-only routes

### ✅ Internationalization
- Vue I18n for translations
- Arabic (RTL) & English (LTR)
- Dynamic locale switching
- Persistent locale preference

### ✅ API Integration
- Axios client with interceptors
- Auto token injection
- Error handling
- Type-safe API calls

### ✅ Components
- Navbar with auth & i18n
- Footer with links
- RoomCard for listings
- Responsive design

### ✅ Views
- Home (hero + features)
- Rooms (listing + filters)
- Login (authentication)
- Placeholders for other pages

## Available Scripts

```bash
npm run dev      # Start dev server
npm run build    # Build for production
npm run preview  # Preview production build
```

## Environment Variables

```env
VITE_API_URL=http://localhost:8000  # Backend API URL
```

## Styling

### Tailwind Utilities
- `btn-primary` - Primary button
- `btn-secondary` - Secondary button
- `card` - Card container
- `input` - Form input

### Custom Colors
- `primary-*` - Blue shades
- `secondary-*` - Orange shades

### Fonts
- English: Inter
- Arabic: Cairo

## Authentication Flow

1. User logs in via `/login`
2. Token stored in localStorage
3. Token auto-injected in API calls
4. User data fetched on app mount
5. Protected routes check auth status

## i18n Usage

```vue
<template>
  <h1>{{ t('nav.home') }}</h1>
</template>

<script setup>
import { useI18n } from 'vue-i18n'
const { t } = useI18n()
</script>
```

## RTL Support

- Auto-detected from locale
- CSS classes: `rtl:*`
- Direction attribute on `<html>`
- Arabic font (Cairo) applied

## Next Steps

1. ✅ Frontend core is ready
2. 🔄 Add more views (RoomDetail, Booking, etc.)
3. 🔄 Integrate AI Chatbot
4. 🔄 Add booking calendar
5. 🚀 Deploy to production

## Troubleshooting

### Port Already in Use
```bash
# Change port in vite.config.ts or:
npm run dev -- --port 3000
```

### API Connection Error
- Check backend is running on port 8000
- Verify VITE_API_URL in .env
- Check CORS settings in backend

### Build Errors
```bash
rm -rf node_modules package-lock.json
npm install
```
