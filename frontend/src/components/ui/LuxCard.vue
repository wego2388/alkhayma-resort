<script setup lang="ts">
defineProps<{
  hover?: boolean
}>()
</script>

<template>
  <div
    :class="[
      'bg-white rounded-3xl overflow-hidden shadow-lg transition-luxury',
      hover && 'group hover:shadow-luxury-lg hover:-translate-y-2'
    ]"
  >
    <slot />
  </div>
</template>
