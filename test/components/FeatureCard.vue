<template>
  <div 
    class="group relative bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 overflow-hidden"
    :class="cardClass"
  >
    <!-- Background Pattern -->
    <div class="absolute inset-0 opacity-5">
      <div class="absolute top-0 left-0 w-full h-full" :style="backgroundPattern"></div>
    </div>
    
    <!-- Floating Element -->
    <div class="absolute -top-4 -right-4 w-24 h-24 rounded-full opacity-10 group-hover:opacity-20 transition-opacity duration-500" :class="floatingElementClass"></div>
    
    <div class="relative z-10">
      <!-- Icon Section -->
      <div class="relative mb-6">
        <div 
          class="w-20 h-20 rounded-2xl flex items-center justify-center mx-auto group-hover:scale-110 transition-transform duration-300 shadow-lg"
          :class="iconBgClass"
        >
          <i :class="icon" class="text-white text-3xl"></i>
        </div>
        
        <!-- Ping Animation -->
        <div 
          v-if="showPing"
          class="absolute -top-2 -right-2 w-6 h-6 rounded-full animate-ping"
          :class="pingClass"
        ></div>
        
        <!-- Badge -->
        <div 
          v-if="badge"
          class="absolute -bottom-2 -right-2 px-2 py-1 rounded-full text-xs font-bold text-white"
          :class="badgeClass"
        >
          {{ badge }}
        </div>
      </div>
      
      <!-- Content -->
      <div class="text-center">
        <h3 class="text-2xl font-bold text-gray-800 mb-4 group-hover:text-transparent group-hover:bg-clip-text group-hover:bg-gradient-to-r transition-all duration-300" :class="titleHoverClass">
          {{ title }}
        </h3>
        
        <p class="text-gray-600 leading-relaxed mb-6">
          {{ description }}
        </p>
        
        <!-- Stats or Additional Info -->
        <div v-if="stats" class="flex justify-center items-center space-x-6 space-x-reverse mb-6">
          <div 
            v-for="stat in stats"
            :key="stat.label"
            class="text-center"
          >
            <div class="text-2xl font-bold" :class="statValueClass">{{ stat.value }}</div>
            <div class="text-sm text-gray-500">{{ stat.label }}</div>
          </div>
        </div>
        
        <!-- Action Button -->
        <button 
          v-if="actionText"
          @click="$emit('action', { title, description })"
          class="group-hover:scale-105 transition-transform duration-300 px-6 py-3 rounded-xl font-semibold"
          :class="buttonClass"
        >
          <i v-if="actionIcon" :class="actionIcon" class="mr-2"></i>
          {{ actionText }}
        </button>
        
        <!-- Link -->
        <router-link 
          v-else-if="linkTo"
          :to="linkTo"
          class="inline-block group-hover:scale-105 transition-transform duration-300 px-6 py-3 rounded-xl font-semibold"
          :class="buttonClass"
        >
          <i v-if="linkIcon" :class="linkIcon" class="mr-2"></i>
          {{ linkText || 'اعرف المزيد' }}
        </router-link>
      </div>
    </div>
    
    <!-- Hover Gradient Overlay -->
    <div 
      class="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none"
      :class="hoverOverlayClass"
    ></div>
  </div>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  title: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  icon: {
    type: String,
    required: true
  },
  theme: {
    type: String,
    default: 'blue',
    validator: (value) => ['blue', 'purple', 'green', 'orange', 'red', 'teal', 'pink', 'indigo'].includes(value)
  },
  variant: {
    type: String,
    default: 'default',
    validator: (value) => ['default', 'gradient', 'minimal'].includes(value)
  },
  showPing: {
    type: Boolean,
    default: false
  },
  badge: {
    type: String,
    default: null
  },
  stats: {
    type: Array,
    default: null
  },
  actionText: {
    type: String,
    default: null
  },
  actionIcon: {
    type: String,
    default: null
  },
  linkTo: {
    type: String,
    default: null
  },
  linkText: {
    type: String,
    default: null
  },
  linkIcon: {
    type: String,
    default: null
  }
})

const emit = defineEmits(['action'])

// Theme configurations
const themeConfig = {
  blue: {
    iconBg: 'bg-gradient-to-br from-blue-400 to-blue-600',
    ping: 'bg-blue-200',
    badge: 'bg-blue-500',
    titleHover: 'group-hover:from-blue-600 group-hover:to-blue-800',
    statValue: 'text-blue-600',
    button: 'bg-blue-100 text-blue-700 hover:bg-blue-200',
    hoverOverlay: 'bg-gradient-to-t from-blue-600/10 to-transparent',
    floating: 'bg-blue-500',
    pattern: 'radial-gradient(circle at 25% 25%, #3b82f6 2px, transparent 2px)'
  },
  purple: {
    iconBg: 'bg-gradient-to-br from-purple-400 to-purple-600',
    ping: 'bg-purple-200',
    badge: 'bg-purple-500',
    titleHover: 'group-hover:from-purple-600 group-hover:to-purple-800',
    statValue: 'text-purple-600',
    button: 'bg-purple-100 text-purple-700 hover:bg-purple-200',
    hoverOverlay: 'bg-gradient-to-t from-purple-600/10 to-transparent',
    floating: 'bg-purple-500',
    pattern: 'radial-gradient(circle at 25% 25%, #8b5cf6 2px, transparent 2px)'
  },
  green: {
    iconBg: 'bg-gradient-to-br from-green-400 to-green-600',
    ping: 'bg-green-200',
    badge: 'bg-green-500',
    titleHover: 'group-hover:from-green-600 group-hover:to-green-800',
    statValue: 'text-green-600',
    button: 'bg-green-100 text-green-700 hover:bg-green-200',
    hoverOverlay: 'bg-gradient-to-t from-green-600/10 to-transparent',
    floating: 'bg-green-500',
    pattern: 'radial-gradient(circle at 25% 25%, #10b981 2px, transparent 2px)'
  },
  orange: {
    iconBg: 'bg-gradient-to-br from-orange-400 to-orange-600',
    ping: 'bg-orange-200',
    badge: 'bg-orange-500',
    titleHover: 'group-hover:from-orange-600 group-hover:to-orange-800',
    statValue: 'text-orange-600',
    button: 'bg-orange-100 text-orange-700 hover:bg-orange-200',
    hoverOverlay: 'bg-gradient-to-t from-orange-600/10 to-transparent',
    floating: 'bg-orange-500',
    pattern: 'radial-gradient(circle at 25% 25%, #f97316 2px, transparent 2px)'
  },
  red: {
    iconBg: 'bg-gradient-to-br from-red-400 to-red-600',
    ping: 'bg-red-200',
    badge: 'bg-red-500',
    titleHover: 'group-hover:from-red-600 group-hover:to-red-800',
    statValue: 'text-red-600',
    button: 'bg-red-100 text-red-700 hover:bg-red-200',
    hoverOverlay: 'bg-gradient-to-t from-red-600/10 to-transparent',
    floating: 'bg-red-500',
    pattern: 'radial-gradient(circle at 25% 25%, #ef4444 2px, transparent 2px)'
  },
  teal: {
    iconBg: 'bg-gradient-to-br from-teal-400 to-teal-600',
    ping: 'bg-teal-200',
    badge: 'bg-teal-500',
    titleHover: 'group-hover:from-teal-600 group-hover:to-teal-800',
    statValue: 'text-teal-600',
    button: 'bg-teal-100 text-teal-700 hover:bg-teal-200',
    hoverOverlay: 'bg-gradient-to-t from-teal-600/10 to-transparent',
    floating: 'bg-teal-500',
    pattern: 'radial-gradient(circle at 25% 25%, #14b8a6 2px, transparent 2px)'
  },
  pink: {
    iconBg: 'bg-gradient-to-br from-pink-400 to-pink-600',
    ping: 'bg-pink-200',
    badge: 'bg-pink-500',
    titleHover: 'group-hover:from-pink-600 group-hover:to-pink-800',
    statValue: 'text-pink-600',
    button: 'bg-pink-100 text-pink-700 hover:bg-pink-200',
    hoverOverlay: 'bg-gradient-to-t from-pink-600/10 to-transparent',
    floating: 'bg-pink-500',
    pattern: 'radial-gradient(circle at 25% 25%, #ec4899 2px, transparent 2px)'
  },
  indigo: {
    iconBg: 'bg-gradient-to-br from-indigo-400 to-indigo-600',
    ping: 'bg-indigo-200',
    badge: 'bg-indigo-500',
    titleHover: 'group-hover:from-indigo-600 group-hover:to-indigo-800',
    statValue: 'text-indigo-600',
    button: 'bg-indigo-100 text-indigo-700 hover:bg-indigo-200',
    hoverOverlay: 'bg-gradient-to-t from-indigo-600/10 to-transparent',
    floating: 'bg-indigo-500',
    pattern: 'radial-gradient(circle at 25% 25%, #6366f1 2px, transparent 2px)'
  }
}

// Computed properties
const config = computed(() => themeConfig[props.theme])

const cardClass = computed(() => {
  if (props.variant === 'gradient') {
    return `bg-gradient-to-br from-${props.theme}-50 to-${props.theme}-100`
  }
  return 'bg-white'
})

const iconBgClass = computed(() => config.value.iconBg)
const pingClass = computed(() => config.value.ping)
const badgeClass = computed(() => config.value.badge)
const titleHoverClass = computed(() => config.value.titleHover)
const statValueClass = computed(() => config.value.statValue)
const buttonClass = computed(() => config.value.button)
const hoverOverlayClass = computed(() => config.value.hoverOverlay)
const floatingElementClass = computed(() => config.value.floating)

const backgroundPattern = computed(() => ({
  backgroundImage: config.value.pattern,
  backgroundSize: '50px 50px'
}))
</script>

