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

    <!-- Loading -->
    <div v-if="loading" class="text-center py-12">
      <div class="inline-block animate-spin rounded-full h-16 w-16 border-4 border-primary-600 border-t-transparent"></div>
      <p class="text-gray-600 mt-4">{{ isRTL ? 'جاري التحميل...' : 'Loading...' }}</p>
    </div>

    <!-- Categories -->
    <div v-else class="space-y-8">
      <!-- Food & Beverages -->
      <div class="card bg-gradient-to-br from-orange-50 to-yellow-50 border-2 border-orange-200">
        <div class="flex items-center justify-between mb-6">
          <div class="flex items-center gap-3">
            <span class="text-4xl">🍽️</span>
            <div>
              <h3 class="text-2xl font-bold text-gray-900">{{ isRTL ? 'المطعم والكافيه' : 'Food & Beverages' }}</h3>
              <p class="text-sm text-gray-600">{{ foodProducts.length }} {{ isRTL ? 'منتج' : 'items' }}</p>
            </div>
          </div>
          <button @click="addProduct('restaurant')" class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded-lg text-sm font-semibold transition-all">
            ➕ {{ isRTL ? 'إضافة' : 'Add' }}
          </button>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          <div v-for="product in foodProducts" :key="product.id" class="bg-white rounded-xl p-4 shadow-sm hover:shadow-lg transition-all border border-orange-100">
            <div class="flex items-start gap-3 mb-3">
              <img :src="product.image_url" :alt="product.name" class="w-20 h-20 object-cover rounded-lg" />
              <div class="flex-1">
                <div class="flex items-center gap-2 mb-1">
                  <span class="text-xl">{{ product.type === 'restaurant' ? '🍽️' : '☕' }}</span>
                  <h4 class="font-bold text-gray-900">{{ isRTL ? product.name_ar : product.name }}</h4>
                </div>
                <p class="text-xs text-gray-600 line-clamp-1">{{ isRTL ? product.description_ar : product.description }}</p>
                <p class="text-lg font-bold text-orange-600 mt-1">${{ product.price }}</p>
              </div>
            </div>
            <div class="flex gap-2">
              <button @click="editProduct(product)" class="flex-1 bg-blue-500 text-white px-3 py-1.5 rounded text-xs font-semibold hover:bg-blue-600">
                ✏️ {{ isRTL ? 'تعديل' : 'Edit' }}
              </button>
              <button @click="deleteProduct(product.id)" class="flex-1 bg-red-500 text-white px-3 py-1.5 rounded text-xs font-semibold hover:bg-red-600">
                🗑️ {{ isRTL ? 'حذف' : 'Delete' }}
              </button>
            </div>
          </div>
        </div>
        
        <div v-if="foodProducts.length === 0" class="text-center py-8 text-gray-500">
          {{ isRTL ? 'لا توجد منتجات' : 'No products yet' }}
        </div>
      </div>

      <!-- Beach Services -->
      <div class="card bg-gradient-to-br from-blue-50 to-cyan-50 border-2 border-blue-200">
        <div class="flex items-center justify-between mb-6">
          <div class="flex items-center gap-3">
            <span class="text-4xl">🏖️</span>
            <div>
              <h3 class="text-2xl font-bold text-gray-900">{{ isRTL ? 'خدمات الشاطئ' : 'Beach Services' }}</h3>
              <p class="text-sm text-gray-600">{{ beachProducts.length }} {{ isRTL ? 'خدمة' : 'services' }}</p>
            </div>
          </div>
          <button @click="addProduct('beach')" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-semibold transition-all">
            ➕ {{ isRTL ? 'إضافة' : 'Add' }}
          </button>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          <div v-for="product in beachProducts" :key="product.id" class="bg-white rounded-xl p-4 shadow-sm hover:shadow-lg transition-all border border-blue-100">
            <div class="flex items-start gap-3 mb-3">
              <img :src="product.image_url" :alt="product.name" class="w-20 h-20 object-cover rounded-lg" />
              <div class="flex-1">
                <div class="flex items-center gap-2 mb-1">
                  <span class="text-xl">🏖️</span>
                  <h4 class="font-bold text-gray-900">{{ isRTL ? product.name_ar : product.name }}</h4>
                </div>
                <p class="text-xs text-gray-600 line-clamp-1">{{ isRTL ? product.description_ar : product.description }}</p>
                <p class="text-lg font-bold text-blue-600 mt-1">${{ product.price }}</p>
              </div>
            </div>
            <div class="flex gap-2">
              <button @click="editProduct(product)" class="flex-1 bg-blue-500 text-white px-3 py-1.5 rounded text-xs font-semibold hover:bg-blue-600">
                ✏️ {{ isRTL ? 'تعديل' : 'Edit' }}
              </button>
              <button @click="deleteProduct(product.id)" class="flex-1 bg-red-500 text-white px-3 py-1.5 rounded text-xs font-semibold hover:bg-red-600">
                🗑️ {{ isRTL ? 'حذف' : 'Delete' }}
              </button>
            </div>
          </div>
        </div>
        
        <div v-if="beachProducts.length === 0" class="text-center py-8 text-gray-500">
          {{ isRTL ? 'لا توجد خدمات' : 'No services yet' }}
        </div>
      </div>

      <!-- Water Sports -->
      <div class="card bg-gradient-to-br from-teal-50 to-emerald-50 border-2 border-teal-200">
        <div class="flex items-center justify-between mb-6">
          <div class="flex items-center gap-3">
            <span class="text-4xl">🏄</span>
            <div>
              <h3 class="text-2xl font-bold text-gray-900">{{ isRTL ? 'الرياضات المائية' : 'Water Sports' }}</h3>
              <p class="text-sm text-gray-600">{{ waterSportsProducts.length }} {{ isRTL ? 'نشاط' : 'activities' }}</p>
            </div>
          </div>
          <button @click="addProduct('water_sports')" class="bg-teal-500 hover:bg-teal-600 text-white px-4 py-2 rounded-lg text-sm font-semibold transition-all">
            ➕ {{ isRTL ? 'إضافة' : 'Add' }}
          </button>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          <div v-for="product in waterSportsProducts" :key="product.id" class="bg-white rounded-xl p-4 shadow-sm hover:shadow-lg transition-all border border-teal-100">
            <div class="flex items-start gap-3 mb-3">
              <img :src="product.image_url" :alt="product.name" class="w-20 h-20 object-cover rounded-lg" />
              <div class="flex-1">
                <div class="flex items-center gap-2 mb-1">
                  <span class="text-xl">🏄</span>
                  <h4 class="font-bold text-gray-900">{{ isRTL ? product.name_ar : product.name }}</h4>
                </div>
                <p class="text-xs text-gray-600 line-clamp-1">{{ isRTL ? product.description_ar : product.description }}</p>
                <p class="text-lg font-bold text-teal-600 mt-1">${{ product.price }}</p>
              </div>
            </div>
            <div class="flex gap-2">
              <button @click="editProduct(product)" class="flex-1 bg-blue-500 text-white px-3 py-1.5 rounded text-xs font-semibold hover:bg-blue-600">
                ✏️ {{ isRTL ? 'تعديل' : 'Edit' }}
              </button>
              <button @click="deleteProduct(product.id)" class="flex-1 bg-red-500 text-white px-3 py-1.5 rounded text-xs font-semibold hover:bg-red-600">
                🗑️ {{ isRTL ? 'حذف' : 'Delete' }}
              </button>
            </div>
          </div>
        </div>
        
        <div v-if="waterSportsProducts.length === 0" class="text-center py-8 text-gray-500">
          {{ isRTL ? 'لا توجد أنشطة' : 'No activities yet' }}
        </div>
      </div>

      <!-- Activities & Events -->
      <div class="card bg-gradient-to-br from-purple-50 to-pink-50 border-2 border-purple-200">
        <div class="flex items-center justify-between mb-6">
          <div class="flex items-center gap-3">
            <span class="text-4xl">🎯</span>
            <div>
              <h3 class="text-2xl font-bold text-gray-900">{{ isRTL ? 'الأنشطة والفعاليات' : 'Activities & Events' }}</h3>
              <p class="text-sm text-gray-600">{{ activitiesProducts.length }} {{ isRTL ? 'نشاط' : 'activities' }}</p>
            </div>
          </div>
          <button @click="addProduct('activities')" class="bg-purple-500 hover:bg-purple-600 text-white px-4 py-2 rounded-lg text-sm font-semibold transition-all">
            ➕ {{ isRTL ? 'إضافة' : 'Add' }}
          </button>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          <div v-for="product in activitiesProducts" :key="product.id" class="bg-white rounded-xl p-4 shadow-sm hover:shadow-lg transition-all border border-purple-100">
            <div class="flex items-start gap-3 mb-3">
              <img :src="product.image_url" :alt="product.name" class="w-20 h-20 object-cover rounded-lg" />
              <div class="flex-1">
                <div class="flex items-center gap-2 mb-1">
                  <span class="text-xl">🎯</span>
                  <h4 class="font-bold text-gray-900">{{ isRTL ? product.name_ar : product.name }}</h4>
                </div>
                <p class="text-xs text-gray-600 line-clamp-1">{{ isRTL ? product.description_ar : product.description }}</p>
                <p class="text-lg font-bold text-purple-600 mt-1">${{ product.price }}</p>
              </div>
            </div>
            <div class="flex gap-2">
              <button @click="editProduct(product)" class="flex-1 bg-blue-500 text-white px-3 py-1.5 rounded text-xs font-semibold hover:bg-blue-600">
                ✏️ {{ isRTL ? 'تعديل' : 'Edit' }}
              </button>
              <button @click="deleteProduct(product.id)" class="flex-1 bg-red-500 text-white px-3 py-1.5 rounded text-xs font-semibold hover:bg-red-600">
                🗑️ {{ isRTL ? 'حذف' : 'Delete' }}
              </button>
            </div>
          </div>
        </div>
        
        <div v-if="activitiesProducts.length === 0" class="text-center py-8 text-gray-500">
          {{ isRTL ? 'لا توجد أنشطة' : 'No activities yet' }}
        </div>
      </div>
    </div>

    <!-- Add/Edit Modal -->
    <Transition name="modal">
      <div v-if="showAddModal || editingProduct" class="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4" @click.self="closeModal">
        <div class="bg-white rounded-2xl p-8 max-w-3xl w-full max-h-[90vh] overflow-y-auto shadow-2xl">
          <div class="flex items-center justify-between mb-6">
            <h3 class="text-3xl font-bold text-gray-900">
              {{ editingProduct ? (isRTL ? '✏️ تعديل منتج' : '✏️ Edit Product') : (isRTL ? '➕ إضافة منتج' : '➕ Add Product') }}
            </h3>
            <button @click="closeModal" class="text-3xl text-gray-400 hover:text-gray-600">×</button>
          </div>
          
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label class="block text-sm font-bold text-gray-700 mb-2">Name (EN) *</label>
              <input v-model="formData.name" type="text" class="input w-full" placeholder="Grilled Fish" />
            </div>
            <div>
              <label class="block text-sm font-bold text-gray-700 mb-2">Name (AR) *</label>
              <input v-model="formData.name_ar" type="text" class="input w-full" placeholder="سمك مشوي" />
            </div>
            <div class="col-span-1 md:col-span-2">
              <label class="block text-sm font-bold text-gray-700 mb-2">Description (EN) *</label>
              <textarea v-model="formData.description" class="input w-full" rows="2" placeholder="Fresh grilled fish with vegetables..."></textarea>
            </div>
            <div class="col-span-1 md:col-span-2">
              <label class="block text-sm font-bold text-gray-700 mb-2">Description (AR) *</label>
              <textarea v-model="formData.description_ar" class="input w-full" rows="2" placeholder="سمك مشوي طازج مع الخضار..."></textarea>
            </div>
            <div>
              <label class="block text-sm font-bold text-gray-700 mb-2">Price ($) *</label>
              <input v-model.number="formData.price" type="number" min="0" class="input w-full" placeholder="25" />
            </div>
            <div>
              <label class="block text-sm font-bold text-gray-700 mb-2">Type *</label>
              <select v-model="formData.type" class="input w-full">
                <option value="restaurant">🍽️ Restaurant</option>
                <option value="cafe">☕ Cafe</option>
                <option value="beach">🏖️ Beach</option>
                <option value="water_sports">🏄 Water Sports</option>
                <option value="activities">🎯 Activities</option>
              </select>
            </div>
            <div class="col-span-1 md:col-span-2">
              <label class="block text-sm font-bold text-gray-700 mb-2">Image URL *</label>
              <input v-model="formData.image_url" type="text" class="input w-full" placeholder="https://images.unsplash.com/..." />
            </div>
            <div class="col-span-1 md:col-span-2">
              <label class="flex items-center gap-3 p-4 bg-gray-50 rounded-lg cursor-pointer hover:bg-gray-100">
                <input v-model="formData.is_active" type="checkbox" class="w-5 h-5" />
                <div>
                  <span class="font-bold text-gray-900">Active</span>
                  <p class="text-xs text-gray-600">Product is available for booking</p>
                </div>
              </label>
            </div>
          </div>

          <div class="flex gap-3 mt-8">
            <button @click="closeModal" class="flex-1 btn-secondary py-3" :disabled="saving">Cancel</button>
            <button @click="saveProduct" class="flex-1 btn-primary py-3" :disabled="saving">
              <span v-if="saving" class="inline-block animate-spin mr-2">⏳</span>
              {{ saving ? 'Saving...' : '💾 Save' }}
            </button>
          </div>
        </div>
      </div>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
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

const foodProducts = computed(() => 
  products.value.filter(p => ['restaurant', 'cafe'].includes(p.type))
)

const beachProducts = computed(() => 
  products.value.filter(p => p.type === 'beach')
)

const waterSportsProducts = computed(() => 
  products.value.filter(p => p.type === 'water_sports')
)

const activitiesProducts = computed(() => 
  products.value.filter(p => p.type === 'activities')
)

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

function addProduct(type: string) {
  formData.value.type = type
  showAddModal.value = true
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
  if (!confirm(isRTL.value ? 'هل أنت متأكد؟' : 'Are you sure?')) return
  
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

.line-clamp-1 {
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
