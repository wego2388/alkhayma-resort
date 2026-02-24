<template>
  <div class="space-y-8">
    <!-- Header Stats -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      <div class="group relative bg-gradient-to-br from-blue-500 to-blue-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-blue-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-blue-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-blue-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'إجمالي المنتجات' : 'Total Products' }}</p>
          <p class="text-4xl font-bold">{{ products.length }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-green-500 to-green-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-green-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-green-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-green-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'متاحة' : 'Available' }}</p>
          <p class="text-4xl font-bold">{{ products.filter(p => p.is_available).length }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-amber-500 to-amber-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-amber-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-amber-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-amber-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'الفئات' : 'Categories' }}</p>
          <p class="text-4xl font-bold">{{ uniqueCategories }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-purple-500 to-purple-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-purple-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-purple-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-purple-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'متوسط السعر' : 'Avg Price' }}</p>
          <p class="text-3xl font-bold">${{ avgPrice }}</p>
        </div>
      </div>
    </div>

    <!-- Header -->
    <div class="bg-white rounded-2xl p-6 shadow-lg border border-slate-200/50">
      <div class="flex justify-between items-center">
        <div>
          <h2 class="text-2xl font-bold text-slate-900">{{ isRTL ? 'إدارة المنتجات' : 'Manage Products' }}</h2>
          <p class="text-sm text-slate-600 mt-1">{{ products.length }} {{ isRTL ? 'منتج' : 'products' }}</p>
        </div>
        <button @click="showAddModal = true" class="px-6 py-3 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-xl font-semibold hover:shadow-xl hover:shadow-amber-500/50 hover:scale-105 transition-all duration-300 flex items-center gap-2">
          <span class="text-xl">➕</span>
          {{ isRTL ? 'إضافة منتج' : 'Add Product' }}
        </button>
      </div>
    </div>

    <!-- Filters -->
    <div class="bg-white rounded-2xl p-6 shadow-lg border border-slate-200/50">
      <div class="flex flex-wrap gap-4">
        <select v-model="categoryFilter" class="px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-all">
          <option value="">{{ isRTL ? 'كل الفئات' : 'All Categories' }}</option>
          <option value="food">{{ isRTL ? 'طعام' : 'Food' }}</option>
          <option value="beverage">{{ isRTL ? 'مشروبات' : 'Beverage' }}</option>
          <option value="spa">{{ isRTL ? 'سبا' : 'Spa' }}</option>
          <option value="amenity">{{ isRTL ? 'مرافق' : 'Amenity' }}</option>
        </select>
        <select v-model="availabilityFilter" class="px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-all">
          <option value="">{{ isRTL ? 'كل المنتجات' : 'All Products' }}</option>
          <option value="available">{{ isRTL ? 'متاحة' : 'Available' }}</option>
          <option value="unavailable">{{ isRTL ? 'غير متاحة' : 'Unavailable' }}</option>
        </select>
      </div>
    </div>

    <!-- Loading -->
    <div v-if="loading" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="i in 6" :key="i" class="bg-white rounded-2xl p-6 shadow-lg animate-pulse">
        <div class="h-48 bg-slate-200 rounded-xl mb-4"></div>
        <div class="h-6 bg-slate-200 rounded mb-2"></div>
        <div class="h-4 bg-slate-200 rounded mb-3"></div>
        <div class="flex gap-2">
          <div class="flex-1 h-10 bg-slate-200 rounded"></div>
          <div class="flex-1 h-10 bg-slate-200 rounded"></div>
        </div>
      </div>
    </div>

    <!-- Products Grid -->
    <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="product in filteredProducts" :key="product.id" class="group bg-white rounded-2xl shadow-lg border border-slate-200/50 overflow-hidden hover:shadow-2xl hover:scale-105 transition-all duration-300">
        <div class="relative overflow-hidden">
          <img :src="product.image_url" :alt="product.name" class="w-full h-48 object-cover group-hover:scale-110 transition-transform duration-500" />
          <div class="absolute top-3 right-3">
            <span :class="product.is_available ? 'bg-green-500' : 'bg-slate-500'" class="px-3 py-1 rounded-full text-white text-xs font-bold shadow-lg">
              {{ product.is_available ? '✓' : '✕' }}
            </span>
          </div>
          <div class="absolute top-3 left-3 bg-white/90 backdrop-blur-sm px-3 py-1 rounded-full">
            <span class="text-sm font-semibold text-slate-700">{{ getCategoryEmoji(product.category) }} {{ product.category }}</span>
          </div>
        </div>
        
        <div class="p-6">
          <h3 class="font-bold text-xl text-slate-900 mb-2">{{ isRTL ? product.name_ar : product.name }}</h3>
          <p class="text-sm text-slate-600 mb-4 line-clamp-2 min-h-[40px]">{{ isRTL ? product.description_ar : product.description }}</p>
          
          <div class="flex items-center justify-between mb-4 pb-4 border-b border-slate-200">
            <div>
              <p class="text-xs text-slate-500">{{ isRTL ? 'السعر' : 'Price' }}</p>
              <p class="text-2xl font-bold text-amber-600">${{ product.price }}</p>
            </div>
            <div class="text-right">
              <p class="text-xs text-slate-500">{{ isRTL ? 'الفئة' : 'Category' }}</p>
              <p class="text-sm font-semibold text-slate-900">{{ product.category }}</p>
            </div>
          </div>
          
          <div class="flex gap-2">
            <button @click="editProduct(product)" class="flex-1 px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors font-medium">
              ✏️ {{ isRTL ? 'تعديل' : 'Edit' }}
            </button>
            <button @click="toggleAvailability(product)" :class="product.is_available ? 'bg-slate-500 hover:bg-slate-600' : 'bg-green-500 hover:bg-green-600'" class="flex-1 px-4 py-2 text-white rounded-lg transition-colors font-medium">
              {{ product.is_available ? '🔒' : '✓' }}
            </button>
            <button @click="deleteProduct(product)" class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 transition-colors font-medium">
              🗑️
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- Add/Edit Modal -->
    <div v-if="showAddModal || editingProduct" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4">
      <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
        <div class="sticky top-0 bg-gradient-to-r from-amber-500 to-amber-600 text-white p-6 rounded-t-2xl">
          <h3 class="text-2xl font-bold">{{ editingProduct ? (isRTL ? 'تعديل منتج' : 'Edit Product') : (isRTL ? 'إضافة منتج' : 'Add Product') }}</h3>
        </div>
        
        <div class="p-6 space-y-4">
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الاسم (EN)' : 'Name (EN)' }}</label>
              <input v-model="formData.name" type="text" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
            </div>
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الاسم (AR)' : 'Name (AR)' }}</label>
              <input v-model="formData.name_ar" type="text" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" dir="rtl" />
            </div>
          </div>

          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الوصف (EN)' : 'Description (EN)' }}</label>
              <textarea v-model="formData.description" rows="3" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent"></textarea>
            </div>
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الوصف (AR)' : 'Description (AR)' }}</label>
              <textarea v-model="formData.description_ar" rows="3" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" dir="rtl"></textarea>
            </div>
          </div>

          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'السعر' : 'Price' }}</label>
              <input v-model.number="formData.price" type="number" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
            </div>
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الفئة' : 'Category' }}</label>
              <select v-model="formData.category" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent">
                <option value="food">Food</option>
                <option value="beverage">Beverage</option>
                <option value="spa">Spa</option>
                <option value="amenity">Amenity</option>
              </select>
            </div>
          </div>

          <div>
            <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الصورة' : 'Image' }}</label>
            
            <!-- Image Preview -->
            <div v-if="formData.image_url || imagePreview" class="mb-3 relative group">
              <img :src="imagePreview || formData.image_url" class="w-full h-48 object-cover rounded-xl border-2 border-slate-200" />
              <button @click="clearImage" type="button" class="absolute top-2 right-2 p-2 bg-red-500 text-white rounded-lg opacity-0 group-hover:opacity-100 transition-opacity">
                ❌
              </button>
            </div>

            <!-- Upload Options -->
            <div class="flex gap-2">
              <label class="flex-1 px-4 py-3 bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-xl font-semibold hover:shadow-lg cursor-pointer text-center transition-all">
                📤 {{ isRTL ? 'رفع صورة' : 'Upload Image' }}
                <input type="file" @change="handleImageUpload" accept="image/*" class="hidden" />
              </label>
              <button @click="showUrlInput = !showUrlInput" type="button" class="px-4 py-3 bg-slate-200 text-slate-700 rounded-xl font-semibold hover:bg-slate-300 transition-colors">
                🔗
              </button>
            </div>

            <!-- URL Input (Toggle) -->
            <input v-if="showUrlInput" v-model="formData.image_url" type="text" :placeholder="isRTL ? 'أو أدخل رابط الصورة' : 'Or enter image URL'" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent mt-2" />
          </div>

          <!-- Quick Templates -->
          <div class="bg-slate-50 rounded-xl p-4">
            <p class="text-sm font-semibold text-slate-700 mb-3">{{ isRTL ? '🎯 قوالب سريعة' : '🎯 Quick Templates' }}</p>
            <div class="grid grid-cols-2 gap-2">
              <button @click="applyTemplate('coffee')" type="button" class="px-3 py-2 bg-white border border-slate-200 rounded-lg hover:border-amber-500 hover:bg-amber-50 transition-all text-sm text-left">
                ☕ Coffee - $5
              </button>
              <button @click="applyTemplate('juice')" type="button" class="px-3 py-2 bg-white border border-slate-200 rounded-lg hover:border-amber-500 hover:bg-amber-50 transition-all text-sm text-left">
                🥤 Fresh Juice - $8
              </button>
              <button @click="applyTemplate('massage')" type="button" class="px-3 py-2 bg-white border border-slate-200 rounded-lg hover:border-amber-500 hover:bg-amber-50 transition-all text-sm text-left">
                💆 Massage - $120
              </button>
              <button @click="applyTemplate('towel')" type="button" class="px-3 py-2 bg-white border border-slate-200 rounded-lg hover:border-amber-500 hover:bg-amber-50 transition-all text-sm text-left">
                🎁 Beach Towel - $25
              </button>
            </div>
          </div>

          <div class="flex gap-3 pt-4">
            <button @click="saveProduct" class="flex-1 px-6 py-3 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-xl font-semibold hover:shadow-xl hover:shadow-amber-500/50 transition-all">
              {{ editingProduct ? (isRTL ? 'حفظ' : 'Save') : (isRTL ? 'إضافة' : 'Add') }}
            </button>
            <button @click="closeModal" class="px-6 py-3 bg-slate-200 text-slate-700 rounded-xl font-semibold hover:bg-slate-300 transition-colors">
              {{ isRTL ? 'إلغاء' : 'Cancel' }}
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import { productsApi } from '@/api'
import type { Product } from '@/types'

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const products = ref<Product[]>([])
const loading = ref(false)
const showAddModal = ref(false)
const editingProduct = ref<Product | null>(null)
const categoryFilter = ref('')
const availabilityFilter = ref('')
const imagePreview = ref('')
const showUrlInput = ref(false)

const formData = ref({
  name: '',
  name_ar: '',
  description: '',
  description_ar: '',
  price: 0,
  category: 'food',
  image_url: ''
})

const filteredProducts = computed(() => {
  return products.value.filter(product => {
    const matchesCategory = !categoryFilter.value || product.category === categoryFilter.value
    const matchesAvailability = !availabilityFilter.value || 
      (availabilityFilter.value === 'available' && product.is_available) ||
      (availabilityFilter.value === 'unavailable' && !product.is_available)
    return matchesCategory && matchesAvailability
  })
})

const uniqueCategories = computed(() => {
  return new Set(products.value.map(p => p.category)).size
})

const avgPrice = computed(() => {
  if (products.value.length === 0) return 0
  return Math.round(products.value.reduce((sum, p) => sum + p.price, 0) / products.value.length)
})

function getCategoryEmoji(category: string) {
  const emojis: Record<string, string> = {
    food: '🍽️',
    beverage: '🥤',
    spa: '💆',
    amenity: '🎁'
  }
  return emojis[category] || '📦'
}

async function loadProducts() {
  try {
    loading.value = true
    products.value = await productsApi.getAll()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل تحميل المنتجات' : 'Failed to load products')
  } finally {
    loading.value = false
  }
}

function editProduct(product: Product) {
  editingProduct.value = product
  formData.value = { ...product }
  imagePreview.value = ''
  showUrlInput.value = false
}

function handleImageUpload(event: Event) {
  const target = event.target as HTMLInputElement
  const file = target.files?.[0]
  if (!file) return

  // Validate file
  if (!file.type.startsWith('image/')) {
    toast.error(isRTL.value ? 'الملف يجب أن يكون صورة' : 'File must be an image')
    return
  }

  if (file.size > 5 * 1024 * 1024) {
    toast.error(isRTL.value ? 'حجم الصورة يجب أن يكون أقل من 5MB' : 'Image size must be less than 5MB')
    return
  }

  // Create preview
  const reader = new FileReader()
  reader.onload = (e) => {
    imagePreview.value = e.target?.result as string
    formData.value.image_url = imagePreview.value
  }
  reader.readAsDataURL(file)
  
  toast.success(isRTL.value ? 'تم رفع الصورة' : 'Image uploaded')
}

function clearImage() {
  imagePreview.value = ''
  formData.value.image_url = ''
  showUrlInput.value = false
}

function applyTemplate(type: string) {
  const templates: Record<string, any> = {
    coffee: {
      name: 'Premium Coffee',
      name_ar: 'قهوة فاخرة',
      description: 'Freshly brewed premium coffee',
      description_ar: 'قهوة فاخرة طازجة',
      price: 5,
      category: 'beverage',
      image_url: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400'
    },
    juice: {
      name: 'Fresh Juice',
      name_ar: 'عصير طازج',
      description: 'Freshly squeezed fruit juice',
      description_ar: 'عصير فواكه طازج',
      price: 8,
      category: 'beverage',
      image_url: 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=400'
    },
    massage: {
      name: 'Relaxing Massage',
      name_ar: 'مساج استرخاء',
      description: '60-minute full body massage',
      description_ar: 'مساج كامل للجسم 60 دقيقة',
      price: 120,
      category: 'spa',
      image_url: 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=400'
    },
    towel: {
      name: 'Beach Towel',
      name_ar: 'منشفة شاطئ',
      description: 'Premium beach towel',
      description_ar: 'منشفة شاطئ فاخرة',
      price: 25,
      category: 'amenity',
      image_url: 'https://images.unsplash.com/photo-1582735689369-4fe89db7114c?w=400'
    }
  }
  
  const template = templates[type]
  if (template) {
    formData.value = { ...template }
    imagePreview.value = template.image_url
    toast.success(isRTL.value ? 'تم تطبيق القالب' : 'Template applied')
  }
}

async function toggleAvailability(product: Product) {
  try {
    await productsApi.update(product.id, { is_available: !product.is_available })
    toast.success(isRTL.value ? 'تم التحديث' : 'Updated')
    loadProducts()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل التحديث' : 'Failed to update')
  }
}

async function deleteProduct(product: Product) {
  if (!confirm(isRTL.value ? 'هل أنت متأكد؟' : 'Are you sure?')) return
  
  try {
    await productsApi.delete(product.id)
    toast.success(isRTL.value ? 'تم الحذف' : 'Deleted')
    loadProducts()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل الحذف' : 'Failed to delete')
  }
}

async function saveProduct() {
  // Validate
  if (!formData.value.name || !formData.value.name_ar) {
    toast.error(isRTL.value ? 'الاسم مطلوب' : 'Name is required')
    return
  }
  if (formData.value.price <= 0) {
    toast.error(isRTL.value ? 'السعر يجب أن يكون أكبر من صفر' : 'Price must be greater than zero')
    return
  }

  try {
    if (editingProduct.value) {
      await productsApi.update(editingProduct.value.id, formData.value)
      toast.success(isRTL.value ? '✅ تم التحديث بنجاح' : '✅ Updated successfully')
    } else {
      await productsApi.create(formData.value)
      toast.success(isRTL.value ? '✅ تمت الإضافة بنجاح' : '✅ Added successfully')
    }
    closeModal()
    loadProducts()
  } catch (error) {
    toast.error(isRTL.value ? '❌ فشل الحفظ' : '❌ Failed to save')
  }
}

function closeModal() {
  showAddModal.value = false
  editingProduct.value = null
  imagePreview.value = ''
  showUrlInput.value = false
  formData.value = {
    name: '',
    name_ar: '',
    description: '',
    description_ar: '',
    price: 0,
    category: 'food',
    image_url: ''
  }
}

onMounted(() => {
  loadProducts()
})
</script>
