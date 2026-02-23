<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Top Bar -->
    <div class="bg-gradient-to-r from-primary-600 to-primary-800 text-white shadow-lg">
      <div class="container mx-auto px-4 py-6">
        <div class="flex justify-between items-center">
          <div>
            <h1 class="text-3xl font-bold">
              {{ isRTL ? '🏨 لوحة تحكم الخيمة' : '🏨 Al Khayma Dashboard' }}
            </h1>
            <p class="text-primary-100 mt-1">{{ isRTL ? 'مرحباً بك في لوحة الإدارة' : 'Welcome to Admin Panel' }}</p>
          </div>
          <router-link to="/" class="bg-white/20 hover:bg-white/30 px-6 py-3 rounded-xl font-semibold transition-all">
            {{ isRTL ? '← الرئيسية' : 'Home →' }}
          </router-link>
        </div>
      </div>
    </div>

    <div class="container mx-auto px-4 py-8">
      <!-- Stats Cards -->
      <div v-if="stats" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <div class="card bg-gradient-to-br from-blue-500 to-blue-600 text-white hover:shadow-2xl transition-all">
          <div class="flex justify-between items-start mb-3">
            <div>
              <p class="text-blue-100 text-sm">{{ isRTL ? 'إجمالي الحجوزات' : 'Total Bookings' }}</p>
              <p class="text-4xl font-bold mt-2">{{ stats.overview.total_bookings }}</p>
            </div>
            <span class="text-4xl">📊</span>
          </div>
          <p class="text-sm text-blue-100">
            {{ stats.overview.recent_bookings }} {{ isRTL ? 'آخر 7 أيام' : 'last 7 days' }}
          </p>
        </div>

        <div class="card bg-gradient-to-br from-green-500 to-green-600 text-white hover:shadow-2xl transition-all">
          <div class="flex justify-between items-start mb-3">
            <div>
              <p class="text-green-100 text-sm">{{ isRTL ? 'الحجوزات النشطة' : 'Active Bookings' }}</p>
              <p class="text-4xl font-bold mt-2">{{ stats.overview.active_bookings }}</p>
            </div>
            <span class="text-4xl">✅</span>
          </div>
          <p class="text-sm text-green-100">
            {{ stats.overview.pending_bookings }} {{ isRTL ? 'قيد الانتظار' : 'pending' }}
          </p>
        </div>

        <div class="card bg-gradient-to-br from-yellow-500 to-yellow-600 text-white hover:shadow-2xl transition-all">
          <div class="flex justify-between items-start mb-3">
            <div>
              <p class="text-yellow-100 text-sm">{{ isRTL ? 'الإيرادات الكلية' : 'Total Revenue' }}</p>
              <p class="text-4xl font-bold mt-2">${{ stats.overview.total_revenue.toLocaleString() }}</p>
            </div>
            <span class="text-4xl">💰</span>
          </div>
          <p class="text-sm text-yellow-100">
            ${{ stats.overview.monthly_revenue.toLocaleString() }} {{ isRTL ? 'هذا الشهر' : 'this month' }}
          </p>
        </div>

        <div class="card bg-gradient-to-br from-purple-500 to-purple-600 text-white hover:shadow-2xl transition-all">
          <div class="flex justify-between items-start mb-3">
            <div>
              <p class="text-purple-100 text-sm">{{ isRTL ? 'المخزون' : 'Inventory' }}</p>
              <p class="text-4xl font-bold mt-2">{{ stats.inventory.active_rooms + stats.inventory.active_products }}</p>
            </div>
            <span class="text-4xl">📦</span>
          </div>
          <p class="text-sm text-purple-100">
            {{ stats.inventory.active_rooms }} {{ isRTL ? 'غرف' : 'rooms' }} + {{ stats.inventory.active_products }} {{ isRTL ? 'منتجات' : 'products' }}
          </p>
        </div>
      </div>

      <!-- Charts Row -->
      <div v-if="stats" class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
        <!-- Revenue Chart -->
        <div class="card">
          <h3 class="text-xl font-bold mb-4">{{ isRTL ? '📈 الإيرادات الشهرية' : '📈 Monthly Revenue' }}</h3>
          <div class="space-y-2">
            <div v-for="month in stats.monthly_revenue" :key="month.month" class="flex items-center gap-3">
              <span class="text-sm font-semibold w-12">{{ month.month }}</span>
              <div class="flex-1 bg-gray-200 rounded-full h-8 relative overflow-hidden">
                <div 
                  class="bg-gradient-to-r from-primary-500 to-primary-600 h-full rounded-full flex items-center justify-end px-3 text-white text-sm font-semibold transition-all duration-500"
                  :style="{ width: `${(month.revenue / maxRevenue) * 100}%` }"
                >
                  <span v-if="month.revenue > 0">${{ month.revenue.toLocaleString() }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Bookings by Type -->
        <div class="card">
          <h3 class="text-xl font-bold mb-4">{{ isRTL ? '📊 الحجوزات حسب النوع' : '📊 Bookings by Type' }}</h3>
          <div class="space-y-3">
            <div v-for="item in stats.bookings_by_type" :key="item.type" class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
              <div class="flex items-center gap-3">
                <span class="text-2xl">{{ getTypeIcon(item.type) }}</span>
                <span class="font-semibold">{{ getTypeLabel(item.type) }}</span>
              </div>
              <span class="text-2xl font-bold text-primary-600">{{ item.count }}</span>
            </div>
          </div>
        </div>
      </div>

      <!-- Tabs -->
      <div class="bg-white rounded-xl shadow-sm mb-6">
        <div class="flex border-b overflow-x-auto">
          <button 
            @click="activeTab = 'bookings'" 
            :class="activeTab === 'bookings' ? 'border-b-2 border-primary-600 text-primary-600 font-bold' : 'text-gray-600'"
            class="px-6 py-4 whitespace-nowrap hover:bg-gray-50 transition-colors"
          >
            📋 {{ isRTL ? 'الحجوزات' : 'Bookings' }}
          </button>
          <button 
            @click="activeTab = 'rooms'" 
            :class="activeTab === 'rooms' ? 'border-b-2 border-primary-600 text-primary-600 font-bold' : 'text-gray-600'"
            class="px-6 py-4 whitespace-nowrap hover:bg-gray-50 transition-colors"
          >
            🏨 {{ isRTL ? 'الغرف' : 'Rooms' }}
          </button>
          <button 
            @click="activeTab = 'products'" 
            :class="activeTab === 'products' ? 'border-b-2 border-primary-600 text-primary-600 font-bold' : 'text-gray-600'"
            class="px-6 py-4 whitespace-nowrap hover:bg-gray-50 transition-colors"
          >
            🍽️ {{ isRTL ? 'المنتجات' : 'Products' }}
          </button>
        </div>
      </div>

      <!-- Tab Content -->
      <div v-if="activeTab === 'bookings'" class="card">
        <div class="flex justify-between items-center mb-4">
          <h2 class="text-2xl font-bold">{{ isRTL ? 'جميع الحجوزات' : 'All Bookings' }}</h2>
          <select v-model="statusFilter" class="input w-48">
            <option value="">{{ isRTL ? 'كل الحالات' : 'All Status' }}</option>
            <option value="pending">Pending</option>
            <option value="confirmed">Confirmed</option>
            <option value="cancelled">Cancelled</option>
            <option value="completed">Completed</option>
          </select>
        </div>
        
        <div class="overflow-x-auto">
          <table class="w-full">
            <thead class="bg-gray-100">
              <tr>
                <th class="px-4 py-3 text-left text-sm font-semibold">ID</th>
                <th class="px-4 py-3 text-left text-sm font-semibold">{{ isRTL ? 'الضيف' : 'Guest' }}</th>
                <th class="px-4 py-3 text-left text-sm font-semibold">{{ isRTL ? 'النوع' : 'Type' }}</th>
                <th class="px-4 py-3 text-left text-sm font-semibold">{{ isRTL ? 'التاريخ' : 'Date' }}</th>
                <th class="px-4 py-3 text-left text-sm font-semibold">{{ isRTL ? 'السعر' : 'Price' }}</th>
                <th class="px-4 py-3 text-left text-sm font-semibold">{{ isRTL ? 'الحالة' : 'Status' }}</th>
                <th class="px-4 py-3 text-left text-sm font-semibold">{{ isRTL ? 'إجراءات' : 'Actions' }}</th>
              </tr>
            </thead>
            <tbody class="divide-y">
              <tr v-for="booking in filteredBookings" :key="booking.id" class="hover:bg-gray-50">
                <td class="px-4 py-3 font-mono text-sm font-semibold">#{{ booking.id }}</td>
                <td class="px-4 py-3 text-sm">
                  <div v-if="booking.special_requests">
                    <div class="font-semibold">{{ extractGuestName(booking.special_requests) }}</div>
                    <div class="text-gray-600 text-xs">{{ extractGuestEmail(booking.special_requests) }}</div>
                  </div>
                  <div v-else class="text-gray-400">User {{ booking.user_id }}</div>
                </td>
                <td class="px-4 py-3">
                  <span class="px-2 py-1 bg-blue-100 text-blue-800 rounded text-xs">{{ booking.booking_type }}</span>
                </td>
                <td class="px-4 py-3 text-sm">{{ formatDate(booking.booking_date) }}</td>
                <td class="px-4 py-3 font-semibold">${{ Number(booking.total_price).toLocaleString() }}</td>
                <td class="px-4 py-3">
                  <span :class="getStatusClass(booking.status)" class="px-3 py-1 rounded-full text-xs font-semibold">
                    {{ booking.status }}
                  </span>
                </td>
                <td class="px-4 py-3">
                  <div class="flex gap-2">
                    <button 
                      v-if="booking.status === 'pending'"
                      @click="updateStatus(booking.id, 'confirmed')" 
                      class="px-3 py-1 bg-green-500 text-white rounded hover:bg-green-600 text-xs"
                    >
                      ✓
                    </button>
                    <button 
                      v-if="booking.status !== 'cancelled'"
                      @click="updateStatus(booking.id, 'cancelled')" 
                      class="px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600 text-xs"
                    >
                      ✕
                    </button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <RoomManager v-if="activeTab === 'rooms'" />
      <ProductManager v-if="activeTab === 'products'" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import apiClient from '@/api/client'
import RoomManager from '@/components/RoomManager.vue'
import ProductManager from '@/components/ProductManager.vue'

const { t } = useI18n()
const appStore = useAppStore()
const toast = useToast()

const activeTab = ref('bookings')
const bookings = ref<any[]>([])
const stats = ref<any>(null)
const statusFilter = ref('')
const isRTL = computed(() => appStore.isRTL)

const filteredBookings = computed(() => {
  if (!statusFilter.value) return bookings.value
  return bookings.value.filter(b => b.status === statusFilter.value)
})

const maxRevenue = computed(() => {
  if (!stats.value) return 1
  return Math.max(...stats.value.monthly_revenue.map((m: any) => m.revenue), 1)
})

async function loadStats() {
  try {
    const response = await apiClient.get('/api/stats/dashboard')
    stats.value = response.data
  } catch (error) {
    toast.error('Failed to load stats')
  }
}

async function loadBookings() {
  try {
    const response = await apiClient.get('/api/bookings')
    bookings.value = response.data
  } catch (error) {
    toast.error('Failed to load bookings')
  }
}

async function updateStatus(bookingId: number, status: string) {
  try {
    await apiClient.put(`/api/bookings/${bookingId}`, { status })
    toast.success(isRTL.value ? 'تم التحديث' : 'Updated')
    loadBookings()
    loadStats()
  } catch (error) {
    toast.error('Failed to update')
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

function getTypeLabel(type: string) {
  const labels: Record<string, string> = {
    room: isRTL.value ? 'غرفة' : 'Room',
    restaurant: isRTL.value ? 'مطعم' : 'Restaurant',
    cafe: isRTL.value ? 'كافيه' : 'Cafe',
    water_sports: isRTL.value ? 'رياضة مائية' : 'Water Sport',
    activities: isRTL.value ? 'نشاط' : 'Activity',
    beach: isRTL.value ? 'شاطئ' : 'Beach'
  }
  return labels[type] || type
}

onMounted(() => {
  loadStats()
  loadBookings()
})
</script>
