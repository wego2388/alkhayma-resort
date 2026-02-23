<template>
  <div class="container mx-auto px-4 py-12">
    <h1 class="text-4xl font-bold mb-8">{{ isRTL ? 'المطعم والكافيه' : 'Restaurant & Cafe' }}</h1>

    <!-- Category Tabs -->
    <div class="flex gap-4 mb-8">
      <button @click="selectedType = 'restaurant'" 
        :class="selectedType === 'restaurant' ? 'btn-primary' : 'btn-secondary'">
        {{ isRTL ? 'المطعم' : 'Restaurant' }}
      </button>
      <button @click="selectedType = 'cafe'" 
        :class="selectedType === 'cafe' ? 'btn-primary' : 'btn-secondary'">
        {{ isRTL ? 'الكافيه' : 'Cafe' }}
      </button>
    </div>

    <!-- Loading -->
    <div v-if="loading" class="text-center py-12">
      <p class="text-xl">{{ t('common.loading') }}</p>
    </div>

    <!-- Products Grid -->
    <div v-else class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div v-for="product in filteredProducts" :key="product.id" class="card">
        <img :src="product.image_url || 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400'" 
          :alt="displayName(product)" class="w-full h-48 object-cover rounded-lg mb-4" />
        
        <h3 class="text-xl font-bold mb-2">{{ displayName(product) }}</h3>
        <p class="text-gray-600 mb-4">{{ displayDescription(product) }}</p>
        
        <div class="flex justify-between items-center">
          <span class="text-2xl font-bold text-primary-600">{{ formatPrice(Number(product.price), currentLocale) }}</span>
          <button @click="orderProduct(product)" class="btn-primary">
            {{ isRTL ? 'اطلب الآن' : 'Order Now' }}
          </button>
        </div>
      </div>
    </div>

    <!-- Empty State -->
    <div v-if="!loading && filteredProducts.length === 0" class="text-center py-12">
      <p class="text-xl text-gray-500">{{ isRTL ? 'لا توجد منتجات متاحة' : 'No products available' }}</p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useAuthStore } from '@/stores/auth'
import { useAppStore } from '@/stores/app'
import { productsApi } from '@/api/products'
import { bookingsApi } from '@/api/bookings'
import { formatPrice } from '@/utils/currency'
import type { Product } from '@/types'

const { t } = useI18n()
const router = useRouter()
const authStore = useAuthStore()
const appStore = useAppStore()

const products = ref<Product[]>([])
const loading = ref(true)
const selectedType = ref('restaurant')
const isRTL = computed(() => appStore.isRTL)
const currentLocale = computed(() => appStore.currentLocale)

const filteredProducts = computed(() => 
  products.value.filter(p => p.type === selectedType.value)
)

const displayName = (product: Product) => isRTL.value ? product.name_ar : product.name
const displayDescription = (product: Product) => isRTL.value ? product.description_ar : product.description

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
  if (!authStore.isAuthenticated) {
    alert(isRTL.value ? 'يجب تسجيل الدخول للطلب' : 'Please login to order')
    router.push('/login')
    return
  }

  try {
    await bookingsApi.create({
      product_id: product.id,
      booking_type: selectedType.value,
      booking_date: new Date().toISOString(),
      guests: 1,
      total_price: Number(product.price)
    })
    
    alert(isRTL.value ? 'تم الطلب بنجاح!' : 'Order placed successfully!')
    router.push('/account')
  } catch (error: any) {
    alert(error.response?.data?.detail || 'Order failed')
  }
}

onMounted(() => {
  loadProducts()
})
</script>
