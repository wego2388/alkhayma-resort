<script setup lang="ts">
import { ref, onMounted } from 'vue'
import LuxSection from '@/components/ui/LuxSection.vue'
import LuxTitle from '@/components/ui/LuxTitle.vue'

const socials = [
  { 
    name: 'Instagram', 
    url: 'https://instagram.com/alkhaymaresort', 
    color: 'hover:bg-gradient-to-br hover:from-purple-500 hover:via-pink-500 hover:to-orange-500',
    followers: '12.5K',
    icon: 'M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z'
  },
  { 
    name: 'Facebook', 
    url: 'https://facebook.com/alkhaymaresort', 
    color: 'hover:bg-blue-600',
    followers: '8.2K',
    icon: 'M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z'
  },
  { 
    name: 'YouTube', 
    url: 'https://youtube.com/@alkhaymaresort', 
    color: 'hover:bg-red-600',
    followers: '3.4K',
    icon: 'M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z'
  },
  { 
    name: 'TikTok', 
    url: 'https://tiktok.com/@alkhaymaresort', 
    color: 'hover:bg-black',
    followers: '15.8K',
    icon: 'M19.59 6.69a4.83 4.83 0 0 1-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 0 1-5.2 1.74 2.89 2.89 0 0 1 2.31-4.64 2.93 2.93 0 0 1 .88.13V9.4a6.84 6.84 0 0 0-1-.05A6.33 6.33 0 0 0 5 20.1a6.34 6.34 0 0 0 10.86-4.43v-7a8.16 8.16 0 0 0 4.77 1.52v-3.4a4.85 4.85 0 0 1-1-.1z'
  }
]

const isVisible = ref(false)

onMounted(() => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        isVisible.value = true
      }
    })
  }, { threshold: 0.1 })

  const section = document.querySelector('#social-section')
  if (section) observer.observe(section)
})
</script>

<template>
  <LuxSection id="social-section" dark>
    <LuxTitle subtitle="STAY CONNECTED">
      Follow Our Journey
    </LuxTitle>

    <p class="text-center text-white/70 text-lg max-w-2xl mx-auto mb-12">
      Join our community of travelers and get daily inspiration, exclusive offers, and behind-the-scenes content
    </p>

    <!-- Social Icons -->
    <div class="flex flex-wrap justify-center gap-6 mb-12">
      <a
        v-for="(social, i) in socials"
        :key="social.name"
        :href="social.url"
        target="_blank"
        rel="noopener noreferrer"
        :class="[
          'group relative flex flex-col items-center gap-3 p-6 rounded-2xl',
          'bg-white/10 backdrop-blur-sm border border-white/20',
          'transition-all duration-500 hover:scale-110 hover:border-white/40',
          'hover:shadow-2xl',
          isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'
        ]"
        :style="{ transitionDelay: `${i * 100}ms` }"
        :aria-label="social.name"
      >
        <!-- Icon Circle -->
        <div :class="['w-16 h-16 flex items-center justify-center rounded-full transition-all duration-500', social.color, 'bg-white/10']">
          <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 24 24">
            <path :d="social.icon" />
          </svg>
        </div>

        <!-- Name & Followers -->
        <div class="text-center">
          <div class="text-white font-semibold mb-1">{{ social.name }}</div>
          <div class="text-amber-400 text-sm font-bold">{{ social.followers }}</div>
        </div>

        <!-- Hover Effect -->
        <div class="absolute inset-0 rounded-2xl bg-gradient-to-br from-amber-500/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 pointer-events-none"></div>
      </a>
    </div>

    <!-- Hashtag & CTA -->
    <div class="text-center space-y-6">
      <div>
        <p class="text-white/60 text-sm mb-2">Share your experience with</p>
        <p class="text-amber-400 text-2xl font-bold tracking-wider">#AlKhaymaResort</p>
      </div>

      <!-- Instagram Feed Preview -->
      <div class="max-w-4xl mx-auto">
        <div class="bg-white/5 backdrop-blur-sm rounded-3xl p-8 border border-white/10">
          <div class="flex items-center justify-between mb-6">
            <h3 class="text-white text-xl font-semibold">Latest from Instagram</h3>
            <a 
              href="https://instagram.com/alkhaymaresort" 
              target="_blank"
              class="text-amber-400 hover:text-amber-300 text-sm font-semibold transition"
            >
              View All →
            </a>
          </div>

          <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div v-for="i in 4" :key="i" class="aspect-square rounded-xl bg-white/10 overflow-hidden group cursor-pointer">
              <div class="w-full h-full bg-gradient-to-br from-slate-800 to-slate-900 group-hover:scale-110 transition-transform duration-500 flex items-center justify-center">
                <svg class="w-12 h-12 text-white/20" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z" />
                </svg>
              </div>
            </div>
          </div>

          <p class="text-white/50 text-xs text-center mt-4">
            Connect your Instagram to display live feed
          </p>
        </div>
      </div>
    </div>
  </LuxSection>
</template>
