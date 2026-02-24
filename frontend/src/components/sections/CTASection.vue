<script setup lang="ts">
import { useRouter } from 'vue-router'
import { useAppStore } from '@/stores/app'
import { computed } from 'vue'
import LuxSection from '@/components/ui/LuxSection.vue'
import LuxButton from '@/components/ui/LuxButton.vue'

const router = useRouter()
const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)

const bookNow = () => {
  router.push('/rooms')
}
</script>

<template>
  <LuxSection dark>
    <div class="text-center max-w-4xl mx-auto">
      <p class="text-amber-400 text-sm tracking-[0.3em] uppercase mb-4">
        {{ isRTL ? 'عرض محدود' : 'Limited Offer' }}
      </p>
      
      <h2 class="font-display text-4xl md:text-6xl font-bold mb-6">
        {{ isRTL ? 'جاهز لتجربة لا تُنسى؟' : 'Ready for an Unforgettable Experience?' }}
      </h2>
      
      <p class="text-lg md:text-xl text-white/80 mb-8 max-w-2xl mx-auto leading-relaxed">
        {{ isRTL ? 'احجز إقامتك الآن واستمتع بأفضل العروض الحصرية على شاطئنا الخاص' : 'Book your stay now and enjoy exclusive offers on our private beach' }}
      </p>

      <div class="flex flex-col sm:flex-row gap-4 justify-center items-center mb-6">
        <LuxButton @click="bookNow" size="lg">
          {{ isRTL ? 'احجز إقامتك' : 'Book Your Stay' }}
        </LuxButton>
        <button 
          @click="router.push('/packages')"
          class="px-8 py-4 border-2 border-white/30 text-white rounded-full font-semibold hover:bg-white/10 transition-all duration-300"
        >
          {{ isRTL ? 'استكشف الباقات' : 'Explore Packages' }}
        </button>
      </div>

      <div class="flex items-center justify-center gap-6 text-sm text-white/60">
        <span>✓ {{ isRTL ? 'أفضل الأسعار مضمونة' : 'Best Price Guaranteed' }}</span>
        <span>✓ {{ isRTL ? 'إلغاء مجاني' : 'Free Cancellation' }}</span>
        <span>✓ {{ isRTL ? 'دفع آمن' : 'Secure Payment' }}</span>
      </div>
    </div>
  </LuxSection>
</template>
