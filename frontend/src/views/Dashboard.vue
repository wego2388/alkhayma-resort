<template>
  <div class="flex h-screen bg-gradient-to-br from-slate-50 via-blue-50 to-slate-100 overflow-hidden">
    <!-- Sidebar -->
    <aside :class="sidebarOpen ? 'translate-x-0' : '-translate-x-full'" class="fixed lg:static inset-y-0 left-0 z-50 w-72 bg-gradient-to-b from-slate-900 via-slate-800 to-slate-900 text-white transition-all duration-500 lg:translate-x-0 shadow-2xl border-r border-white/10">
      <!-- Logo -->
      <div class="p-6 border-b border-white/10 bg-gradient-to-r from-amber-500/10 to-transparent">
        <div class="flex items-center gap-3">
          <div class="w-12 h-12 bg-gradient-to-br from-amber-400 to-amber-600 rounded-2xl flex items-center justify-center shadow-lg shadow-amber-500/50">
            <span class="text-2xl">🏨</span>
          </div>
          <div>
            <h2 class="font-display text-2xl font-bold bg-gradient-to-r from-amber-400 to-amber-600 bg-clip-text text-transparent">{{ isRTL ? 'الخيمة' : 'El Kheima' }}</h2>
            <p class="text-xs text-slate-400">{{ isRTL ? 'لوحة التحكم' : 'Admin Dashboard' }}</p>
          </div>
        </div>
      </div>

      <!-- Search Bar -->
      <div class="px-4 py-3 border-b border-white/10">
        <div class="relative">
          <input 
            v-model="searchQuery" 
            type="text" 
            :placeholder="isRTL ? '🔍 بحث سريع...' : '🔍 Quick search...'"
            class="w-full px-4 py-2 bg-white/10 border border-white/20 rounded-xl text-white placeholder-white/50 focus:bg-white/20 focus:border-amber-500 transition-all text-sm"
            @input="handleSearch"
          />
          <div v-if="searchResults.length > 0" class="absolute top-full left-0 right-0 mt-2 bg-slate-800 rounded-xl shadow-2xl border border-white/10 max-h-64 overflow-y-auto z-50">
            <button 
              v-for="result in searchResults" 
              :key="result.id"
              @click="navigateToResult(result)"
              class="w-full px-4 py-3 hover:bg-white/10 transition-colors text-left border-b border-white/5 last:border-0"
            >
              <p class="text-sm font-semibold text-white">{{ result.name }}</p>
              <p class="text-xs text-slate-400">{{ result.type }}</p>
            </button>
          </div>
        </div>
      </div>

      <!-- Navigation -->
      <nav class="p-4 space-y-2 overflow-y-auto" style="max-height: calc(100vh - 240px)">
        <button 
          v-for="item in menuItems" 
          :key="item.id"
          @click="activeView = item.id"
          :class="activeView === item.id ? 'bg-gradient-to-r from-amber-500 to-amber-600 shadow-lg shadow-amber-500/30 scale-105' : 'hover:bg-white/10 hover:translate-x-1'"
          class="w-full flex items-center gap-4 px-4 py-4 rounded-2xl transition-all duration-300 group relative overflow-hidden"
        >
          <!-- Glow effect -->
          <div v-if="activeView === item.id" class="absolute inset-0 bg-gradient-to-r from-amber-400/20 to-transparent blur-xl"></div>
          
          <div class="relative w-10 h-10 rounded-xl flex items-center justify-center" :class="activeView === item.id ? 'bg-white/20' : 'bg-white/5 group-hover:bg-white/10'">
            <span class="text-2xl">{{ item.icon }}</span>
          </div>
          <div class="flex-1 text-left relative">
            <p class="font-semibold text-sm">{{ isRTL ? item.nameAr : item.name }}</p>
            <p class="text-xs opacity-70">{{ isRTL ? item.descAr : item.desc }}</p>
          </div>
          <span v-if="activeView === item.id" class="text-xl relative">→</span>
        </button>
      </nav>

      <!-- User Info -->
      <div class="absolute bottom-0 left-0 right-0 p-4 border-t border-white/10 bg-gradient-to-t from-black/20">
        <div class="flex items-center gap-3 mb-3 p-3 bg-white/5 rounded-xl backdrop-blur-sm">
          <div class="w-12 h-12 bg-gradient-to-br from-amber-400 to-amber-600 rounded-xl flex items-center justify-center shadow-lg">
            <span class="text-2xl">👤</span>
          </div>
          <div class="flex-1">
            <p class="font-semibold text-sm">Admin</p>
            <p class="text-xs text-slate-400">admin@alkhayma.com</p>
          </div>
        </div>
        <router-link to="/" class="block w-full bg-white/10 hover:bg-gradient-to-r hover:from-amber-500 hover:to-amber-600 text-center py-3 rounded-xl text-sm font-semibold transition-all duration-300 hover:shadow-lg hover:scale-105">
          {{ isRTL ? '← العودة للرئيسية' : 'Back to Home →' }}
        </router-link>
      </div>
    </aside>

    <!-- Main Content -->
    <div class="flex-1 flex flex-col overflow-hidden">
      <!-- Top Bar -->
      <header class="bg-white/80 backdrop-blur-xl shadow-lg border-b border-slate-200/50 z-10">
        <div class="flex items-center justify-between px-8 py-5">
          <div class="flex items-center gap-4">
            <button @click="sidebarOpen = !sidebarOpen" class="lg:hidden w-10 h-10 flex items-center justify-center bg-slate-100 hover:bg-slate-200 rounded-xl transition-all text-xl">
              ☰
            </button>
            <div>
              <h1 class="text-3xl font-display font-bold bg-gradient-to-r from-slate-900 to-slate-600 bg-clip-text text-transparent">{{ currentTitle }}</h1>
              <p class="text-sm text-slate-500 mt-1">{{ currentDesc }}</p>
            </div>
          </div>
          
          <!-- Quick Stats -->
          <div class="hidden md:flex items-center gap-4">
            <!-- Refresh Button -->
            <button @click="refreshStats" :disabled="refreshing" class="group relative px-4 py-3 bg-gradient-to-br from-slate-100 to-slate-200 rounded-2xl border border-slate-300/50 hover:shadow-lg hover:scale-105 transition-all duration-300 disabled:opacity-50">
              <span class="text-2xl" :class="refreshing ? 'animate-spin' : ''">🔄</span>
            </button>

            <!-- Notifications -->
            <button @click="showNotifications = !showNotifications" class="group relative px-4 py-3 bg-gradient-to-br from-amber-50 to-amber-100 rounded-2xl border border-amber-200/50 hover:shadow-lg hover:scale-105 transition-all duration-300">
              <span class="text-2xl">🔔</span>
              <span v-if="pendingCount > 0" class="absolute -top-1 -right-1 w-6 h-6 bg-red-500 text-white text-xs font-bold rounded-full flex items-center justify-center animate-pulse">{{ pendingCount }}</span>
            </button>

            <!-- Export Button -->
            <button @click="exportData" class="group relative px-4 py-3 bg-gradient-to-br from-green-50 to-green-100 rounded-2xl border border-green-200/50 hover:shadow-lg hover:scale-105 transition-all duration-300">
              <span class="text-2xl">📥</span>
            </button>

            <div class="group relative px-6 py-3 bg-gradient-to-br from-blue-50 to-blue-100 rounded-2xl border border-blue-200/50 hover:shadow-lg hover:scale-105 transition-all duration-300">
              <div class="absolute inset-0 bg-gradient-to-br from-blue-400/20 to-transparent rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity"></div>
              <p class="text-xs text-blue-600 font-semibold uppercase tracking-wider mb-1">{{ isRTL ? 'حجوزات اليوم' : 'Today' }}</p>
              <p class="text-2xl font-bold text-blue-700 relative">{{ stats?.overview?.recent_bookings || 0 }}</p>
            </div>
            <div class="group relative px-6 py-3 bg-gradient-to-br from-green-50 to-green-100 rounded-2xl border border-green-200/50 hover:shadow-lg hover:scale-105 transition-all duration-300">
              <div class="absolute inset-0 bg-gradient-to-br from-green-400/20 to-transparent rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity"></div>
              <p class="text-xs text-green-600 font-semibold uppercase tracking-wider mb-1">{{ isRTL ? 'الإيرادات' : 'Revenue' }}</p>
              <p class="text-2xl font-bold text-green-700 relative">${{ (stats?.overview?.monthly_revenue || 0).toLocaleString() }}</p>
            </div>
            <div class="group relative px-6 py-3 bg-gradient-to-br from-amber-50 to-amber-100 rounded-2xl border border-amber-200/50 hover:shadow-lg hover:scale-105 transition-all duration-300">
              <div class="absolute inset-0 bg-gradient-to-br from-amber-400/20 to-transparent rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity"></div>
              <p class="text-xs text-amber-600 font-semibold uppercase tracking-wider mb-1">{{ isRTL ? 'الفعاليات' : 'Events' }}</p>
              <p class="text-2xl font-bold text-amber-700 relative">{{ stats?.events?.total || 0 }}</p>
            </div>
          </div>
        </div>
      </header>

      <!-- Content Area -->
      <main class="flex-1 overflow-y-auto p-8">
        <Transition name="fade" mode="out-in">
          <component :is="currentComponent" :key="activeView" @navigate="handleNavigate" />
        </Transition>
      </main>
    </div>

    <!-- Mobile Overlay -->
    <div 
      v-if="sidebarOpen" 
      @click="sidebarOpen = false"
      class="fixed inset-0 bg-black/50 backdrop-blur-sm z-40 lg:hidden"
    ></div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, shallowRef } from 'vue'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import apiClient from '@/api/client'
import DashboardOverview from '@/components/DashboardOverview.vue'
import BookingsManager from '@/components/BookingsManager.vue'
import RoomManager from '@/components/RoomManager.vue'
import ProductManager from '@/components/ProductManager.vue'
import EventsManager from '@/components/EventsManager.vue'
import SettingsManager from '@/components/SettingsManager.vue'

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const sidebarOpen = ref(false)
const activeView = ref('overview')
const stats = ref<any>(null)
const searchQuery = ref('')
const searchResults = ref<any[]>([])
const showNotifications = ref(false)
const refreshing = ref(false)

const pendingCount = computed(() => {
  return stats.value?.overview?.pending_bookings || 0
})

const menuItems = [
  {
    id: 'overview',
    icon: '📊',
    name: 'Overview',
    nameAr: 'نظرة عامة',
    desc: 'Statistics & Charts',
    descAr: 'الإحصائيات والرسوم'
  },
  {
    id: 'bookings',
    icon: '📋',
    name: 'Bookings',
    nameAr: 'الحجوزات',
    desc: 'Manage Reservations',
    descAr: 'إدارة الحجوزات'
  },
  {
    id: 'rooms',
    icon: '🏨',
    name: 'Rooms',
    nameAr: 'الغرف',
    desc: 'Room Inventory',
    descAr: 'مخزون الغرف'
  },
  {
    id: 'products',
    icon: '🍽️',
    name: 'Products',
    nameAr: 'المنتجات',
    desc: 'Food & Activities',
    descAr: 'الطعام والأنشطة'
  },
  {
    id: 'events',
    icon: '🎉',
    name: 'Events',
    nameAr: 'الفعاليات',
    desc: 'Manage Events',
    descAr: 'إدارة الفعاليات'
  },
  {
    id: 'settings',
    icon: '⚙️',
    name: 'Settings',
    nameAr: 'الإعدادات',
    desc: 'System Settings',
    descAr: 'إعدادات النظام'
  }
]

const currentComponent = computed(() => {
  const components: Record<string, any> = {
    overview: DashboardOverview,
    bookings: BookingsManager,
    rooms: RoomManager,
    products: ProductManager,
    events: EventsManager,
    settings: SettingsManager
  }
  return components[activeView.value]
})

const currentTitle = computed(() => {
  const item = menuItems.find(m => m.id === activeView.value)
  return item ? (isRTL.value ? item.nameAr : item.name) : ''
})

const currentDesc = computed(() => {
  const item = menuItems.find(m => m.id === activeView.value)
  return item ? (isRTL.value ? item.descAr : item.desc) : ''
})

async function loadStats() {
  try {
    const response = await apiClient.get('/api/stats/dashboard')
    stats.value = response.data
  } catch (error) {
    console.error('Failed to load stats')
  }
}

async function refreshStats() {
  refreshing.value = true
  try {
    await loadStats()
    toast.success(isRTL.value ? '✅ تم التحديث' : '✅ Refreshed')
  } catch (error) {
    toast.error(isRTL.value ? '❌ فشل التحديث' : '❌ Failed to refresh')
  } finally {
    setTimeout(() => {
      refreshing.value = false
    }, 1000)
  }
}

function handleSearch() {
  if (!searchQuery.value.trim()) {
    searchResults.value = []
    return
  }

  const query = searchQuery.value.toLowerCase()
  const results: any[] = []

  // Search in menu items
  menuItems.forEach(item => {
    if (item.name.toLowerCase().includes(query) || item.nameAr.includes(query)) {
      results.push({
        id: item.id,
        name: isRTL.value ? item.nameAr : item.name,
        type: isRTL.value ? 'قائمة' : 'Menu',
        action: 'navigate'
      })
    }
  })

  searchResults.value = results.slice(0, 5)
}

function navigateToResult(result: any) {
  if (result.action === 'navigate') {
    activeView.value = result.id
  }
  searchQuery.value = ''
  searchResults.value = []
}

function exportData() {
  try {
    // Create CSV data
    const csvData = [
      ['Metric', 'Value'],
      ['Total Bookings', stats.value?.overview?.total_bookings || 0],
      ['Active Bookings', stats.value?.overview?.active_bookings || 0],
      ['Pending Bookings', stats.value?.overview?.pending_bookings || 0],
      ['Total Revenue', stats.value?.overview?.total_revenue || 0],
      ['Monthly Revenue', stats.value?.overview?.monthly_revenue || 0],
      ['Total Rooms', stats.value?.overview?.total_rooms || 0],
      ['Total Products', stats.value?.overview?.total_products || 0]
    ]

    const csv = csvData.map(row => row.join(',')).join('\n')
    const blob = new Blob([csv], { type: 'text/csv' })
    const url = window.URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = `dashboard-stats-${new Date().toISOString().split('T')[0]}.csv`
    a.click()
    window.URL.revokeObjectURL(url)

    toast.success(isRTL.value ? '✅ تم التصدير' : '✅ Exported successfully')
  } catch (error) {
    toast.error(isRTL.value ? '❌ فشل التصدير' : '❌ Failed to export')
  }
}

function handleNavigate(view: string) {
  activeView.value = view
}

onMounted(() => {
  loadStats()
  
  // Auto-refresh every 30 seconds
  const interval = setInterval(() => {
    loadStats()
  }, 30000)

  // Cleanup
  return () => clearInterval(interval)
})
</script>

<style scoped>
.fade-enter-active, .fade-leave-active {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}
.fade-enter-from {
  opacity: 0;
  transform: translateY(10px);
}
.fade-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}

/* Custom scrollbar */
::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}
::-webkit-scrollbar-track {
  background: transparent;
}
::-webkit-scrollbar-thumb {
  background: linear-gradient(to bottom, #f59e0b, #d97706);
  border-radius: 4px;
}
::-webkit-scrollbar-thumb:hover {
  background: linear-gradient(to bottom, #d97706, #b45309);
}
</style>
