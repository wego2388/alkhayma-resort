<template>
  <div class="card hover:shadow-lg transition-shadow cursor-pointer" @click="$emit('click')">
    <img v-if="room.image_url" :src="room.image_url" :alt="displayName" 
      class="w-full h-48 object-cover rounded-t-lg mb-4" />
    
    <div class="p-4">
      <h3 class="text-xl font-bold mb-2">{{ displayName }}</h3>
      <p class="text-gray-600 mb-4 line-clamp-2">{{ displayDescription }}</p>
      
      <div class="flex justify-between items-center mb-4">
        <span class="text-sm text-gray-500">
          {{ t('rooms.capacity') }}: {{ room.capacity }}
        </span>
        <span class="text-lg font-bold text-primary-600">
          {{ formatPrice(Number(room.base_price), currentLocale) }}
        </span>
      </div>

      <div class="flex flex-wrap gap-2 mb-4">
        <span v-for="amenity in room.amenities.slice(0, 3)" :key="amenity"
          class="px-2 py-1 bg-gray-100 text-xs rounded">
          {{ amenity }}
        </span>
      </div>

      <button class="btn-primary w-full">
        {{ t('rooms.bookNow') }}
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'
import { formatPrice } from '@/utils/currency'
import type { Room } from '@/types'

const props = defineProps<{ room: Room }>()
defineEmits(['click'])

const { t } = useI18n()
const appStore = useAppStore()

const currentLocale = computed(() => appStore.currentLocale)
const displayName = computed(() => 
  appStore.isRTL ? props.room.name_ar : props.room.name
)

const displayDescription = computed(() => 
  appStore.isRTL ? props.room.description_ar : props.room.description
)
</script>
