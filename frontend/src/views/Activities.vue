<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-blue-600 to-cyan-600 text-white py-16">
      <div class="container mx-auto px-4 text-center">
        <h1 class="text-5xl font-bold mb-4">
          {{ isRTL ? '🏄 الأنشطة والرياضات المائية' : '🏄 Activities & Water Sports' }}
        </h1>
        <p class="text-xl text-blue-100">
          {{ isRTL ? 'استمتع بأفضل الأنشطة الترفيهية والرياضات المائية' : 'Enjoy the best recreational activities and water sports' }}
        </p>
      </div>
    </div>

    <div class="container mx-auto px-4 py-12">
      <!-- Category Filter -->
      <div class="flex justify-center gap-4 mb-12 flex-wrap">
        <button 
          @click="selectedType = 'all'" 
          :class="selectedType === 'all' ? 'bg-blue-600 text-white shadow-lg scale-105' : 'bg-white text-gray-700 hover:bg-gray-50'"
          class="px-6 py-3 rounded-xl font-bold transition-all duration-300 border-2 border-blue-600"
        >
          🌟 {{ isRTL ? 'الكل' : 'All' }}
        </button>
        <button 
          @click="selectedType = 'water_sports'" 
          :class="selectedType === 'water_sports' ? 'bg-blue-600 text-white shadow-lg scale-105' : 'bg-white text-gray-700 hover:bg-gray-50'"
          class="px-6 py-3 rounded-xl font-bold transition-all duration-300 border-2 border-blue-600"
        >
          🏄 {{ isRTL ? 'رياضات مائية' : 'Water Sports' }}
        </button>
        <button 
          @click="selectedType = 'activities'" 
          :class="selectedType === 'activities' ? 'bg-blue-600 text-white shadow-lg scale-105' : 'bg-white text-gray-700 hover:bg-gray-50'"
          class="px-6 py-3 rounded-xl font-bold transition-all duration-300 border-2 border-blue-600"
        >
          🎯 {{ isRTL ? 'أنشطة' : 'Activities' }}
        </button>
        <button 
          @click="selectedType = 'beach'" 
          :class="selectedType === 'beach' ? 'bg-blue-600 text-white shadow-lg scale-105' : 'bg-white text-gray-700 hover:bg-gray-50'"
          class="px-6 py-3 rounded-xl font-bold transition-all duration-300 border-2 border-blue-600"
        >
          🏖️ {{ isRTL ? 'شاطئ' : 'Beach' }}
        </button>
      </div>

      <!-- Loading -->
      <div v-if="loading" class="text-center py-20">
        <div class="inline-block animate-spin rounded-full h-16 w-16 border-4 border-blue-600 border-t-transparent"></div>
        <p class="text-xl mt-4 text-gray-600">{{ t('common.loading') }}</p>
      </div>

      <!-- Activities Grid -->
      <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div 
          v-for="activity in filteredActivities" 
          :key="activity.id" 
          class="bg-white rounded-2xl shadow-md hover:shadow-2xl transition-all duration-300 overflow-hidden group"
        >
          <div class="relative overflow-hidden h-56">
            <img 
              :src="activity.image_url || getDefaultImage(activity.type)" 
              :alt="displayName(activity)" 
              class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500" 
            />
            <div class="absolute top-4 right-4 bg-white/90 backdrop-blur-sm px-3 py-1 rounded-full">
              <span class="text-sm font-semibold text-blue-600">{{ getTypeIcon(activity.type) }}</span>
            </div>
          </div>
          
          <div class="p-6">
            <h3 class="text-2xl font-bold mb-2 text-gray-900">{{ displayName(activity) }}</h3>
            <p class="text-gray-600 mb-4 line-clamp-2 min-h-[3rem]">{{ displayDescription(activity) }}</p>
            
            <div class="flex justify-between items-center pt-4 border-t">
              <div>
                <span class="text-3xl font-bold text-blue-600">
                  {{ formatPrice(Number(activity.price), currentLocale) }}
                </span>
                <p v-if="activity.duration" class="text-sm text-gray-500 mt-1">
                  ⏱️ {{ activity.duration }} {{ isRTL ? 'دقيقة' : 'min' }}
                </p>
              </div>
              <button 
                @click="bookActivity(activity)" 
                class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-xl font-semibold transition-all duration-300 hover:scale-105 shadow-md"
              >
                {{ isRTL ? '📅 احجز' : '📅 Book' }}
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Empty State -->
      <div v-if="!loading && filteredActivities.length === 0" class="text-center py-20">
        <div class="text-8xl mb-4">🏄</div>
        <p class="text-2xl text-gray-500 font-semibold">
          {{ isRTL ? 'لا توجد أنشطة متاحة' : 'No activities available' }}
        </p>
      </div>
    </div>

    <!-- Guest Info Modal -->
    <div v-if="showGuestModal" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4" @click.self="showGuestModal = false">
      <div class="bg-white rounded-2xl p-8 max-w-md w-full shadow-2xl">
        <h3 class="text-2xl font-bold text-gray-900 mb-6 text-center">
          {{ isRTL ? '📝 معلومات الحجز' : '📝 Booking Information' }}
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
            <input v-model="guestInfo.email" type="email" class="input w-full" placeholder="example@email.com" required />
          </div>
          
          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              {{ isRTL ? 'رقم الهاتف' : 'Phone' }} *
            </label>
            <input v-model="guestInfo.phone" type="tel" class="input w-full" placeholder="+20 123 456 7890" required />
          </div>

          <!-- Date & Time for Activities -->
          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              {{ isRTL ? 'تاريخ النشاط' : 'Activity Date' }} *
            </label>
            <input v-model="bookingDate" type="date" class="input w-full" :min="minDate" required />
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              {{ isRTL ? 'الوقت المفضل' : 'Preferred Time' }} *
            </label>
            <select v-model="bookingTime" class="input w-full" required>
              <option value="">{{ isRTL ? 'اختر الوقت' : 'Select time' }}</option>
              <option value="09:00">09:00 AM</option>
              <option value="11:00">11:00 AM</option>
              <option value="13:00">01:00 PM</option>
              <option value="15:00">03:00 PM</option>
              <option value="17:00">05:00 PM</option>
            </select>
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              {{ isRTL ? 'عدد الأشخاص' : 'Number of People' }} *
            </label>
            <input v-model.number="guestCount" type="number" min="1" max="10" class="input w-full" required />
          </div>
        </div>
        
        <div class="flex gap-3">
          <button @click="showGuestModal = false" class="flex-1 btn-secondary">
            {{ isRTL ? 'إلغاء' : 'Cancel' }}
          </button>
          <button @click="confirmBooking" class="flex-1 btn-primary">
            {{ isRTL ? 'تأكيد الحجز' : 'Confirm Booking' }}
          </button>
        </div>
      </div>
    </div>

    <!-- Success Modal -->
    <div v-if="showSuccessModal" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4" @click.self="showSuccessModal = false">
      <div class="bg-white rounded-2xl p-8 max-w-md w-full shadow-2xl">
        <div class="text-center mb-6">
          <div class="text-6xl mb-4">✅</div>
          <h3 class="text-2xl font-bold text-gray-900 mb-2">
            {{ isRTL ? 'تم الحجز بنجاح!' : 'Booking Confirmed!' }}
          </h3>
          <p class="text-gray-600">
            {{ isRTL ? `رقم الحجز: #${lastBookingId}` : `Booking ID: #${lastBookingId}` }}
          </p>
        </div>
        <button @click="showSuccessModal = false" class="w-full btn-primary">
          {{ isRTL ? 'إغلاق' : 'Close' }}
        </button>
      </div>
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
const showGuestModal = ref(false)
const showSuccessModal = ref(false)
const lastBookingId = ref(0)
const selectedActivity = ref<Product | null>(null)
const bookingDate = ref('')
const bookingTime = ref('')
const guestCount = ref(1)
const guestInfo = ref({
  name: '',
  email: '',
  phone: ''
})
const isRTL = computed(() => appStore.isRTL)
const currentLocale = computed(() => appStore.currentLocale)
const minDate = computed(() => new Date().toISOString().split('T')[0])

const filteredActivities = computed(() => {
  if (selectedType.value === 'all') return activities.value
  return activities.value.filter(a => a.type === selectedType.value)
})

const displayName = (activity: Product) => isRTL.value ? activity.name_ar : activity.name
const displayDescription = (activity: Product) => isRTL.value ? activity.description_ar : activity.description

function getTypeIcon(type: string) {
  const icons: Record<string, string> = {
    water_sports: '🏄',
    activities: '🎯',
    beach: '🏖️'
  }
  return icons[type] || '🌟'
}

function getDefaultImage(type: string) {
  const images: Record<string, string> = {
    water_sports: 'https://images.unsplash.com/photo-1530870110042-98b2cb110834?w=600',
    activities: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=600',
    beach: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600'
  }
  return images[type] || images.activities
}

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

function bookActivity(activity: Product) {
  selectedActivity.value = activity
  showGuestModal.value = true
}

async function confirmBooking() {
  if (!guestInfo.value.name || !guestInfo.value.email || !guestInfo.value.phone) {
    alert(isRTL.value ? 'يرجى ملء جميع الحقول' : 'Please fill all fields')
    return
  }

  if (!bookingDate.value || !bookingTime.value) {
    alert(isRTL.value ? 'يرجى اختيار التاريخ والوقت' : 'Please select date and time')
    return
  }

  if (!selectedActivity.value) return

  try {
    const booking = await bookingsApi.create({
      product_id: selectedActivity.value.id,
      booking_type: selectedActivity.value.type,
      booking_date: `${bookingDate.value}T${bookingTime.value}:00`,
      guests: guestCount.value,
      total_price: Number(selectedActivity.value.price) * guestCount.value,
      guest_name: guestInfo.value.name,
      guest_email: guestInfo.value.email,
      guest_phone: guestInfo.value.phone
    })
    
    lastBookingId.value = booking.id
    showGuestModal.value = false
    showSuccessModal.value = true
    
    // Reset
    guestInfo.value = { name: '', email: '', phone: '' }
    bookingDate.value = ''
    bookingTime.value = ''
    guestCount.value = 1
  } catch (error: any) {
    alert(error.response?.data?.detail || (isRTL.value ? 'فشل الحجز' : 'Booking failed'))
  }
}

onMounted(() => {
  loadActivities()
})
</script>
