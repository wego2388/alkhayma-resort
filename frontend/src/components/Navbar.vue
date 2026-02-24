<template>
  <nav 
    class="fixed top-0 left-0 right-0 z-50 transition-all duration-500"
    :class="scrolled ? 'glass-dark shadow-lg' : 'bg-transparent'"
  >
    <div class="container mx-auto px-4">
      <div class="flex justify-between items-center h-20">
        <!-- Logo -->
        <router-link 
          to="/" 
          class="font-display text-2xl font-bold transition-colors"
          :class="scrolled ? 'text-white' : 'text-white'"
        >
          {{ isRTL ? 'الخيمة' : 'El Kheima' }}
        </router-link>

        <!-- Desktop Menu -->
        <div class="hidden md:flex items-center space-x-8 rtl:space-x-reverse">
          <router-link 
            v-for="link in navLinks" 
            :key="link.path" 
            :to="link.path"
            class="font-medium transition-all hover:text-amber-400"
            :class="scrolled ? 'text-white' : 'text-white'"
          >
            {{ t(link.label) }}
          </router-link>

          <!-- Language Toggle -->
          <button 
            @click="toggleLocale" 
            class="px-4 py-2 rounded-full border transition-all"
            :class="scrolled ? 'border-white/30 text-white hover:bg-white/10' : 'border-white/50 text-white hover:bg-white/20'"
          >
            {{ currentLocale === 'en' ? 'ع' : 'EN' }}
          </button>

          <!-- Auth Links -->
          <template v-if="isAuthenticated && isAdmin">
            <router-link 
              to="/dashboard" 
              class="font-medium transition-colors hover:text-amber-400"
              :class="scrolled ? 'text-white' : 'text-white'"
            >
              {{ isRTL ? 'لوحة التحكم' : 'Dashboard' }}
            </router-link>
            <button 
              @click="handleLogout" 
              class="px-6 py-2 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-full font-semibold hover:shadow-lg transition-all"
            >
              {{ t('nav.logout') }}
            </button>
          </template>
          <template v-else>
            <router-link 
              to="/dashboard" 
              class="px-6 py-2 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-full font-semibold hover:shadow-lg transition-all"
            >
              {{ isRTL ? 'لوحة التحكم' : 'Dashboard' }}
            </router-link>
          </template>
        </div>

        <!-- Mobile Menu Button -->
        <button 
          @click="mobileMenuOpen = !mobileMenuOpen" 
          class="md:hidden w-10 h-10 flex flex-col items-center justify-center gap-1.5 transition-colors relative z-50"
          :class="scrolled ? 'text-white' : 'text-white'"
          aria-label="Menu"
        >
          <span 
            class="w-6 h-0.5 bg-current transition-all duration-300 rounded-full"
            :class="mobileMenuOpen ? 'rotate-45 translate-y-2' : ''"
          ></span>
          <span 
            class="w-6 h-0.5 bg-current transition-all duration-300 rounded-full"
            :class="mobileMenuOpen ? 'opacity-0' : ''"
          ></span>
          <span 
            class="w-6 h-0.5 bg-current transition-all duration-300 rounded-full"
            :class="mobileMenuOpen ? '-rotate-45 -translate-y-2' : ''"
          ></span>
        </button>
      </div>

      <!-- Mobile Menu Overlay -->
      <Transition name="fade">
        <div 
          v-if="mobileMenuOpen" 
          class="fixed inset-0 bg-black/60 backdrop-blur-sm z-40 md:hidden"
          @click="mobileMenuOpen = false"
        ></div>
      </Transition>

      <!-- Mobile Menu Drawer -->
      <Transition name="slide">
        <div 
          v-if="mobileMenuOpen" 
          class="fixed top-0 right-0 bottom-0 w-80 bg-gradient-to-br from-slate-900 via-blue-900 to-slate-800 z-40 md:hidden overflow-y-auto"
          :class="isRTL ? 'left-0 right-auto' : 'right-0 left-auto'"
        >
          <div class="p-8 pt-24">
            <!-- Logo -->
            <div class="font-display text-3xl font-bold text-white mb-12 text-center">
              {{ isRTL ? 'الخيمة' : 'El Kheima' }}
            </div>

            <!-- Menu Links -->
            <nav class="space-y-2">
              <router-link 
                v-for="link in navLinks" 
                :key="link.path" 
                :to="link.path"
                class="block py-4 px-6 text-white hover:bg-white/10 rounded-xl transition-all font-medium text-lg"
                @click="mobileMenuOpen = false"
              >
                {{ t(link.label) }}
              </router-link>
            </nav>

            <!-- Divider -->
            <div class="h-px bg-white/20 my-8"></div>

            <!-- Language Toggle -->
            <button 
              @click="toggleLocale" 
              class="w-full py-4 px-6 rounded-xl border border-white/30 text-white hover:bg-white/10 transition-all font-medium mb-4"
            >
              {{ currentLocale === 'en' ? 'العربية' : 'English' }}
            </button>

            <!-- Auth Links -->
            <template v-if="isAuthenticated && isAdmin">
              <router-link 
                to="/dashboard" 
                class="block py-4 px-6 text-white hover:bg-white/10 rounded-xl transition-all font-medium mb-2"
                @click="mobileMenuOpen = false"
              >
                {{ isRTL ? 'لوحة التحكم' : 'Dashboard' }}
              </router-link>
              <button 
                @click="handleLogout" 
                class="w-full py-4 px-6 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-xl font-semibold hover:shadow-lg transition-all"
              >
                {{ t('nav.logout') }}
              </button>
            </template>
            <template v-else>
              <router-link 
                to="/dashboard" 
                class="block py-4 px-6 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-xl font-semibold hover:shadow-lg transition-all text-center"
                @click="mobileMenuOpen = false"
              >
                {{ isRTL ? 'لوحة التحكم' : 'Dashboard' }}
              </router-link>
            </template>
          </div>
        </div>
      </Transition>
    </div>
  </nav>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useAuthStore } from '@/stores/auth'
import { useAppStore } from '@/stores/app'

const { t } = useI18n()
const router = useRouter()
const authStore = useAuthStore()
const appStore = useAppStore()

const mobileMenuOpen = ref(false)
const scrolled = ref(false)

const isAuthenticated = computed(() => authStore.isAuthenticated)
const isAdmin = computed(() => authStore.isAdmin)
const currentLocale = computed(() => appStore.currentLocale)
const isRTL = computed(() => appStore.isRTL)

const navLinks = [
  { path: '/', label: 'nav.home' },
  { path: '/rooms', label: 'nav.rooms' },
  { path: '/restaurant', label: 'nav.restaurant' },
  { path: '/packages', label: 'nav.packages' },
  { path: '/activities', label: 'nav.activities' },
  { path: '/events', label: 'nav.events' },
  { path: '/gallery', label: 'nav.gallery' },
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

function handleScroll() {
  scrolled.value = window.scrollY > 50
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
/* Fade Transition */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* Slide Transition */
.slide-enter-active,
.slide-leave-active {
  transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.slide-enter-from {
  transform: translateX(100%);
}

.slide-leave-to {
  transform: translateX(100%);
}

[dir="rtl"] .slide-enter-from {
  transform: translateX(-100%);
}

[dir="rtl"] .slide-leave-to {
  transform: translateX(-100%);
}
</style>
