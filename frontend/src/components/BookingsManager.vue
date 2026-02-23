<template>
  <div class="space-y-6">
    <!-- Filters -->
    <div class="card">
      <div class="flex flex-wrap gap-4 items-center">
        <div class="flex-1 min-w-[200px]">
          <input 
            v-model="searchQuery" 
            type="text" 
            :placeholder="isRTL ? 'بحث بالاسم أو الإيميل...' : 'Search by name or email...'" 
            class="input w-full"
          />
        </div>
        <select v-model="statusFilter" class="input w-48">
          <option value="">{{ isRTL ? 'كل الحالات' : 'All Status' }}</option>
          <option value="pending">Pending</option>
          <option value="confirmed">Confirmed</option>
          <option value="cancelled">Cancelled</option>
          <option value="completed">Completed</option>
        </select>
        <select v-model="typeFilter" class="input w-48">
          <option value="">{{ isRTL ? 'كل الأنواع' : 'All Types' }}</option>
          <option value="room">Room</option>
          <option value="restaurant">Restaurant</option>
          <option value="cafe">Cafe</option>
          <option value="water_sports">Water Sports</option>
          <option value="activities">Activities</option>
          <option value="beach">Beach</option>
        </select>
      </div>
    </div>

    <!-- Bookings Table -->
    <div class="card">
      <div class="flex justify-between items-center mb-4">
        <h2 class="text-2xl font-bold">
          {{ isRTL ? 'جميع الحجوزات' : 'All Bookings' }}
          <span class="text-primary-600">({{ filteredBookings.length }})</span>
        </h2>
      </div>
      
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gradient-to-r from-gray-100 to-gray-200">
            <tr>
              <th class="px-4 py-3 text-left text-sm font-bold">ID</th>
              <th class="px-4 py-3 text-left text-sm font-bold">{{ isRTL ? 'معلومات الضيف' : 'Guest Info' }}</th>
              <th class="px-4 py-3 text-left text-sm font-bold">{{ isRTL ? 'النوع' : 'Type' }}</th>
              <th class="px-4 py-3 text-left text-sm font-bold">{{ isRTL ? 'التاريخ' : 'Date' }}</th>
              <th class="px-4 py-3 text-left text-sm font-bold">{{ isRTL ? 'السعر' : 'Price' }}</th>
              <th class="px-4 py-3 text-left text-sm font-bold">{{ isRTL ? 'الحالة' : 'Status' }}</th>
              <th class="px-4 py-3 text-left text-sm font-bold">{{ isRTL ? 'إجراءات' : 'Actions' }}</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr v-for="booking in paginatedBookings" :key="booking.id" class="hover:bg-gray-50 transition-colors">
              <td class="px-4 py-4">
                <span class="font-mono text-sm font-bold text-primary-600 bg-primary-50 px-2 py-1 rounded">#{{ booking.id }}</span>
              </td>
              <td class="px-4 py-4">
                <div v-if="booking.special_requests" class="text-sm">
                  <div class="font-bold text-gray-900">{{ extractGuestName(booking.special_requests) }}</div>
                  <div class="text-gray-600 text-xs">📧 {{ extractGuestEmail(booking.special_requests) }}</div>
                  <div class="text-gray-500 text-xs">📱 {{ extractGuestPhone(booking.special_requests) }}</div>
                </div>
                <div v-else class="text-gray-400 text-sm">User #{{ booking.user_id }}</div>
              </td>
              <td class="px-4 py-4">
                <span class="px-3 py-1 bg-blue-100 text-blue-800 rounded-full text-xs font-semibold flex items-center gap-1 w-fit">
                  <span>{{ getTypeIcon(booking.booking_type) }}</span>
                  {{ booking.booking_type }}
                </span>
              </td>
              <td class="px-4 py-4 text-sm text-gray-700">
                <div>📅 {{ formatDate(booking.booking_date) }}</div>
                <div class="text-xs text-gray-500">🕐 {{ formatTime(booking.booking_date) }}</div>
              </td>
              <td class="px-4 py-4">
                <span class="font-bold text-lg text-gray-900">${{ Number(booking.total_price).toLocaleString() }}</span>
              </td>
              <td class="px-4 py-4">
                <span :class="getStatusClass(booking.status)" class="px-3 py-1 rounded-full text-xs font-bold uppercase">
                  {{ booking.status }}
                </span>
              </td>
              <td class="px-4 py-4">
                <div class="flex gap-2">
                  <button 
                    v-if="booking.status === 'pending'"
                    @click="updateStatus(booking.id, 'confirmed')" 
                    class="px-3 py-1 bg-green-500 text-white rounded-lg hover:bg-green-600 text-xs font-semibold transition-all hover:scale-105"
                    title="Confirm"
                  >
                    ✓
                  </button>
                  <button 
                    v-if="booking.status === 'confirmed'"
                    @click="updateStatus(booking.id, 'completed')" 
                    class="px-3 py-1 bg-blue-500 text-white rounded-lg hover:bg-blue-600 text-xs font-semibold transition-all hover:scale-105"
                    title="Complete"
                  >
                    ✓✓
                  </button>
                  <button 
                    v-if="booking.status !== 'cancelled'"
                    @click="updateStatus(booking.id, 'cancelled')" 
                    class="px-3 py-1 bg-red-500 text-white rounded-lg hover:bg-red-600 text-xs font-semibold transition-all hover:scale-105"
                    title="Cancel"
                  >
                    ✕
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Pagination -->
      <div v-if="totalPages > 1" class="flex justify-center items-center gap-2 mt-6">
        <button 
          @click="currentPage--" 
          :disabled="currentPage === 1"
          class="px-4 py-2 bg-gray-200 rounded-lg hover:bg-gray-300 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          ←
        </button>
        <span class="px-4 py-2 font-semibold">{{ currentPage }} / {{ totalPages }}</span>
        <button 
          @click="currentPage++" 
          :disabled="currentPage === totalPages"
          class="px-4 py-2 bg-gray-200 rounded-lg hover:bg-gray-300 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          →
        </button>
      </div>
    </div>
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

const bookings = ref<any[]>([])
const searchQuery = ref('')
const statusFilter = ref('')
const typeFilter = ref('')
const currentPage = ref(1)
const perPage = 10

const filteredBookings = computed(() => {
  let result = bookings.value

  if (searchQuery.value) {
    const query = searchQuery.value.toLowerCase()
    result = result.filter(b => 
      b.special_requests?.toLowerCase().includes(query)
    )
  }

  if (statusFilter.value) {
    result = result.filter(b => b.status === statusFilter.value)
  }

  if (typeFilter.value) {
    result = result.filter(b => b.booking_type === typeFilter.value)
  }

  return result
})

const totalPages = computed(() => Math.ceil(filteredBookings.value.length / perPage))

const paginatedBookings = computed(() => {
  const start = (currentPage.value - 1) * perPage
  return filteredBookings.value.slice(start, start + perPage)
})

async function loadBookings() {
  try {
    const response = await apiClient.get('/api/bookings')
    bookings.value = response.data
  } catch (error) {
    toast.error(isRTL.value ? 'فشل التحميل' : 'Failed to load')
  }
}

async function updateStatus(bookingId: number, status: string) {
  try {
    await apiClient.put(`/api/bookings/${bookingId}`, { status })
    toast.success(isRTL.value ? 'تم التحديث' : 'Updated')
    loadBookings()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل التحديث' : 'Failed to update')
  }
}

function extractGuestName(sr: string) {
  const match = sr.match(/Guest: (.+?),/)
  return match ? match[1] : 'N/A'
}

function extractGuestEmail(sr: string) {
  const match = sr.match(/Email: (.+?),/)
  return match ? match[1] : 'N/A'
}

function extractGuestPhone(sr: string) {
  const match = sr.match(/Phone: (.+?)(?:,|$)/)
  return match ? match[1] : 'N/A'
}

function formatDate(date: string) {
  return new Date(date).toLocaleDateString(isRTL.value ? 'ar-SA' : 'en-US')
}

function formatTime(date: string) {
  return new Date(date).toLocaleTimeString(isRTL.value ? 'ar-SA' : 'en-US', { 
    hour: '2-digit', 
    minute: '2-digit' 
  })
}

function getStatusClass(status: string) {
  const classes: Record<string, string> = {
    pending: 'bg-yellow-100 text-yellow-800 border border-yellow-300',
    confirmed: 'bg-green-100 text-green-800 border border-green-300',
    cancelled: 'bg-red-100 text-red-800 border border-red-300',
    completed: 'bg-blue-100 text-blue-800 border border-blue-300'
  }
  return classes[status] || 'bg-gray-100 text-gray-800'
}

function getTypeIcon(type: string) {
  const icons: Record<string, string> = {
    room: '🏨',
    restaurant: '🍽️',
    cafe: '☕',
    water_sports: '🏄',
    activities: '🎯',
    beach: '🏖️'
  }
  return icons[type] || '📦'
}

onMounted(() => {
  loadBookings()
})
</script>
