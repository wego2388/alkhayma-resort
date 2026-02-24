# 🖼️ Image Management System

## 📁 Location
`frontend/src/config/images.ts`

---

## 🎯 Purpose
Centralized image configuration for easy management without touching component code.

---

## ✨ Features

### 1. **Single Source of Truth**
All images in one file - change once, update everywhere.

### 2. **Type-Safe**
TypeScript support with autocomplete.

### 3. **Fallback Support**
Automatic fallback to placeholder if image fails.

### 4. **Easy Updates**
Change images without rebuilding or breaking code.

### 5. **Organized Categories**
- Hero images (per page)
- Restaurant images
- Room types
- Activities
- Placeholders
- Branding

---

## 📖 Usage

### Basic Usage
```vue
<script setup>
import { getImage } from '@/config/images'
</script>

<template>
  <!-- Hero Background -->
  <div :style="{ backgroundImage: `url(${getImage('hero.home')})` }"></div>
  
  <!-- Image Tag -->
  <img :src="getImage('restaurant.italian')" alt="Italian Restaurant" />
  
  <!-- With Fallback -->
  <img :src="getImage('rooms.deluxe', '/fallback.jpg')" alt="Deluxe Room" />
</template>
```

### Direct Import
```typescript
import { IMAGES } from '@/config/images'

const heroImage = IMAGES.hero.home
const italianRestaurant = IMAGES.restaurant.italian
```

### Preload Critical Images
```typescript
import { preloadImages } from '@/config/images'

onMounted(() => {
  preloadImages(['hero.home', 'restaurant.italian'])
})
```

---

## 🗂️ Image Categories

### Hero Images
```typescript
IMAGES.hero.home          // Home page hero
IMAGES.hero.rooms         // Rooms page hero
IMAGES.hero.restaurant    // Restaurant page hero
IMAGES.hero.activities    // Activities page hero
IMAGES.hero.gallery       // Gallery page hero
IMAGES.hero.about         // About page hero
IMAGES.hero.contact       // Contact page hero
```

### Restaurant Images
```typescript
IMAGES.restaurant.italian  // Italian restaurant
IMAGES.restaurant.cafe     // Cafe
IMAGES.restaurant.dining   // Main dining
```

### Room Types
```typescript
IMAGES.rooms.deluxe       // Deluxe room
IMAGES.rooms.suite        // Suite
IMAGES.rooms.villa        // Villa
IMAGES.rooms.standard     // Standard room
```

### Activities
```typescript
IMAGES.activities.diving  // Diving
IMAGES.activities.spa     // Spa
IMAGES.activities.beach   // Beach
IMAGES.activities.pool    // Pool
```

### Placeholders
```typescript
IMAGES.placeholder.room      // Room placeholder
IMAGES.placeholder.food      // Food placeholder
IMAGES.placeholder.activity  // Activity placeholder
IMAGES.placeholder.default   // Default placeholder
```

---

## 🔄 How to Update Images

### Option 1: Change URL in Config
```typescript
// frontend/src/config/images.ts
export const IMAGES = {
  hero: {
    home: 'https://your-new-image-url.com/image.jpg'  // ← Change here
  }
}
```

### Option 2: Use Local Images
```typescript
export const IMAGES = {
  hero: {
    home: '/images/hero-home.jpg'  // ← Place in public/images/
  }
}
```

### Option 3: Use CDN
```typescript
export const IMAGES = {
  hero: {
    home: 'https://cdn.yoursite.com/hero-home.jpg'
  }
}
```

---

## 🚀 Benefits

### Before (Hard-coded)
```vue
<!-- Need to change in EVERY component -->
<img src="https://images.unsplash.com/photo-123.jpg" />
```

### After (Centralized)
```vue
<!-- Change once in config, updates everywhere -->
<img :src="getImage('hero.home')" />
```

---

## 📝 Best Practices

### 1. Use Descriptive Keys
```typescript
// ✅ Good
IMAGES.restaurant.italian

// ❌ Bad
IMAGES.img1
```

### 2. Group Related Images
```typescript
// ✅ Good
IMAGES.rooms.deluxe
IMAGES.rooms.suite

// ❌ Bad
IMAGES.deluxeRoom
IMAGES.suiteRoom
```

### 3. Always Provide Fallback
```typescript
// ✅ Good
getImage('hero.home', IMAGES.placeholder.default)

// ⚠️ Risky
getImage('hero.home')
```

### 4. Optimize Image URLs
```typescript
// ✅ Good - Specify size and quality
'https://images.unsplash.com/photo-123?w=1920&q=80'

// ❌ Bad - Full resolution
'https://images.unsplash.com/photo-123'
```

---

## 🎨 Image Sizes Guide

### Hero Images
- Width: 1920px
- Quality: 80
- Format: WebP or JPEG

### Section Images
- Width: 800px
- Quality: 80
- Format: WebP or JPEG

### Thumbnails
- Width: 400px
- Quality: 80
- Format: WebP or JPEG

---

## 🔧 Advanced Usage

### Dynamic Images
```vue
<script setup>
const roomType = ref('deluxe')
const roomImage = computed(() => getImage(`rooms.${roomType.value}`))
</script>

<template>
  <img :src="roomImage" />
</template>
```

### Conditional Images
```vue
<script setup>
const isDark = ref(false)
const logo = computed(() => 
  isDark.value 
    ? getImage('branding.logoWhite') 
    : getImage('branding.logo')
)
</script>
```

---

## 📦 Migration Guide

### Step 1: Import Function
```typescript
import { getImage } from '@/config/images'
```

### Step 2: Replace Hard-coded URLs
```vue
<!-- Before -->
<img src="https://images.unsplash.com/photo-123.jpg" />

<!-- After -->
<img :src="getImage('hero.home')" />
```

### Step 3: Update Config
```typescript
// Add your custom images to config/images.ts
export const IMAGES = {
  hero: {
    myPage: 'https://your-image-url.com/image.jpg'
  }
}
```

---

## ✅ Checklist

- [ ] All hero images use `getImage()`
- [ ] All section images use `getImage()`
- [ ] Fallbacks provided for critical images
- [ ] Images optimized (size + quality)
- [ ] Config file documented
- [ ] Team trained on usage

---

## 🎉 Result

**Before:** 50+ hard-coded image URLs scattered across components  
**After:** 1 config file, easy updates, no code changes needed

**Time to update all images:**  
- Before: 2+ hours (find & replace in all files)  
- After: 2 minutes (edit one config file)

---

*Last Updated: February 24, 2026*
