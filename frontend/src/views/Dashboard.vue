<template>
  <div class="container mx-auto px-4 py-12">
    <h1 class="text-4xl font-bold mb-8">{{ isRTL ? 'لوحة التحكم' : 'Admin Dashboard' }}</h1>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
      <div class="card bg-blue-50">
        <p class="text-gray-600 mb-2">{{ isRTL ? 'إجمالي الحجوزات' : 'Total Bookings' }}</p>
        <p class="text-3xl font-bold text-blue-600">{{ stats.totalBookings }}</p>
      </div>
      <div class="card bg-green-50">
        <p class="text-gray-600 mb-2">{{ isRTL ? 'الحجوزات النشطة' : 'Active Bookings' }}</p>
        <p class="text-3xl font-bold text-green-600">{{ stats.activeBookings }}</p>
      </div>
      <div class="card bg-yellow-50">
        <p class="text-gray-600 mb-2">{{ isRTL ? 'الإيرادات' : 'Revenue' }}</p>
        <p class="text-3xl font-bold text-yellow-600">${{ stats.revenue }}</p>
      </div>
      <div class="card bg-purple-50">
        <p class="text-gray-600 mb-2">{{ isRTL ? 'الغرف المتاحة' : 'Available Rooms' }}</p>
        <p class="text-3xl font-bold text-purple-600">{{ stats.availableRooms }}</p>
      </div>
    </div>

    <!-- Tabs -->
    <div class="flex gap-4 mb-6 border-b">
      <button @click="activeTab = 'bookings'" 
        :class="activeTab === 'bookings' ? 'border-b-2 border-primary-600 font-bold' : ''"
        class="px-4 py-2">
        {{ isRTL ? 'الحجوزات' : 'Bookings' }}
      </button>
      <button @click="activeTab = 'rooms'" 
        :class="activeTab === 'rooms' ? 'border-b-2 border-primary-600 font-bold' : ''"
        class="px-4 py-2">
        {{ isRTL ? 'الغرف' : 'Rooms' }}
      </button>
      <button @click="activeTab = 'products'" 
        :class="activeTab === 'products' ? 'border-b-2 border-primary-600 font-bold' : ''"
        class="px-4 py-2">
        {{ isRTL ? 'المنتجات' : 'Products' }}
      </button>
    </div>

    <!-- Bookings Tab -->
    <div v-if="activeTab === 'bookings'" class="card">
      <h2 class="text-2xl font-bold mb-4">{{ isRTL ? 'جميع الحجوزات' : 'All Bookings' }}</h2>
      
      <div v-if="loading" class="text-center py-8">{{ t('common.loading') }}</div>
      
      <div v-else class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-4 py-2 text-left">ID</th>
              <th class="px-4 py-2 text-left">{{ isRTL ? 'المستخدم' : 'User' }}</th>
              <th class="px-4 py-2 text-left">{{ isRTL ? 'النوع' : 'Type' }}</th>
              <th class="px-4 py-2 text-left">{{ isRTL ? 'التاريخ' : 'Date' }}</th>
              <th class="px-4 py-2 text-left">{{ isRTL ? 'السعر' : 'Price' }}</th>
              <th class="px-4 py-2 text-left">{{ isRTL ? 'الحالة' : 'Status' }}</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="booking in bookings" :key="booking.id" class="border-t">
              <td class="px-4 py-2">#{{ booking.id }}</td>
              <td class="px-4 py-2">User {{ booking.user_id }}</td>
              <td class="px-4 py-2">{{ booking.booking_type }}</td>
              <td class="px-4 py-2">{{ formatDate(booking.created_at) }}</td>
              <td class="px-4 py-2">${{ booking.total_price }}</td>
              <td class="px-4 py-2">
                <span :class="getStatusClass(booking.status)" class="px-2 py-1 rounded text-sm">
                  {{ booking.status }}
                </span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Rooms Tab -->
    <div v-if="activeTab === 'rooms'" class="card">
      <h2 class="text-2xl font-bold mb-4">{{ isRTL ? 'إدارة الغرف' : 'Manage Rooms' }}</h2>
      <p class="text-gray-600">{{ isRTL ? 'قريباً' : 'Coming soon' }}</p>
    </div>

    <!-- Products Tab -->
    <div v-if="activeTab === 'products'" class="card">
      <h2 class="text-2xl font-bold mb-4">{{ isRTL ? 'إدارة المنتجات' : 'Manage Products' }}</h2>
      <p class="text-gray-600">{{ isRTL ? 'قريباً' : 'Coming soon' }}</p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'
import { bookingsApi } from '@/api/bookings'
import type { Booking } from '@/types'

const { t } = useI18n()
const appStore = useAppStore()

const activeTab = ref('bookings')
const loading = ref(true)
const bookings = ref<Booking[]>([])
const isRTL = computed(() => appStore.isRTL)

const stats = computed(() => ({
  totalBookings: bookings.value.length,
  activeBookings: bookings.value.filter(b => b.status === 'confirmed').length,
  revenue: bookings.value.reduce((sum, b) => sum + Number(b.total_price), 0),
  availableRooms: 45
}))

async function loadBookings() {
  try {
    bookings.value = await bookingsApi.getAll()
  } catch (error) {
    console.error('Failed to load bookings:', error)
  } finally {
    loading.value = false
  }
}

function formatDate(date: string) {
  return new Date(date).toLocaleDateString(isRTL.value ? 'ar-SA' : 'en-US')
}

function getStatusClass(status: string) {
  const classes: Record<string, string> = {
    pending: 'bg-yellow-100 text-yellow-800',
    confirmed: 'bg-green-100 text-green-800',
    cancelled: 'bg-red-100 text-red-800',
    completed: 'bg-blue-100 text-blue-800'
  }
  return classes[status] || 'bg-gray-100 text-gray-800'
}

onMounted(() => {
  loadBookings()
})
</script>
