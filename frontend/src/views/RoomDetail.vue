<template>
  <div class="min-h-screen bg-gradient-to-br from-slate-50 to-white">
    <!-- Loading State -->
    <div v-if="loading" class="flex items-center justify-center min-h-screen">
      <div class="text-center">
        <div class="inline-block animate-spin rounded-full h-16 w-16 border-4 border-amber-500 border-t-transparent mb-4"></div>
        <p class="text-xl text-slate-600">{{ t('common.loading') }}</p>
      </div>
    </div>

    <!-- Room Content -->
    <div v-else-if="room">
      <!-- Hero Image -->
      <section class="relative h-[60vh]">
        <img 
          :src="room.image_url || 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=2070'" 
          :alt="displayName" 
          class="w-full h-full object-cover"
        />
        <div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/30 to-transparent"></div>
        
        <!-- Room Title Overlay -->
        <div class="absolute bottom-0 left-0 right-0 p-12">
          <div class="container mx-auto max-w-7xl">
            <h1 class="font-display text-5xl md:text-6xl font-bold text-white mb-4">{{ displayName }}</h1>
            <div class="flex items-center gap-6 text-white/90">
              <span class="flex items-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                </svg>
                {{ room.capacity }} {{ isRTL ? 'أشخاص' : 'Guests' }}
              </span>
              <span class="text-3xl font-bold text-amber-400">{{ formatPrice(Number(room.base_price), currentLocale) }}</span>
            </div>
          </div>
        </div>
      </section>

      <!-- Room Details -->
      <section class="py-24">
        <div class="container mx-auto px-6 max-w-7xl">
          <div class="grid lg:grid-cols-3 gap-12">
            <div class="lg:col-span-2">
              <h2 class="text-3xl font-bold mb-6">{{ isRTL ? 'تفاصيل الغرفة' : 'Room Details' }}</h2>
              <p class="text-slate-600 text-lg">{{ isRTL ? room?.description_ar : room?.description }}</p>
            </div>
            
            <div class="bg-slate-50 rounded-3xl p-8">
              <h3 class="text-2xl font-bold mb-6">{{ isRTL ? 'احجز الآن' : 'Book Now' }}</h3>
              <form @submit.prevent="handleBooking">
                <div class="mb-4">
                  <label class="block mb-2 font-medium">{{ t('booking.specialRequests') }}</label>
                  <textarea v-model="specialRequests" class="input w-full" rows="3"></textarea>
                </div>

                <div v-if="totalPrice > 0" class="text-xl font-bold mb-4">
                  {{ t('booking.total') }}: {{ formatPrice(totalPrice, currentLocale) }}
                </div>

                <button type="submit" :disabled="bookingLoading" class="btn-primary w-full">
                  {{ bookingLoading ? t('common.loading') : t('booking.confirm') }}
                </button>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useAuthStore } from '@/stores/auth'
import { useAppStore } from '@/stores/app'
import { roomsApi } from '@/api/rooms'
import apiClient from '@/api/client'
import { formatPrice } from '@/utils/currency'
import type { Room } from '@/types'

const { t } = useI18n()
const route = useRoute()
const router = useRouter()
const authStore = useAuthStore()
const appStore = useAppStore()

const room = ref<Room | null>(null)
const loading = ref(true)
const bookingLoading = ref(false)
const guestName = ref('')
const guestEmail = ref('')
const guestPhone = ref('')
const checkIn = ref('')
const checkOut = ref('')
const guests = ref(1)
const specialRequests = ref('')

const isRTL = computed(() => appStore.isRTL)
const currentLocale = computed(() => appStore.currentLocale)
const displayName = computed(() => room.value ? (isRTL.value ? room.value.name_ar : room.value.name) : '')
const displayDescription = computed(() => room.value ? (isRTL.value ? room.value.description_ar : room.value.description) : '')

const today = computed(() => new Date().toISOString().split('T')[0])

const totalPrice = computed(() => {
  if (!room.value || !checkIn.value || !checkOut.value) return 0
  const nights = Math.ceil((new Date(checkOut.value).getTime() - new Date(checkIn.value).getTime()) / (1000 * 60 * 60 * 24))
  return nights * Number(room.value.base_price)
})

async function loadRoom() {
  try {
    const id = Number(route.params.id)
    room.value = await roomsApi.getById(id)
  } catch (error) {
    console.error('Failed to load room:', error)
    router.push('/rooms')
  } finally {
    loading.value = false
  }
}

async function handleBooking() {
  if (!room.value) return
  
  bookingLoading.value = true
  try {
    const bookingData = {
      room_id: room.value.id,
      booking_type: 'room',
      check_in: checkIn.value,
      check_out: checkOut.value,
      guests: guests.value,
      special_requests: specialRequests.value
    }
    
    // Send booking with guest info as query params
    const params = new URLSearchParams({
      guest_name: guestName.value,
      guest_email: guestEmail.value,
      guest_phone: guestPhone.value
    })
    
    const response = await apiClient.post(`/api/bookings?${params}`, bookingData)
    const bookingId = response.data.id
    
    alert(isRTL.value 
      ? `تم الحجز بنجاح!\nرقم الحجز: #${bookingId}\nسنتواصل معك على: ${guestEmail.value}`
      : `Booking successful!\nBooking ID: #${bookingId}\nWe will contact you at: ${guestEmail.value}`
    )
    router.push('/')
  } catch (error: any) {
    alert(error.response?.data?.detail || 'Booking failed')
  } finally {
    bookingLoading.value = false
  }
}

onMounted(() => {
  loadRoom()
})
</script>
