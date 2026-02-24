<template>
  <div class="container mx-auto px-6 max-w-7xl py-12">
    <h1 class="text-4xl font-bold mb-8">{{ isRTL ? 'حسابي' : 'My Account' }}</h1>

    <!-- User Info -->
    <div class="card mb-8">
      <h2 class="text-2xl font-bold mb-4">{{ isRTL ? 'معلومات الحساب' : 'Account Information' }}</h2>
      <div class="space-y-2">
        <p><span class="font-semibold">{{ isRTL ? 'الاسم' : 'Name' }}:</span> {{ authStore.user?.full_name }}</p>
        <p><span class="font-semibold">{{ isRTL ? 'البريد' : 'Email' }}:</span> {{ authStore.user?.email }}</p>
        <p><span class="font-semibold">{{ isRTL ? 'الهاتف' : 'Phone' }}:</span> {{ authStore.user?.phone || 'N/A' }}</p>
        <p><span class="font-semibold">{{ isRTL ? 'الدور' : 'Role' }}:</span> {{ authStore.user?.role }}</p>
      </div>
    </div>

    <!-- Bookings -->
    <div class="card">
      <h2 class="text-2xl font-bold mb-4">{{ isRTL ? 'حجوزاتي' : 'My Bookings' }}</h2>

      <div v-if="loading" class="text-center py-8">
        <p>{{ t('common.loading') }}</p>
      </div>

      <div v-else-if="bookings.length === 0" class="text-center py-8 text-slate-500">
        <p>{{ isRTL ? 'لا توجد حجوزات' : 'No bookings yet' }}</p>
      </div>

      <div v-else class="space-y-4">
        <div v-for="booking in bookings" :key="booking.id" 
          class="border rounded-lg p-4 hover:shadow-md transition-shadow">
          <div class="flex justify-between items-start">
            <div>
              <p class="font-semibold text-lg">
                {{ isRTL ? 'حجز رقم' : 'Booking' }} #{{ booking.id }}
              </p>
              <p class="text-sm text-slate-600">
                {{ isRTL ? 'النوع' : 'Type' }}: {{ booking.booking_type }}
              </p>
              <p v-if="booking.check_in" class="text-sm text-slate-600">
                {{ formatDate(booking.check_in) }} - {{ formatDate(booking.check_out!) }}
              </p>
              <p v-else class="text-sm text-slate-600">
                {{ formatDate(booking.booking_date!) }}
              </p>
              <p class="text-sm text-slate-600">
                {{ isRTL ? 'الضيوف' : 'Guests' }}: {{ booking.guests }}
              </p>
            </div>
            <div class="text-right">
              <p class="text-xl font-bold text-slate-900">{{ formatPrice(Number(booking.total_price), currentLocale) }}</p>
              <span :class="getStatusClass(booking.status)" class="text-sm px-2 py-1 rounded">
                {{ booking.status }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAuthStore } from '@/stores/auth'
import { useAppStore } from '@/stores/app'
import { bookingsApi } from '@/api/bookings'
import { formatPrice } from '@/utils/currency'
import type { Booking } from '@/types'

const { t } = useI18n()
const authStore = useAuthStore()
const appStore = useAppStore()

const bookings = ref<Booking[]>([])
const loading = ref(true)
const isRTL = computed(() => appStore.isRTL)
const currentLocale = computed(() => appStore.currentLocale)

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
  return classes[status] || 'bg-slate-100 text-slate-800'
}

onMounted(() => {
  loadBookings()
})
</script>
