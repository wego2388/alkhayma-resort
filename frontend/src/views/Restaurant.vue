<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-primary-600 to-primary-800 text-white py-16">
      <div class="container mx-auto px-4 text-center">
        <h1 class="text-5xl font-bold mb-4">
          {{ isRTL ? '🍽️ المطعم والكافيه' : '🍽️ Restaurant & Cafe' }}
        </h1>
        <p class="text-xl text-primary-100">
          {{ isRTL ? 'استمتع بأشهى المأكولات والمشروبات' : 'Enjoy the finest food and beverages' }}
        </p>
      </div>
    </div>

    <div class="container mx-auto px-4 py-12">
      <!-- Category Tabs -->
      <div class="flex justify-center gap-4 mb-12">
        <button 
          @click="selectedType = 'restaurant'" 
          :class="selectedType === 'restaurant' ? 'bg-primary-600 text-white shadow-lg scale-105' : 'bg-white text-gray-700 hover:bg-gray-50'"
          class="px-8 py-4 rounded-xl font-bold text-lg transition-all duration-300 border-2 border-primary-600"
        >
          🍽️ {{ isRTL ? 'المطعم' : 'Restaurant' }}
          <span class="ml-2 px-2 py-1 bg-white/20 rounded-full text-sm">
            {{ restaurantCount }}
          </span>
        </button>
        <button 
          @click="selectedType = 'cafe'" 
          :class="selectedType === 'cafe' ? 'bg-primary-600 text-white shadow-lg scale-105' : 'bg-white text-gray-700 hover:bg-gray-50'"
          class="px-8 py-4 rounded-xl font-bold text-lg transition-all duration-300 border-2 border-primary-600"
        >
          ☕ {{ isRTL ? 'الكافيه' : 'Cafe' }}
          <span class="ml-2 px-2 py-1 bg-white/20 rounded-full text-sm">
            {{ cafeCount }}
          </span>
        </button>
      </div>

      <!-- Loading Skeletons -->
      <div v-if="loading" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div v-for="i in 6" :key="i" class="bg-white rounded-2xl shadow-md overflow-hidden animate-pulse">
          <div class="h-56 bg-gray-200"></div>
          <div class="p-6 space-y-3">
            <div class="h-6 bg-gray-200 rounded w-3/4"></div>
            <div class="h-4 bg-gray-200 rounded w-full"></div>
            <div class="h-4 bg-gray-200 rounded w-2/3"></div>
            <div class="flex justify-between items-center pt-4">
              <div class="h-8 bg-gray-200 rounded w-24"></div>
              <div class="h-10 bg-gray-200 rounded w-28"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Products Grid -->
      <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div 
          v-for="product in filteredProducts" 
          :key="product.id" 
          class="bg-white rounded-2xl shadow-md hover:shadow-2xl transition-all duration-300 overflow-hidden group"
        >
          <!-- Image -->
          <div class="relative overflow-hidden h-56">
            <img 
              :src="product.image_url || getDefaultImage(product.type)" 
              :alt="displayName(product)" 
              class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500" 
            />
            <div class="absolute top-4 right-4 bg-white/90 backdrop-blur-sm px-3 py-1 rounded-full">
              <span class="text-sm font-semibold text-primary-600">
                {{ product.type === 'restaurant' ? '🍽️' : '☕' }}
              </span>
            </div>
          </div>
          
          <!-- Content -->
          <div class="p-6">
            <h3 class="text-2xl font-bold mb-2 text-gray-900">{{ displayName(product) }}</h3>
            <p class="text-gray-600 mb-4 line-clamp-2 min-h-[3rem]">{{ displayDescription(product) }}</p>
            
            <div class="flex justify-between items-center pt-4 border-t">
              <div>
                <p class="text-sm text-gray-500 mb-1">{{ isRTL ? 'السعر' : 'Price' }}</p>
                <span class="text-3xl font-bold text-primary-600">
                  {{ formatPrice(Number(product.price), currentLocale) }}
                </span>
              </div>
              <button 
                @click="orderProduct(product)" 
                class="bg-primary-600 hover:bg-primary-700 text-white px-6 py-3 rounded-xl font-semibold transition-all duration-300 hover:scale-105 shadow-md hover:shadow-lg"
              >
                {{ isRTL ? '🛒 اطلب الآن' : '🛒 Order Now' }}
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Empty State -->
      <div v-if="!loading && filteredProducts.length === 0" class="text-center py-20">
        <div class="text-8xl mb-4">{{ selectedType === 'restaurant' ? '🍽️' : '☕' }}</div>
        <p class="text-2xl text-gray-500 font-semibold">
          {{ isRTL ? 'لا توجد منتجات متاحة حالياً' : 'No products available at the moment' }}
        </p>
      </div>
    </div>

    <!-- Guest Info Modal -->
    <Transition name="modal">
      <div v-if="showGuestModal" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4" @click.self="showGuestModal = false">
        <Transition name="modal-content">
          <div v-if="showGuestModal" class="bg-white rounded-2xl p-8 max-w-md w-full shadow-2xl">
            <h3 class="text-2xl font-bold text-gray-900 mb-6 text-center">
              {{ isRTL ? '📝 معلومات الطلب' : '📝 Order Information' }}
            </h3>
            
            <div class="space-y-4 mb-6">
              <div>
                <label class="block text-sm font-semibold text-gray-700 mb-2">
                  {{ isRTL ? 'الاسم' : 'Name' }} *
                </label>
                <input v-model="guestInfo.name" type="text" class="input w-full" :placeholder="isRTL ? 'أدخل اسمك' : 'Enter your name'" required />
              </div>
              
              <div>
                <label class="block text-sm font-semibold text-gray-700 mb-2">
                  {{ isRTL ? 'البريد الإلكتروني' : 'Email' }} *
                </label>
                <input v-model="guestInfo.email" type="email" class="input w-full" :placeholder="isRTL ? 'example@email.com' : 'example@email.com'" required />
              </div>
              
              <div>
                <label class="block text-sm font-semibold text-gray-700 mb-2">
                  {{ isRTL ? 'رقم الهاتف' : 'Phone' }} *
                </label>
                <input v-model="guestInfo.phone" type="tel" class="input w-full" :placeholder="isRTL ? '+20 123 456 7890' : '+20 123 456 7890'" required />
              </div>
            </div>
            
            <div class="flex gap-3">
              <button @click="showGuestModal = false" class="flex-1 btn-secondary" :disabled="submitting">
                {{ isRTL ? 'إلغاء' : 'Cancel' }}
              </button>
              <button @click="confirmOrder" class="flex-1 btn-primary" :disabled="submitting">
                <span v-if="submitting" class="inline-block animate-spin mr-2">⏳</span>
                {{ submitting ? (isRTL ? 'جاري الطلب...' : 'Ordering...') : (isRTL ? 'تأكيد الطلب' : 'Confirm Order') }}
              </button>
            </div>
          </div>
        </Transition>
      </div>
    </Transition>

    <!-- Success Modal -->
    <Transition name="modal">
      <div v-if="showSuccessModal" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4" @click.self="showSuccessModal = false">
        <Transition name="modal-content">
          <div v-if="showSuccessModal" class="bg-white rounded-2xl p-8 max-w-md w-full shadow-2xl">
            <div class="text-center mb-6">
              <div class="text-6xl mb-4 animate-bounce">✅</div>
              <h3 class="text-2xl font-bold text-gray-900 mb-2">
                {{ isRTL ? 'تم الطلب بنجاح!' : 'Order Placed Successfully!' }}
              </h3>
              <p class="text-gray-600">
                {{ isRTL ? `رقم الطلب: #${lastBookingId}` : `Order ID: #${lastBookingId}` }}
              </p>
            </div>
            <button @click="showSuccessModal = false" class="w-full btn-primary">
              {{ isRTL ? 'إغلاق' : 'Close' }}
            </button>
          </div>
        </Transition>
      </div>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useAuthStore } from '@/stores/auth'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import { productsApi } from '@/api/products'
import { bookingsApi } from '@/api/bookings'
import { formatPrice } from '@/utils/currency'
import type { Product } from '@/types'

const { t } = useI18n()
const router = useRouter()
const authStore = useAuthStore()
const appStore = useAppStore()
const toast = useToast()

const products = ref<Product[]>([])
const loading = ref(true)
const submitting = ref(false)
const selectedType = ref('restaurant')
const showGuestModal = ref(false)
const showSuccessModal = ref(false)
const lastBookingId = ref(0)
const selectedProduct = ref<Product | null>(null)
const guestInfo = ref({
  name: '',
  email: '',
  phone: ''
})
const isRTL = computed(() => appStore.isRTL)
const currentLocale = computed(() => appStore.currentLocale)

const filteredProducts = computed(() => 
  products.value.filter(p => p.type === selectedType.value)
)

const restaurantCount = computed(() => 
  products.value.filter(p => p.type === 'restaurant').length
)

const cafeCount = computed(() => 
  products.value.filter(p => p.type === 'cafe').length
)

const displayName = (product: Product) => isRTL.value ? product.name_ar : product.name
const displayDescription = (product: Product) => isRTL.value ? product.description_ar : product.description

function getDefaultImage(type: string) {
  return type === 'restaurant' 
    ? 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=600'
    : 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600'
}

async function loadProducts() {
  try {
    products.value = await productsApi.getAll({ is_active: true })
  } catch (error) {
    console.error('Failed to load products:', error)
  } finally {
    loading.value = false
  }
}

async function orderProduct(product: Product) {
  selectedProduct.value = product
  showGuestModal.value = true
}

async function confirmOrder() {
  // Validation
  if (!guestInfo.value.name.trim()) {
    toast.error(
      isRTL.value ? 'خطأ' : 'Error',
      isRTL.value ? 'يرجى إدخال الاسم' : 'Please enter your name'
    )
    return
  }

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  if (!emailRegex.test(guestInfo.value.email)) {
    toast.error(
      isRTL.value ? 'خطأ' : 'Error',
      isRTL.value ? 'يرجى إدخال بريد إلكتروني صحيح' : 'Please enter a valid email'
    )
    return
  }

  const phoneRegex = /^[\d\s\+\-\(\)]+$/
  if (!phoneRegex.test(guestInfo.value.phone) || guestInfo.value.phone.length < 10) {
    toast.error(
      isRTL.value ? 'خطأ' : 'Error',
      isRTL.value ? 'يرجى إدخال رقم هاتف صحيح' : 'Please enter a valid phone number'
    )
    return
  }

  if (!selectedProduct.value) return

  submitting.value = true

  try {
    const booking = await bookingsApi.create({
      product_id: selectedProduct.value.id,
      booking_type: selectedType.value,
      booking_date: new Date().toISOString(),
      guests: 1,
      total_price: Number(selectedProduct.value.price),
      guest_name: guestInfo.value.name,
      guest_email: guestInfo.value.email,
      guest_phone: guestInfo.value.phone
    })
    
    lastBookingId.value = booking.id
    showGuestModal.value = false
    showSuccessModal.value = true
    
    toast.success(
      isRTL.value ? 'تم الطلب بنجاح!' : 'Order Placed!',
      isRTL.value ? `رقم الطلب: #${booking.id}` : `Order ID: #${booking.id}`
    )
    
    // Reset form
    guestInfo.value = { name: '', email: '', phone: '' }
  } catch (error: any) {
    toast.error(
      isRTL.value ? 'فشل الطلب' : 'Order Failed',
      error.response?.data?.detail || (isRTL.value ? 'حدث خطأ، حاول مرة أخرى' : 'An error occurred, please try again')
    )
  } finally {
    submitting.value = false
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

.modal-content-enter-active {
  transition: all 0.3s ease;
}
.modal-content-leave-active {
  transition: all 0.2s ease;
}
.modal-content-enter-from {
  opacity: 0;
  transform: scale(0.9) translateY(-20px);
}
.modal-content-leave-to {
  opacity: 0;
  transform: scale(0.95);
}
</style>

