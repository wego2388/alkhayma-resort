# 📦 Products Organization Plan

## 🎯 New Product Types Structure

### Current Types (Old):
- `product` - عام
- `water_sports` - رياضات مائية
- `activities` - أنشطة
- `beach` - شاطئ

### New Types (Organized):
1. **`restaurant`** - منتجات المطعم (طعام)
2. **`cafe`** - منتجات الكافيه (مشروبات، حلويات)
3. **`water_sports`** - رياضات مائية (غوص، سنوركل، كاياك)
4. **`beach_entry`** - رسم دخول الشاطئ
5. **`events`** - الفعاليات (أفراح، مؤتمرات) - موجودة في جدول منفصل
6. **`rooms`** - الغرف - موجودة في جدول منفصل

---

## 📋 Implementation Plan

### Phase 1: Update Frontend Views

#### 1. Restaurant Page (`Restaurant.vue`)
```typescript
// Load products with types: 'restaurant' and 'cafe'
const products = await productsApi.getAll({ 
  type: ['restaurant', 'cafe'],
  is_active: true 
})

// Categories
const categories = [
  { id: 'all', name: 'All', nameAr: 'الكل' },
  { id: 'restaurant', name: 'Restaurant', nameAr: 'المطعم' },
  { id: 'cafe', name: 'Cafe', nameAr: 'الكافيه' }
]
```

#### 2. Activities Page (`Activities.vue`)
```typescript
// Load products with types: 'water_sports' and 'beach_entry'
const products = await productsApi.getAll({ 
  type: ['water_sports', 'beach_entry'],
  is_active: true 
})

// Categories
const categories = [
  { id: 'all', name: 'All Activities', nameAr: 'جميع الأنشطة' },
  { id: 'water_sports', name: 'Water Sports', nameAr: 'رياضات مائية' },
  { id: 'beach_entry', name: 'Beach Entry', nameAr: 'دخول الشاطئ' }
]
```

#### 3. Events Page (Separate - Already exists)
```typescript
// Load from events table
const events = await eventsApi.getAll({ is_active: true })
```

#### 4. Rooms Page (Separate - Already exists)
```typescript
// Load from rooms table
const rooms = await roomsApi.getAll({ is_active: true })
```

---

### Phase 2: Update Backend (Optional - for new products)

#### Products Table Types:
```sql
-- Valid types for products table:
'restaurant'    -- مطعم
'cafe'          -- كافيه
'water_sports'  -- رياضات مائية
'beach_entry'   -- دخول شاطئ
```

#### Separate Tables:
```sql
-- Events table (already exists)
events

-- Rooms table (already exists)
rooms
```

---

## 🎨 Frontend Pages Structure

### 1. `/restaurant` - Restaurant & Cafe
- **Products**: `restaurant` + `cafe`
- **Filter**: All / Restaurant / Cafe
- **Display**: Menu items with prices

### 2. `/activities` - Activities & Sports
- **Products**: `water_sports` + `beach_entry`
- **Filter**: All / Water Sports / Beach Entry
- **Display**: Activity cards with booking

### 3. `/events` - Events
- **Source**: Events table
- **Filter**: By category (wedding, corporate, etc.)
- **Display**: Event cards with booking

### 4. `/rooms` - Rooms
- **Source**: Rooms table
- **Filter**: By type (standard, deluxe, suite)
- **Display**: Room cards with booking

---

## 🔄 Migration Strategy (No Database Changes Needed!)

### Option 1: Update Existing Products (Recommended)
```sql
-- Update existing products to new types
UPDATE products SET type = 'restaurant' WHERE type = 'product' AND category LIKE '%food%';
UPDATE products SET type = 'cafe' WHERE type = 'product' AND category LIKE '%drink%';
UPDATE products SET type = 'beach_entry' WHERE type = 'beach';
-- water_sports stays the same
```

### Option 2: Keep Old Types (Backward Compatible)
```typescript
// Frontend handles both old and new types
const restaurantTypes = ['product', 'restaurant', 'cafe']
const activityTypes = ['water_sports', 'beach', 'beach_entry', 'activities']
```

---

## ✅ Implementation Steps

### Step 1: Update Activities.vue
- [x] Change filter categories
- [x] Load only `water_sports` and `beach_entry`
- [x] Remove old `activities` and `beach` types

### Step 2: Update Restaurant.vue
- [ ] Add category filter (All / Restaurant / Cafe)
- [ ] Load `restaurant` and `cafe` types
- [ ] Display as menu items

### Step 3: Test
- [ ] Test filtering works
- [ ] Test booking works
- [ ] Test no conflicts with events/rooms

---

## 📊 Product Examples

### Restaurant Products:
```json
{
  "name": "Margherita Pizza",
  "type": "restaurant",
  "category": "italian",
  "price": 120.00
}
```

### Cafe Products:
```json
{
  "name": "Cappuccino",
  "type": "cafe",
  "category": "hot_drinks",
  "price": 35.00
}
```

### Water Sports:
```json
{
  "name": "Scuba Diving",
  "type": "water_sports",
  "category": "diving",
  "price": 250.00
}
```

### Beach Entry:
```json
{
  "name": "Beach Day Pass",
  "type": "beach_entry",
  "category": "access",
  "price": 50.00
}
```

---

## 🎯 Benefits

✅ **Clear Organization** - كل نوع في مكانه  
✅ **No Database Changes** - نفس الجدول  
✅ **Easy Filtering** - فلترة سهلة  
✅ **Scalable** - سهل الإضافة  
✅ **No Conflicts** - لا تعارض مع Events/Rooms  

---

**Status**: Ready to Implement  
**Risk**: Low (No DB changes)  
**Effort**: 30 minutes
