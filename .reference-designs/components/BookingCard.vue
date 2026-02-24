<template>
  <div class="bg-white rounded-2xl shadow-xl overflow-hidden group hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2">
    <!-- Image Section -->
    <div class="relative h-64 overflow-hidden">
      <img
        :src="item.image || '/images/placeholder.jpg'"
        :alt="item.name"
        class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
        @error="handleImageError"
      />
      
      <!-- Overlay Gradient -->
      <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent"></div>
      
      <!-- Price Badge -->
      <div class="absolute top-4 right-4">
        <div class="bg-gradient-to-r from-blue-600 to-purple-600 text-white px-4 py-2 rounded-full font-bold shadow-lg">
          {{ formatPrice(item.price) }}
          <span v-if="type === 'room'" class="text-xs opacity-90">/ليلة</span>
        </div>
      </div>

      <!-- Rating Badge -->
      <div class="absolute top-4 left-4">
        <div class="bg-white/90 backdrop-blur-sm px-3 py-1 rounded-full flex items-center">
          <i class="fas fa-star text-yellow-400 text-sm mr-1"></i>
          <span class="text-sm font-semibold text-gray-800">{{ item.rating || 4.8 }}</span>
        </div>
      </div>

      <!-- Category/Type Badge -->
      <div class="absolute bottom-4 left-4">
        <div class="bg-white/20 backdrop-blur-sm text-white px-3 py-1 rounded-full text-sm font-medium">
          {{ getCategoryLabel() }}
        </div>
      </div>
    </div>

    <!-- Content Section -->
    <div class="p-6">
      <!-- Title -->
      <h3 class="text-xl font-bold text-gray-900 mb-3 group-hover:text-blue-600 transition-colors duration-300">
        {{ item.name }}
      </h3>
      
      <!-- Description -->
      <p class="text-gray-600 mb-4 line-clamp-2 leading-relaxed">
        {{ item.description }}
      </p>
      
      <!-- Features/Amenities -->
      <div class="mb-6">
        <div class="flex flex-wrap gap-2">
          <span 
            v-for="feature in getFeatures()" 
            :key="feature"
            class="bg-blue-50 text-blue-700 px-3 py-1 rounded-full text-xs font-medium"
          >
            {{ feature }}
          </span>
        </div>
      </div>

      <!-- Stats Row -->
      <div class="flex items-center justify-between mb-6 text-sm text-gray-500">
        <div v-if="type === 'room'" class="flex items-center">
          <i class="fas fa-users mr-1"></i>
          <span>{{ item.capacity || 2 }} ضيوف</span>
        </div>
        <div v-if="type === 'product'" class="flex items-center">
          <i class="fas fa-clock mr-1"></i>
          <span>{{ item.duration || '60' }} دقيقة</span>
        </div>
        <div class="flex items-center">
          <i class="fas fa-comment-alt mr-1"></i>
          <span>{{ item.reviews_count || item.reviews || 25 }} مراجعة</span>
        </div>
      </div>
      
      <!-- Action Buttons -->
      <div class="flex gap-3">
        <button 
          @click="handlePrimaryAction"
          class="flex-1 bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white py-3 px-6 rounded-xl font-semibold transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl"
        >
          <i :class="getPrimaryIcon()" class="mr-2"></i>
          {{ getPrimaryText() }}
        </button>
        
        <button 
          @click="handleSecondaryAction"
          class="bg-gray-100 hover:bg-gray-200 text-gray-700 py-3 px-4 rounded-xl transition-colors duration-300 flex items-center justify-center"
        >
          <i class="fas fa-eye"></i>
        </button>
      </div>
    </div>
    
    <!-- Hover Effect Overlay -->
    <div class="absolute inset-0 bg-gradient-to-t from-blue-600/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none"></div>
  </div>
</template>

<script setup lang="ts">
interface Props {
  item: any
  type: 'room' | 'product'
}

const props = defineProps<Props>()
const emit = defineEmits<{
  book: [item: any]
  order: [item: any]
  view: [item: any]
}>()

const handleImageError = (event: Event) => {
  const target = event.target as HTMLImageElement
  target.src = '/images/placeholder.jpg'
}

const getCategoryLabel = () => {
  if (props.type === 'room') {
    const labels: Record<string, string> = {
      'STANDARD': 'قياسية',
      'DELUXE': 'ديلوكس',
      'SUITE': 'جناح',
      'VILLA': 'فيلا'
    }
    return labels[props.item.room_type || props.item.type] || 'غرفة'
  } else {
    const labels: Record<string, string> = {
      'EVENT': 'فعالية',
      'RESTAURANT': 'مطعم',
      'WATER_ACTIVITY': 'نشاط مائي',
      'BEACH': 'شاطئ'
    }
    return labels[props.item.category || props.item.type] || 'منتج'
  }
}

const getFeatures = () => {
  const amenities = props.item.amenities || []
  if (typeof amenities === 'string') {
    try {
      return JSON.parse(amenities).slice(0, 3)
    } catch {
      return [amenities]
    }
  }
  return amenities.slice(0, 3)
}

const getPrimaryIcon = () => {
  return props.type === 'room' ? 'fas fa-calendar-check' : 'fas fa-shopping-cart'
}

const getPrimaryText = () => {
  return props.type === 'room' ? 'احجز الآن' : 'اطلب الآن'
}

const handlePrimaryAction = () => {
  if (props.type === 'room') {
    emit('book', props.item)
  } else {
    emit('order', props.item)
  }
}

const handleSecondaryAction = () => {
  emit('view', props.item)
}

const formatPrice = (price: number | string) => {
  const numPrice = typeof price === 'string' ? parseFloat(price) : price
  return `${numPrice} ريال`
}
</script>
