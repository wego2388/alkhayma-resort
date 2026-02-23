<template>
  <div class="group bg-white rounded-3xl overflow-hidden shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2">
    <!-- Image Section -->
    <div class="relative h-64 overflow-hidden">
      <div class="absolute inset-0 bg-gradient-to-br from-blue-400 to-purple-600 opacity-90"></div>
      <img 
        v-if="room.images && room.images[0]" 
        :src="room.images[0]" 
        :alt="room.name"
        class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
      />
      
      <!-- Overlay Content -->
      <div class="absolute inset-0 bg-black/20 group-hover:bg-black/30 transition-colors duration-300"></div>
      
      <!-- Price Badge -->
      <div class="absolute bottom-4 left-4">
        <div class="bg-white/90 backdrop-blur-sm px-4 py-2 rounded-full">
          <span class="text-lg font-bold text-gray-800">{{ formatPrice(room.price_per_night || room.price) }} ريال</span>
          <span class="text-sm text-gray-600">/ليلة</span>
        </div>
      </div>
      
      <!-- Rating Badge -->
      <div class="absolute top-4 right-4">
        <div class="bg-yellow-400 text-yellow-900 px-3 py-1 rounded-full flex items-center">
          <i class="fas fa-star mr-1"></i>
          <span class="font-bold">{{ room.rating || 4.8 }}</span>
        </div>
      </div>
      
      <!-- Favorite Button -->
      <button 
        @click="$emit('favorite', room)"
        class="absolute top-4 left-4 w-10 h-10 bg-white/20 backdrop-blur-sm rounded-full flex items-center justify-center hover:bg-white/30 transition-colors duration-300"
      >
        <i :class="room.isFavorite ? 'fas fa-heart text-red-500' : 'far fa-heart text-white'" class="text-lg"></i>
      </button>
      
      <!-- Room Type Badge -->
      <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
        <div class="bg-white/90 backdrop-blur-sm px-6 py-3 rounded-full">
          <span class="text-lg font-bold text-gray-800">{{ getRoomTypeLabel(room.type) }}</span>
        </div>
      </div>
    </div>

    <!-- Content Section -->
    <div class="p-6">
      <!-- Room Name -->
      <h3 class="text-xl font-bold text-gray-800 mb-2 group-hover:text-blue-600 transition-colors duration-300">
        {{ room.name }}
      </h3>
      
      <!-- Description -->
      <p class="text-gray-600 mb-4 line-clamp-2">
        {{ room.description }}
      </p>
      
      <!-- Room Info -->
      <div class="flex items-center justify-between mb-4">
        <div class="flex items-center space-x-4 space-x-reverse">
          <div class="flex items-center text-gray-500">
            <i class="fas fa-users mr-2"></i>
            <span class="text-sm">{{ room.capacity }} ضيوف</span>
          </div>
          <div class="flex items-center text-gray-500">
            <i class="fas fa-expand-arrows-alt mr-2"></i>
            <span class="text-sm">{{ room.size }} م²</span>
          </div>
        </div>
        
        <div class="flex items-center text-gray-500">
          <i class="fas fa-comment-alt mr-2"></i>
          <span class="text-sm">{{ room.reviews }} مراجعة</span>
        </div>
      </div>
      
      <!-- Amenities -->
      <div class="mb-6">
        <div class="flex flex-wrap gap-2">
          <span 
            v-for="amenity in room.amenities.slice(0, 3)" 
            :key="amenity"
            class="bg-blue-50 text-blue-700 px-3 py-1 rounded-full text-xs font-medium"
          >
            {{ amenity }}
          </span>
          <span 
            v-if="room.amenities.length > 3"
            class="bg-gray-100 text-gray-600 px-3 py-1 rounded-full text-xs font-medium"
          >
            +{{ room.amenities.length - 3 }} المزيد
          </span>
        </div>
      </div>
      
      <!-- Action Buttons -->
      <div class="flex gap-3">
        <button 
          @click="$emit('book', room)"
          class="flex-1 bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white py-3 px-6 rounded-xl font-semibold transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl"
        >
          <i class="fas fa-calendar-check mr-2"></i>
          احجز الآن
        </button>
        
        <router-link 
          :to="`/rooms/${room.id}`"
          class="bg-gray-100 hover:bg-gray-200 text-gray-700 py-3 px-4 rounded-xl transition-colors duration-300 flex items-center justify-center"
        >
          <i class="fas fa-eye"></i>
        </router-link>
      </div>
    </div>
    
    <!-- Hover Effect Overlay -->
    <div class="absolute inset-0 bg-gradient-to-t from-blue-600/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none"></div>
  </div>
</template>

<script setup>
const props = defineProps({
  room: {
    type: Object,
    required: true
  }
})

const emit = defineEmits(['book', 'favorite'])

const formatPrice = (price) => {
  const numPrice = typeof price === 'string' ? parseFloat(price) : price
  return numPrice || 0
}

const getRoomTypeLabel = (type) => {
  const labels = {
    'deluxe': 'ديلوكس',
    'suite': 'جناح',
    'family': 'عائلية',
    'standard': 'قياسية',
    'DELUXE': 'ديلوكس',
    'SUITE': 'جناح',
    'STANDARD': 'قياسية',
    'VILLA': 'فيلا'
  }
  return labels[type] || type
}
</script>

