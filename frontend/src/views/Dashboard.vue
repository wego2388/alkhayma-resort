<template>
  <div class="flex h-screen bg-gray-50 overflow-hidden">
    <!-- Sidebar -->
    <aside :class="sidebarOpen ? 'translate-x-0' : '-translate-x-full'" class="fixed lg:static inset-y-0 left-0 z-50 w-64 bg-gradient-to-b from-primary-800 to-primary-900 text-white transition-transform duration-300 lg:translate-x-0 shadow-2xl">
      <!-- Logo -->
      <div class="p-6 border-b border-primary-700">
        <div class="flex items-center gap-3">
          <span class="text-4xl">🏨</span>
          <div>
            <h2 class="text-xl font-bold">{{ isRTL ? 'الخيمة' : 'Al Khayma' }}</h2>
            <p class="text-xs text-primary-200">{{ isRTL ? 'لوحة التحكم' : 'Dashboard' }}</p>
          </div>
        </div>
      </div>

      <!-- Navigation -->
      <nav class="p-4 space-y-2">
        <button 
          v-for="item in menuItems" 
          :key="item.id"
          @click="activeView = item.id"
          :class="activeView === item.id ? 'bg-white/20 shadow-lg' : 'hover:bg-white/10'"
          class="w-full flex items-center gap-3 px-4 py-3 rounded-xl transition-all duration-200 group"
        >
          <span class="text-2xl">{{ item.icon }}</span>
          <div class="flex-1 text-left">
            <p class="font-semibold">{{ isRTL ? item.nameAr : item.name }}</p>
            <p class="text-xs text-primary-200">{{ isRTL ? item.descAr : item.desc }}</p>
          </div>
          <span v-if="activeView === item.id" class="text-xl">→</span>
        </button>
      </nav>

      <!-- User Info -->
      <div class="absolute bottom-0 left-0 right-0 p-4 border-t border-primary-700">
        <div class="flex items-center gap-3 mb-3">
          <div class="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center">
            <span class="text-xl">👤</span>
          </div>
          <div class="flex-1">
            <p class="font-semibold text-sm">Admin</p>
            <p class="text-xs text-primary-200">admin@alkhayma.com</p>
          </div>
        </div>
        <router-link to="/" class="block w-full bg-white/10 hover:bg-white/20 text-center py-2 rounded-lg text-sm font-semibold transition-all">
          {{ isRTL ? '← الرئيسية' : 'Home →' }}
        </router-link>
      </div>
    </aside>

    <!-- Main Content -->
    <div class="flex-1 flex flex-col overflow-hidden">
      <!-- Top Bar -->
      <header class="bg-white shadow-sm border-b z-10">
        <div class="flex items-center justify-between px-6 py-4">
          <div class="flex items-center gap-4">
            <button @click="sidebarOpen = !sidebarOpen" class="lg:hidden text-2xl">☰</button>
            <div>
              <h1 class="text-2xl font-bold text-gray-900">{{ currentTitle }}</h1>
              <p class="text-sm text-gray-600">{{ currentDesc }}</p>
            </div>
          </div>
          
          <!-- Quick Stats -->
          <div class="hidden md:flex items-center gap-4">
            <div class="text-center px-4 py-2 bg-blue-50 rounded-lg">
              <p class="text-xs text-gray-600">{{ isRTL ? 'حجوزات اليوم' : 'Today' }}</p>
              <p class="text-xl font-bold text-blue-600">{{ stats?.overview?.recent_bookings || 0 }}</p>
            </div>
            <div class="text-center px-4 py-2 bg-green-50 rounded-lg">
              <p class="text-xs text-gray-600">{{ isRTL ? 'الإيرادات' : 'Revenue' }}</p>
              <p class="text-xl font-bold text-green-600">${{ (stats?.overview?.monthly_revenue || 0).toLocaleString() }}</p>
            </div>
          </div>
        </div>
      </header>

      <!-- Content Area -->
      <main class="flex-1 overflow-y-auto p-6">
        <Transition name="fade" mode="out-in">
          <component :is="currentComponent" :key="activeView" />
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

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const sidebarOpen = ref(false)
const activeView = ref('overview')
const stats = ref<any>(null)

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
  }
]

const currentComponent = computed(() => {
  const components: Record<string, any> = {
    overview: DashboardOverview,
    bookings: BookingsManager,
    rooms: RoomManager,
    products: ProductManager
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

onMounted(() => {
  loadStats()
})
</script>

<style scoped>
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.2s ease;
}
.fade-enter-from, .fade-leave-to {
  opacity: 0;
}
</style>
