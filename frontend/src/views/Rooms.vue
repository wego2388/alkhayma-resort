<template>
  <div class="min-h-screen bg-gradient-to-br from-slate-50 to-blue-50">
    <!-- Hero Section -->
    <section class="relative py-24 bg-gradient-to-br from-slate-900 via-blue-900 to-slate-800 text-white">
      <div class="container mx-auto px-6 max-w-7xl text-center">
        <h1 class="font-display text-6xl md:text-7xl font-bold mb-6">{{ t('rooms.title') }}</h1>
        <div class="h-0.5 w-20 bg-gradient-to-r from-transparent via-amber-400 to-transparent mx-auto mb-6"></div>
        <p class="text-xl text-white/80 max-w-3xl mx-auto leading-relaxed">
          {{ isRTL ? 'اختر من بين مجموعة واسعة من الغرف الفاخرة المصممة لراحتك' : 'Choose from our wide selection of luxury rooms designed for your comfort' }}
        </p>
      </div>
    </section>

    <!-- Filters -->
    <section class="py-12 bg-white shadow-lg sticky top-20 z-30">
      <div class="container mx-auto px-6 max-w-7xl">
        <div class="flex flex-col md:flex-row gap-6 items-center justify-between">
          <!-- Type Filter -->
          <div class="relative w-full md:w-auto">
            <select 
              v-model="selectedType" 
              class="w-full md:min-w-[240px] px-6 py-4 rounded-xl border-2 border-slate-200 focus:border-amber-500 focus:ring-4 focus:ring-amber-100 transition-all outline-none bg-white font-medium appearance-none cursor-pointer"
            >
              <option value="">{{ isRTL ? '🏨 جميع الأنواع' : '🏨 All Types' }}</option>
              <option value="standard">{{ isRTL ? '⭐ قياسي' : '⭐ Standard' }}</option>
              <option value="deluxe">{{ isRTL ? '⭐⭐ ديلوكس' : '⭐⭐ Deluxe' }}</option>
              <option value="suite">{{ isRTL ? '⭐⭐⭐ جناح' : '⭐⭐⭐ Suite' }}</option>
              <option value="presidential">{{ isRTL ? '⭐⭐⭐⭐ رئاسي' : '⭐⭐⭐⭐ Presidential' }}</option>
            </select>
            <div class="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none">
              <svg class="w-5 h-5 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </div>
          </div>

          <!-- Results Count -->
          <div class="flex items-center gap-3 px-6 py-4 bg-slate-50 rounded-xl">
            <div class="w-2 h-2 bg-amber-500 rounded-full animate-pulse"></div>
            <p class="text-slate-700 font-semibold">
              {{ filteredRooms.length }} {{ isRTL ? 'غرفة متاحة' : 'rooms available' }}
            </p>
          </div>

          <!-- Sort (Optional) -->
          <button 
            class="px-6 py-4 bg-gradient-to-r from-amber-500 to-amber-600 hover:from-amber-600 hover:to-amber-700 text-white rounded-xl font-semibold transition-all duration-400 hover:scale-105 shadow-lg hover:shadow-amber-500/50"
          >
            {{ isRTL ? '🔍 بحث متقدم' : '🔍 Advanced Search' }}
          </button>
        </div>
      </div>
    </section>

    <!-- Rooms Grid -->
    <section class="py-24">
      <div class="container mx-auto px-6 max-w-7xl">
        <!-- Loading -->
        <div v-if="loading" class="text-center py-20">
          <div class="inline-block animate-spin rounded-full h-16 w-16 border-4 border-amber-500 border-t-transparent"></div>
          <p class="text-xl text-slate-600 mt-6">{{ t('common.loading') }}</p>
        </div>

        <!-- Grid -->
        <div v-else-if="filteredRooms.length > 0" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <RoomCard 
            v-for="room in filteredRooms" 
            :key="room.id" 
            :room="room"
            @click="goToRoom(room.id)"
          />
        </div>

        <!-- Empty State -->
        <div v-else class="text-center py-20">
          <div class="text-6xl mb-6">🏨</div>
          <p class="text-2xl font-display font-bold text-slate-900 mb-4">{{ isRTL ? 'لا توجد غرف متاحة' : 'No rooms available' }}</p>
          <p class="text-slate-600">{{ isRTL ? 'جرب تغيير الفلتر' : 'Try changing the filter' }}</p>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'
import { roomsApi } from '@/api/rooms'
import RoomCard from '@/components/RoomCard.vue'
import type { Room } from '@/types'

const { t } = useI18n()
const router = useRouter()
const appStore = useAppStore()

const rooms = ref<Room[]>([])
const loading = ref(true)
const selectedType = ref('')
const isRTL = computed(() => appStore.isRTL)

const filteredRooms = computed(() => {
  if (!selectedType.value) return rooms.value
  return rooms.value.filter(r => r.type === selectedType.value)
})

async function loadRooms() {
  try {
    rooms.value = await roomsApi.getAll({ is_active: true })
  } catch (error) {
    console.error('Failed to load rooms:', error)
  } finally {
    loading.value = false
  }
}

function goToRoom(id: number) {
  router.push(`/rooms/${id}`)
}

onMounted(() => {
  loadRooms()
})
</script>
