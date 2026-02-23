<template>
  <Transition name="fade-scale">
    <div v-if="isVisible" class="upsell-modal-overlay" @click.self="close">
      <div class="upsell-modal">
        <!-- Close Button -->
        <button @click="close" class="close-btn" aria-label="Close">✕</button>

        <!-- Header -->
        <div class="modal-header">
          <span class="upgrade-icon">✨</span>
          <h3>{{ $t("upsell.title") }}</h3>
          <p class="subtitle">{{ $t("upsell.subtitle") }}</p>
        </div>

        <!-- Current vs Upgrade -->
        <div class="comparison">
          <div class="current-option">
            <h4>{{ $t("upsell.current") }}</h4>
            <div class="option-card current">
              <span class="icon">{{ currentItem.icon }}</span>
              <span class="name">{{ currentItem.name }}</span>
              <span class="price">{{ formatPrice(currentItem.price) }}</span>
            </div>
          </div>

          <div class="arrow">➜</div>

          <div class="upgrade-option">
            <h4>{{ $t("upsell.upgrade") }}</h4>
            <div class="option-card upgrade">
              <span class="badge">{{ $t("upsell.recommended") }}</span>
              <span class="icon">{{ upgradeItem.icon }}</span>
              <span class="name">{{ upgradeItem.name }}</span>
              <span class="price">{{ formatPrice(upgradeItem.price) }}</span>
              <ul class="benefits">
                <li v-for="(benefit, index) in upgradeItem.benefits" :key="index">
                  ✓ {{ benefit }}
                </li>
              </ul>
            </div>
          </div>
        </div>

        <!-- Savings Badge -->
        <div v-if="savings > 0" class="savings-badge">
          {{ $t("upsell.savings", { amount: formatPrice(savings) }) }}
        </div>

        <!-- Urgency Message -->
        <div class="urgency">
          <span class="clock">⏰</span>
          <p>{{ $t("upsell.limitedOffer") }}</p>
          <div class="countdown" v-if="timeRemaining > 0">
            {{ formatCountdown(timeRemaining) }}
          </div>
        </div>

        <!-- Actions -->
        <div class="actions">
          <button @click="acceptUpgrade" class="btn-upgrade">
            {{ $t("upsell.upgradeNow") }}
          </button>
          <button @click="close" class="btn-decline">
            {{ $t("upsell.noThanks") }}
          </button>
        </div>

        <!-- Trust Indicators -->
        <div class="trust">
          <span>🔒 {{ $t("upsell.secure") }}</span>
          <span>✓ {{ $t("upsell.instant") }}</span>
          <span>↩ {{ $t("upsell.refundable") }}</span>
        </div>
      </div>
    </div>
  </Transition>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from "vue";
import { useI18n } from "vue-i18n";

const { t: _ } = useI18n();

interface UpsellItem {
  id: string;
  name: string;
  icon: string;
  price: number;
  benefits?: string[];
}

const props = defineProps<{
  modelValue: boolean;
  currentItem: UpsellItem;
  upgradeItem: UpsellItem;
}>();

const emit = defineEmits<{
  "update:modelValue": [value: boolean];
  accept: [item: UpsellItem];
  decline: [];
}>();

const isVisible = computed({
  get: () => props.modelValue,
  set: (value) => emit("update:modelValue", value),
});

const timeRemaining = ref(900); // 15 minutes in seconds
let countdownInterval: number | null = null;

const savings = computed(() => {
  return Math.max(0, props.currentItem.price - props.upgradeItem.price);
});

const formatPrice = (price: number): string => {
  return new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
  }).format(price);
};

const formatCountdown = (seconds: number): string => {
  const mins = Math.floor(seconds / 60);
  const secs = seconds % 60;
  return `${mins}:${secs.toString().padStart(2, "0")}`;
};

const close = () => {
  isVisible.value = false;
  emit("decline");
};

const acceptUpgrade = () => {
  emit("accept", props.upgradeItem);
  isVisible.value = false;
};

onMounted(() => {
  countdownInterval = window.setInterval(() => {
    if (timeRemaining.value > 0) {
      timeRemaining.value--;
    }
  }, 1000);
});

onUnmounted(() => {
  if (countdownInterval) {
    clearInterval(countdownInterval);
  }
});
</script>

