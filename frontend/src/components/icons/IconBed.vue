<template>
  <svg xmlns="http://www.w3.org/2000/svg" :width="size" :height="size" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M3 20v-8a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2v8"/>
    <path d="M3 12V6a2 2 0 0 1 2-2h3"/>
    <path d="M21 12V6a2 2 0 0 1-2-2h-3"/>
    <circle cx="7" cy="9" r="1.5"/>
  </svg>
</template>

<script setup lang="ts">
defineProps<{ size?: number | string }>()
</script>
