<template>
  <div class="card hover:shadow-lg transition-shadow">
    <img v-if="product.image_url" :src="product.image_url" :alt="displayName" 
      class="w-full h-48 object-cover rounded-t-lg mb-4" />
    
    <div class="p-4">
      <h3 class="text-xl font-bold mb-2">{{ displayName }}</h3>
      <p class="text-gray-600 mb-4 line-clamp-2">{{ displayDescription }}</p>
      
      <div class="flex justify-between items-center mb-4">
        <span v-if="product.duration" class="text-sm text-gray-500">
          {{ product.duration }} {{ isRTL ? 'دقيقة' : 'min' }}
        </span>
        <span class="text-lg font-bold text-primary-600">
          {{ formatPrice(Number(product.price), currentLocale) }}
        </span>
      </div>

      <button @click="$emit('book')" class="btn-primary w-full">
        {{ isRTL ? 'احجز الآن' : 'Book Now' }}
      </button>
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
</script>
