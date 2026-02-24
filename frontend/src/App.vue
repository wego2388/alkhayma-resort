<template>
  <div class="min-h-screen flex flex-col">
    <!-- Scroll Progress Indicator -->
    <div 
      class="fixed top-0 left-0 h-1 bg-gradient-to-r from-amber-500 to-amber-600 z-[100] transition-all duration-300"
      :style="{ width: `${scrollProgress}%` }"
    ></div>

    <!-- Skip to main content link -->
    <a 
      href="#main-content" 
      class="sr-only focus:not-sr-only focus:absolute focus:top-4 focus:left-4 focus:z-[200] focus:px-6 focus:py-3 focus:bg-amber-500 focus:text-white focus:rounded-lg focus:shadow-lg"
    >
      Skip to main content
    </a>
    
    <Navbar />
    <main id="main-content" class="flex-grow">
      <router-view />
    </main>
    <Footer />
    <WhatsAppWidget />
    <LiveCounter :base-count="12" :recent-bookings="5" />
    
    <!-- Toast Container -->
    <div class="fixed top-4 right-4 z-[100] space-y-2" role="alert" aria-live="polite">
      <Toast 
        v-for="toast in toasts" 
        :key="toast.id"
        :type="toast.type"
        :message="toast.message"
        :description="toast.description"
        @close="removeToast(toast.id)"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import { onMounted } from 'vue'
import Navbar from '@/components/Navbar.vue'
import Footer from '@/components/Footer.vue'
import WhatsAppWidget from '@/components/WhatsAppWidget.vue'
import Toast from '@/components/Toast.vue'
import LiveCounter from '@/components/LiveCounter.vue'
import { useAuthStore } from '@/stores/auth'
import { useToast } from '@/composables/useToast'
import { useScrollProgress } from '@/composables/useScrollProgress'

const authStore = useAuthStore()
const { toasts, remove: removeToast } = useToast()
const { progress: scrollProgress } = useScrollProgress()

onMounted(() => {
  if (authStore.token) {
    authStore.fetchUser()
  }
})
</script>
