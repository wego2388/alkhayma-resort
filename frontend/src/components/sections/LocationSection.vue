<script setup lang="ts">
import { ref, onMounted } from 'vue'
import LuxSection from '@/components/ui/LuxSection.vue'
import LuxTitle from '@/components/ui/LuxTitle.vue'
import { IconMapPin, IconPhone, IconMail } from '@/components/icons'

const isVisible = ref(false)

onMounted(() => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        isVisible.value = true
      }
    })
  }, { threshold: 0.1 })

  const section = document.querySelector('#location-section')
  if (section) observer.observe(section)
})
</script>

<template>
  <LuxSection id="location-section" dark>
    <LuxTitle subtitle="LOCATION">
      Discover Our Paradise in Sharm El Sheikh
    </LuxTitle>

    <div class="grid md:grid-cols-2 gap-16 items-center">
      <!-- Info -->
      <div :class="['transition-all duration-1000', isVisible ? 'opacity-100 translate-x-0' : 'opacity-0 -translate-x-10']">
        <p class="text-white/80 text-lg leading-relaxed mb-8">
          Located on the pristine shores of the Red Sea in Sharm El Sheikh, El Kheima Resort offers
          luxury beachfront accommodations with private beach access and breathtaking sea views.
        </p>

        <div class="space-y-6">
          <a href="https://maps.google.com/?q=Sharm+El+Sheikh+Private+Beach" target="_blank" class="flex items-center gap-4 text-white hover:text-amber-400 transition group">
            <div class="w-12 h-12 rounded-full bg-amber-500/20 flex items-center justify-center flex-shrink-0 group-hover:bg-amber-500/30 transition">
              <IconMapPin class="w-6 h-6 text-amber-400" />
            </div>
            <div>
              <div class="text-sm text-white/60 mb-1">Address</div>
              <div class="font-semibold">Naama Bay, Sharm El Sheikh, South Sinai, Egypt</div>
            </div>
          </a>

          <a href="tel:+201000000000" class="flex items-center gap-4 text-white hover:text-amber-400 transition group">
            <div class="w-12 h-12 rounded-full bg-amber-500/20 flex items-center justify-center flex-shrink-0 group-hover:bg-amber-500/30 transition">
              <IconPhone class="w-6 h-6 text-amber-400" />
            </div>
            <div>
              <div class="text-sm text-white/60 mb-1">Phone</div>
              <div class="font-semibold">+20 XX XXXX XXXX</div>
            </div>
          </a>

          <a href="mailto:info@alkhaymaresort.com" class="flex items-center gap-4 text-white hover:text-amber-400 transition group">
            <div class="w-12 h-12 rounded-full bg-amber-500/20 flex items-center justify-center flex-shrink-0 group-hover:bg-amber-500/30 transition">
              <IconMail class="w-6 h-6 text-amber-400" />
            </div>
            <div>
              <div class="text-sm text-white/60 mb-1">Email</div>
              <div class="font-semibold">info@alkhaymaresort.com</div>
            </div>
          </a>
        </div>

        <!-- Quick Info -->
        <div class="mt-8 grid grid-cols-2 gap-4">
          <div class="bg-white/5 backdrop-blur-sm rounded-2xl p-4 border border-white/10">
            <div class="text-amber-400 text-2xl font-bold mb-1">20 min</div>
            <div class="text-white/60 text-sm">From Airport</div>
          </div>
          <div class="bg-white/5 backdrop-blur-sm rounded-2xl p-4 border border-white/10">
            <div class="text-amber-400 text-2xl font-bold mb-1">Private</div>
            <div class="text-white/60 text-sm">Beach Access</div>
          </div>
        </div>

        <!-- Nearby Attractions -->
        <div class="mt-8 space-y-3">
          <div class="text-white/40 text-sm uppercase tracking-wider mb-4">Nearby Attractions</div>
          <div class="flex items-center gap-3 text-white/70">
            <span class="text-amber-400">📍</span>
            <span>Ras Mohammed National Park - 24km</span>
          </div>
          <div class="flex items-center gap-3 text-white/70">
            <span class="text-amber-400">🏁</span>
            <span>Ghibli Raceway - 15 minutes</span>
          </div>
        </div>
      </div>

      <!-- Map -->
      <div :class="['transition-all duration-1000 delay-300', isVisible ? 'opacity-100 translate-x-0' : 'opacity-0 translate-x-10']">
        <div class="relative rounded-3xl overflow-hidden shadow-luxury-lg group">
          <!-- Animated Border -->
          <div class="absolute inset-0 bg-gradient-to-r from-amber-500 via-amber-400 to-amber-500 opacity-0 group-hover:opacity-100 transition-opacity duration-500 blur-xl"></div>
          
          <div class="relative bg-slate-900 rounded-3xl overflow-hidden">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3456.789!2d34.329869!3d27.915752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjfCsDU0JzU2LjciTiAzNMKwMTknNDcuNSJF!5e0!3m2!1sen!2seg!4v1234567890"
              width="100%"
              height="450"
              style="border:0;"
              loading="lazy"
              allowfullscreen
              class="grayscale hover:grayscale-0 transition-all duration-500"
            ></iframe>
          </div>
        </div>

        <!-- Directions Button -->
        <div class="mt-6 text-center">
          <a 
            href="https://maps.google.com/?q=27.915752,34.329869" 
            target="_blank"
            class="inline-flex items-center gap-2 px-6 py-3 bg-amber-500 hover:bg-amber-600 text-white rounded-full font-semibold transition-all duration-300 hover:scale-105 shadow-lg hover:shadow-amber-500/50"
          >
            <IconMapPin class="w-5 h-5" />
            Get Directions
          </a>
        </div>
      </div>
    </div>
  </LuxSection>
</template>
