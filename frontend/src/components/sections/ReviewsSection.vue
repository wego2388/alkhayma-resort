<script setup lang="ts">
import { ref, onMounted } from 'vue'
import LuxSection from '@/components/ui/LuxSection.vue'
import LuxTitle from '@/components/ui/LuxTitle.vue'
import LuxCard from '@/components/ui/LuxCard.vue'
import { IconStar } from '@/components/icons'

const reviews = [
  {
    name: 'Sarah Mitchell',
    rating: 5,
    text: 'The private beach is absolutely stunning! Crystal clear water, pristine sand, and exceptional service. The Italian restaurant exceeded all expectations.',
    source: 'TripAdvisor',
    location: 'London, UK'
  },
  {
    name: 'Ahmed Al-Masri',
    rating: 5,
    text: 'أفضل منتجع في شرم الشيخ! الشاطئ الخاص رائع والخدمة ممتازة. المطعم الإيطالي تحفة فنية. سنعود بالتأكيد!',
    source: 'Google Reviews',
    location: 'Cairo, Egypt'
  },
  {
    name: 'Emily Rodriguez',
    rating: 5,
    text: 'Perfect honeymoon destination! The sunset views from our suite were breathtaking. Staff went above and beyond to make our stay unforgettable.',
    source: 'Booking.com',
    location: 'Madrid, Spain'
  }
]

const displayRating = ref(0)
const displayGuests = ref(0)
const isVisible = ref(false)

onMounted(() => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting && !isVisible.value) {
        isVisible.value = true
        animateCounters()
      }
    })
  }, { threshold: 0.2 })

  const section = document.querySelector('#reviews-section')
  if (section) observer.observe(section)
})

const animateCounters = () => {
  const duration = 2000
  const targetRating = 4.7
  const targetGuests = 487
  const steps = 60
  const ratingIncrement = targetRating / steps
  const guestsIncrement = targetGuests / steps
  
  let currentStep = 0
  const interval = setInterval(() => {
    currentStep++
    displayRating.value = Math.min(currentStep * ratingIncrement, targetRating)
    displayGuests.value = Math.min(Math.floor(currentStep * guestsIncrement), targetGuests)
    
    if (currentStep >= steps) clearInterval(interval)
  }, duration / steps)
}
</script>

<template>
  <LuxSection id="reviews-section">
    <LuxTitle subtitle="GUEST REVIEWS">
      Loved by Travelers Worldwide
    </LuxTitle>

    <!-- Overall Rating Summary -->
    <div class="max-w-3xl mx-auto mb-16">
      <div class="bg-gradient-to-br from-amber-50 to-white rounded-3xl p-10 shadow-luxury-lg border border-amber-100">
        <div class="flex flex-col md:flex-row items-center justify-center gap-8">
          <!-- Rating Number -->
          <div class="text-center">
            <div class="text-7xl font-bold bg-gradient-to-br from-amber-500 to-amber-600 bg-clip-text text-transparent mb-2">
              {{ displayRating.toFixed(1) }}
            </div>
            <div class="flex gap-1 justify-center mb-2">
              <IconStar v-for="i in 5" :key="i" class="w-6 h-6 text-amber-500 fill-current" />
            </div>
            <p class="text-sm text-slate-500">Excellent Rating</p>
          </div>

          <!-- Divider -->
          <div class="hidden md:block w-px h-20 bg-slate-200"></div>

          <!-- Stats -->
          <div class="text-center">
            <div class="text-4xl font-bold text-slate-900 mb-2">
              #1
            </div>
            <p class="text-slate-600 mb-1 font-semibold">Ranked #1 of 8</p>
            <p class="text-xs text-slate-400">In the area</p>
          </div>

          <!-- Divider -->
          <div class="hidden md:block w-px h-20 bg-slate-200"></div>

          <!-- Trust Badges -->
          <div class="text-center">
            <div class="text-4xl font-bold text-slate-900 mb-2">
              💕
            </div>
            <p class="text-slate-600 mb-1 font-semibold">Loved by Couples</p>
            <p class="text-xs text-slate-400">Top rated for romance</p>
          </div>
        </div>

        <!-- Detailed Scores -->
        <div class="mt-8 pt-8 border-t border-slate-200">
          <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div class="text-center">
              <div class="text-2xl font-bold text-amber-600 mb-1">4.9</div>
              <p class="text-xs text-slate-600">Location</p>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold text-amber-600 mb-1">4.9</div>
              <p class="text-xs text-slate-600">Cleanliness</p>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold text-amber-600 mb-1">4.9</div>
              <p class="text-xs text-slate-600">Service</p>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold text-amber-600 mb-1">4.9</div>
              <p class="text-xs text-slate-600">Sleep Quality</p>
            </div>
          </div>
        </div>

        <!-- Trust Logos -->
        <div class="mt-8 pt-8 border-t border-slate-200">
          <div class="flex flex-wrap items-center justify-center gap-6">
            <div class="text-xs font-semibold text-slate-400 uppercase tracking-wider">Featured on:</div>
            <div class="flex flex-wrap gap-6 items-center">
              <div class="flex items-center gap-2">
                <div class="w-8 h-8 rounded-full bg-green-500 flex items-center justify-center">
                  <IconStar class="w-4 h-4 text-white fill-current" />
                </div>
                <span class="text-sm font-bold text-slate-700">TripAdvisor</span>
              </div>
              <div class="flex items-center gap-2">
                <div class="w-8 h-8 rounded-full bg-blue-500 flex items-center justify-center text-white text-xs font-bold">G</div>
                <span class="text-sm font-bold text-slate-700">Google</span>
              </div>
              <div class="flex items-center gap-2">
                <div class="w-8 h-8 rounded-full bg-blue-600 flex items-center justify-center text-white text-xs font-bold">B</div>
                <span class="text-sm font-bold text-slate-700">Booking.com</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Reviews Grid -->
    <div class="grid md:grid-cols-3 gap-8">
      <div
        v-for="(review, i) in reviews"
        :key="i"
        :class="['transition-all duration-700', isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10']"
        :style="{ transitionDelay: `${i * 150}ms` }"
      >
        <LuxCard hover class="h-full">
          <div class="p-8 flex flex-col h-full">
            <!-- Stars -->
            <div class="flex gap-1 mb-4">
              <IconStar v-for="j in review.rating" :key="j" class="w-5 h-5 text-amber-500 fill-current" />
            </div>

            <!-- Review Text -->
            <p class="text-slate-600 leading-relaxed mb-6 flex-grow">
              "{{ review.text }}"
            </p>

            <!-- Author -->
            <div class="border-t border-slate-100 pt-4">
              <div class="font-semibold text-slate-900 mb-1">
                {{ review.name }}
              </div>
              <div class="text-sm text-slate-400 mb-1">
                {{ review.location }}
              </div>
              <div class="flex items-center gap-2 text-xs text-slate-500">
                <span>via</span>
                <span class="font-semibold text-amber-600">{{ review.source }}</span>
              </div>
            </div>
          </div>
        </LuxCard>
      </div>
    </div>

    <!-- CTA -->
    <div class="mt-16 text-center">
      <div class="inline-flex flex-col items-center gap-4">
        <div class="flex items-center gap-3 px-8 py-4 bg-gradient-to-r from-amber-50 to-amber-100 rounded-full border border-amber-200">
          <div class="flex gap-1">
            <IconStar v-for="i in 5" :key="i" class="w-6 h-6 text-amber-500 fill-current" />
          </div>
          <div class="text-slate-900 font-semibold">
            Rated 5.0 on TripAdvisor
          </div>
        </div>
        
        <a 
          href="https://www.tripadvisor.com/alkhaymaresort" 
          target="_blank"
          class="text-sm text-amber-600 hover:text-amber-700 font-semibold hover:underline transition"
        >
          Read all {{ displayGuests }}+ reviews →
        </a>
      </div>
    </div>
  </LuxSection>
</template>
