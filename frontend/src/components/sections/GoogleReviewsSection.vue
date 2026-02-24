<template>
  <section class="relative py-24 bg-gradient-to-br from-slate-50 to-white overflow-hidden">
    <div class="container mx-auto px-6 max-w-7xl">
      <!-- Section Header -->
      <div class="text-center mb-16">
        <p class="text-amber-500 text-sm tracking-[0.3em] uppercase mb-4">
          {{ isRTL ? 'آراء الضيوف' : 'Guest Reviews' }}
        </p>
        <h2 class="font-display text-5xl md:text-6xl font-bold text-slate-900 mb-6">
          {{ isRTL ? 'ماذا يقول ضيوفنا' : 'What Our Guests Say' }}
        </h2>
        <div class="flex items-center justify-center gap-4 mb-6">
          <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
          <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
          <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
        </div>
      </div>

      <!-- Google Rating Summary -->
      <div class="max-w-4xl mx-auto mb-16">
        <div class="bg-white rounded-3xl p-10 shadow-luxury-lg border border-slate-100">
          <div class="flex flex-col md:flex-row items-center justify-center gap-8">
            <!-- Google Logo & Rating -->
            <div class="text-center">
              <div class="flex items-center justify-center gap-2 mb-3">
                <svg class="w-8 h-8" viewBox="0 0 24 24">
                  <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                  <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                  <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                  <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                </svg>
                <span class="text-2xl font-bold text-slate-900">Google</span>
              </div>
              <div class="text-6xl font-bold bg-gradient-to-br from-amber-500 to-amber-600 bg-clip-text text-transparent mb-2">
                {{ googleRating }}
              </div>
              <div class="flex gap-1 justify-center mb-2">
                <svg v-for="i in 5" :key="i" class="w-6 h-6 text-amber-500 fill-current" viewBox="0 0 20 20">
                  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
              </div>
              <p class="text-sm text-slate-500">{{ totalReviews }} {{ isRTL ? 'تقييم' : 'reviews' }}</p>
            </div>

            <!-- Divider -->
            <div class="hidden md:block w-px h-32 bg-slate-200"></div>

            <!-- Ranking Badge -->
            <div class="text-center">
              <div class="w-20 h-20 bg-gradient-to-br from-amber-500 to-amber-600 rounded-full flex items-center justify-center mx-auto mb-3">
                <span class="text-3xl font-bold text-white">#1</span>
              </div>
              <p class="text-lg font-semibold text-slate-900 mb-1">
                {{ isRTL ? 'المرتبة #1' : 'Ranked #1' }}
              </p>
              <p class="text-sm text-slate-500">
                {{ isRTL ? 'من 8 منتجعات' : 'of 8 resorts' }}
              </p>
            </div>

            <!-- Divider -->
            <div class="hidden md:block w-px h-32 bg-slate-200"></div>

            <!-- Trust Badge -->
            <div class="text-center">
              <div class="text-5xl mb-3">💕</div>
              <p class="text-lg font-semibold text-slate-900 mb-1">
                {{ isRTL ? 'محبوب من الأزواج' : 'Loved by Couples' }}
              </p>
              <p class="text-sm text-slate-500">
                {{ isRTL ? 'تقييم عالي للرومانسية' : 'Top rated for romance' }}
              </p>
            </div>
          </div>
        </div>
      </div>

      <!-- Reviews Grid -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
        <div 
          v-for="(review, index) in reviews" 
          :key="index"
          class="bg-white rounded-3xl p-8 shadow-lg hover:shadow-luxury-lg transition-all duration-500 hover:-translate-y-2"
        >
          <!-- Stars -->
          <div class="flex gap-1 mb-4">
            <svg v-for="i in review.rating" :key="i" class="w-5 h-5 text-amber-500 fill-current" viewBox="0 0 20 20">
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
          </div>

          <!-- Review Text -->
          <p class="text-slate-700 leading-relaxed mb-6">
            "{{ review.text }}"
          </p>

          <!-- Reviewer Info -->
          <div class="flex items-center gap-3 pt-6 border-t border-slate-100">
            <div class="w-12 h-12 bg-gradient-to-br from-amber-400 to-amber-600 rounded-full flex items-center justify-center text-white font-bold text-lg">
              {{ review.name.charAt(0) }}
            </div>
            <div>
              <div class="font-semibold text-slate-900">{{ review.name }}</div>
              <div class="text-sm text-slate-500">{{ review.location }}</div>
            </div>
          </div>

          <!-- Google Badge -->
          <div class="mt-4 flex items-center gap-2 text-xs text-slate-400">
            <svg class="w-4 h-4" viewBox="0 0 24 24">
              <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
              <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
              <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
              <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
            </svg>
            <span>{{ isRTL ? 'تقييم على جوجل' : 'Posted on Google' }}</span>
          </div>
        </div>
      </div>

      <!-- View All Button -->
      <div class="text-center">
        <a 
          href="https://g.page/r/YOUR_GOOGLE_PLACE_ID/review" 
          target="_blank"
          rel="noopener noreferrer"
          class="inline-flex items-center gap-3 px-10 py-4 bg-white hover:bg-slate-50 border-2 border-slate-200 hover:border-amber-400 text-slate-900 rounded-full font-semibold text-lg shadow-lg transition-all duration-300 hover:scale-105"
        >
          <svg class="w-6 h-6" viewBox="0 0 24 24">
            <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
            <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
            <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
            <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
          </svg>
          {{ isRTL ? 'اقرأ جميع التقييمات' : 'Read All Reviews' }}
        </a>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useAppStore } from '@/stores/app'

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)

// Google Reviews Data (from data1.json)
const googleRating = ref(4.7)
const totalReviews = ref(487)

// Sample reviews
// TODO: Replace with actual Google Places API integration
const reviews = ref([
  {
    rating: 5,
    text: 'The private beach is absolutely stunning! Crystal clear water, pristine sand, and exceptional service. The Italian restaurant exceeded all expectations.',
    name: 'Sarah Mitchell',
    location: 'London, UK'
  },
  {
    rating: 5,
    text: 'أفضل منتجع في شرم الشيخ! الشاطئ الخاص رائع والخدمة ممتازة. المطعم الإيطالي تحفة فنية. سنعود بالتأكيد!',
    name: 'Ahmed Al-Masri',
    location: 'Cairo, Egypt'
  },
  {
    rating: 5,
    text: 'Perfect honeymoon destination! The sunset views from our suite were breathtaking. Staff went above and beyond to make our stay unforgettable.',
    name: 'Emily Rodriguez',
    location: 'Madrid, Spain'
  },
  {
    rating: 5,
    text: 'Amazing water sports facilities! The diving instructors were professional and friendly. Beach was clean and well-maintained.',
    name: 'Michael Chen',
    location: 'Singapore'
  },
  {
    rating: 4,
    text: 'Great family resort! Kids loved the beach and the food was excellent. Only minor issue was WiFi speed in rooms.',
    name: 'Lisa Johnson',
    location: 'New York, USA'
  },
  {
    rating: 5,
    text: 'Romantic dinner on the beach was magical! The candlelight setup and service were perfect. Highly recommend for couples.',
    name: 'Marco Rossi',
    location: 'Rome, Italy'
  }
])
</script>
