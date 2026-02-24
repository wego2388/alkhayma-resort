<template>
  <div class="min-h-screen bg-gradient-to-br from-gray-50 to-slate-100">
    <!-- Hero Section -->
    <section class="relative h-96 flex items-center justify-center overflow-hidden">
      <div class="absolute inset-0 bg-gradient-to-r from-slate-800 via-gray-800 to-zinc-800"></div>
      <div class="absolute inset-0 bg-black/40"></div>
      
      <!-- Floating Camera Elements -->
      <div class="absolute top-10 left-10 w-16 h-16 bg-white/10 rounded-full animate-float flex items-center justify-center">
        <i class="fas fa-camera text-white text-xl"></i>
      </div>
      <div class="absolute bottom-10 right-10 w-12 h-12 bg-slate-400/20 rounded-full animate-float-delay flex items-center justify-center">
        <i class="fas fa-image text-white"></i>
      </div>
      <div class="absolute top-1/3 right-1/4 w-14 h-14 bg-gray-400/20 rounded-full animate-float-slow flex items-center justify-center">
        <i class="fas fa-video text-white"></i>
      </div>
      
      <div class="relative z-10 text-center text-white px-4 max-w-4xl mx-auto">
        <h1 class="text-5xl md:text-6xl font-black mb-6 animate-fade-in-up">
          معرض الصور
        </h1>
        <div class="h-1 w-24 bg-gradient-to-r from-white to-gray-200 mx-auto mb-6 rounded-full"></div>
        <p class="text-xl md:text-2xl mb-8 animate-fade-in-up-delay">
          اكتشف جمال منتجعنا من خلال مجموعة مختارة من أجمل الصور
        </p>
      </div>
    </section>

    <!-- Filter Tabs -->
    <section class="py-8 bg-white shadow-lg sticky top-20 z-40">
      <div class="container mx-auto px-4">
        <div class="flex flex-wrap justify-center gap-4">
          <button
            v-for="category in categories"
            :key="category.id"
            @click="activeCategory = category.id"
            :class="activeCategory === category.id ? 'bg-gradient-to-r from-blue-600 to-purple-600 text-white shadow-lg' : 'bg-gray-100 text-gray-700 hover:bg-gray-200'"
            class="px-6 py-3 rounded-full font-semibold transition-all duration-300 transform hover:scale-105"
          >
            <i :class="category.icon" class="mr-2"></i>
            {{ category.name }}
            <span class="ml-2 bg-white/20 px-2 py-1 rounded-full text-xs">{{ category.count }}</span>
          </button>
        </div>
      </div>
    </section>

    <!-- Gallery Grid -->
    <section class="py-12">
      <div class="container mx-auto px-4">
        <!-- Masonry Grid -->
        <div class="columns-1 md:columns-2 lg:columns-3 xl:columns-4 gap-6 space-y-6">
          <div
            v-for="(image, index) in filteredImages"
            :key="image.id"
            @click="openLightbox(index)"
            class="group relative break-inside-avoid cursor-pointer overflow-hidden rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2"
          >
            <!-- Image -->
            <div class="relative overflow-hidden">
              <img
                :src="image.src"
                :alt="image.title"
                class="w-full h-auto object-cover group-hover:scale-110 transition-transform duration-700"
                loading="lazy"
              />
              
              <!-- Overlay -->
              <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
              
              <!-- Content Overlay -->
              <div class="absolute bottom-0 left-0 right-0 p-6 text-white transform translate-y-full group-hover:translate-y-0 transition-transform duration-300">
                <h3 class="text-lg font-bold mb-2">{{ image.title }}</h3>
                <p class="text-sm text-gray-200 mb-3">{{ image.description }}</p>
                <div class="flex items-center justify-between">
                  <span class="text-xs bg-white/20 px-3 py-1 rounded-full">{{ image.category }}</span>
                  <div class="flex items-center space-x-2">
                    <button class="w-8 h-8 bg-white/20 rounded-full flex items-center justify-center hover:bg-white/30 transition-colors">
                      <i class="fas fa-heart text-sm"></i>
                    </button>
                    <button class="w-8 h-8 bg-white/20 rounded-full flex items-center justify-center hover:bg-white/30 transition-colors">
                      <i class="fas fa-share text-sm"></i>
                    </button>
                  </div>
                </div>
              </div>
              
              <!-- Zoom Icon -->
              <div class="absolute top-4 right-4 w-10 h-10 bg-black/30 backdrop-blur-sm rounded-full flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                <i class="fas fa-search-plus text-white"></i>
              </div>
            </div>
          </div>
        </div>

        <!-- Load More Button -->
        <div class="text-center mt-12" v-if="hasMoreImages">
          <button
            @click="loadMoreImages"
            :disabled="loading"
            class="bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 disabled:from-gray-400 disabled:to-gray-500 text-white px-8 py-4 rounded-full font-bold text-lg transition-all duration-300 transform hover:scale-105 disabled:scale-100 shadow-xl"
          >
            <i v-if="loading" class="fas fa-spinner fa-spin mr-3"></i>
            <i v-else class="fas fa-images mr-3"></i>
            {{ loading ? 'جاري التحميل...' : 'عرض المزيد' }}
          </button>
        </div>
      </div>
    </section>

    <!-- Lightbox Modal -->
    <div
      v-if="lightboxOpen"
      class="fixed inset-0 bg-black/90 flex items-center justify-center z-50 p-4"
      @click="closeLightbox"
    >
      <div class="relative max-w-6xl max-h-full" @click.stop>
        <!-- Close Button -->
        <button
          @click="closeLightbox"
          class="absolute -top-12 right-0 text-white hover:text-gray-300 transition-colors z-10"
        >
          <i class="fas fa-times text-2xl"></i>
        </button>
        
        <!-- Navigation Buttons -->
        <button
          v-if="currentImageIndex > 0"
          @click="previousImage"
          class="absolute left-4 top-1/2 transform -translate-y-1/2 text-white hover:text-gray-300 transition-colors z-10"
        >
          <i class="fas fa-chevron-left text-3xl"></i>
        </button>
        
        <button
          v-if="currentImageIndex < filteredImages.length - 1"
          @click="nextImage"
          class="absolute right-4 top-1/2 transform -translate-y-1/2 text-white hover:text-gray-300 transition-colors z-10"
        >
          <i class="fas fa-chevron-right text-3xl"></i>
        </button>
        
        <!-- Image -->
        <img
          :src="filteredImages[currentImageIndex]?.src"
          :alt="filteredImages[currentImageIndex]?.title"
          class="max-w-full max-h-full object-contain rounded-lg shadow-2xl"
        />
        
        <!-- Image Info -->
        <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/80 to-transparent text-white p-6 rounded-b-lg">
          <h3 class="text-xl font-bold mb-2">{{ filteredImages[currentImageIndex]?.title }}</h3>
          <p class="text-gray-200 mb-3">{{ filteredImages[currentImageIndex]?.description }}</p>
          <div class="flex items-center justify-between">
            <span class="text-sm bg-white/20 px-3 py-1 rounded-full">
              {{ filteredImages[currentImageIndex]?.category }}
            </span>
            <div class="text-sm text-gray-300">
              {{ currentImageIndex + 1 }} من {{ filteredImages.length }}
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Stats Section -->
    <section class="py-16 bg-gradient-to-r from-blue-600 via-purple-600 to-teal-600">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center text-white">
          <div class="animate-fade-in-up">
            <div class="text-4xl font-black mb-2">500+</div>
            <div class="text-lg opacity-90">صورة فوتوغرافية</div>
          </div>
          <div class="animate-fade-in-up-delay">
            <div class="text-4xl font-black mb-2">50+</div>
            <div class="text-lg opacity-90">فيديو عالي الجودة</div>
          </div>
          <div class="animate-fade-in-up-delay-2">
            <div class="text-4xl font-black mb-2">25+</div>
            <div class="text-lg opacity-90">جولة افتراضية</div>
          </div>
          <div class="animate-fade-in-up-delay-3">
            <div class="text-4xl font-black mb-2">10K+</div>
            <div class="text-lg opacity-90">مشاهدة شهرياً</div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'

// Reactive data
const activeCategory = ref('all')
const lightboxOpen = ref(false)
const currentImageIndex = ref(0)
const loading = ref(false)
const hasMoreImages = ref(true)

// Categories
const categories = ref([
  { id: 'all', name: 'الكل', icon: 'fas fa-images', count: 48 },
  { id: 'rooms', name: 'الغرف', icon: 'fas fa-bed', count: 12 },
  { id: 'restaurant', name: 'المطعم', icon: 'fas fa-utensils', count: 8 },
  { id: 'beach', name: 'الشاطئ', icon: 'fas fa-umbrella-beach', count: 15 },
  { id: 'activities', name: 'الأنشطة', icon: 'fas fa-swimmer', count: 10 },
  { id: 'facilities', name: 'المرافق', icon: 'fas fa-building', count: 3 }
])

// Sample images data
const images = ref([
  {
    id: 1,
    src: 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
    title: 'غرفة ديلوكس بإطلالة بحرية',
    description: 'غرفة فاخرة مع إطلالة خلابة على البحر الأحمر',
    category: 'rooms'
  },
  {
    id: 2,
    src: 'https://images.unsplash.com/photo-1544148103-0773bf10d330?w=600',
    title: 'شاطئ المنتجع الخاص',
    description: 'شاطئ رملي ذهبي مع مياه صافية',
    category: 'beach'
  },
  {
    id: 3,
    src: 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
    title: 'المطعم الرئيسي',
    description: 'تجربة طعام فاخرة مع إطلالة بانورامية',
    category: 'restaurant'
  },
  {
    id: 4,
    src: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=700',
    title: 'حمام السباحة اللامتناهي',
    description: 'مسبح بإطلالة خلابة على الأفق',
    category: 'facilities'
  },
  {
    id: 5,
    src: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=500',
    title: 'الغوص في الشعاب المرجانية',
    description: 'استكشف عالم البحر الأحمر الساحر',
    category: 'activities'
  },
  {
    id: 6,
    src: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600',
    title: 'جناح رئاسي',
    description: 'أقصى درجات الفخامة والراحة',
    category: 'rooms'
  },
  // Add more images...
])

// Computed properties
const filteredImages = computed(() => {
  if (activeCategory.value === 'all') {
    return images.value
  }
  return images.value.filter(image => image.category === activeCategory.value)
})

// Methods
const openLightbox = (index) => {
  currentImageIndex.value = index
  lightboxOpen.value = true
  document.body.style.overflow = 'hidden'
}

const closeLightbox = () => {
  lightboxOpen.value = false
  document.body.style.overflow = 'auto'
}

const nextImage = () => {
  if (currentImageIndex.value < filteredImages.value.length - 1) {
    currentImageIndex.value++
  }
}

const previousImage = () => {
  if (currentImageIndex.value > 0) {
    currentImageIndex.value--
  }
}

const loadMoreImages = () => {
  loading.value = true
  // Simulate API call
  setTimeout(() => {
    // Add more images here
    loading.value = false
    hasMoreImages.value = false // Set to false when no more images
  }, 1000)
}

// Keyboard navigation
const handleKeydown = (event) => {
  if (!lightboxOpen.value) return
  
  switch (event.key) {
    case 'Escape':
      closeLightbox()
      break
    case 'ArrowLeft':
      previousImage()
      break
    case 'ArrowRight':
      nextImage()
      break
  }
}

onMounted(() => {
  document.addEventListener('keydown', handleKeydown)
})
</script>

