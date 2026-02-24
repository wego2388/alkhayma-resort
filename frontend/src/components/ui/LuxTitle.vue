<script setup lang="ts">
defineProps<{
  subtitle?: string
}>()
</script>

<template>
  <div class="mb-16 text-center">
    <p v-if="subtitle" class="uppercase tracking-[0.3em] text-amber-500 text-sm mb-4">
      {{ subtitle }}
    </p>
    <h2 class="font-display text-4xl md:text-6xl font-light leading-tight">
      <slot />
    </h2>
    <div class="h-0.5 w-20 bg-gradient-to-r from-transparent via-amber-400 to-transparent mx-auto mt-6"></div>
  </div>
</template>
