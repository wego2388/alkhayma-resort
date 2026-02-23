<template>
  <nav class="bg-white shadow-md sticky top-0 z-50">
    <div class="container mx-auto px-4">
      <div class="flex justify-between items-center h-16">
        <!-- Logo -->
        <router-link to="/" class="text-2xl font-bold text-primary-600">
          {{ isRTL ? 'الخيمة' : 'Al Khayma' }}
        </router-link>

        <!-- Desktop Menu -->
        <div class="hidden md:flex items-center space-x-6 rtl:space-x-reverse">
          <router-link v-for="link in navLinks" :key="link.path" :to="link.path"
            class="hover:text-primary-600 transition-colors">
            {{ t(link.label) }}
          </router-link>

          <!-- Language Toggle -->
          <button @click="toggleLocale" class="px-3 py-1 border rounded-lg hover:bg-gray-100">
            {{ currentLocale === 'en' ? 'ع' : 'EN' }}
          </button>

          <!-- Auth Links -->
          <template v-if="isAuthenticated">
            <router-link to="/account" class="hover:text-primary-600">
              {{ t('nav.account') }}
            </router-link>
            <button @click="handleLogout" class="btn-primary">
              {{ t('nav.logout') }}
            </button>
          </template>
          <template v-else>
            <router-link to="/login" class="hover:text-primary-600">
              {{ t('nav.login') }}
            </router-link>
            <router-link to="/register" class="btn-primary">
              {{ t('nav.register') }}
            </router-link>
          </template>
        </div>

        <!-- Mobile Menu Button -->
        <button @click="mobileMenuOpen = !mobileMenuOpen" class="md:hidden">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
        </button>
      </div>

      <!-- Mobile Menu -->
      <div v-if="mobileMenuOpen" class="md:hidden py-4 space-y-2">
        <router-link v-for="link in navLinks" :key="link.path" :to="link.path"
          class="block py-2 hover:text-primary-600" @click="mobileMenuOpen = false">
          {{ t(link.label) }}
        </router-link>
      </div>
    </div>
  </nav>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useAuthStore } from '@/stores/auth'
import { useAppStore } from '@/stores/app'

const { t } = useI18n()
const router = useRouter()
const authStore = useAuthStore()
const appStore = useAppStore()

const mobileMenuOpen = ref(false)
const isAuthenticated = computed(() => authStore.isAuthenticated)
const currentLocale = computed(() => appStore.currentLocale)
const isRTL = computed(() => appStore.isRTL)

const navLinks = [
  { path: '/', label: 'nav.home' },
  { path: '/rooms', label: 'nav.rooms' },
  { path: '/restaurant', label: 'nav.restaurant' },
  { path: '/activities', label: 'nav.activities' },
  { path: '/about', label: 'nav.about' },
  { path: '/contact', label: 'nav.contact' }
]

function toggleLocale() {
  appStore.setLocale(currentLocale.value === 'en' ? 'ar' : 'en')
}

function handleLogout() {
  authStore.logout()
  router.push('/')
}
</script>
