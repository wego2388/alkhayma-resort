<template>
  <Transition name="toast">
    <div v-if="visible" :class="toastClass" class="fixed top-4 right-4 z-[100] px-6 py-4 rounded-xl shadow-2xl flex items-center gap-3 min-w-[300px] max-w-md backdrop-blur-sm">
      <span class="text-2xl">{{ icon }}</span>
      <div class="flex-1">
        <p class="font-semibold">{{ message }}</p>
        <p v-if="description" class="text-sm opacity-90">{{ description }}</p>
      </div>
      <button @click="close" class="text-xl opacity-70 hover:opacity-100">×</button>
    </div>
  </Transition>
</template>

<script setup lang="ts">
import { ref, computed, watch } from 'vue'

const props = defineProps<{
  type?: 'success' | 'error' | 'warning' | 'info'
  message: string
  description?: string
  duration?: number
}>()

const emit = defineEmits<{
  close: []
}>()

const visible = ref(true)
let timer: NodeJS.Timeout

const icon = computed(() => {
  const icons = {
    success: '✅',
    error: '❌',
    warning: '⚠️',
    info: 'ℹ️'
  }
  return icons[props.type || 'info']
})

const toastClass = computed(() => {
  const classes = {
    success: 'bg-green-500 text-white',
    error: 'bg-red-500 text-white',
    warning: 'bg-yellow-500 text-white',
    info: 'bg-blue-500 text-white'
  }
  return classes[props.type || 'info']
})

function close() {
  visible.value = false
  setTimeout(() => emit('close'), 300)
}

watch(() => visible.value, (val) => {
  if (val) {
    timer = setTimeout(() => close(), props.duration || 3000)
  }
}, { immediate: true })
</script>

<style scoped>
.toast-enter-active, .toast-leave-active {
  transition: all 0.3s ease;
}
.toast-enter-from {
  opacity: 0;
  transform: translateX(100px);
}
.toast-leave-to {
  opacity: 0;
  transform: translateX(100px);
}
</style>
