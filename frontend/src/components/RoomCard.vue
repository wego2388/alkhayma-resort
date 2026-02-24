<template>
  <div 
    class="group bg-white rounded-3xl overflow-hidden shadow-lg hover:shadow-luxury-lg transition-luxury cursor-pointer hover:-translate-y-2"
    @click="$emit('click')"
  >
    <!-- Image Container -->
    <div class="relative h-64 overflow-hidden">
      <img 
        v-if="room.image_url" 
        :src="room.image_url" 
        :alt="displayName"
        loading="lazy"
        decoding="async"
        width="400"
        height="256"
        class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
      />
      <!-- Gradient Overlay -->
      <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent"></div>
      
      <!-- Conversion Badges -->
      <div class="absolute top-4 left-4 right-4 flex flex-wrap gap-2">
        <!-- Most Booked by Couples -->
        <div v-if="room.name_en?.toLowerCase().includes('double') || room.name_en?.toLowerCase().includes('sea view')" 
          class="bg-pink-500/90 backdrop-blur-sm text-white px-3 py-1.5 rounded-full text-xs font-bold shadow-lg flex items-center gap-1.5">
          {{ isRTL ? 'الأكثر حجزاً للأزواج' : 'Most Booked by Couples' }}
        </div>
        
        <!-- Perfect for Honeymoon -->
        <div v-if="room.type === 'suite' || room.name_en?.toLowerCase().includes('sea view')" 
          class="bg-amber-500/90 backdrop-blur-sm text-white px-3 py-1.5 rounded-full text-xs font-bold shadow-lg flex items-center gap-1.5">
          {{ isRTL ? 'مثالي لشهر العسل' : 'Perfect for Honeymoon' }}
        </div>
        
        <!-- Family Favorite -->
        <div v-if="room.name_en?.toLowerCase().includes('family') || room.capacity >= 4" 
          class="bg-green-500/90 backdrop-blur-sm text-white px-3 py-1.5 rounded-full text-xs font-bold shadow-lg flex items-center gap-1.5">
          {{ isRTL ? 'مفضل للعائلات' : 'Family Favorite' }}
        </div>
      </div>

      <!-- Scarcity Badge -->
      <div v-if="showScarcity" class="absolute bottom-4 right-4">
        <div class="bg-red-500/90 backdrop-blur-sm text-white px-3 py-1.5 rounded-full text-xs font-semibold shadow-lg flex items-center gap-2">
          <span class="w-1.5 h-1.5 bg-white rounded-full animate-pulse"></span>
          {{ isRTL ? 'غرفتان فقط متبقيتان' : 'Only 2 Left' }}
        </div>
      </div>
    </div>
    
    <!-- Content -->
    <div class="p-8">
      <h3 class="font-display text-2xl font-bold mb-3 text-slate-900">{{ displayName }}</h3>
      <p class="text-slate-600 mb-6 line-clamp-2 leading-relaxed">{{ displayDescription }}</p>
      
      <!-- Details Grid -->
      <div class="flex justify-between items-center mb-6">
        <div class="flex items-center gap-2 text-slate-500">
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
          </svg>
          <span class="text-sm font-medium">{{ room.capacity }} {{ t('rooms.guests') }}</span>
        </div>
        
        <!-- Gold Stars Rating -->
        <div class="flex gap-1">
          <svg v-for="i in 5" :key="i" class="w-4 h-4 text-amber-400 fill-current" viewBox="0 0 20 20">
            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
          </svg>
        </div>
      </div>

      <!-- Amenities -->
      <div class="flex flex-wrap gap-2 mb-6">
        <span 
          v-for="amenity in room.amenities.slice(0, 3)" 
          :key="amenity"
          class="px-3 py-1.5 bg-slate-100 text-slate-700 text-xs font-medium rounded-full"
        >
          {{ amenity }}
        </span>
      </div>

      <!-- Price & CTA -->
      <div class="flex items-center justify-between pt-6 border-t border-slate-100">
        <div>
          <p class="text-sm text-slate-500 mb-1">{{ t('rooms.from') }}</p>
          <p class="font-display text-2xl font-bold text-slate-900">
            {{ formatPrice(Number(room.base_price), currentLocale) }}
          </p>
        </div>
        <button class="bg-gradient-to-r from-amber-500 to-amber-600 hover:from-amber-600 hover:to-amber-700 text-white px-6 py-3 rounded-full font-semibold transition-all duration-300 hover:shadow-lg">
          {{ t('rooms.bookNow') }}
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'
import { formatPrice } from '@/utils/currency'
import type { Room } from '@/types'

const props = withDefaults(defineProps<{ 
  room: Room
  showScarcity?: boolean
}>(), {
  showScarcity: false
})

defineEmits(['click'])

const { t } = useI18n()
const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)

const currentLocale = computed(() => appStore.currentLocale)
const displayName = computed(() => 
  appStore.isRTL ? props.room.name_ar : props.room.name
)

const displayDescription = computed(() => 
  appStore.isRTL ? props.room.description_ar : props.room.description
)
</script>
