<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import { useAppStore } from '@/stores/app'
import { computed } from 'vue'

const router = useRouter()
const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)
const isVisible = ref(false)

const handleScroll = () => {
  isVisible.value = window.scrollY > 800
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})

const bookNow = () => {
  router.push('/rooms')
}
</script>

<template>
  <Transition name="slide-up">
    <div 
      v-if="isVisible"
      class="hidden md:block fixed bottom-0 left-0 right-0 z-40 bg-white/95 backdrop-blur-lg border-t border-slate-200 shadow-2xl"
    >
      <div class="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
        <div>
          <p class="text-sm text-slate-500 mb-1">
            {{ isRTL ? 'جاهز لتجربة الفخامة؟' : 'Ready to experience luxury?' }}
          </p>
          <p class="font-semibold text-slate-900">
            {{ isRTL ? 'احجز إقامتك الآن' : 'Book your stay now' }}
          </p>
        </div>
        
        <button
          @click="bookNow"
          class="bg-gradient-to-r from-amber-500 to-amber-600 hover:from-amber-600 hover:to-amber-700 text-white px-8 py-3 rounded-full font-semibold transition-all duration-400 hover:scale-105 shadow-lg hover:shadow-amber-500/50"
        >
          {{ isRTL ? 'احجز الآن' : 'Book Now' }}
        </button>
      </div>
    </div>
  </Transition>
</template>

<style scoped>
.slide-up-enter-active,
.slide-up-leave-active {
  transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.slide-up-enter-from,
.slide-up-leave-to {
  transform: translateY(100%);
}
</style>
