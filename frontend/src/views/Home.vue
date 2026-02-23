<template>
  <div>
    <!-- Hero Section -->
    <section class="relative h-screen bg-cover bg-center" 
      style="background-image: url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1920')">
      <div class="absolute inset-0 bg-black bg-opacity-50"></div>
      <div class="relative container mx-auto px-4 h-full flex items-center justify-center text-center text-white">
        <div>
          <h1 class="text-5xl md:text-6xl font-bold mb-4">{{ t('home.hero.title') }}</h1>
          <p class="text-xl md:text-2xl mb-8">{{ t('home.hero.subtitle') }}</p>
          <router-link to="/rooms" class="btn-primary text-lg px-8 py-3">
            {{ t('home.hero.cta') }}
          </router-link>
        </div>
      </div>
    </section>

    <!-- Features Section -->
    <section class="py-20 bg-gray-50">
      <div class="container mx-auto px-4">
        <h2 class="text-4xl font-bold text-center mb-12">{{ isRTL ? 'مرافقنا' : 'Our Facilities' }}</h2>
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div v-for="feature in features" :key="feature.title" class="card text-center hover:shadow-xl transition-shadow">
            <div class="text-5xl mb-4">{{ feature.icon }}</div>
            <h3 class="text-xl font-bold mb-2">{{ t(feature.title) }}</h3>
            <p class="text-gray-600 mb-2">{{ feature.description }}</p>
            <p class="text-3xl font-bold text-primary-600">{{ feature.count }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Stats Section -->
    <section class="py-16 bg-primary-600 text-white">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
          <div>
            <p class="text-5xl font-bold mb-2">50+</p>
            <p class="text-lg">{{ isRTL ? 'غرفة فاخرة' : 'Luxury Rooms' }}</p>
          </div>
          <div>
            <p class="text-5xl font-bold mb-2">5000+</p>
            <p class="text-lg">{{ isRTL ? 'ضيف سعيد' : 'Happy Guests' }}</p>
          </div>
          <div>
            <p class="text-5xl font-bold mb-2">10+</p>
            <p class="text-lg">{{ isRTL ? 'سنوات خبرة' : 'Years Experience' }}</p>
          </div>
          <div>
            <p class="text-5xl font-bold mb-2">4.9</p>
            <p class="text-lg">{{ isRTL ? 'تقييم ممتاز' : 'Excellent Rating' }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-primary-600 text-white text-center">
      <div class="container mx-auto px-4">
        <h2 class="text-4xl font-bold mb-4">{{ isRTL ? 'احجز إقامتك اليوم' : 'Book Your Stay Today' }}</h2>
        <p class="text-xl mb-8">{{ isRTL ? 'استمتع بتجربة لا تُنسى' : 'Experience unforgettable moments' }}</p>
        <router-link to="/rooms" class="bg-white text-primary-600 px-8 py-3 rounded-lg font-bold hover:bg-gray-100">
          {{ t('home.hero.cta') }}
        </router-link>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'

const { t } = useI18n()
const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)

const features = [
  { icon: '🏨', title: 'home.features.rooms', description: 'Luxury accommodations', count: '50+' },
  { icon: '🍽️', title: 'home.features.restaurant', description: 'World-class dining', count: '20+' },
  { icon: '🏄', title: 'home.features.activities', description: 'Exciting water sports', count: '15+' },
  { icon: '💆', title: 'home.features.spa', description: 'Relaxation & wellness', count: '10+' }
]
</script>
