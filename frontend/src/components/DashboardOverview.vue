<template>
  <div class="space-y-6">
    <!-- Stats Cards -->
    <div v-if="stats" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
      <div class="card bg-gradient-to-br from-blue-500 to-blue-600 text-white hover:shadow-2xl transition-all cursor-pointer hover:scale-105">
        <div class="flex justify-between items-start mb-3">
          <div>
            <p class="text-blue-100 text-sm">{{ isRTL ? 'إجمالي الحجوزات' : 'Total Bookings' }}</p>
            <p class="text-5xl font-bold mt-2">{{ stats.overview.total_bookings }}</p>
          </div>
          <span class="text-5xl">📊</span>
        </div>
        <p class="text-sm text-blue-100 flex items-center gap-2">
          <span class="text-xl">📈</span>
          {{ stats.overview.recent_bookings }} {{ isRTL ? 'آخر 7 أيام' : 'last 7 days' }}
        </p>
      </div>

      <div class="card bg-gradient-to-br from-green-500 to-green-600 text-white hover:shadow-2xl transition-all cursor-pointer hover:scale-105">
        <div class="flex justify-between items-start mb-3">
          <div>
            <p class="text-green-100 text-sm">{{ isRTL ? 'الحجوزات النشطة' : 'Active Bookings' }}</p>
            <p class="text-5xl font-bold mt-2">{{ stats.overview.active_bookings }}</p>
          </div>
          <span class="text-5xl">✅</span>
        </div>
        <p class="text-sm text-green-100 flex items-center gap-2">
          <span class="text-xl">⏳</span>
          {{ stats.overview.pending_bookings }} {{ isRTL ? 'قيد الانتظار' : 'pending' }}
        </p>
      </div>

      <div class="card bg-gradient-to-br from-yellow-500 to-yellow-600 text-white hover:shadow-2xl transition-all cursor-pointer hover:scale-105">
        <div class="flex justify-between items-start mb-3">
          <div>
            <p class="text-yellow-100 text-sm">{{ isRTL ? 'الإيرادات الكلية' : 'Total Revenue' }}</p>
            <p class="text-4xl font-bold mt-2">${{ stats.overview.total_revenue.toLocaleString() }}</p>
          </div>
          <span class="text-5xl">💰</span>
        </div>
        <p class="text-sm text-yellow-100 flex items-center gap-2">
          <span class="text-xl">📅</span>
          ${{ stats.overview.monthly_revenue.toLocaleString() }} {{ isRTL ? 'هذا الشهر' : 'this month' }}
        </p>
      </div>

      <div class="card bg-gradient-to-br from-purple-500 to-purple-600 text-white hover:shadow-2xl transition-all cursor-pointer hover:scale-105">
        <div class="flex justify-between items-start mb-3">
          <div>
            <p class="text-purple-100 text-sm">{{ isRTL ? 'المخزون' : 'Inventory' }}</p>
            <p class="text-5xl font-bold mt-2">{{ stats.inventory.active_rooms + stats.inventory.active_products }}</p>
          </div>
          <span class="text-5xl">📦</span>
        </div>
        <p class="text-sm text-purple-100 flex items-center gap-2">
          <span class="text-xl">🏨</span>
          {{ stats.inventory.active_rooms }} + {{ stats.inventory.active_products }}
        </p>
      </div>
    </div>

    <!-- Charts Row -->
    <div v-if="stats" class="grid grid-cols-1 lg:grid-cols-2 gap-6">
      <!-- Revenue Chart -->
      <div class="card">
        <h3 class="text-2xl font-bold mb-6 flex items-center gap-2">
          <span>📈</span>
          {{ isRTL ? 'الإيرادات الشهرية' : 'Monthly Revenue' }}
        </h3>
        <div class="space-y-3">
          <div v-for="month in stats.monthly_revenue" :key="month.month" class="group">
            <div class="flex items-center justify-between mb-1">
              <span class="text-sm font-semibold text-gray-700">{{ month.month }}</span>
              <span class="text-sm font-bold text-primary-600">${{ month.revenue.toLocaleString() }}</span>
            </div>
            <div class="w-full bg-gray-200 rounded-full h-10 relative overflow-hidden">
              <div 
                class="bg-gradient-to-r from-primary-500 to-primary-600 h-full rounded-full transition-all duration-700 ease-out group-hover:from-primary-600 group-hover:to-primary-700"
                :style="{ width: `${(month.revenue / maxRevenue) * 100}%` }"
              ></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Bookings by Type -->
      <div class="card">
        <h3 class="text-2xl font-bold mb-6 flex items-center gap-2">
          <span>📊</span>
          {{ isRTL ? 'الحجوزات حسب النوع' : 'Bookings by Type' }}
        </h3>
        <div class="space-y-3">
          <div v-for="item in stats.bookings_by_type" :key="item.type" class="flex items-center justify-between p-4 bg-gradient-to-r from-gray-50 to-gray-100 rounded-xl hover:shadow-md transition-all cursor-pointer group">
            <div class="flex items-center gap-4">
              <span class="text-4xl group-hover:scale-110 transition-transform">{{ getTypeIcon(item.type) }}</span>
              <div>
                <p class="font-bold text-lg">{{ getTypeLabel(item.type) }}</p>
                <p class="text-sm text-gray-600">{{ item.type }}</p>
              </div>
            </div>
            <div class="text-right">
              <p class="text-3xl font-bold text-primary-600">{{ item.count }}</p>
              <p class="text-xs text-gray-500">{{ isRTL ? 'حجز' : 'bookings' }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Status Distribution -->
    <div v-if="stats" class="card">
      <h3 class="text-2xl font-bold mb-6 flex items-center gap-2">
        <span>🎯</span>
        {{ isRTL ? 'توزيع الحالات' : 'Status Distribution' }}
      </h3>
      <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
        <div v-for="item in stats.bookings_by_status" :key="item.status" class="text-center p-6 rounded-xl" :class="getStatusBg(item.status)">
          <p class="text-4xl font-bold mb-2">{{ item.count }}</p>
          <p class="font-semibold capitalize">{{ item.status }}</p>
        </div>
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

const stats = ref<any>(null)

const maxRevenue = computed(() => {
  if (!stats.value) return 1
  return Math.max(...stats.value.monthly_revenue.map((m: any) => m.revenue), 1)
})

async function loadStats() {
  try {
    const response = await apiClient.get('/api/stats/dashboard')
    stats.value = response.data
  } catch (error) {
    toast.error(isRTL.value ? 'فشل التحميل' : 'Failed to load')
  }
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

function getStatusBg(status: string) {
  const classes: Record<string, string> = {
    pending: 'bg-yellow-100 text-yellow-800',
    confirmed: 'bg-green-100 text-green-800',
    cancelled: 'bg-red-100 text-red-800',
    completed: 'bg-blue-100 text-blue-800'
  }
  return classes[status] || 'bg-gray-100 text-gray-800'
}

onMounted(() => {
  loadStats()
})
</script>
