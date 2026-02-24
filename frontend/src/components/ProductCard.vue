<template>
  <div class="group bg-white rounded-3xl overflow-hidden shadow-lg hover:shadow-luxury-lg transition-luxury hover:-translate-y-2">
    <!-- Image Container -->
    <div class="relative h-64 overflow-hidden">
      <img 
        v-if="product.image_url" 
        :src="product.image_url" 
        :alt="displayName"
        loading="lazy"
        decoding="async"
        width="400"
        height="256"
        class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
      />
      <!-- Gradient Overlay -->
      <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent"></div>
      
      <!-- Category Badge -->
      <div class="absolute top-4 left-4 bg-white/90 backdrop-blur-sm text-slate-900 px-4 py-2 rounded-full text-sm font-semibold shadow-lg">
        {{ getCategoryIcon(product.category) }} {{ getCategoryName(product.category) }}
      </div>
    </div>
    
    <!-- Content -->
    <div class="p-8">
      <h3 class="font-display text-2xl font-bold mb-3 text-slate-900">{{ displayName }}</h3>
      <p class="text-slate-600 mb-6 line-clamp-2 leading-relaxed">{{ displayDescription }}</p>
      
      <!-- Details -->
      <div class="flex items-center gap-4 mb-6">
        <div v-if="product.duration" class="flex items-center gap-2 text-slate-500">
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
          </svg>
          <span class="text-sm font-medium">{{ product.duration }} {{ isRTL ? 'دقيقة' : 'min' }}</span>
        </div>
        
        <!-- Gold Stars Rating -->
        <div class="flex gap-1">
          <svg v-for="i in 5" :key="i" class="w-4 h-4 text-amber-400 fill-current" viewBox="0 0 20 20">
            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
          </svg>
        </div>
      </div>

      <!-- Price & CTA -->
      <div class="flex items-center justify-between pt-6 border-t border-slate-100">
        <div>
          <p class="text-sm text-slate-500 mb-1">{{ isRTL ? 'السعر' : 'Price' }}</p>
          <p class="font-display text-2xl font-bold text-slate-900">
            {{ formatPrice(Number(product.price), currentLocale) }}
          </p>
        </div>
        <button 
          @click="$emit('book')" 
          class="bg-gradient-to-r from-amber-500 to-amber-600 hover:from-amber-600 hover:to-amber-700 text-white px-6 py-3 rounded-full font-semibold transition-all duration-300 hover:shadow-lg"
        >
          {{ isRTL ? 'احجز الآن' : 'Book Now' }}
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useAppStore } from '@/stores/app'
import { formatPrice } from '@/utils/currency'
import type { Product } from '@/types'

const props = defineProps<{ product: Product }>()
defineEmits(['book'])

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)
const currentLocale = computed(() => appStore.currentLocale)

const displayName = computed(() => 
  isRTL.value ? props.product.name_ar : props.product.name
)

const displayDescription = computed(() => 
  isRTL.value ? props.product.description_ar : props.product.description
)

function getCategoryIcon(category: string): string {
  const icons: Record<string, string> = {
    'restaurant': '🍽️',
    'cafe': '☕',
    'beach': '🏖️',
    'water_sports': '🏄',
    'activities': '🎯'
  }
  return icons[category] || '✨'
}

function getCategoryName(category: string): string {
  if (isRTL.value) {
    const names: Record<string, string> = {
      'restaurant': 'مطعم',
      'cafe': 'مقهى',
      'beach': 'شاطئ',
      'water_sports': 'رياضات مائية',
      'activities': 'أنشطة'
    }
    return names[category] || category
  }
  
  const names: Record<string, string> = {
    'restaurant': 'Restaurant',
    'cafe': 'Café',
    'beach': 'Beach',
    'water_sports': 'Water Sports',
    'activities': 'Activities'
  }
  return names[category] || category
}
</script>
