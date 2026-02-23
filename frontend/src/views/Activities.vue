<template>
  <div class="container mx-auto px-4 py-12">
    <h1 class="text-4xl font-bold mb-8">{{ isRTL ? 'الأنشطة والرياضات المائية' : 'Activities & Water Sports' }}</h1>

    <!-- Category Filter -->
    <div class="flex gap-4 mb-8 flex-wrap">
      <button @click="selectedType = 'all'" 
        :class="selectedType === 'all' ? 'btn-primary' : 'btn-secondary'">
        {{ isRTL ? 'الكل' : 'All' }}
      </button>
      <button @click="selectedType = 'water_sports'" 
        :class="selectedType === 'water_sports' ? 'btn-primary' : 'btn-secondary'">
        {{ isRTL ? 'رياضات مائية' : 'Water Sports' }}
      </button>
      <button @click="selectedType = 'activities'" 
        :class="selectedType === 'activities' ? 'btn-primary' : 'btn-secondary'">
        {{ isRTL ? 'أنشطة' : 'Activities' }}
      </button>
      <button @click="selectedType = 'beach'" 
        :class="selectedType === 'beach' ? 'btn-primary' : 'btn-secondary'">
        {{ isRTL ? 'شاطئ' : 'Beach' }}
      </button>
    </div>

    <!-- Loading -->
    <div v-if="loading" class="text-center py-12">
      <p class="text-xl">{{ t('common.loading') }}</p>
    </div>

    <!-- Activities Grid -->
    <div v-else class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div v-for="activity in filteredActivities" :key="activity.id" class="card">
        <img :src="activity.image_url || 'https://images.unsplash.com/photo-1530870110042-98b2cb110834?w=400'" 
          :alt="displayName(activity)" class="w-full h-48 object-cover rounded-lg mb-4" />
        
        <h3 class="text-xl font-bold mb-2">{{ displayName(activity) }}</h3>
        <p class="text-gray-600 mb-4">{{ displayDescription(activity) }}</p>
        
        <div class="flex justify-between items-center mb-4">
          <div>
            <span class="text-2xl font-bold text-primary-600">{{ formatPrice(Number(activity.price), currentLocale) }}</span>
            <span v-if="activity.duration" class="text-sm text-gray-500 block">
              {{ activity.duration }} {{ isRTL ? 'دقيقة' : 'minutes' }}
            </span>
          </div>
          <button @click="bookActivity(activity)" class="btn-primary">
            {{ isRTL ? 'احجز الآن' : 'Book Now' }}
          </button>
        </div>
      </div>
    </div>

    <!-- Empty State -->
    <div v-if="!loading && filteredActivities.length === 0" class="text-center py-12">
      <p class="text-xl text-gray-500">{{ isRTL ? 'لا توجد أنشطة متاحة' : 'No activities available' }}</p>
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

const activities = ref<Product[]>([])
const loading = ref(true)
const selectedType = ref('all')
const isRTL = computed(() => appStore.isRTL)
const currentLocale = computed(() => appStore.currentLocale)

const filteredActivities = computed(() => {
  if (selectedType.value === 'all') return activities.value
  return activities.value.filter(a => a.type === selectedType.value)
})

const displayName = (activity: Product) => isRTL.value ? activity.name_ar : activity.name
const displayDescription = (activity: Product) => isRTL.value ? activity.description_ar : activity.description

async function loadActivities() {
  try {
    const allProducts = await productsApi.getAll({ is_active: true })
    activities.value = allProducts.filter(p => 
      ['water_sports', 'activities', 'beach'].includes(p.type)
    )
  } catch (error) {
    console.error('Failed to load activities:', error)
  } finally {
    loading.value = false
  }
}

async function bookActivity(activity: Product) {
  if (!authStore.isAuthenticated) {
    alert(isRTL.value ? 'يجب تسجيل الدخول للحجز' : 'Please login to book')
    router.push('/login')
    return
  }

  try {
    await bookingsApi.create({
      product_id: activity.id,
      booking_type: activity.type,
      booking_date: new Date().toISOString(),
      guests: 1,
      total_price: Number(activity.price)
    })
    
    alert(isRTL.value ? 'تم الحجز بنجاح!' : 'Booking successful!')
    router.push('/account')
  } catch (error: any) {
    alert(error.response?.data?.detail || 'Booking failed')
  }
}

onMounted(() => {
  loadActivities()
})
</script>
