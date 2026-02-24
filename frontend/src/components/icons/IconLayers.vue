<template>
  <svg xmlns="http://www.w3.org/2000/svg" :width="size" :height="size" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M12 2 2 7l10 5 10-5-10-5z"/>
    <path d="m2 17 10 5 10-5M2 12l10 5 10-5"/>
  </svg>
</template>

<script setup lang="ts">
defineProps<{ size?: number | string }>()
</script>
