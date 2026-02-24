<template>
  <nav class="fixed top-0 left-0 right-0 z-50 transition-all duration-300" :class="scrolled ? 'bg-white/95 backdrop-blur-lg shadow-xl' : 'bg-transparent'">
    <div class="container mx-auto px-4">
      <div class="flex items-center justify-between h-20">
        <!-- Logo -->
        <router-link to="/" class="flex items-center space-x-3 space-x-reverse group">
          <div class="w-12 h-12 bg-gradient-to-br from-blue-600 to-purple-600 rounded-xl flex items-center justify-center group-hover:scale-110 transition-transform duration-300">
            <i class="fas fa-umbrella-beach text-white text-xl"></i>
          </div>
          <div>
            <h1 class="text-xl font-black" :class="scrolled ? 'text-gray-800' : 'text-white'">
              الخيمة بيتش ريزورت
            </h1>
            <p class="text-xs opacity-75" :class="scrolled ? 'text-gray-600' : 'text-blue-100'">
              Luxury Beach Resort
            </p>
          </div>
        </router-link>

        <!-- Desktop Navigation -->
        <div class="hidden lg:flex items-center space-x-8 space-x-reverse">
          <router-link
            to="/"
            class="nav-link"
            :class="scrolled ? 'text-gray-700 hover:text-blue-600' : 'text-white hover:text-blue-200'"
          >
            <i class="fas fa-home mr-2"></i>
            الرئيسية
          </router-link>

          <router-link
            to="/rooms"
            class="nav-link"
            :class="scrolled ? 'text-gray-700 hover:text-blue-600' : 'text-white hover:text-blue-200'"
          >
            <i class="fas fa-bed mr-2"></i>
            الغرف والأجنحة
          </router-link>

          <router-link
            to="/restaurant"
            class="nav-link"
            :class="scrolled ? 'text-gray-700 hover:text-blue-600' : 'text-white hover:text-blue-200'"
          >
            <i class="fas fa-utensils mr-2"></i>
            المطعم والكافيه
          </router-link>

          <router-link
            to="/products"
            class="nav-link"
            :class="scrolled ? 'text-gray-700 hover:text-blue-600' : 'text-white hover:text-blue-200'"
          >
            <i class="fas fa-shopping-bag mr-2"></i>
            المنتجات والخدمات
          </router-link>

          <router-link
            to="/activities"
            class="nav-link"
            :class="scrolled ? 'text-gray-700 hover:text-blue-600' : 'text-white hover:text-blue-200'"
          >
            <i class="fas fa-swimmer mr-2"></i>
            الأنشطة
          </router-link>

          <router-link
            to="/gallery"
            class="nav-link"
            :class="scrolled ? 'text-gray-700 hover:text-blue-600' : 'text-white hover:text-blue-200'"
          >
            <i class="fas fa-images mr-2"></i>
            معرض الصور
          </router-link>

          <router-link
            to="/about"
            class="nav-link"
            :class="scrolled ? 'text-gray-700 hover:text-blue-600' : 'text-white hover:text-blue-200'"
          >
            <i class="fas fa-info-circle mr-2"></i>
            عن المنتجع
          </router-link>

          <router-link
            to="/contact"
            class="nav-link"
            :class="scrolled ? 'text-gray-700 hover:text-blue-600' : 'text-white hover:text-blue-200'"
          >
            <i class="fas fa-phone mr-2"></i>
            تواصل معنا
          </router-link>

          <!-- Book Now Button -->
          <router-link
            to="/rooms"
            class="bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white px-6 py-3 rounded-full font-bold transition-all duration-300 transform hover:scale-105 shadow-lg"
          >
            احجز الآن
          </router-link>
        </div>

        <!-- Mobile Menu Button -->
        <button
          @click="mobileMenuOpen = !mobileMenuOpen"
          class="lg:hidden p-2 rounded-lg"
          :class="scrolled ? 'text-gray-700 hover:bg-gray-100' : 'text-white hover:bg-white/10'"
        >
          <i class="fas fa-bars text-xl"></i>
        </button>
      </div>

      <!-- Mobile Menu -->
      <div v-if="mobileMenuOpen" class="lg:hidden bg-white shadow-xl rounded-2xl mt-2 p-6">
        <div class="space-y-4">
          <router-link
            to="/"
            @click="mobileMenuOpen = false"
            class="block text-gray-700 hover:text-blue-600 font-semibold py-2"
          >
            <i class="fas fa-home mr-3"></i>
            الرئيسية
          </router-link>

          <router-link
            to="/rooms"
            @click="mobileMenuOpen = false"
            class="block text-gray-700 hover:text-blue-600 font-semibold py-2"
          >
            <i class="fas fa-bed mr-3"></i>
            الغرف والأجنحة
          </router-link>

          <router-link
            to="/restaurant"
            @click="mobileMenuOpen = false"
            class="block text-gray-700 hover:text-blue-600 font-semibold py-2"
          >
            <i class="fas fa-utensils mr-3"></i>
            المطعم والكافيه
          </router-link>

          <router-link
            to="/activities"
            @click="mobileMenuOpen = false"
            class="block text-gray-700 hover:text-blue-600 font-semibold py-2"
          >
            <i class="fas fa-swimmer mr-3"></i>
            الأنشطة
          </router-link>

          <router-link
            to="/gallery"
            @click="mobileMenuOpen = false"
            class="block text-gray-700 hover:text-blue-600 font-semibold py-2"
          >
            <i class="fas fa-images mr-3"></i>
            معرض الصور
          </router-link>

          <router-link
            to="/about"
            @click="mobileMenuOpen = false"
            class="block text-gray-700 hover:text-blue-600 font-semibold py-2"
          >
            <i class="fas fa-info-circle mr-3"></i>
            عن المنتجع
          </router-link>

          <router-link
            to="/contact"
            @click="mobileMenuOpen = false"
            class="block text-gray-700 hover:text-blue-600 font-semibold py-2"
          >
            <i class="fas fa-phone mr-3"></i>
            تواصل معنا
          </router-link>

          <router-link
            to="/rooms"
            @click="mobileMenuOpen = false"
            class="block bg-gradient-to-r from-blue-600 to-purple-600 text-white px-6 py-3 rounded-full font-bold text-center mt-4"
          >
            احجز الآن
          </router-link>
        </div>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const scrolled = ref(false)
const mobileMenuOpen = ref(false)

const handleScroll = () => {
  scrolled.value = window.scrollY > 50
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>


