<template>
  <Transition name="slide-up">
    <div v-if="isVisible" class="fixed bottom-24 right-6 z-40 bg-gradient-to-r from-red-500 to-pink-500 text-white px-6 py-3 rounded-full shadow-2xl flex items-center gap-3 animate-pulse-slow">
      <span class="relative flex h-3 w-3">
        <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-white opacity-75"></span>
        <span class="relative inline-flex rounded-full h-3 w-3 bg-white"></span>
      </span>
      <span class="font-bold text-sm">
        {{ isRTL ? `${displayCount} شخص يشاهدون الآن` : `${displayCount} people watching now` }}
      </span>
      <span v-if="recentBookings > 0" class="text-xs bg-white/20 px-2 py-1 rounded-full">
        {{ isRTL ? `${recentBookings} حجز اليوم` : `${recentBookings} booked today` }}
      </span>
    </div>
  </Transition>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useAppStore } from '@/stores/app'

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)

interface Props {
  baseCount?: number
  recentBookings?: number
}

const props = withDefaults(defineProps<Props>(), {
  baseCount: 8,
  recentBookings: 3
})

const isVisible = ref(false)
const currentCount = ref(props.baseCount)
let fluctuationInterval: ReturnType<typeof setInterval>
let hideTimeout: ReturnType<typeof setTimeout>

const displayCount = computed(() => Math.max(1, currentCount.value))

function fluctuateCount() {
  const change = Math.random() > 0.5 ? 1 : -1
  currentCount.value = Math.max(3, Math.min(15, currentCount.value + change))
}

onMounted(() => {
  setTimeout(() => {
    isVisible.value = true
  }, 2000)

  fluctuationInterval = setInterval(fluctuateCount, 5000)

  hideTimeout = setTimeout(() => {
    isVisible.value = false
  }, 30000)
})

onUnmounted(() => {
  if (fluctuationInterval) clearInterval(fluctuationInterval)
  if (hideTimeout) clearTimeout(hideTimeout)
})
</script>

<style scoped>
.slide-up-enter-active, .slide-up-leave-active {
  transition: all 0.5s ease;
}
.slide-up-enter-from {
  opacity: 0;
  transform: translateY(20px);
}
.slide-up-leave-to {
  opacity: 0;
  transform: translateY(20px);
}

.animate-pulse-slow {
  animation: pulse-slow 3s cubic-bezier(0.4, 0, 0.6, 1) infinite;
}

@keyframes pulse-slow {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.9;
  }
}
</style>
