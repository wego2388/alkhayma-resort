<script setup lang="ts">
import { ref, onMounted } from 'vue'
import LuxSection from '@/components/ui/LuxSection.vue'

const stats = [
  { value: 0, target: 120, suffix: '+', label: 'Luxury Rooms', labelAr: 'غرفة فاخرة', icon: '🛏️' },
  { value: 0, target: 4.7, suffix: '', label: 'Guest Rating', labelAr: 'تقييم الضيوف', icon: '⭐' },
  { value: 0, target: 487, suffix: '+', label: 'Happy Guests', labelAr: 'ضيف سعيد', icon: '😊' },
  { value: 0, target: 1, suffix: '', label: 'Ranked #1', labelAr: 'المرتبة #1', icon: '🏆' }
]

const displayStats = ref(stats.map(s => ({ ...s })))

onMounted(() => {
  const duration = 2000
  const steps = 60
  let currentStep = 0
  
  const interval = setInterval(() => {
    currentStep++
    displayStats.value = stats.map(stat => {
      const currentValue = (currentStep / steps) * stat.target
      return {
        ...stat,
        value: Math.min(currentValue, stat.target)
      }
    })
    
    if (currentStep >= steps) clearInterval(interval)
  }, duration / steps)
})
</script>

<template>
  <LuxSection>
    <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
      <div 
        v-for="(stat, i) in displayStats" 
        :key="i"
        class="text-center group"
      >
        <div class="mb-4 text-5xl md:text-6xl font-bold bg-gradient-to-br from-amber-500 to-amber-600 bg-clip-text text-transparent group-hover:scale-110 transition-transform duration-400">
          {{ stat.target === 4.7 ? stat.value.toFixed(1) : Math.floor(stat.value) }}{{ stat.suffix }}
        </div>
        <div class="text-sm md:text-base text-slate-600 font-semibold">
          {{ stat.label }}
        </div>
      </div>
    </div>
  </LuxSection>
</template>
