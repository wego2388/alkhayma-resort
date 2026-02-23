<template>
  <div class="container mx-auto px-4 py-12">
    <div v-if="loading" class="text-center py-12">
      <p class="text-xl">{{ t('common.loading') }}</p>
    </div>

    <div v-else-if="room" class="grid grid-cols-1 lg:grid-cols-2 gap-8">
      <!-- Room Image -->
      <div>
        <img :src="room.image_url || 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800'" 
          :alt="displayName" class="w-full h-96 object-cover rounded-lg shadow-lg" />
      </div>

      <!-- Room Details -->
      <div>
        <h1 class="text-4xl font-bold mb-4">{{ displayName }}</h1>
        <p class="text-gray-600 mb-6">{{ displayDescription }}</p>

        <div class="space-y-4 mb-6">
          <div class="flex items-center gap-2">
            <span class="font-semibold">{{ t('rooms.capacity') }}:</span>
            <span>{{ room.capacity }} {{ isRTL ? 'أشخاص' : 'guests' }}</span>
          </div>
          <div class="flex items-center gap-2">
            <span class="font-semibold">{{ t('rooms.price') }}:</span>
            <span class="text-2xl text-primary-600 font-bold">{{ formatPrice(Number(room.base_price), currentLocale) }}</span>
          </div>
          <div class="flex items-center gap-2">
            <span class="font-semibold">{{ isRTL ? 'النوع' : 'Type' }}:</span>
            <span class="capitalize">{{ room.type }}</span>
          </div>
        </div>

        <!-- Amenities -->
        <div class="mb-6">
          <h3 class="font-semibold mb-3">{{ isRTL ? 'المرافق' : 'Amenities' }}</h3>
          <div class="flex flex-wrap gap-2">
            <span v-for="amenity in room.amenities" :key="amenity"
              class="px-3 py-1 bg-gray-100 rounded-full text-sm">
              {{ amenity }}
            </span>
          </div>
        </div>

        <!-- Booking Form -->
        <div class="card bg-gray-50">
          <h3 class="text-xl font-bold mb-4">{{ t('booking.title') }}</h3>
          <form @submit.prevent="handleBooking" class="space-y-4">
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block mb-2 font-medium">{{ t('booking.checkIn') }}</label>
                <input v-model="checkIn" type="date" required class="input" :min="today" />
              </div>
              <div>
                <label class="block mb-2 font-medium">{{ t('booking.checkOut') }}</label>
                <input v-model="checkOut" type="date" required class="input" :min="checkIn || today" />
              </div>
            </div>

            <div>
              <label class="block mb-2 font-medium">{{ t('booking.guests') }}</label>
              <input v-model.number="guests" type="number" :max="room.capacity" min="1" required class="input" />
            </div>

            <div>
              <label class="block mb-2 font-medium">{{ t('booking.specialRequests') }}</label>
              <textarea v-model="specialRequests" class="input" rows="3"></textarea>
            </div>

            <div v-if="totalPrice > 0" class="text-xl font-bold">
              {{ t('booking.total') }}: {{ formatPrice(totalPrice, currentLocale) }}
            </div>

            <button type="submit" :disabled="bookingLoading || !authStore.isAuthenticated" class="btn-primary w-full">
              {{ bookingLoading ? t('common.loading') : t('booking.confirm') }}
            </button>

            <p v-if="!authStore.isAuthenticated" class="text-sm text-red-600 text-center">
              {{ isRTL ? 'يجب تسجيل الدخول للحجز' : 'Please login to book' }}
            </p>
          </form>
        </div>
      </div>
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
import { bookingsApi } from '@/api/bookings'
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
    await bookingsApi.create({
      room_id: room.value.id,
      booking_type: 'room',
      check_in: checkIn.value,
      check_out: checkOut.value,
      guests: guests.value,
      special_requests: specialRequests.value,
      total_price: totalPrice.value
    })
    
    alert(t('booking.success'))
    router.push('/account')
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
