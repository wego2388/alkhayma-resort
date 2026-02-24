<template>
  <div class="min-h-screen bg-gradient-to-br from-slate-50 to-blue-50">
    <!-- Hero Section -->
    <section class="relative h-[70vh] flex items-center justify-center overflow-hidden">
      <div 
        class="absolute inset-0 bg-cover bg-center"
        style="background-image: url('https://images.unsplash.com/photo-1492684223066-81342ee5ff30?q=80&w=2070')"
      ></div>
      <div class="absolute inset-0 bg-gradient-to-b from-black/70 via-black/50 to-black/70"></div>
      
      <div class="relative z-10 text-center text-white px-6 max-w-5xl mx-auto">
        <p class="text-sm tracking-[0.3em] uppercase text-amber-400 mb-4 animate-fade-in-up">
          {{ isRTL ? 'معرض الصور' : 'Photo Gallery' }}
        </p>
        <h1 class="font-display text-6xl md:text-8xl font-bold mb-6 animate-fade-in-up" style="animation-delay: 0.2s">
          {{ isRTL ? 'معرض الصور' : 'Gallery' }}
        </h1>
        <div class="flex items-center justify-center gap-4 mb-6 animate-fade-in-up" style="animation-delay: 0.4s">
          <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
          <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
          <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
        </div>
        <p class="text-xl md:text-2xl text-white/90 max-w-3xl mx-auto leading-relaxed animate-fade-in-up" style="animation-delay: 0.6s">
          {{ isRTL ? 'اكتشف جمال منتجعنا من خلال مجموعة مختارة من أجمل الصور' : 'Discover the beauty of our resort through our curated photo collection' }}
        </p>
      </div>
    </section>

    <!-- Filter Tabs -->
    <section class="py-12 bg-white shadow-sm sticky top-20 z-40">
      <div class="container mx-auto px-6 max-w-7xl">
        <div class="flex flex-wrap justify-center gap-4">
          <button
            v-for="category in categories"
            :key="category.id"
            @click="activeCategory = category.id"
            :class="activeCategory === category.id ? 'bg-gradient-to-r from-amber-500 to-amber-600 text-white shadow-lg scale-105' : 'bg-white text-slate-700 hover:bg-slate-50 border-2 border-slate-200 hover:border-amber-300'"
            class="px-8 py-4 rounded-2xl font-semibold transition-all duration-300 transform hover:scale-105"
          >
            {{ isRTL ? category.nameAr : category.name }}
            <span class="ml-2 px-2 py-1 rounded-full text-xs" :class="activeCategory === category.id ? 'bg-white/20' : 'bg-slate-100'">{{ category.count }}</span>
          </button>
        </div>
      </div>
    </section>

    <!-- Gallery Grid -->
    <section class="py-24">
      <div class="container mx-auto px-6 max-w-7xl">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div
            v-for="(image, index) in filteredImages"
            :key="image.id"
            @click="openLightbox(index)"
            class="group relative cursor-pointer overflow-hidden rounded-3xl shadow-lg hover:shadow-luxury-lg transition-all duration-500 transform hover:-translate-y-2"
          >
            <div class="relative overflow-hidden h-80">
              <img
                :src="image.src"
                :alt="image.title"
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                loading="lazy"
              />
              
              <div class="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
              
              <div class="absolute bottom-0 left-0 right-0 p-6 text-white transform translate-y-full group-hover:translate-y-0 transition-transform duration-300">
                <h3 class="text-lg font-bold mb-2">{{ isRTL ? image.titleAr : image.title }}</h3>
                <p class="text-sm text-slate-200">{{ isRTL ? image.descriptionAr : image.description }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Lightbox -->
    <Transition name="fade">
      <div v-if="lightboxOpen" @click="closeLightbox" class="fixed inset-0 bg-black/95 z-50 flex items-center justify-center p-4">
        <button @click="closeLightbox" class="absolute top-4 right-4 text-white text-4xl hover:text-slate-300 z-10">×</button>
        
        <button @click.stop="prevImage" class="absolute left-4 text-white text-4xl hover:text-slate-300 z-10">‹</button>
        <button @click.stop="nextImage" class="absolute right-4 text-white text-4xl hover:text-slate-300 z-10">›</button>
        
        <div @click.stop class="max-w-6xl w-full">
          <img :src="currentImage.src" :alt="currentImage.title" class="w-full h-auto rounded-lg shadow-2xl" />
          <div class="text-white text-center mt-4">
            <h3 class="text-2xl font-bold mb-2">{{ isRTL ? currentImage.titleAr : currentImage.title }}</h3>
            <p class="text-slate-300">{{ isRTL ? currentImage.descriptionAr : currentImage.description }}</p>
          </div>
        </div>
      </div>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useAppStore } from '@/stores/app'

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)

const activeCategory = ref('all')
const lightboxOpen = ref(false)
const currentImageIndex = ref(0)

const categories = [
  { id: 'all', name: 'All', nameAr: 'الكل', icon: '🌟', count: 24 },
  { id: 'rooms', name: 'Rooms', nameAr: 'الغرف', icon: '🏨', count: 8 },
  { id: 'beach', name: 'Beach', nameAr: 'الشاطئ', icon: '🏖️', count: 6 },
  { id: 'restaurant', name: 'Restaurant', nameAr: 'المطعم', icon: '🍽️', count: 5 },
  { id: 'activities', name: 'Activities', nameAr: 'الأنشطة', icon: '🏄', count: 5 }
]

const images = [
  // Rooms
  { id: 1, category: 'rooms', src: 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800', title: 'Deluxe Room', titleAr: 'غرفة ديلوكس', description: 'Spacious luxury room', descriptionAr: 'غرفة فاخرة واسعة' },
  { id: 2, category: 'rooms', src: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800', title: 'Suite View', titleAr: 'إطلالة الجناح', description: 'Ocean view suite', descriptionAr: 'جناح بإطلالة بحرية' },
  { id: 3, category: 'rooms', src: 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800', title: 'Family Room', titleAr: 'غرفة عائلية', description: 'Perfect for families', descriptionAr: 'مثالية للعائلات' },
  { id: 4, category: 'rooms', src: 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800', title: 'Presidential Suite', titleAr: 'الجناح الرئاسي', description: 'Ultimate luxury', descriptionAr: 'الفخامة المطلقة' },
  { id: 5, category: 'rooms', src: 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800', title: 'Honeymoon Suite', titleAr: 'جناح شهر العسل', description: 'Romantic getaway', descriptionAr: 'رومانسية خاصة' },
  { id: 6, category: 'rooms', src: 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=800', title: 'Standard Room', titleAr: 'غرفة قياسية', description: 'Comfortable stay', descriptionAr: 'إقامة مريحة' },
  { id: 7, category: 'rooms', src: 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?w=800', title: 'Twin Room', titleAr: 'غرفة مزدوجة', description: 'Two beds', descriptionAr: 'سريرين منفصلين' },
  { id: 8, category: 'rooms', src: 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800', title: 'King Room', titleAr: 'غرفة كينج', description: 'King size bed', descriptionAr: 'سرير كينج سايز' },
  
  // Beach
  { id: 9, category: 'beach', src: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800', title: 'Beach View', titleAr: 'إطلالة الشاطئ', description: 'Crystal clear water', descriptionAr: 'مياه صافية' },
  { id: 10, category: 'beach', src: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800', title: 'Sunset Beach', titleAr: 'شاطئ الغروب', description: 'Beautiful sunset', descriptionAr: 'غروب جميل' },
  { id: 11, category: 'beach', src: 'https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?w=800', title: 'Beach Chairs', titleAr: 'كراسي الشاطئ', description: 'Relax by the sea', descriptionAr: 'استرخِ بجانب البحر' },
  { id: 12, category: 'beach', src: 'https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?w=800', title: 'Private Beach', titleAr: 'شاطئ خاص', description: 'Exclusive access', descriptionAr: 'وصول حصري' },
  { id: 13, category: 'beach', src: 'https://images.unsplash.com/photo-1471922694854-ff1b63b20054?w=800', title: 'Beach Activities', titleAr: 'أنشطة الشاطئ', description: 'Fun in the sun', descriptionAr: 'متعة تحت الشمس' },
  { id: 14, category: 'beach', src: 'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=800', title: 'Beach Paradise', titleAr: 'جنة الشاطئ', description: 'Tropical paradise', descriptionAr: 'جنة استوائية' },
  
  // Restaurant
  { id: 15, category: 'restaurant', src: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800', title: 'Fine Dining', titleAr: 'مطعم فاخر', description: 'Gourmet cuisine', descriptionAr: 'مأكولات راقية' },
  { id: 16, category: 'restaurant', src: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=800', title: 'Seafood Special', titleAr: 'مأكولات بحرية', description: 'Fresh catch', descriptionAr: 'طازج من البحر' },
  { id: 17, category: 'restaurant', src: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800', title: 'Restaurant View', titleAr: 'إطلالة المطعم', description: 'Dining with a view', descriptionAr: 'طعام مع إطلالة' },
  { id: 18, category: 'restaurant', src: 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=800', title: 'Breakfast Buffet', titleAr: 'بوفيه الإفطار', description: 'Start your day right', descriptionAr: 'ابدأ يومك بشكل صحيح' },
  { id: 19, category: 'restaurant', src: 'https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c?w=800', title: 'Cafe Corner', titleAr: 'ركن الكافيه', description: 'Coffee & desserts', descriptionAr: 'قهوة وحلويات' },
  
  // Activities
  { id: 20, category: 'activities', src: 'https://images.unsplash.com/photo-1530870110042-98b2cb110834?w=800', title: 'Water Sports', titleAr: 'رياضات مائية', description: 'Jet ski & more', descriptionAr: 'جت سكي والمزيد' },
  { id: 21, category: 'activities', src: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800', title: 'Diving', titleAr: 'الغطس', description: 'Explore underwater', descriptionAr: 'استكشف تحت الماء' },
  { id: 22, category: 'activities', src: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=800', title: 'Yoga Session', titleAr: 'جلسة يوغا', description: 'Beach yoga', descriptionAr: 'يوغا على الشاطئ' },
  { id: 23, category: 'activities', src: 'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=800', title: 'Pool Party', titleAr: 'حفلة المسبح', description: 'Fun by the pool', descriptionAr: 'متعة بجانب المسبح' },
  { id: 24, category: 'activities', src: 'https://images.unsplash.com/photo-1483683804023-6ccdb62f86ef?w=800', title: 'Sunset Cruise', titleAr: 'رحلة الغروب', description: 'Boat tour', descriptionAr: 'جولة بالقارب' }
]

const filteredImages = computed(() => {
  if (activeCategory.value === 'all') return images
  return images.filter(img => img.category === activeCategory.value)
})

const currentImage = computed(() => filteredImages.value[currentImageIndex.value] || images[0])

function openLightbox(index: number) {
  currentImageIndex.value = index
  lightboxOpen.value = true
}

function closeLightbox() {
  lightboxOpen.value = false
}

function nextImage() {
  currentImageIndex.value = (currentImageIndex.value + 1) % filteredImages.value.length
}

function prevImage() {
  currentImageIndex.value = (currentImageIndex.value - 1 + filteredImages.value.length) % filteredImages.value.length
}
</script>

<style scoped>
@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-20px); }
}

@keyframes float-delay {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-30px); }
}

@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-float {
  animation: float 6s ease-in-out infinite;
}

.animate-float-delay {
  animation: float-delay 8s ease-in-out infinite;
}

.animate-fade-in-up {
  animation: fade-in-up 1s ease-out;
}

.animate-fade-in-up-delay {
  animation: fade-in-up 1s ease-out 0.2s both;
}

.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from, .fade-leave-to {
  opacity: 0;
}
</style>
