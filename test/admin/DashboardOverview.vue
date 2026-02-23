<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Header -->
    <div class="bg-white shadow-sm border-b">
      <div class="container mx-auto px-4 py-6">
        <h1 class="text-3xl font-bold text-gray-900">لوحة التحكم</h1>
        <p class="text-gray-600 mt-2">مرحباً بك في نظام إدارة منتجع الخيمة</p>
      </div>
    </div>

    <!-- Stats Cards -->
    <div class="container mx-auto px-4 py-8">
      <!-- Loading State -->
      <div v-if="loading" class="text-center py-20">
        <div class="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
        <p class="mt-4 text-gray-600">جاري تحميل الإحصائيات...</p>
      </div>

      <!-- Error State -->
      <div v-else-if="error" class="bg-red-50 border border-red-200 rounded-lg p-6 mb-8">
        <div class="flex items-center">
          <i class="fas fa-exclamation-triangle text-red-500 text-xl mr-3"></i>
          <div>
            <h3 class="text-red-800 font-semibold">خطأ في تحميل البيانات</h3>
            <p class="text-red-600">{{ error }}</p>
          </div>
        </div>
        <button
          @click="fetchStats"
          class="mt-4 bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded-lg"
        >
          إعادة المحاولة
        </button>
      </div>

      <!-- Stats Grid -->
      <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <!-- Total Rooms -->
        <div class="bg-white rounded-xl shadow-lg p-6 border-l-4 border-blue-500">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm font-medium text-gray-600">إجمالي الغرف</p>
              <p class="text-3xl font-bold text-gray-900">{{ stats.total_rooms || 0 }}</p>
            </div>
            <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
              <i class="fas fa-bed text-blue-600 text-xl"></i>
            </div>
          </div>
        </div>

        <!-- Available Rooms -->
        <div class="bg-white rounded-xl shadow-lg p-6 border-l-4 border-green-500">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm font-medium text-gray-600">الغرف المتاحة</p>
              <p class="text-3xl font-bold text-gray-900">{{ stats.available_rooms || 0 }}</p>
            </div>
            <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
              <i class="fas fa-check-circle text-green-600 text-xl"></i>
            </div>
          </div>
        </div>

        <!-- Total Bookings -->
        <div class="bg-white rounded-xl shadow-lg p-6 border-l-4 border-purple-500">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm font-medium text-gray-600">إجمالي الحجوزات</p>
              <p class="text-3xl font-bold text-gray-900">{{ stats.total_bookings || 0 }}</p>
            </div>
            <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center">
              <i class="fas fa-calendar-check text-purple-600 text-xl"></i>
            </div>
          </div>
        </div>

        <!-- Total Users -->
        <div class="bg-white rounded-xl shadow-lg p-6 border-l-4 border-orange-500">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm font-medium text-gray-600">إجمالي المستخدمين</p>
              <p class="text-3xl font-bold text-gray-900">{{ stats.total_users || 0 }}</p>
            </div>
            <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center">
              <i class="fas fa-users text-orange-600 text-xl"></i>
            </div>
          </div>
        </div>
      </div>

      <!-- Quick Actions -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
        <router-link
          to="/admin/bookings"
          class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition-shadow duration-300 group"
        >
          <div class="flex items-center">
            <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center group-hover:bg-blue-200 transition-colors">
              <i class="fas fa-calendar-alt text-blue-600 text-xl"></i>
            </div>
            <div class="mr-4">
              <h3 class="text-lg font-semibold text-gray-900">إدارة الحجوزات</h3>
              <p class="text-gray-600">عرض وإدارة جميع الحجوزات</p>
            </div>
          </div>
        </router-link>

        <router-link
          to="/admin/rooms"
          class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition-shadow duration-300 group"
        >
          <div class="flex items-center">
            <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center group-hover:bg-green-200 transition-colors">
              <i class="fas fa-home text-green-600 text-xl"></i>
            </div>
            <div class="mr-4">
              <h3 class="text-lg font-semibold text-gray-900">إدارة الغرف</h3>
              <p class="text-gray-600">إضافة وتعديل الغرف والأجنحة</p>
            </div>
          </div>
        </router-link>

        <router-link
          to="/admin/users"
          class="bg-white rounded-xl shadow-lg p-6 hover:shadow-xl transition-shadow duration-300 group"
        >
          <div class="flex items-center">
            <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center group-hover:bg-purple-200 transition-colors">
              <i class="fas fa-user-cog text-purple-600 text-xl"></i>
            </div>
            <div class="mr-4">
              <h3 class="text-lg font-semibold text-gray-900">إدارة المستخدمين</h3>
              <p class="text-gray-600">إدارة حسابات المستخدمين</p>
            </div>
          </div>
        </router-link>
      </div>

      <!-- Recent Activity -->
      <div class="bg-white rounded-xl shadow-lg p-6">
        <h2 class="text-xl font-bold text-gray-900 mb-6">النشاط الأخير</h2>
        
        <div v-if="bookingsStore.loading" class="text-center py-8">
          <div class="inline-block animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
        </div>
        
        <div v-else-if="recentBookings.length === 0" class="text-center py-8 text-gray-500">
          <i class="fas fa-inbox text-4xl mb-4"></i>
          <p>لا توجد حجوزات حديثة</p>
        </div>
        
        <div v-else class="space-y-4">
          <div
            v-for="booking in recentBookings"
            :key="booking.id"
            class="flex items-center justify-between p-4 bg-gray-50 rounded-lg"
          >
            <div class="flex items-center">
              <div class="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center mr-4">
                <i class="fas fa-calendar text-blue-600"></i>
              </div>
              <div>
                <p class="font-semibold text-gray-900">{{ booking.full_name }}</p>
                <p class="text-sm text-gray-600">{{ booking.room_name }} - {{ formatDate(booking.created_at) }}</p>
              </div>
            </div>
            <div class="text-left">
              <span
                class="px-3 py-1 rounded-full text-xs font-medium"
                :class="getStatusClass(booking.status)"
              >
                {{ getStatusLabel(booking.status) }}
              </span>
              <p class="text-sm text-gray-600 mt-1">{{ booking.total_price }} ريال</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useApi } from '@/services/api'
import { useBookingsStore } from '@/stores/bookings'

const { api } = useApi()
const bookingsStore = useBookingsStore()

const stats = ref({})
const loading = ref(false)
const error = ref(null)

const recentBookings = computed(() => 
  bookingsStore.bookings.slice(0, 5)
)

const fetchStats = async () => {
  loading.value = true
  error.value = null
  
  try {
    stats.value = await api.getStats()
  } catch (err) {
    error.value = err.message
  } finally {
    loading.value = false
  }
}

const formatDate = (dateString: string) => {
  return new Date(dateString).toLocaleDateString('ar-SA', {
    year: 'numeric',
    month: 'short',
    day: 'numeric'
  })
}

const getStatusClass = (status: string) => {
  const classes = {
    'pending': 'bg-yellow-100 text-yellow-800',
    'confirmed': 'bg-green-100 text-green-800',
    'cancelled': 'bg-red-100 text-red-800'
  }
  return classes[status] || 'bg-gray-100 text-gray-800'
}

const getStatusLabel = (status: string) => {
  const labels = {
    'pending': 'في الانتظار',
    'confirmed': 'مؤكد',
    'cancelled': 'ملغي'
  }
  return labels[status] || status
}

onMounted(() => {
  fetchStats()
  bookingsStore.fetchBookings()
})
</script>
