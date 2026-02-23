<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex justify-between items-center">
      <div>
        <h2 class="text-3xl font-bold text-gray-900">{{ isRTL ? 'إدارة المنتجات' : 'Manage Products' }}</h2>
        <p class="text-gray-600 mt-1">{{ products.length }} {{ isRTL ? 'منتج' : 'products' }}</p>
      </div>
      <button @click="showAddModal = true" class="btn-primary flex items-center gap-2 shadow-lg hover:shadow-xl">
        <span class="text-xl">➕</span>
        {{ isRTL ? 'إضافة منتج' : 'Add Product' }}
      </button>
    </div>

    <!-- Filter -->
    <div class="card">
      <select v-model="typeFilter" class="input w-64">
        <option value="">{{ isRTL ? 'كل الأنواع' : 'All Types' }}</option>
        <option value="restaurant">🍽️ Restaurant</option>
        <option value="cafe">☕ Cafe</option>
        <option value="water_sports">🏄 Water Sports</option>
        <option value="activities">🎯 Activities</option>
        <option value="beach">🏖️ Beach</option>
      </select>
    </div>

    <!-- Loading -->
    <div v-if="loading" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="i in 6" :key="i" class="card animate-pulse">
        <div class="h-48 bg-gray-200 rounded-lg mb-3"></div>
        <div class="h-6 bg-gray-200 rounded mb-2"></div>
        <div class="h-4 bg-gray-200 rounded mb-3"></div>
        <div class="flex gap-2">
          <div class="flex-1 h-10 bg-gray-200 rounded"></div>
          <div class="flex-1 h-10 bg-gray-200 rounded"></div>
        </div>
      </div>
    </div>

    <!-- Products Grid -->
    <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="product in filteredProducts" :key="product.id" class="card hover:shadow-2xl transition-all duration-300 group border-2 border-transparent hover:border-primary-200">
        <div class="relative overflow-hidden rounded-xl mb-4">
          <img :src="product.image_url" :alt="product.name" class="w-full h-48 object-cover group-hover:scale-110 transition-transform duration-500" />
          <div class="absolute top-3 right-3">
            <span class="px-3 py-1 bg-blue-500 text-white rounded-full text-xs font-bold shadow-lg flex items-center gap-1">
              <span>{{ getTypeIcon(product.type) }}</span>
              {{ product.type }}
            </span>
          </div>
          <div class="absolute bottom-3 left-3 bg-white/90 backdrop-blur-sm px-3 py-1 rounded-full">
            <span :class="product.is_active ? 'text-green-600' : 'text-gray-600'" class="text-sm font-semibold">
              {{ product.is_active ? '✓ Active' : '✕ Inactive' }}
            </span>
          </div>
        </div>
        
        <h3 class="font-bold text-xl text-gray-900 mb-2">{{ isRTL ? product.name_ar : product.name }}</h3>
        <p class="text-sm text-gray-600 mb-4 line-clamp-2 min-h-[40px]">{{ isRTL ? product.description_ar : product.description }}</p>
        
        <div class="flex items-center justify-between mb-4 pb-4 border-b">
          <div>
            <p class="text-xs text-gray-500">{{ isRTL ? 'السعر' : 'Price' }}</p>
            <p class="text-2xl font-bold text-primary-600">${{ product.price }}</p>
          </div>
          <div class="text-right">
            <p class="text-xs text-gray-500">{{ isRTL ? 'رقم المنتج' : 'Product ID' }}</p>
            <p class="text-lg font-mono font-bold text-gray-700">#{{ product.id }}</p>
          </div>
        </div>
        
        <div class="flex gap-2">
          <button @click="editProduct(product)" class="flex-1 bg-gradient-to-r from-blue-500 to-blue-600 text-white px-4 py-2.5 rounded-lg hover:from-blue-600 hover:to-blue-700 text-sm font-semibold transition-all hover:shadow-lg flex items-center justify-center gap-2">
            <span>✏️</span>
            {{ isRTL ? 'تعديل' : 'Edit' }}
          </button>
          <button @click="deleteProduct(product.id)" class="flex-1 bg-gradient-to-r from-red-500 to-red-600 text-white px-4 py-2.5 rounded-lg hover:from-red-600 hover:to-red-700 text-sm font-semibold transition-all hover:shadow-lg flex items-center justify-center gap-2">
            <span>🗑️</span>
            {{ isRTL ? 'حذف' : 'Delete' }}
          </button>
        </div>
      </div>
    </div>

    <!-- Empty State -->
    <div v-if="!loading && filteredProducts.length === 0" class="card text-center py-16">
      <div class="text-8xl mb-4">🍽️</div>
      <h3 class="text-2xl font-bold text-gray-900 mb-2">{{ isRTL ? 'لا توجد منتجات' : 'No Products Yet' }}</h3>
      <p class="text-gray-600 mb-6">{{ isRTL ? 'ابدأ بإضافة منتج جديد' : 'Start by adding a new product' }}</p>
      <button @click="showAddModal = true" class="btn-primary">
        ➕ {{ isRTL ? 'إضافة منتج' : 'Add Product' }}
      </button>
    </div>

    <Transition name="modal">
      <div v-if="showAddModal || editingProduct" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4" @click.self="closeModal">
        <div class="bg-white rounded-2xl p-6 max-w-2xl w-full max-h-[90vh] overflow-y-auto">
          <h3 class="text-2xl font-bold mb-4">
            {{ editingProduct ? (isRTL ? 'تعديل منتج' : 'Edit Product') : (isRTL ? 'إضافة منتج' : 'Add Product') }}
          </h3>
          
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-semibold mb-2">Name (EN)</label>
              <input v-model="formData.name" type="text" class="input w-full" />
            </div>
            <div>
              <label class="block text-sm font-semibold mb-2">Name (AR)</label>
              <input v-model="formData.name_ar" type="text" class="input w-full" />
            </div>
            <div class="col-span-2">
              <label class="block text-sm font-semibold mb-2">Description (EN)</label>
              <textarea v-model="formData.description" class="input w-full" rows="2"></textarea>
            </div>
            <div class="col-span-2">
              <label class="block text-sm font-semibold mb-2">Description (AR)</label>
              <textarea v-model="formData.description_ar" class="input w-full" rows="2"></textarea>
            </div>
            <div>
              <label class="block text-sm font-semibold mb-2">Price</label>
              <input v-model.number="formData.price" type="number" class="input w-full" />
            </div>
            <div>
              <label class="block text-sm font-semibold mb-2">Type</label>
              <select v-model="formData.type" class="input w-full">
                <option value="restaurant">Restaurant</option>
                <option value="cafe">Cafe</option>
                <option value="water_sports">Water Sports</option>
                <option value="activities">Activities</option>
                <option value="beach">Beach</option>
              </select>
            </div>
            <div class="col-span-2">
              <label class="block text-sm font-semibold mb-2">Image URL</label>
              <input v-model="formData.image_url" type="text" class="input w-full" />
            </div>
            <div class="col-span-2">
              <label class="flex items-center gap-2">
                <input v-model="formData.is_active" type="checkbox" class="w-4 h-4" />
                <span class="font-semibold">Active</span>
              </label>
            </div>
          </div>

          <div class="flex gap-3 mt-6">
            <button @click="closeModal" class="flex-1 btn-secondary">Cancel</button>
            <button @click="saveProduct" class="flex-1 btn-primary" :disabled="saving">
              {{ saving ? '...' : 'Save' }}
            </button>
          </div>
        </div>
      </div>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import apiClient from '@/api/client'

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const products = ref<any[]>([])
const showAddModal = ref(false)
const editingProduct = ref<any>(null)
const saving = ref(false)
const loading = ref(true)
const typeFilter = ref('')

const filteredProducts = computed(() => {
  if (!typeFilter.value) return products.value
  return products.value.filter(p => p.type === typeFilter.value)
})

function getTypeIcon(type: string) {
  const icons: Record<string, string> = {
    restaurant: '🍽️',
    cafe: '☕',
    water_sports: '🏄',
    activities: '🎯',
    beach: '🏖️'
  }
  return icons[type] || '📦'
}

const formData = ref({
  name: '',
  name_ar: '',
  description: '',
  description_ar: '',
  price: 0,
  type: 'restaurant',
  image_url: '',
  is_active: true
})

async function loadProducts() {
  loading.value = true
  try {
    const response = await apiClient.get('/api/products')
    products.value = response.data
  } catch (error) {
    toast.error('Failed to load')
  } finally {
    loading.value = false
  }
}

function editProduct(product: any) {
  editingProduct.value = product
  formData.value = { ...product }
}

async function saveProduct() {
  saving.value = true
  try {
    if (editingProduct.value) {
      await apiClient.put(`/api/products/${editingProduct.value.id}`, formData.value)
      toast.success('Updated')
    } else {
      await apiClient.post('/api/products', formData.value)
      toast.success('Added')
    }
    closeModal()
    loadProducts()
  } catch (error) {
    toast.error('Failed to save')
  } finally {
    saving.value = false
  }
}

async function deleteProduct(id: number) {
  if (!confirm('Are you sure?')) return
  
  try {
    await apiClient.delete(`/api/products/${id}`)
    toast.success('Deleted')
    loadProducts()
  } catch (error) {
    toast.error('Failed to delete')
  }
}

function closeModal() {
  showAddModal.value = false
  editingProduct.value = null
  formData.value = {
    name: '',
    name_ar: '',
    description: '',
    description_ar: '',
    price: 0,
    type: 'restaurant',
    image_url: '',
    is_active: true
  }
}

onMounted(() => {
  loadProducts()
})
</script>

<style scoped>
.modal-enter-active, .modal-leave-active {
  transition: opacity 0.3s ease;
}
.modal-enter-from, .modal-leave-to {
  opacity: 0;
}

.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
