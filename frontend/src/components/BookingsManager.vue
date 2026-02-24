<template>
  <div class="space-y-8">
    <!-- Header Stats -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      <div class="group relative bg-gradient-to-br from-blue-500 to-blue-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-blue-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-blue-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-blue-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'إجمالي الحجوزات' : 'Total Bookings' }}</p>
          <p class="text-4xl font-bold">{{ bookings.length }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-amber-500 to-amber-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-amber-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-amber-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-amber-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'قيد الانتظار' : 'Pending' }}</p>
          <p class="text-4xl font-bold">{{ bookings.filter(b => b.status === 'pending').length }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-green-500 to-green-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-green-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-green-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-green-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'مؤكدة' : 'Confirmed' }}</p>
          <p class="text-4xl font-bold">{{ bookings.filter(b => b.status === 'confirmed').length }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-purple-500 to-purple-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-purple-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-purple-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-purple-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'الإيرادات' : 'Revenue' }}</p>
          <p class="text-3xl font-bold">${{ totalRevenue.toLocaleString() }}</p>
        </div>
      </div>
    </div>

    <!-- Filters -->
    <div class="bg-white rounded-2xl p-6 shadow-lg border border-slate-200/50">
      <div class="flex flex-wrap items-center gap-4">
        <div class="flex-1 min-w-[250px]">
          <div class="relative">
            <input 
              v-model="searchQuery" 
              type="text" 
              :placeholder="isRTL ? 'بحث بالاسم أو الإيميل...' : 'Search by name or email...'" 
              class="w-full px-4 py-3 pl-12 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-all"
            />
            <span class="absolute left-4 top-1/2 -translate-y-1/2 text-xl">🔍</span>
          </div>
        </div>
        <select v-model="statusFilter" class="px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-all">
          <option value="">{{ isRTL ? 'كل الحالات' : 'All Status' }}</option>
          <option value="pending">{{ isRTL ? 'قيد الانتظار' : 'Pending' }}</option>
          <option value="confirmed">{{ isRTL ? 'مؤكدة' : 'Confirmed' }}</option>
          <option value="cancelled">{{ isRTL ? 'ملغاة' : 'Cancelled' }}</option>
          <option value="completed">{{ isRTL ? 'مكتملة' : 'Completed' }}</option>
        </select>
        <select v-model="typeFilter" class="px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-all">
          <option value="">{{ isRTL ? 'كل الأنواع' : 'All Types' }}</option>
          <option value="room">{{ isRTL ? 'غرفة' : 'Room' }}</option>
          <option value="event">{{ isRTL ? 'فعالية' : 'Event' }}</option>
          <option value="product">{{ isRTL ? 'منتج' : 'Product' }}</option>
        </select>
        <select v-model="itemsPerPage" @change="currentPage = 1" class="px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-all">
          <option :value="10">10 / {{ isRTL ? 'صفحة' : 'page' }}</option>
          <option :value="25">25 / {{ isRTL ? 'صفحة' : 'page' }}</option>
          <option :value="50">50 / {{ isRTL ? 'صفحة' : 'page' }}</option>
          <option :value="100">100 / {{ isRTL ? 'صفحة' : 'page' }}</option>
        </select>
      </div>
    </div>

    <!-- Bulk Actions Bar -->
    <div v-if="selectedBookings.length > 0" class="bg-amber-50 border border-amber-200 rounded-2xl p-4 shadow-lg">
      <div class="flex items-center justify-between">
        <div class="flex items-center gap-3">
          <span class="text-2xl">✓</span>
          <span class="font-semibold text-slate-900">{{ selectedBookings.length }} {{ isRTL ? 'محدد' : 'selected' }}</span>
        </div>
        <div class="flex items-center gap-2">
          <button @click="bulkExport" class="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors font-medium">
            📥 {{ isRTL ? 'تصدير' : 'Export' }}
          </button>
          <button @click="bulkDelete" class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 transition-colors font-medium">
            🗑️ {{ isRTL ? 'حذف' : 'Delete' }}
          </button>
          <button @click="selectedBookings = []" class="px-4 py-2 bg-slate-200 text-slate-700 rounded-lg hover:bg-slate-300 transition-colors font-medium">
            {{ isRTL ? 'إلغاء' : 'Cancel' }}
          </button>
        </div>
      </div>
    </div>

    <!-- Bookings Table -->
    <div class="bg-white rounded-2xl shadow-lg border border-slate-200/50 overflow-hidden">
      <div class="p-6 border-b border-slate-200">
        <div class="flex items-center justify-between">
          <div>
            <h2 class="text-2xl font-bold text-slate-900">{{ isRTL ? 'جميع الحجوزات' : 'All Bookings' }}</h2>
            <p class="text-sm text-slate-600 mt-1">
              {{ isRTL ? 'عرض' : 'Showing' }} {{ (currentPage - 1) * itemsPerPage + 1 }}-{{ Math.min(currentPage * itemsPerPage, sortedBookings.length) }} 
              {{ isRTL ? 'من' : 'of' }} {{ sortedBookings.length }} {{ isRTL ? 'حجز' : 'bookings' }}
            </p>
          </div>
          <div class="flex items-center gap-2">
            <button @click="exportAllBookings" class="px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600 transition-colors font-medium flex items-center gap-2">
              <span>📥</span>
              <span>{{ isRTL ? 'تصدير الكل' : 'Export All' }}</span>
            </button>
            <span class="text-2xl">📋</span>
          </div>
        </div>
      </div>
      
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-slate-50 border-b border-slate-200">
            <tr>
              <th class="px-6 py-4 text-left">
                <input type="checkbox" v-model="allSelected" class="w-5 h-5 text-amber-500 rounded focus:ring-2 focus:ring-amber-500" />
              </th>
              <th @click="sortBy('id')" class="px-6 py-4 text-left text-sm font-semibold text-slate-900 cursor-pointer hover:bg-slate-100 transition-colors">
                <div class="flex items-center gap-2">
                  <span>ID</span>
                  <span v-if="sortField === 'id'">{{ sortOrder === 'asc' ? '↑' : '↓' }}</span>
                </div>
              </th>
              <th @click="sortBy('guest_name')" class="px-6 py-4 text-left text-sm font-semibold text-slate-900 cursor-pointer hover:bg-slate-100 transition-colors">
                <div class="flex items-center gap-2">
                  <span>{{ isRTL ? 'معلومات الضيف' : 'Guest Info' }}</span>
                  <span v-if="sortField === 'guest_name'">{{ sortOrder === 'asc' ? '↑' : '↓' }}</span>
                </div>
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-slate-900">{{ isRTL ? 'النوع' : 'Type' }}</th>
              <th @click="sortBy('booking_date')" class="px-6 py-4 text-left text-sm font-semibold text-slate-900 cursor-pointer hover:bg-slate-100 transition-colors">
                <div class="flex items-center gap-2">
                  <span>{{ isRTL ? 'التاريخ' : 'Date' }}</span>
                  <span v-if="sortField === 'booking_date'">{{ sortOrder === 'asc' ? '↑' : '↓' }}</span>
                </div>
              </th>
              <th @click="sortBy('total_price')" class="px-6 py-4 text-left text-sm font-semibold text-slate-900 cursor-pointer hover:bg-slate-100 transition-colors">
                <div class="flex items-center gap-2">
                  <span>{{ isRTL ? 'السعر' : 'Price' }}</span>
                  <span v-if="sortField === 'total_price'">{{ sortOrder === 'asc' ? '↑' : '↓' }}</span>
                </div>
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-slate-900">{{ isRTL ? 'الحالة' : 'Status' }}</th>
              <th class="px-6 py-4 text-center text-sm font-semibold text-slate-900">{{ isRTL ? 'الإجراءات' : 'Actions' }}</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-slate-100">
            <tr v-if="loading">
              <td colspan="8" class="px-6 py-12 text-center">
                <div class="flex items-center justify-center gap-3">
                  <div class="w-6 h-6 border-3 border-amber-500 border-t-transparent rounded-full animate-spin"></div>
                  <span class="text-slate-600">{{ isRTL ? 'جاري التحميل...' : 'Loading...' }}</span>
                </div>
              </td>
            </tr>
            <tr v-else-if="paginatedBookings.length === 0">
              <td colspan="8" class="px-6 py-12 text-center text-slate-500">
                <div class="text-6xl mb-4">📋</div>
                {{ isRTL ? 'لا توجد حجوزات' : 'No bookings found' }}
              </td>
            </tr>
            <tr v-else v-for="booking in paginatedBookings" :key="booking.id" class="hover:bg-slate-50 transition-colors">
              <td class="px-6 py-4">
                <input type="checkbox" :value="booking.id" v-model="selectedBookings" class="w-5 h-5 text-amber-500 rounded focus:ring-2 focus:ring-amber-500" />
              </td>
              <td class="px-6 py-4">
                <span class="font-mono text-sm font-semibold text-slate-900">#{{ booking.id }}</span>
              </td>
              <td class="px-6 py-4">
                <div>
                  <p class="font-semibold text-slate-900">{{ booking.guest_name }}</p>
                  <p class="text-sm text-slate-600">{{ booking.guest_email }}</p>
                </div>
              </td>
              <td class="px-6 py-4">
                <span class="px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-sm font-medium">
                  {{ booking.booking_type }}
                </span>
              </td>
              <td class="px-6 py-4 text-slate-600">
                {{ formatDate(booking.booking_date) }}
              </td>
              <td class="px-6 py-4 font-semibold text-slate-900">
                ${{ booking.total_price }}
              </td>
              <td class="px-6 py-4">
                <span 
                  :class="{
                    'bg-amber-100 text-amber-700': booking.status === 'pending',
                    'bg-green-100 text-green-700': booking.status === 'confirmed',
                    'bg-red-100 text-red-700': booking.status === 'cancelled',
                    'bg-blue-100 text-blue-700': booking.status === 'completed'
                  }"
                  class="px-3 py-1 rounded-full text-sm font-medium"
                >
                  {{ booking.status }}
                </span>
              </td>
              <td class="px-6 py-4">
                <div class="flex items-center justify-center gap-2">
                  <button @click="viewBooking(booking)" class="p-2 text-blue-600 hover:bg-blue-50 rounded-lg transition-colors" title="View">
                    👁️
                  </button>
                  <button v-if="booking.status === 'pending'" @click="confirmBooking(booking)" class="p-2 text-green-600 hover:bg-green-50 rounded-lg transition-colors" title="Confirm">
                    ✅
                  </button>
                  <button v-if="booking.status !== 'cancelled'" @click="cancelBooking(booking)" class="p-2 text-red-600 hover:bg-red-50 rounded-lg transition-colors" title="Cancel">
                    ❌
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Pagination -->
      <div v-if="totalPages > 1" class="p-6 border-t border-slate-200">
        <div class="flex items-center justify-between">
          <button @click="currentPage--" :disabled="currentPage === 1" class="px-4 py-2 bg-slate-100 text-slate-700 rounded-lg hover:bg-slate-200 transition-colors font-medium disabled:opacity-50 disabled:cursor-not-allowed">
            {{ isRTL ? 'السابق' : 'Previous' }}
          </button>
          
          <div class="flex items-center gap-2">
            <button 
              v-for="page in visiblePages" 
              :key="page"
              @click="currentPage = page"
              :class="currentPage === page ? 'bg-amber-500 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'"
              class="w-10 h-10 rounded-lg font-semibold transition-colors"
            >
              {{ page }}
            </button>
          </div>
          
          <button @click="currentPage++" :disabled="currentPage === totalPages" class="px-4 py-2 bg-slate-100 text-slate-700 rounded-lg hover:bg-slate-200 transition-colors font-medium disabled:opacity-50 disabled:cursor-not-allowed">
            {{ isRTL ? 'التالي' : 'Next' }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import { bookingsApi } from '@/api'
import type { Booking } from '@/types'

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const bookings = ref<Booking[]>([])
const loading = ref(false)
const searchQuery = ref('')
const statusFilter = ref('')
const typeFilter = ref('')
const selectedBookings = ref<number[]>([])
const currentPage = ref(1)
const itemsPerPage = ref(25)
const sortField = ref('id')
const sortOrder = ref<'asc' | 'desc'>('desc')

const filteredBookings = computed(() => {
  return bookings.value.filter(booking => {
    const matchesSearch = !searchQuery.value || 
      booking.guest_name?.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
      booking.guest_email?.toLowerCase().includes(searchQuery.value.toLowerCase())
    
    const matchesStatus = !statusFilter.value || booking.status === statusFilter.value
    const matchesType = !typeFilter.value || booking.booking_type === typeFilter.value
    
    return matchesSearch && matchesStatus && matchesType
  })
})

const sortedBookings = computed(() => {
  const sorted = [...filteredBookings.value]
  sorted.sort((a, b) => {
    const aVal = a[sortField.value as keyof Booking]
    const bVal = b[sortField.value as keyof Booking]
    
    if (aVal < bVal) return sortOrder.value === 'asc' ? -1 : 1
    if (aVal > bVal) return sortOrder.value === 'asc' ? 1 : -1
    return 0
  })
  return sorted
})

const paginatedBookings = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage.value
  const end = start + itemsPerPage.value
  return sortedBookings.value.slice(start, end)
})

const totalPages = computed(() => {
  return Math.ceil(sortedBookings.value.length / itemsPerPage.value)
})

const allSelected = computed({
  get: () => paginatedBookings.value.length > 0 && paginatedBookings.value.every(b => selectedBookings.value.includes(b.id)),
  set: (value) => {
    if (value) {
      selectedBookings.value = paginatedBookings.value.map(b => b.id)
    } else {
      selectedBookings.value = []
    }
  }
})

const totalRevenue = computed(() => {
  return bookings.value.reduce((sum, b) => sum + (b.total_price || 0), 0)
})

const visiblePages = computed(() => {
  const pages = []
  const maxVisible = 5
  let start = Math.max(1, currentPage.value - Math.floor(maxVisible / 2))
  let end = Math.min(totalPages.value, start + maxVisible - 1)
  
  if (end - start < maxVisible - 1) {
    start = Math.max(1, end - maxVisible + 1)
  }
  
  for (let i = start; i <= end; i++) {
    pages.push(i)
  }
  return pages
})

function formatDate(date: string) {
  return new Date(date).toLocaleDateString('en-US', { 
    year: 'numeric', 
    month: 'short', 
    day: 'numeric' 
  })
}

function sortBy(field: string) {
  if (sortField.value === field) {
    sortOrder.value = sortOrder.value === 'asc' ? 'desc' : 'asc'
  } else {
    sortField.value = field
    sortOrder.value = 'asc'
  }
}

async function bulkDelete() {
  if (!confirm(isRTL.value ? `هل أنت متأكد من حذف ${selectedBookings.value.length} حجز؟` : `Delete ${selectedBookings.value.length} bookings?`)) return
  
  try {
    await Promise.all(selectedBookings.value.map(id => bookingsApi.delete(id)))
    toast.success(isRTL.value ? '✅ تم الحذف' : '✅ Deleted')
    selectedBookings.value = []
    loadBookings()
  } catch (error) {
    toast.error(isRTL.value ? '❌ فشل الحذف' : '❌ Failed to delete')
  }
}

function bulkExport() {
  const selected = bookings.value.filter(b => selectedBookings.value.includes(b.id))
  exportBookings(selected)
}

function exportAllBookings() {
  exportBookings(sortedBookings.value)
}

function exportBookings(data: Booking[]) {
  const csvData = [
    ['ID', 'Guest Name', 'Email', 'Type', 'Date', 'Price', 'Status'],
    ...data.map(b => [
      b.id,
      b.guest_name,
      b.guest_email,
      b.booking_type,
      b.booking_date,
      b.total_price,
      b.status
    ])
  ]
  
  const csv = csvData.map(row => row.join(',')).join('\n')
  const blob = new Blob([csv], { type: 'text/csv' })
  const url = window.URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = `bookings-${new Date().toISOString().split('T')[0]}.csv`
  a.click()
  window.URL.revokeObjectURL(url)
  
  toast.success(isRTL.value ? '✅ تم التصدير' : '✅ Exported')
}

async function loadBookings() {
  try {
    loading.value = true
    bookings.value = await bookingsApi.getAll()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل تحميل الحجوزات' : 'Failed to load bookings')
  } finally {
    loading.value = false
  }
}

function viewBooking(booking: Booking) {
  alert(`Booking #${booking.id}\nGuest: ${booking.guest_name}\nType: ${booking.booking_type}\nPrice: $${booking.total_price}`)
}

async function confirmBooking(booking: Booking) {
  try {
    await bookingsApi.update(booking.id, { status: 'confirmed' })
    toast.success(isRTL.value ? 'تم تأكيد الحجز' : 'Booking confirmed')
    loadBookings()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل التأكيد' : 'Failed to confirm')
  }
}

async function cancelBooking(booking: Booking) {
  if (!confirm(isRTL.value ? 'هل أنت متأكد من إلغاء الحجز؟' : 'Are you sure you want to cancel this booking?')) return
  
  try {
    await bookingsApi.update(booking.id, { status: 'cancelled' })
    toast.success(isRTL.value ? 'تم إلغاء الحجز' : 'Booking cancelled')
    loadBookings()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل الإلغاء' : 'Failed to cancel')
  }
}

onMounted(() => {
  loadBookings()
})
</script>
