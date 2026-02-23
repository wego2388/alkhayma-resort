<template>
  <div class="container mx-auto px-4 py-12">
    <h1 class="text-4xl font-bold mb-8">{{ t('rooms.title') }}</h1>

    <!-- Filters -->
    <div class="mb-8 flex gap-4">
      <select v-model="selectedType" class="input">
        <option value="">{{ isRTL ? 'جميع الأنواع' : 'All Types' }}</option>
        <option value="standard">Standard</option>
        <option value="deluxe">Deluxe</option>
        <option value="suite">Suite</option>
        <option value="presidential">Presidential</option>
      </select>
    </div>

    <!-- Loading -->
    <div v-if="loading" class="text-center py-12">
      <p class="text-xl">{{ t('common.loading') }}</p>
    </div>

    <!-- Rooms Grid -->
    <div v-else class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <RoomCard 
        v-for="room in filteredRooms" 
        :key="room.id" 
        :room="room"
        @click="goToRoom(room.id)"
      />
    </div>

    <!-- Empty State -->
    <div v-if="!loading && filteredRooms.length === 0" class="text-center py-12">
      <p class="text-xl text-gray-500">{{ isRTL ? 'لا توجد غرف متاحة' : 'No rooms available' }}</p>
    </div>
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
