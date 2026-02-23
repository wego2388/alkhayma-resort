<template>
  <div class="stat-card">
    <div class="stat-header">
      <span class="stat-icon">{{ icon }}</span>
      <span class="stat-trend" :class="trend">
        {{ change }}
        {{ trend === 'up' ? '↑' : '↓' }}
      </span>
    </div>
    <div class="stat-value">{{ value }}</div>
    <div class="stat-title">{{ title }}</div>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  title: string
  value: string
  change: string
  icon: string
  trend: 'up' | 'down'
}>()
</script>

