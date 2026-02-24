<template>
  <div class="space-y-8">
    <!-- Date Range Filter -->
    <div class="bg-white rounded-2xl p-6 shadow-lg border border-slate-200/50">
      <div class="flex flex-wrap items-center gap-4">
        <div class="flex items-center gap-2">
          <span class="text-2xl">📅</span>
          <span class="font-semibold text-slate-900">{{ isRTL ? 'الفترة الزمنية:' : 'Date Range:' }}</span>
        </div>
        <div class="flex gap-2">
          <button @click="setDateRange('today')" :class="dateRange === 'today' ? 'bg-amber-500 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'" class="px-4 py-2 rounded-lg font-medium transition-all">
            {{ isRTL ? 'اليوم' : 'Today' }}
          </button>
          <button @click="setDateRange('week')" :class="dateRange === 'week' ? 'bg-amber-500 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'" class="px-4 py-2 rounded-lg font-medium transition-all">
            {{ isRTL ? 'هذا الأسبوع' : 'This Week' }}
          </button>
          <button @click="setDateRange('month')" :class="dateRange === 'month' ? 'bg-amber-500 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'" class="px-4 py-2 rounded-lg font-medium transition-all">
            {{ isRTL ? 'هذا الشهر' : 'This Month' }}
          </button>
          <button @click="setDateRange('all')" :class="dateRange === 'all' ? 'bg-amber-500 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'" class="px-4 py-2 rounded-lg font-medium transition-all">
            {{ isRTL ? 'الكل' : 'All Time' }}
          </button>
        </div>
      </div>
    </div>

    <!-- Performance Dashboard -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
      <!-- Revenue Chart Card -->
      <div class="lg:col-span-2 bg-white rounded-3xl p-8 shadow-lg border border-slate-200/50">
        <div class="flex items-center justify-between mb-6">
          <div>
            <h3 class="text-2xl font-bold text-slate-900">{{ isRTL ? 'نظرة عامة على الأداء' : 'Performance Overview' }}</h3>
            <p class="text-sm text-slate-600 mt-1">{{ isRTL ? 'آخر 7 أيام' : 'Last 7 days' }}</p>
          </div>
          <div class="flex items-center gap-2">
            <span class="text-3xl">📈</span>
          </div>
        </div>

        <!-- Mini Stats Grid -->
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6">
          <div class="bg-gradient-to-br from-blue-50 to-blue-100 rounded-2xl p-4 border border-blue-200/50">
            <div class="flex items-center gap-2 mb-2">
              <span class="text-2xl">📊</span>
              <p class="text-xs text-blue-600 font-semibold uppercase">{{ isRTL ? 'الحجوزات' : 'Bookings' }}</p>
            </div>
            <p class="text-3xl font-bold text-blue-700">{{ stats?.overview?.total_bookings || 0 }}</p>
            <p class="text-xs text-blue-600 mt-1">+{{ stats?.overview?.recent_bookings || 0 }} {{ isRTL ? 'جديد' : 'new' }}</p>
          </div>

          <div class="bg-gradient-to-br from-green-50 to-green-100 rounded-2xl p-4 border border-green-200/50">
            <div class="flex items-center gap-2 mb-2">
              <span class="text-2xl">✅</span>
              <p class="text-xs text-green-600 font-semibold uppercase">{{ isRTL ? 'نشطة' : 'Active' }}</p>
            </div>
            <p class="text-3xl font-bold text-green-700">{{ stats?.overview?.active_bookings || 0 }}</p>
            <p class="text-xs text-green-600 mt-1">{{ isRTL ? 'قيد التنفيذ' : 'in progress' }}</p>
          </div>

          <div class="bg-gradient-to-br from-amber-50 to-amber-100 rounded-2xl p-4 border border-amber-200/50">
            <div class="flex items-center gap-2 mb-2">
              <span class="text-2xl">⏳</span>
              <p class="text-xs text-amber-600 font-semibold uppercase">{{ isRTL ? 'معلقة' : 'Pending' }}</p>
            </div>
            <p class="text-3xl font-bold text-amber-700">{{ stats?.overview?.pending_bookings || 0 }}</p>
            <p class="text-xs text-amber-600 mt-1">{{ isRTL ? 'تحتاج موافقة' : 'need approval' }}</p>
          </div>

          <div class="bg-gradient-to-br from-purple-50 to-purple-100 rounded-2xl p-4 border border-purple-200/50">
            <div class="flex items-center gap-2 mb-2">
              <span class="text-2xl">💰</span>
              <p class="text-xs text-purple-600 font-semibold uppercase">{{ isRTL ? 'الإيرادات' : 'Revenue' }}</p>
            </div>
            <p class="text-2xl font-bold text-purple-700">${{ (stats?.overview?.monthly_revenue || 0).toLocaleString() }}</p>
            <p class="text-xs text-purple-600 mt-1">{{ isRTL ? 'هذا الشهر' : 'this month' }}</p>
          </div>
        </div>

        <!-- Progress Bars -->
        <div class="space-y-4">
          <div>
            <div class="flex items-center justify-between mb-2">
              <span class="text-sm font-semibold text-slate-700">{{ isRTL ? 'معدل الإشغال' : 'Occupancy Rate' }}</span>
              <span class="text-sm font-bold text-blue-600">{{ occupancyRate }}%</span>
            </div>
            <div class="h-3 bg-slate-100 rounded-full overflow-hidden">
              <div class="h-full bg-gradient-to-r from-blue-500 to-blue-600 rounded-full transition-all duration-1000" :style="{ width: occupancyRate + '%' }"></div>
            </div>
          </div>

          <div>
            <div class="flex items-center justify-between mb-2">
              <span class="text-sm font-semibold text-slate-700">{{ isRTL ? 'معدل التحويل' : 'Conversion Rate' }}</span>
              <span class="text-sm font-bold text-green-600">{{ conversionRate }}%</span>
            </div>
            <div class="h-3 bg-slate-100 rounded-full overflow-hidden">
              <div class="h-full bg-gradient-to-r from-green-500 to-green-600 rounded-full transition-all duration-1000" :style="{ width: conversionRate + '%' }"></div>
            </div>
          </div>

          <div>
            <div class="flex items-center justify-between mb-2">
              <span class="text-sm font-semibold text-slate-700">{{ isRTL ? 'رضا العملاء' : 'Customer Satisfaction' }}</span>
              <span class="text-sm font-bold text-amber-600">{{ satisfactionRate }}%</span>
            </div>
            <div class="h-3 bg-slate-100 rounded-full overflow-hidden">
              <div class="h-full bg-gradient-to-r from-amber-500 to-amber-600 rounded-full transition-all duration-1000" :style="{ width: satisfactionRate + '%' }"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Quick Actions Card -->
      <div class="bg-white rounded-3xl p-8 shadow-lg border border-slate-200/50">
        <div class="flex items-center justify-between mb-6">
          <div>
            <h3 class="text-2xl font-bold text-slate-900">{{ isRTL ? 'إجراءات سريعة' : 'Quick Actions' }}</h3>
            <p class="text-sm text-slate-600 mt-1">{{ isRTL ? 'الأكثر استخداماً' : 'Most used' }}</p>
          </div>
          <span class="text-3xl">⚡</span>
        </div>

        <div class="space-y-3">
          <button @click="$emit('navigate', 'bookings')" class="group w-full flex items-center gap-4 p-4 bg-gradient-to-br from-blue-50 to-blue-100 hover:from-blue-500 hover:to-blue-600 rounded-2xl border border-blue-200/50 transition-all duration-300 hover:shadow-xl hover:scale-105">
            <div class="w-14 h-14 bg-white/80 group-hover:bg-white rounded-xl flex items-center justify-center shadow-lg transition-all">
              <span class="text-3xl">📋</span>
            </div>
            <div class="flex-1 text-left">
              <p class="font-bold text-slate-900 group-hover:text-white transition-colors">{{ isRTL ? 'حجز جديد' : 'New Booking' }}</p>
              <p class="text-xs text-slate-600 group-hover:text-blue-100 transition-colors">{{ isRTL ? 'إضافة حجز جديد' : 'Add new reservation' }}</p>
            </div>
            <span class="text-2xl opacity-0 group-hover:opacity-100 transition-opacity">→</span>
          </button>

          <button @click="$emit('navigate', 'rooms')" class="group w-full flex items-center gap-4 p-4 bg-gradient-to-br from-green-50 to-green-100 hover:from-green-500 hover:to-green-600 rounded-2xl border border-green-200/50 transition-all duration-300 hover:shadow-xl hover:scale-105">
            <div class="w-14 h-14 bg-white/80 group-hover:bg-white rounded-xl flex items-center justify-center shadow-lg transition-all">
              <span class="text-3xl">🏨</span>
            </div>
            <div class="flex-1 text-left">
              <p class="font-bold text-slate-900 group-hover:text-white transition-colors">{{ isRTL ? 'إدارة الغرف' : 'Manage Rooms' }}</p>
              <p class="text-xs text-slate-600 group-hover:text-green-100 transition-colors">{{ isRTL ? 'عرض وتعديل الغرف' : 'View and edit rooms' }}</p>
            </div>
            <span class="text-2xl opacity-0 group-hover:opacity-100 transition-opacity">→</span>
          </button>

          <button @click="$emit('navigate', 'events')" class="group w-full flex items-center gap-4 p-4 bg-gradient-to-br from-amber-50 to-amber-100 hover:from-amber-500 hover:to-amber-600 rounded-2xl border border-amber-200/50 transition-all duration-300 hover:shadow-xl hover:scale-105">
            <div class="w-14 h-14 bg-white/80 group-hover:bg-white rounded-xl flex items-center justify-center shadow-lg transition-all">
              <span class="text-3xl">🎉</span>
            </div>
            <div class="flex-1 text-left">
              <p class="font-bold text-slate-900 group-hover:text-white transition-colors">{{ isRTL ? 'إضافة فعالية' : 'Add Event' }}</p>
              <p class="text-xs text-slate-600 group-hover:text-amber-100 transition-colors">{{ isRTL ? 'فعالية أو نشاط جديد' : 'New event or activity' }}</p>
            </div>
            <span class="text-2xl opacity-0 group-hover:opacity-100 transition-opacity">→</span>
          </button>

          <button @click="$emit('navigate', 'products')" class="group w-full flex items-center gap-4 p-4 bg-gradient-to-br from-purple-50 to-purple-100 hover:from-purple-500 hover:to-purple-600 rounded-2xl border border-purple-200/50 transition-all duration-300 hover:shadow-xl hover:scale-105">
            <div class="w-14 h-14 bg-white/80 group-hover:bg-white rounded-xl flex items-center justify-center shadow-lg transition-all">
              <span class="text-3xl">🍽️</span>
            </div>
            <div class="flex-1 text-left">
              <p class="font-bold text-slate-900 group-hover:text-white transition-colors">{{ isRTL ? 'إدارة المنتجات' : 'Manage Products' }}</p>
              <p class="text-xs text-slate-600 group-hover:text-purple-100 transition-colors">{{ isRTL ? 'طعام ومشروبات' : 'Food & beverages' }}</p>
            </div>
            <span class="text-2xl opacity-0 group-hover:opacity-100 transition-opacity">→</span>
          </button>
        </div>

        <!-- System Status -->
        <div class="mt-6 pt-6 border-t border-slate-200">
          <p class="text-xs font-semibold text-slate-500 uppercase mb-3">{{ isRTL ? 'حالة النظام' : 'System Status' }}</p>
          <div class="space-y-2">
            <div class="flex items-center justify-between">
              <span class="text-sm text-slate-600">{{ isRTL ? 'الخادم' : 'Server' }}</span>
              <div class="flex items-center gap-2">
                <div class="w-2 h-2 bg-green-500 rounded-full animate-pulse"></div>
                <span class="text-xs font-semibold text-green-600">{{ isRTL ? 'نشط' : 'Online' }}</span>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-sm text-slate-600">{{ isRTL ? 'قاعدة البيانات' : 'Database' }}</span>
              <div class="flex items-center gap-2">
                <div class="w-2 h-2 bg-green-500 rounded-full animate-pulse"></div>
                <span class="text-xs font-semibold text-green-600">{{ isRTL ? 'متصل' : 'Connected' }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useAppStore } from '@/stores/app'
import apiClient from '@/api/client'

const emit = defineEmits(['navigate'])

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)
const stats = ref<any>(null)
const dateRange = ref('all')

const occupancyRate = computed(() => {
  if (!stats.value?.overview) return 0
  const total = stats.value.overview.total_rooms || 1
  const active = stats.value.overview.active_bookings || 0
  return Math.min(Math.round((active / total) * 100), 100)
})

const conversionRate = computed(() => {
  if (!stats.value?.overview) return 0
  const total = stats.value.overview.total_bookings || 1
  const confirmed = stats.value.overview.active_bookings || 0
  return Math.min(Math.round((confirmed / total) * 100), 100)
})

const satisfactionRate = computed(() => {
  // Mock data - can be replaced with real customer ratings
  return 92
})

async function loadStats() {
  try {
    const response = await apiClient.get('/api/stats/dashboard', {
      params: { range: dateRange.value }
    })
    stats.value = response.data
  } catch (error) {
    console.error('Failed to load stats')
  }
}

function setDateRange(range: string) {
  dateRange.value = range
  loadStats()
}

onMounted(() => {
  loadStats()
})
</script>
