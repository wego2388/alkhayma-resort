<script setup lang="ts">
defineProps<{
  dark?: boolean
}>()
</script>

<template>
  <section
    :class="[
      'relative py-24 overflow-hidden',
      dark
        ? 'bg-gradient-to-br from-slate-900 via-blue-900 to-slate-800 text-white'
        : 'bg-white text-slate-800'
    ]"
  >
    <div class="max-w-7xl mx-auto px-6">
      <slot />
    </div>
  </section>
</template>
