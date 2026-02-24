<template>
  <div class="min-h-screen">
    <!-- Hero Section - Cinematic Luxury -->
    <section class="relative h-screen flex items-center justify-center overflow-hidden">
      <!-- Parallax Background -->
      <div class="absolute inset-0">
        <div 
          class="absolute inset-0 bg-cover bg-center transition-transform duration-1000 ease-out"
          :style="{ 
            backgroundImage: 'url(https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?q=80&w=2070&auto=format&fit=crop)',
            transform: `scale(${1 + scrollY * 0.0002}) translateY(${scrollY * 0.4}px)`,
            filter: `blur(${Math.min(scrollY * 0.01, 3)}px)`
          }"
          role="img"
          aria-label="Luxury resort beachfront view"
        ></div>
        <div class="absolute inset-0 bg-gradient-to-b from-black/60 via-black/40 to-black/70"></div>
      </div>

      <!-- Ambient Overlay -->
      <div class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-black/20 pointer-events-none"></div>

      <!-- Content -->
      <div class="relative z-20 text-center text-white px-6 max-w-7xl mx-auto">
        <!-- Subtitle -->
        <p class="text-sm md:text-base tracking-[0.3em] uppercase text-amber-400 mb-6 font-light animate-fade-in-up">
          {{ isRTL ? 'منتجع شاطئ خاص - شرم الشيخ' : 'Private Beachfront Resort - Sharm El Sheikh' }}
        </p>
        
        <!-- Main Title with Stagger -->
        <h1 class="font-display text-6xl md:text-8xl font-bold mb-6 tracking-tight leading-tight">
          <span class="block animate-fade-in-up" style="animation-delay: 0.1s; animation-fill-mode: both;">
            {{ isRTL ? 'استمتع بإقامة على' : 'Escape to a' }}
          </span>
          <span class="block animate-fade-in-up text-amber-400" style="animation-delay: 0.3s; animation-fill-mode: both;">
            {{ isRTL ? 'شاطئ خاص في شرم الشيخ' : 'Private Beach Paradise' }}
          </span>
        </h1>

        <!-- Divider -->
        <div class="flex items-center justify-center gap-4 mb-8 animate-fade-in-up" style="animation-delay: 0.5s; animation-fill-mode: both;">
          <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
          <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
          <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
        </div>
        
        <!-- Description -->
        <p class="text-xl md:text-2xl mb-4 font-light text-white/90 max-w-4xl mx-auto leading-relaxed animate-fade-in-up" style="animation-delay: 0.7s; animation-fill-mode: both;">
          {{ isRTL ? 'منتجع مواجه للشاطئ مصمم لذكريات لا تُنسى' : 'A beachfront retreat designed for unforgettable moments' }}
        </p>
        <p class="text-base md:text-lg mb-12 text-white/70 max-w-3xl mx-auto font-light animate-fade-in-up" style="animation-delay: 0.9s; animation-fill-mode: both;">
          {{ isRTL ? 'استيقظ على بعد خطوات من البحر الأحمر • مثالي للأزواج والعائلات • مصنف #1 من 8 منتجعات' : 'Wake up steps from the Red Sea • Perfect for Couples & Families • Ranked #1 of 8 Resorts' }}
        </p>

        <!-- CTA Button -->
        <div class="mb-4 animate-fade-in-up" style="animation-delay: 1.1s; animation-fill-mode: both;">
          <router-link 
            to="/rooms" 
            class="inline-block bg-gradient-to-r from-amber-500 to-amber-600 hover:from-amber-600 hover:to-amber-700 text-white px-12 py-5 rounded-full font-semibold text-lg shadow-2xl hover:shadow-amber-500/50 transition-all duration-400 transform hover:scale-105"
          >
            {{ isRTL ? 'احجز إقامتك' : 'Book Your Stay' }}
          </router-link>
        </div>

        <!-- Urgency Microcopy -->
        <p class="text-sm text-amber-300/80 font-medium animate-fade-in-up" style="animation-delay: 1.3s; animation-fill-mode: both;">
          {{ isRTL ? '⚡ عدد محدود من الغرف المطلة على البحر هذا الموسم' : '⚡ Limited sea view rooms available this season' }}
        </p>
      </div>

      <!-- Scroll Indicator -->
      <div class="absolute bottom-12 left-1/2 -translate-x-1/2 animate-bounce">
        <div class="w-6 h-10 border-2 border-white/40 rounded-full flex justify-center p-2">
          <div class="w-1 h-3 bg-white/60 rounded-full animate-pulse"></div>
        </div>
      </div>
    </section>

    <!-- Stats Section -->
    <StatsSection />

    <!-- Features Section -->
    <FeaturesSection />

    <!-- Beach Experience Section -->
    <BeachExperienceSection />

    <!-- Reviews Section -->
    <ReviewsSection />

    <!-- Google Reviews Section -->
    <GoogleReviewsSection />

    <!-- Instagram Feed Section -->
    <InstagramFeedSection />

    <!-- Location Section -->
    <LocationSection />

    <!-- Social Media Section -->
    <SocialMediaSection />

    <!-- CTA Section -->
    <CTASection />

    <!-- Conversion Optimization -->
    <StickyBookingBar />
    <FloatingWhatsApp />
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted, defineAsyncComponent } from 'vue'
import { useAppStore } from '@/stores/app'
import { useMeta } from '@/composables/useMeta'
import { useStructuredData } from '@/composables/useStructuredData'

// SEO
useMeta({
  title: 'El Kheima Resort | Luxury Beachfront Resort in Sharm El Sheikh',
  titleAr: 'منتجع الخيمة | منتجع فاخر على شاطئ البحر في شرم الشيخ',
  description: 'Experience luxury at El Kheima Resort. Premium beachfront accommodations, world-class dining, water sports, and unforgettable experiences in Sharm El Sheikh, Egypt.',
  descriptionAr: 'استمتع بالفخامة في منتجع الخيمة. إقامة فاخرة على الشاطئ، مطاعم عالمية، رياضات مائية، وتجارب لا تُنسى في شرم الشيخ، مصر.',
  url: 'https://alkhaymaresort.com'
})

useStructuredData()

// Lazy load below-fold sections
const StatsSection = defineAsyncComponent(() => import('@/components/sections/StatsSection.vue'))
const FeaturesSection = defineAsyncComponent(() => import('@/components/sections/FeaturesSection.vue'))
const BeachExperienceSection = defineAsyncComponent(() => import('@/components/sections/BeachExperienceSection.vue'))
const ReviewsSection = defineAsyncComponent(() => import('@/components/sections/ReviewsSection.vue'))
const GoogleReviewsSection = defineAsyncComponent(() => import('@/components/sections/GoogleReviewsSection.vue'))
const InstagramFeedSection = defineAsyncComponent(() => import('@/components/sections/InstagramFeedSection.vue'))
const LocationSection = defineAsyncComponent(() => import('@/components/sections/LocationSection.vue'))
const SocialMediaSection = defineAsyncComponent(() => import('@/components/sections/SocialMediaSection.vue'))
const CTASection = defineAsyncComponent(() => import('@/components/sections/CTASection.vue'))
const StickyBookingBar = defineAsyncComponent(() => import('@/components/StickyBookingBar.vue'))
const FloatingWhatsApp = defineAsyncComponent(() => import('@/components/FloatingWhatsApp.vue'))

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)

const scrollY = ref(0)

function handleScroll() {
  scrollY.value = window.scrollY
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
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
  animation: fade-in-up 1.2s ease-out;
}
</style>
