<script setup lang="ts">
defineProps<{
  href?: string
  variant?: 'primary' | 'secondary'
}>()
</script>

<template>
  <component
    :is="href ? 'a' : 'button'"
    :href="href"
    :class="[
      'inline-block px-8 py-4 rounded-full font-semibold transition-all duration-300',
      variant === 'secondary'
        ? 'bg-white text-slate-900 hover:bg-slate-100'
        : 'bg-gradient-to-r from-amber-500 to-amber-600 hover:from-amber-600 hover:to-amber-700 text-white shadow-2xl hover:shadow-amber-500/50 hover:scale-105'
    ]"
  >
    <slot />
  </component>
</template>
