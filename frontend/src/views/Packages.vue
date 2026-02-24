<template>
  <div class="min-h-screen">
    <!-- Hero Section -->
    <section class="relative h-[70vh] flex items-center justify-center overflow-hidden">
      <div 
        class="absolute inset-0 bg-cover bg-center"
        style="background-image: url('https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=2070')"
      ></div>
      <div class="absolute inset-0 bg-gradient-to-b from-black/70 via-black/50 to-black/70"></div>
      
      <div class="relative z-10 text-center text-white px-6 max-w-5xl mx-auto">
        <p class="text-sm tracking-[0.3em] uppercase text-amber-400 mb-4 animate-fade-in-up">
          {{ isRTL ? 'عروض حصرية' : 'Exclusive Offers' }}
        </p>
        <h1 class="font-display text-6xl md:text-8xl font-bold mb-6 animate-fade-in-up" style="animation-delay: 0.2s">
          {{ isRTL ? 'باقات مميزة' : 'Special Packages' }}
        </h1>
        <div class="flex items-center justify-center gap-4 mb-6 animate-fade-in-up" style="animation-delay: 0.4s">
          <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
          <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
          <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
        </div>
        <p class="text-xl md:text-2xl text-white/90 max-w-3xl mx-auto leading-relaxed animate-fade-in-up" style="animation-delay: 0.6s">
          {{ isRTL ? 'استمتع بعروضنا الحصرية المصممة خصيصاً لتجربة لا تُنسى' : 'Enjoy our exclusive offers designed for an unforgettable experience' }}
        </p>
      </div>
    </section>

    <!-- Packages Section -->
    <section class="relative py-24 bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900">
      <div class="container mx-auto px-6 max-w-7xl">
        <!-- Section Header -->
        <div class="text-center mb-16">
          <p class="text-amber-400 text-sm tracking-[0.3em] uppercase mb-4">
            {{ isRTL ? 'اختر باقتك' : 'Choose Your Package' }}
          </p>
          <h2 class="font-display text-5xl md:text-6xl font-bold text-white mb-6">
            {{ isRTL ? 'عروض حصرية' : 'Exclusive Offers' }}
          </h2>
          <div class="flex items-center justify-center gap-4 mb-8">
            <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
            <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
            <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
          </div>
        </div>

        <!-- Category Filter -->
        <div class="flex flex-wrap justify-center gap-4 mb-16">
          <button 
            @click="selectedCategory = 'all'" 
            :class="selectedCategory === 'all' ? 'bg-gradient-to-r from-amber-500 to-amber-600 text-white shadow-lg shadow-amber-500/50' : 'bg-white/10 text-white hover:bg-white/20'"
            class="px-8 py-3 rounded-full font-semibold transition-all duration-300 hover:scale-105"
          >
            {{ isRTL ? 'الكل' : 'All' }}
          </button>
          <button 
            @click="selectedCategory = 'restaurant'" 
            :class="selectedCategory === 'restaurant' ? 'bg-gradient-to-r from-amber-500 to-amber-600 text-white shadow-lg shadow-amber-500/50' : 'bg-white/10 text-white hover:bg-white/20'"
            class="px-8 py-3 rounded-full font-semibold transition-all duration-300 hover:scale-105"
          >
            {{ isRTL ? 'المطعم' : 'Restaurant' }}
          </button>
          <button 
            @click="selectedCategory = 'cafe'" 
            :class="selectedCategory === 'cafe' ? 'bg-gradient-to-r from-blue-500 to-blue-600 text-white shadow-lg shadow-blue-500/50' : 'bg-white/10 text-white hover:bg-white/20'"
            class="px-8 py-3 rounded-full font-semibold transition-all duration-300 hover:scale-105"
          >
            {{ isRTL ? 'الكافيه' : 'Cafe' }}
          </button>
        </div>

        <!-- Packages Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div 
            v-for="pkg in filteredPackages" 
            :key="pkg.id"
            class="group bg-white/5 backdrop-blur-sm border border-white/10 rounded-3xl overflow-hidden hover:bg-white/10 transition-all duration-500 hover:-translate-y-2"
            :class="pkg.category === 'restaurant' ? 'hover:border-amber-400/50 hover:shadow-luxury-lg hover:shadow-amber-500/20' : 'hover:border-blue-400/50 hover:shadow-luxury-lg hover:shadow-blue-500/20'"
          >
            <!-- Package Image -->
            <div class="relative h-56 overflow-hidden">
              <img 
                :src="pkg.image" 
                :alt="isRTL ? pkg.nameAr : pkg.name"
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
              />
              <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-transparent"></div>
              
              <!-- Badge -->
              <div v-if="pkg.badge" class="absolute top-4 right-4">
                <span class="px-4 py-2 bg-gradient-to-r from-red-500 to-red-600 text-white text-xs font-bold rounded-full shadow-lg animate-pulse">
                  {{ isRTL ? pkg.badgeAr : pkg.badge }}
                </span>
              </div>
              
              <!-- Category Badge -->
              <div class="absolute bottom-4 left-4">
                <span class="px-4 py-2 border rounded-full text-xs font-bold uppercase backdrop-blur-md"
                  :class="pkg.category === 'restaurant' ? 'bg-amber-500/30 border-amber-400/50 text-amber-300' : 'bg-blue-500/30 border-blue-400/50 text-blue-300'"
                >
                  {{ isRTL ? pkg.categoryAr : pkg.categoryEn }}
                </span>
              </div>
            </div>
            
            <!-- Package Content -->
            <div class="p-8">
              <h3 class="text-2xl font-bold text-white mb-3 group-hover:text-amber-400 transition-colors">
                {{ isRTL ? pkg.nameAr : pkg.name }}
              </h3>
              <p class="text-white/70 mb-6 leading-relaxed text-sm">
                {{ isRTL ? pkg.descriptionAr : pkg.description }}
              </p>
              
              <div class="flex items-baseline gap-2 mb-6">
                <span class="text-4xl font-bold bg-gradient-to-r bg-clip-text text-transparent" 
                  :class="pkg.category === 'restaurant' ? 'from-amber-400 to-amber-600' : 'from-blue-400 to-blue-600'"
                >
                  {{ pkg.price }}
                </span>
                <span v-if="pkg.oldPrice" class="text-lg text-white/40 line-through">{{ pkg.oldPrice }}</span>
                <span class="text-white/60 text-sm">{{ isRTL ? 'جنيه' : 'EGP' }}</span>
              </div>
              
              <button 
                @click="bookPackage(pkg)"
                class="w-full px-6 py-4 rounded-xl font-semibold text-white transition-all duration-300 hover:scale-105"
                :class="pkg.category === 'restaurant' 
                ? 'bg-gradient-to-r from-amber-500 to-amber-600 hover:shadow-lg hover:shadow-amber-500/50' 
                : 'bg-gradient-to-r from-blue-500 to-blue-600 hover:shadow-lg hover:shadow-blue-500/50'"
              >
                {{ isRTL ? 'احجز الآن' : 'Book Now' }}
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="py-24 bg-white">
      <div class="container mx-auto px-6 max-w-4xl text-center">
        <h2 class="font-display text-4xl md:text-5xl font-bold text-slate-900 mb-6">
          {{ isRTL ? 'لم تجد ما تبحث عنه؟' : "Didn't Find What You're Looking For?" }}
        </h2>
        <p class="text-xl text-slate-600 mb-8">
          {{ isRTL ? 'تواصل معنا لتخصيص باقة خاصة بك' : 'Contact us to customize your own package' }}
        </p>
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
          <button class="px-10 py-4 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-full font-semibold text-lg hover:shadow-lg hover:shadow-amber-500/50 transition-all hover:scale-105">
            {{ isRTL ? 'تواصل معنا' : 'Contact Us' }}
          </button>
          <button class="px-10 py-4 border-2 border-slate-300 text-slate-900 rounded-full font-semibold text-lg hover:border-amber-400 transition-all hover:scale-105">
            {{ isRTL ? 'عرض القائمة الكاملة' : 'View Full Menu' }}
          </button>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useAppStore } from '@/stores/app'

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)
const selectedCategory = ref('all')

const packages = [
  {
    id: 1,
    category: 'restaurant',
    categoryEn: 'Restaurant',
    categoryAr: 'مطعم',
    image: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070',
    name: 'Pizza Night Offer',
    nameAr: 'ليلة البيتزا',
    description: 'Large Pizza + Soft Drinks + Salad',
    descriptionAr: 'بيتزا كبيرة + مشروبات غازية + سلطة',
    price: 250,
    oldPrice: 300,
    badge: 'Save 20%',
    badgeAr: 'وفر 20%'
  },
  {
    id: 2,
    category: 'restaurant',
    categoryEn: 'Restaurant',
    categoryAr: 'مطعم',
    image: 'https://images.unsplash.com/photo-1470229538611-16ba8c7ffbd7?q=80&w=2070',
    name: 'Candlelight Beach Dinner',
    nameAr: 'عشاء رومانسي على الشاطئ',
    description: 'Romantic Dinner on Beach + Candles + Sunset View',
    descriptionAr: 'عشاء رومانسي على الشاطئ + شموع + إطلالة الغروب',
    price: 650,
    badge: 'Most Romantic',
    badgeAr: 'الأكثر رومانسية'
  },
  {
    id: 3,
    category: 'restaurant',
    categoryEn: 'Restaurant',
    categoryAr: 'مطعم',
    image: 'https://images.unsplash.com/photo-1495954484750-af469f2f9be5?q=80&w=2070',
    name: 'Sunset Romantic Setup',
    nameAr: 'إعداد رومانسي عند الغروب',
    description: 'Private Table + Decorations + Photographer',
    descriptionAr: 'طاولة خاصة + ديكورات + مصور',
    price: 800,
    badge: 'Premium',
    badgeAr: 'بريميوم'
  },
  {
    id: 4,
    category: 'restaurant',
    categoryEn: 'Restaurant',
    categoryAr: 'مطعم',
    image: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=2070',
    name: 'Romantic Dinner for Two',
    nameAr: 'عشاء رومانسي لشخصين',
    description: 'Dinner for Two + Candles + Live Music',
    descriptionAr: 'عشاء لشخصين + شموع + موسيقى حية',
    price: 500,
    badge: 'Popular',
    badgeAr: 'الأكثر طلباً'
  },
  {
    id: 5,
    category: 'restaurant',
    categoryEn: 'Restaurant',
    categoryAr: 'مطعم',
    image: 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?q=80&w=2070',
    name: 'Pasta + Drink Combo',
    nameAr: 'كومبو الباستا',
    description: 'Pasta + Drink + Garlic Bread',
    descriptionAr: 'باستا + مشروب + خبز بالثوم',
    price: 180
  },
  {
    id: 6,
    category: 'cafe',
    categoryEn: 'Cafe',
    categoryAr: 'كافيه',
    image: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?q=80&w=2070',
    name: 'Morning Coffee Package',
    nameAr: 'باقة القهوة الصباحية',
    description: 'Coffee + Croissant + Orange Juice',
    descriptionAr: 'قهوة + كرواسون + عصير برتقال',
    price: 80
  },
  {
    id: 7,
    category: 'cafe',
    categoryEn: 'Cafe',
    categoryAr: 'كافيه',
    image: 'https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?q=80&w=2070',
    name: 'Sunset Drink Offer',
    nameAr: 'عرض الغروب',
    description: 'Signature Drink + Dessert + Sunset View',
    descriptionAr: 'مشروب مميز + حلى + إطلالة الغروب',
    price: 120
  },
  {
    id: 8,
    category: 'cafe',
    categoryEn: 'Cafe',
    categoryAr: 'كافيه',
    image: 'https://images.unsplash.com/photo-1528698827591-e19ccd7bc23d?q=80&w=2070',
    name: 'Hookah & Lounge',
    nameAr: 'شيشة ولاونج',
    description: 'Premium Hookah + Drink + Cozy Seating',
    descriptionAr: 'شيشة فاخرة + مشروب + جلسة مريحة',
    price: 150
  }
]

const filteredPackages = computed(() => {
  if (selectedCategory.value === 'all') return packages
  return packages.filter(p => p.category === selectedCategory.value)
})

function bookPackage(pkg: any) {
  alert(`Booking: ${pkg.name}`)
}
</script>

<style scoped>
@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(40px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-fade-in-up {
  animation: fade-in-up 1s ease-out;
  animation-fill-mode: both;
}
</style>
