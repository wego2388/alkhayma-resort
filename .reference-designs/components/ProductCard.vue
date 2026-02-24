<template>
  <div class="bg-white rounded-xl shadow-lg overflow-hidden group hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2">
    <!-- Product Image -->
    <div class="relative h-48 overflow-hidden">
      <img
        :src="product.image"
        :alt="product.name"
        class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
        @error="handleImageError"
      />
      
      <!-- Price Badge -->
      <div class="absolute top-4 right-4">
        <div class="bg-gradient-to-r from-purple-600 to-pink-600 text-white px-4 py-2 rounded-full font-bold shadow-lg">
          {{ formatPrice(product.price) }} ريال
        </div>
      </div>

      <!-- Category Badge -->
      <div class="absolute top-4 left-4">
        <span class="bg-blue-500 text-white px-3 py-1 rounded-full text-xs font-bold">
          {{ getCategoryLabel(product.category) }}
        </span>
      </div>
    </div>

    <!-- Product Info -->
    <div class="p-6">
      <!-- Rating -->
      <div class="flex items-center mb-3">
        <div class="flex items-center">
          <div class="flex">
            <i
              v-for="star in 5"
              :key="star"
              class="fas fa-star text-sm"
              :class="star <= product.rating ? 'text-yellow-400' : 'text-gray-300'"
            ></i>
          </div>
          <span class="text-sm text-gray-600 mr-2">{{ product.rating }}</span>
          <span class="text-xs text-gray-500">({{ product.reviews_count }} مراجعة)</span>
        </div>
      </div>

      <!-- Product Name -->
      <h3 class="text-xl font-bold text-gray-800 mb-2 group-hover:text-blue-600 transition-colors duration-300">
        {{ product.name }}
      </h3>
      
      <!-- Description -->
      <p class="text-gray-600 mb-4 line-clamp-2">
        {{ product.description }}
      </p>
      
      <!-- Price -->
      <div class="flex items-center justify-between mb-4">
        <div class="text-2xl font-bold text-blue-600">
          {{ product.price }} ريال
        </div>
      </div>
      
      <!-- Action Buttons -->
      <div class="flex gap-3">
        <button 
          @click="$emit('order', product)"
          :disabled="!product.available"
          class="flex-1 bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 disabled:from-gray-400 disabled:to-gray-500 text-white py-3 px-6 rounded-xl font-semibold transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl disabled:cursor-not-allowed"
        >
          <i class="fas fa-shopping-cart mr-2"></i>
          {{ product.available ? 'اطلب الآن' : 'غير متاح' }}
        </button>
        
        <button 
          @click="$emit('view', product)"
          class="bg-gray-100 hover:bg-gray-200 text-gray-700 py-3 px-4 rounded-xl transition-colors duration-300 flex items-center justify-center"
        >
          <i class="fas fa-eye"></i>
        </button>
      </div>
    </div>
    
    <!-- Hover Effect Overlay -->
    <div class="absolute inset-0 bg-gradient-to-t from-blue-600/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none"></div>
  </div>
</template>

<script setup lang="ts">
import type { Product } from '@/stores/products'

interface Props {
  product: Product
}

const props = defineProps<Props>()
const emit = defineEmits<{
  order: [product: Product]
  view: [product: Product]
}>()

const handleImageError = (event: Event) => {
  const target = event.target as HTMLImageElement
  target.src = '/images/placeholder-product.jpg'
}

const formatPrice = (price: number | string) => {
  const numPrice = typeof price === 'string' ? parseFloat(price) : price
  return numPrice || 0
}

const getCategoryLabel = (category: string) => {
  const labels: Record<string, string> = {
    'spa': 'السبا',
    'dining': 'المطاعم',
    'activities': 'الأنشطة',
    'services': 'الخدمات',
    'gifts': 'الهدايا',
    'RESTAURANT': 'مطعم',
    'WATER_ACTIVITY': 'نشاط مائي',
    'EVENT': 'فعالية',
    'BEACH': 'شاطئ'
  }
  return labels[category] || category
}
</script>
