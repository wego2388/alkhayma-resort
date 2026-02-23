<template>
  <div class="min-h-screen flex flex-col">
    <Navbar />
    <main class="flex-grow">
      <router-view />
    </main>
    <Footer />
    <WhatsAppButton />
    
    <!-- Toast Container -->
    <div class="fixed top-4 right-4 z-[100] space-y-2">
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
import WhatsAppButton from '@/components/WhatsAppButton.vue'
import Toast from '@/components/Toast.vue'
import { useAuthStore } from '@/stores/auth'
import { useToast } from '@/composables/useToast'

const authStore = useAuthStore()
const { toasts, remove: removeToast } = useToast()

onMounted(() => {
  if (authStore.token) {
    authStore.fetchUser()
  }
})
</script>
