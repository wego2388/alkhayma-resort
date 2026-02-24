<template>
  <div class="min-h-screen">
    <!-- Hero Section - Cinematic -->
    <section class="relative h-[70vh] flex items-center justify-center overflow-hidden">
      <div 
        class="absolute inset-0 bg-cover bg-center"
        :style="{ 
          backgroundImage: 'url(https://images.unsplash.com/photo-1530870110042-98b2cb110834?q=80&w=2070)',
          transform: `scale(${1 + scrollY * 0.0001})`,
        }"
      ></div>
      <div class="absolute inset-0 bg-gradient-to-b from-black/70 via-black/50 to-black/70"></div>
      
      <div class="relative z-10 text-center text-white px-6 max-w-5xl mx-auto">
        <p class="text-sm tracking-[0.3em] uppercase text-amber-400 mb-4 animate-fade-in-up">
          {{ isRTL ? 'مغامرات في البحر الأحمر' : 'Adventure on the Red Sea' }}
        </p>
        <h1 class="font-display text-6xl md:text-8xl font-bold mb-6 animate-fade-in-up" style="animation-delay: 0.2s">
          {{ isRTL ? 'الأنشطة المائية' : 'Water Activities' }}
        </h1>
        <div class="flex items-center justify-center gap-4 mb-6 animate-fade-in-up" style="animation-delay: 0.4s">
          <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
          <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
          <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
        </div>
        <p class="text-xl md:text-2xl text-white/90 max-w-3xl mx-auto leading-relaxed animate-fade-in-up" style="animation-delay: 0.6s">
          {{ isRTL ? 'أضف روح المغامرة إلى إقامتك - غطس، غوص، جت سكي ورحلات بحرية' : 'Add excitement to your beach escape - Snorkeling, Diving, Jet Ski & Boat Trips' }}
        </p>
      </div>
    </section>

    <LuxSection>
      <!-- Category Filter -->
      <div class="flex justify-center gap-3 mb-16 flex-wrap">
        <button 
          v-for="cat in categories" 
          :key="cat.id"
          @click="selectedType = cat.id" 
          :class="[
            'px-8 py-4 rounded-2xl font-semibold transition-all duration-300',
            selectedType === cat.id 
              ? 'bg-gradient-to-r from-amber-500 to-amber-600 text-white shadow-luxury-lg scale-105' 
              : 'bg-white text-slate-700 hover:bg-slate-50 border-2 border-slate-200 hover:border-amber-300'
          ]"
        >
          {{ isRTL ? cat.nameAr : cat.name }}
        </button>
      </div>

      <!-- Loading -->
      <div v-if="loading" class="text-center py-20">
        <div class="inline-block animate-spin rounded-full h-16 w-16 border-4 border-amber-500 border-t-transparent"></div>
        <p class="text-xl mt-4 text-slate-600">{{ t('common.loading') }}</p>
      </div>

      <!-- Activities Grid -->
      <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <LuxCard 
          v-for="(activity, i) in filteredActivities" 
          :key="activity.id"
          hover
          :class="['transition-all duration-700', isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10']"
          :style="{ transitionDelay: `${i * 100}ms` }"
        >
          <div class="relative overflow-hidden h-64 rounded-t-2xl">
            <img 
              :src="activity.image_url || getDefaultImage(activity.type)" 
              :alt="displayName(activity)" 
              class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" 
            />
            <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent"></div>
            <div class="absolute bottom-4 left-4 right-4">
              <h3 class="text-2xl font-bold text-white mb-1">{{ displayName(activity) }}</h3>
            </div>
          </div>
          
          <div class="p-6">
            <p class="text-slate-600 mb-6 line-clamp-2 min-h-[3rem] leading-relaxed">
              {{ displayDescription(activity) }}
            </p>
            
            <div class="flex items-center gap-4 mb-6 text-sm text-slate-500">
              <div class="flex items-center gap-2" v-if="activity.duration">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                <span>{{ activity.duration }} {{ isRTL ? 'دقيقة' : 'min' }}</span>
              </div>
              <div class="flex items-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                </svg>
                <span>{{ isRTL ? 'مناسب للعائلات' : 'Family Friendly' }}</span>
              </div>
            </div>
            
            <div class="flex justify-between items-center pt-6 border-t border-slate-100">
              <div>
                <p class="text-sm text-slate-500 mb-1">{{ isRTL ? 'يبدأ من' : 'Starting from' }}</p>
                <span class="text-3xl font-bold bg-gradient-to-r from-amber-500 to-amber-600 bg-clip-text text-transparent">
                  {{ formatPrice(Number(activity.price), currentLocale) }}
                </span>
              </div>
              <LuxButton @click="bookActivity(activity)">
                {{ isRTL ? 'احجز الآن' : 'Book Now' }}
              </LuxButton>
            </div>
          </div>
        </LuxCard>
      </div>

      <!-- Empty State -->
      <div v-if="!loading && filteredActivities.length === 0" class="text-center py-20">
        <div class="w-32 h-32 mx-auto mb-6 rounded-full bg-gradient-to-br from-slate-100 to-slate-200 flex items-center justify-center">
          <svg class="w-16 h-16 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4" />
          </svg>
        </div>
        <p class="text-2xl text-slate-500 font-semibold mb-2">
          {{ isRTL ? 'لا توجد أنشطة متاحة' : 'No activities available' }}
        </p>
        <p class="text-slate-400">
          {{ isRTL ? 'جرب فئة أخرى' : 'Try another category' }}
        </p>
      </div>
    </LuxSection>

    <!-- Booking Modal -->
    <div v-if="showGuestModal" class="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4 animate-fade-in" @click.self="showGuestModal = false">
      <div class="bg-white rounded-3xl p-8 max-w-lg w-full shadow-luxury-lg animate-scale-in">
        <div class="text-center mb-8">
          <div class="w-16 h-16 bg-gradient-to-br from-amber-500 to-amber-600 rounded-full flex items-center justify-center mx-auto mb-4">
            <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg>
          </div>
          <h3 class="text-3xl font-bold text-slate-900 mb-2">
            {{ isRTL ? 'معلومات الحجز' : 'Booking Information' }}
          </h3>
          <p class="text-slate-500">{{ displayName(selectedActivity!) }}</p>
        </div>
        
        <div class="space-y-4 mb-8">
          <div>
            <label class="block text-sm font-semibold text-slate-700 mb-2">
              {{ isRTL ? 'الاسم' : 'Name' }} *
            </label>
            <input v-model="guestInfo.name" type="text" class="input w-full" :placeholder="isRTL ? 'أدخل اسمك' : 'Enter your name'" required />
          </div>
          
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">
                {{ isRTL ? 'البريد' : 'Email' }} *
              </label>
              <input v-model="guestInfo.email" type="email" class="input w-full" placeholder="email@example.com" required />
            </div>
            
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">
                {{ isRTL ? 'الهاتف' : 'Phone' }} *
              </label>
              <input v-model="guestInfo.phone" type="tel" class="input w-full" placeholder="+20 XXX XXX" required />
            </div>
          </div>

          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">
                {{ isRTL ? 'التاريخ' : 'Date' }} *
              </label>
              <input v-model="bookingDate" type="date" class="input w-full" :min="minDate" required />
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">
                {{ isRTL ? 'الوقت' : 'Time' }} *
              </label>
              <select v-model="bookingTime" class="input w-full" required>
                <option value="">{{ isRTL ? 'اختر' : 'Select' }}</option>
                <option value="09:00">09:00 AM</option>
                <option value="11:00">11:00 AM</option>
                <option value="13:00">01:00 PM</option>
                <option value="15:00">03:00 PM</option>
                <option value="17:00">05:00 PM</option>
              </select>
            </div>
          </div>

          <div>
            <label class="block text-sm font-semibold text-slate-700 mb-2">
              {{ isRTL ? 'عدد الأشخاص' : 'Number of People' }} *
            </label>
            <input v-model.number="guestCount" type="number" min="1" max="10" class="input w-full" required />
          </div>

          <div class="bg-amber-50 border border-amber-200 rounded-xl p-4">
            <div class="flex justify-between items-center">
              <span class="text-slate-700 font-semibold">{{ isRTL ? 'الإجمالي' : 'Total' }}</span>
              <span class="text-2xl font-bold text-amber-600">
                {{ formatPrice(Number(selectedActivity?.price || 0) * guestCount, currentLocale) }}
              </span>
            </div>
          </div>
        </div>
        
        <div class="flex gap-3">
          <button @click="showGuestModal = false" class="flex-1 px-6 py-3 border-2 border-slate-200 text-slate-700 rounded-xl font-semibold hover:bg-slate-50 transition">
            {{ isRTL ? 'إلغاء' : 'Cancel' }}
          </button>
          <LuxButton @click="confirmBooking" class="flex-1">
            {{ isRTL ? 'تأكيد الحجز' : 'Confirm Booking' }}
          </LuxButton>
        </div>
      </div>
    </div>

    <!-- Success Modal -->
    <div v-if="showSuccessModal" class="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4 animate-fade-in" @click.self="showSuccessModal = false">
      <div class="bg-white rounded-3xl p-8 max-w-md w-full shadow-luxury-lg text-center animate-scale-in">
        <div class="w-20 h-20 bg-gradient-to-br from-green-400 to-green-600 rounded-full flex items-center justify-center mx-auto mb-6">
          <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
          </svg>
        </div>
        <h3 class="text-3xl font-bold text-slate-900 mb-3">
          {{ isRTL ? 'تم الحجز بنجاح!' : 'Booking Confirmed!' }}
        </h3>
        <p class="text-slate-600 mb-2">
          {{ isRTL ? 'رقم الحجز' : 'Booking ID' }}
        </p>
        <p class="text-2xl font-bold text-amber-600 mb-6">
          #{{ lastBookingId }}
        </p>
        <p class="text-sm text-slate-500 mb-8">
          {{ isRTL ? 'تم إرسال تأكيد الحجز إلى بريدك الإلكتروني' : 'Confirmation sent to your email' }}
        </p>
        <LuxButton @click="showSuccessModal = false" class="w-full">
          {{ isRTL ? 'إغلاق' : 'Close' }}
        </LuxButton>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'
import { productsApi } from '@/api/products'
import { bookingsApi } from '@/api/bookings'
import { formatPrice } from '@/utils/currency'
import LuxSection from '@/components/ui/LuxSection.vue'
import LuxCard from '@/components/ui/LuxCard.vue'
import LuxButton from '@/components/ui/LuxButton.vue'
import type { Product } from '@/types'

const { t } = useI18n()
const appStore = useAppStore()

const categories = [
  { id: 'all', name: 'All Activities', nameAr: 'جميع الأنشطة' },
  { id: 'water_sports', name: 'Water Sports', nameAr: 'رياضات مائية' },
  { id: 'beach_entry', name: 'Beach Entry', nameAr: 'دخول الشاطئ' }
]

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
const scrollY = ref(0)
const isVisible = ref(false)
const guestInfo = ref({ name: '', email: '', phone: '' })

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
    diving: '🤿',
    activities: '🎯',
    beach: '🏖️'
  }
  return icons[type] || '🌟'
}

function getDefaultImage(type: string) {
  const images: Record<string, string> = {
    water_sports: 'https://images.unsplash.com/photo-1530870110042-98b2cb110834?w=800',
    beach_entry: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800'
  }
  return images[type] || images.water_sports
}

async function loadActivities() {
  try {
    const allProducts = await productsApi.getAll({ is_active: true })
    // Load only water sports and beach entry
    activities.value = allProducts.filter(p => 
      ['water_sports', 'beach_entry'].includes(p.type)
    )
  } catch (error) {
    console.error('Failed to load activities:', error)
  } finally {
    loading.value = false
    setTimeout(() => isVisible.value = true, 100)
  }
}

function bookActivity(activity: Product) {
  selectedActivity.value = activity
  showGuestModal.value = true
}

async function confirmBooking() {
  if (!guestInfo.value.name || !guestInfo.value.email || !guestInfo.value.phone || !bookingDate.value || !bookingTime.value) {
    alert(isRTL.value ? 'يرجى ملء جميع الحقول' : 'Please fill all fields')
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
    
    guestInfo.value = { name: '', email: '', phone: '' }
    bookingDate.value = ''
    bookingTime.value = ''
    guestCount.value = 1
  } catch (error: any) {
    alert(error.response?.data?.detail || (isRTL.value ? 'فشل الحجز' : 'Booking failed'))
  }
}

function handleScroll() {
  scrollY.value = window.scrollY
}

onMounted(() => {
  loadActivities()
  window.addEventListener('scroll', handleScroll)
})
</script>

<style scoped>
@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(40px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-fade-in-up {
  animation: fade-in-up 1s ease-out;
  animation-fill-mode: both;
}

@keyframes fade-in {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes scale-in {
  from {
    opacity: 0;
    transform: scale(0.9);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.animate-fade-in {
  animation: fade-in 0.3s ease-out;
}

.animate-scale-in {
  animation: scale-in 0.3s ease-out;
}
</style>
