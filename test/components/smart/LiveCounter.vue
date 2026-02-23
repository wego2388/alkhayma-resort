<template>
  <Transition name="slide-in">
    <div v-if="isVisible" class="live-counter">
      <span class="pulse-dot"></span>
      <span class="text">
        {{ $t("liveCounter.watching", { count: displayCount }) }}
      </span>
      <span v-if="recentBookings > 0" class="recent-bookings">
        {{ $t("liveCounter.recentBookings", { count: recentBookings }) }}
      </span>
    </div>
  </Transition>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from "vue";
import { useI18n } from "vue-i18n";

const { t: _ } = useI18n();

interface Props {
  productId: string;
  baseCount?: number;
  recentBookings?: number;
}

const props = withDefaults(defineProps<Props>(), {
  baseCount: 5,
  recentBookings: 0,
});

const isVisible = ref(false);
const currentCount = ref(props.baseCount);
let fluctuationInterval: number | null = null;
let hideTimeout: number | null = null;

const displayCount = computed(() => {
  return Math.max(1, currentCount.value);
});

// Randomly fluctuate the count to create urgency
const fluctuateCount = () => {
  const change = Math.random() > 0.5 ? 1 : -1;
  currentCount.value = Math.max(2, Math.min(20, currentCount.value + change));
};

onMounted(() => {
  // Show after a short delay (creates "just noticed" feeling)
  setTimeout(() => {
    isVisible.value = true;
  }, 2000);

  // Fluctuate count every 3-8 seconds
  fluctuationInterval = window.setInterval(
    () => {
      fluctuateCount();
    },
    3000 + Math.random() * 5000,
  );

  // Hide after 60 seconds of inactivity
  hideTimeout = window.setTimeout(() => {
    isVisible.value = false;
  }, 60000);
});

onUnmounted(() => {
  if (fluctuationInterval) {
    clearInterval(fluctuationInterval);
  }
  if (hideTimeout) {
    clearTimeout(hideTimeout);
  }
});
</script>

