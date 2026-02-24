<template>
  <div class="min-h-screen">
    <!-- Hero Section -->
    <section class="relative h-[70vh] flex items-center justify-center overflow-hidden">
      <div 
        class="absolute inset-0 bg-cover bg-center"
        style="background-image: url('https://images.unsplash.com/photo-1519167758481-83f29da8c2b6?q=80&w=2070')"
      ></div>
      <div class="absolute inset-0 bg-gradient-to-b from-black/70 via-black/50 to-black/70"></div>
      
      <div class="relative z-10 text-center text-white px-6 max-w-5xl mx-auto">
        <p class="text-sm tracking-[0.3em] uppercase text-amber-400 mb-4 animate-fade-in-up">
          {{ isRTL ? 'فعاليات استثنائية' : 'Exceptional Events' }}
        </p>
        <h1 class="font-display text-6xl md:text-8xl font-bold mb-6 animate-fade-in-up" style="animation-delay: 0.2s">
          {{ isRTL ? 'الفعاليات' : 'Events' }}
        </h1>
        <div class="flex items-center justify-center gap-4 mb-6 animate-fade-in-up" style="animation-delay: 0.4s">
          <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
          <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
          <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
        </div>
        <p class="text-xl md:text-2xl text-white/90 max-w-3xl mx-auto leading-relaxed animate-fade-in-up" style="animation-delay: 0.6s">
          {{ isRTL ? 'احتفل بلحظاتك الخاصة في أجواء فاخرة' : 'Celebrate your special moments in luxury' }}
        </p>
      </div>
    </section>

    <!-- Event Types Section -->
    <section class="py-24 bg-white">
      <div class="container mx-auto px-6 max-w-7xl">
        <div class="text-center mb-16">
          <p class="text-amber-500 text-sm tracking-[0.3em] uppercase mb-4">
            {{ isRTL ? 'أنواع الفعاليات' : 'Event Types' }}
          </p>
          <h2 class="font-display text-5xl md:text-6xl font-bold text-slate-900 mb-6">
            {{ isRTL ? 'فعاليات لكل مناسبة' : 'Events for Every Occasion' }}
          </h2>
          <div class="flex items-center justify-center gap-4">
            <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
            <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
            <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
          </div>
        </div>

        <!-- Event Types Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          <!-- Wedding Events -->
          <div class="group bg-gradient-to-br from-pink-50 to-white rounded-3xl p-8 border-2 border-pink-100 hover:border-pink-400 transition-all duration-500 hover:shadow-luxury-lg hover:-translate-y-2">
            <div class="relative h-48 mb-6 overflow-hidden rounded-2xl">
              <img 
                src="https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=800" 
                alt="Wedding"
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
              />
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'حفلات الزفاف' : 'Weddings' }}
            </h3>
            <p class="text-slate-600 mb-4">
              {{ isRTL ? 'احتفل بيومك الخاص على شاطئنا الخاص مع إطلالة خلابة' : 'Celebrate your special day on our private beach with stunning views' }}
            </p>
            <ul class="space-y-2 text-sm text-slate-600 mb-6">
              <li class="flex items-center gap-2">
                <span class="text-pink-500">✓</span>
                {{ isRTL ? 'إعداد رومانسي على الشاطئ' : 'Romantic beach setup' }}
              </li>
              <li class="flex items-center gap-2">
                <span class="text-pink-500">✓</span>
                {{ isRTL ? 'تصوير احترافي' : 'Professional photography' }}
              </li>
              <li class="flex items-center gap-2">
                <span class="text-pink-500">✓</span>
                {{ isRTL ? 'عشاء فاخر' : 'Luxury dinner' }}
              </li>
            </ul>
            <button class="w-full bg-gradient-to-r from-pink-500 to-pink-600 text-white py-3 rounded-xl font-semibold hover:shadow-lg transition-all">
              {{ isRTL ? 'احجز الآن' : 'Book Now' }}
            </button>
          </div>

          <!-- Corporate Events -->
          <div class="group bg-gradient-to-br from-blue-50 to-white rounded-3xl p-8 border-2 border-blue-100 hover:border-blue-400 transition-all duration-500 hover:shadow-luxury-lg hover:-translate-y-2">
            <div class="relative h-48 mb-6 overflow-hidden rounded-2xl">
              <img 
                src="https://images.unsplash.com/photo-1511578314322-379afb476865?q=80&w=800" 
                alt="Corporate"
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
              />
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'فعاليات الشركات' : 'Corporate Events' }}
            </h3>
            <p class="text-slate-600 mb-4">
              {{ isRTL ? 'مؤتمرات وورش عمل احترافية مع كل المرافق' : 'Professional conferences and workshops with all facilities' }}
            </p>
            <ul class="space-y-2 text-sm text-slate-600 mb-6">
              <li class="flex items-center gap-2">
                <span class="text-blue-500">✓</span>
                {{ isRTL ? 'قاعات مجهزة' : 'Equipped halls' }}
              </li>
              <li class="flex items-center gap-2">
                <span class="text-blue-500">✓</span>
                {{ isRTL ? 'معدات تقنية' : 'Technical equipment' }}
              </li>
              <li class="flex items-center gap-2">
                <span class="text-blue-500">✓</span>
                {{ isRTL ? 'خدمات الضيافة' : 'Catering services' }}
              </li>
            </ul>
            <button class="w-full bg-gradient-to-r from-blue-500 to-blue-600 text-white py-3 rounded-xl font-semibold hover:shadow-lg transition-all">
              {{ isRTL ? 'احجز الآن' : 'Book Now' }}
            </button>
          </div>

          <!-- Birthday Parties -->
          <div class="group bg-gradient-to-br from-purple-50 to-white rounded-3xl p-8 border-2 border-purple-100 hover:border-purple-400 transition-all duration-500 hover:shadow-luxury-lg hover:-translate-y-2">
            <div class="relative h-48 mb-6 overflow-hidden rounded-2xl">
              <img 
                src="https://images.unsplash.com/photo-1530103862676-de8c9debad1d?q=80&w=800" 
                alt="Birthday"
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
              />
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'حفلات أعياد الميلاد' : 'Birthday Parties' }}
            </h3>
            <p class="text-slate-600 mb-4">
              {{ isRTL ? 'احتفالات مميزة للأطفال والكبار مع ديكورات رائعة' : 'Special celebrations for kids and adults with amazing decorations' }}
            </p>
            <ul class="space-y-2 text-sm text-slate-600 mb-6">
              <li class="flex items-center gap-2">
                <span class="text-purple-500">✓</span>
                {{ isRTL ? 'ديكورات مخصصة' : 'Custom decorations' }}
              </li>
              <li class="flex items-center gap-2">
                <span class="text-purple-500">✓</span>
                {{ isRTL ? 'كيك وحلويات' : 'Cake & sweets' }}
              </li>
              <li class="flex items-center gap-2">
                <span class="text-purple-500">✓</span>
                {{ isRTL ? 'ألعاب وترفيه' : 'Games & entertainment' }}
              </li>
            </ul>
            <button class="w-full bg-gradient-to-r from-purple-500 to-purple-600 text-white py-3 rounded-xl font-semibold hover:shadow-lg transition-all">
              {{ isRTL ? 'احجز الآن' : 'Book Now' }}
            </button>
          </div>

          <!-- Special Occasions -->
          <div class="group bg-gradient-to-br from-amber-50 to-white rounded-3xl p-8 border-2 border-amber-100 hover:border-amber-400 transition-all duration-500 hover:shadow-luxury-lg hover:-translate-y-2">
            <div class="relative h-48 mb-6 overflow-hidden rounded-2xl">
              <img 
                src="https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?q=80&w=800" 
                alt="Special"
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
              />
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'مناسبات خاصة' : 'Special Occasions' }}
            </h3>
            <p class="text-slate-600 mb-4">
              {{ isRTL ? 'خطوبة، ذكرى سنوية، أو أي احتفال خاص' : 'Engagement, anniversary, or any special celebration' }}
            </p>
            <ul class="space-y-2 text-sm text-slate-600 mb-6">
              <li class="flex items-center gap-2">
                <span class="text-amber-500">✓</span>
                {{ isRTL ? 'إعداد مخصص' : 'Custom setup' }}
              </li>
              <li class="flex items-center gap-2">
                <span class="text-amber-500">✓</span>
                {{ isRTL ? 'موسيقى حية' : 'Live music' }}
              </li>
              <li class="flex items-center gap-2">
                <span class="text-amber-500">✓</span>
                {{ isRTL ? 'عشاء رومانسي' : 'Romantic dinner' }}
              </li>
            </ul>
            <button class="w-full bg-gradient-to-r from-amber-500 to-amber-600 text-white py-3 rounded-xl font-semibold hover:shadow-lg transition-all">
              {{ isRTL ? 'احجز الآن' : 'Book Now' }}
            </button>
          </div>
        </div>
      </div>
    </section>

    <!-- Why Choose Us Section -->
    <section class="py-24 bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900">
      <div class="container mx-auto px-6 max-w-7xl">
        <div class="text-center mb-16">
          <p class="text-amber-400 text-sm tracking-[0.3em] uppercase mb-4">
            {{ isRTL ? 'لماذا نحن' : 'Why Choose Us' }}
          </p>
          <h2 class="font-display text-5xl md:text-6xl font-bold text-white mb-6">
            {{ isRTL ? 'فعاليات لا تُنسى' : 'Unforgettable Events' }}
          </h2>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div class="text-center">
            <div class="w-20 h-20 bg-gradient-to-br from-amber-500 to-amber-600 rounded-full flex items-center justify-center mx-auto mb-6">
              <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
              </svg>
            </div>
            <h3 class="text-2xl font-bold text-white mb-3">500+</h3>
            <p class="text-white/70">{{ isRTL ? 'فعالية سنوياً' : 'Events Yearly' }}</p>
          </div>

          <div class="text-center">
            <div class="w-20 h-20 bg-gradient-to-br from-blue-500 to-blue-600 rounded-full flex items-center justify-center mx-auto mb-6">
              <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
              </svg>
            </div>
            <h3 class="text-2xl font-bold text-white mb-3">100%</h3>
            <p class="text-white/70">{{ isRTL ? 'رضا العملاء' : 'Client Satisfaction' }}</p>
          </div>

          <div class="text-center">
            <div class="w-20 h-20 bg-gradient-to-br from-pink-500 to-pink-600 rounded-full flex items-center justify-center mx-auto mb-6">
              <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
              </svg>
            </div>
            <h3 class="text-2xl font-bold text-white mb-3">24/7</h3>
            <p class="text-white/70">{{ isRTL ? 'دعم الحجز' : 'Booking Support' }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="py-24 bg-white">
      <div class="container mx-auto px-6 max-w-4xl text-center">
        <h2 class="font-display text-4xl md:text-5xl font-bold text-slate-900 mb-6">
          {{ isRTL ? 'جاهز لحجز فعاليتك؟' : 'Ready to Book Your Event?' }}
        </h2>
        <p class="text-xl text-slate-600 mb-8">
          {{ isRTL ? 'تواصل معنا الآن ودعنا نساعدك في تنظيم فعالية لا تُنسى' : 'Contact us now and let us help you organize an unforgettable event' }}
        </p>
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
          <button class="px-10 py-4 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-full font-semibold text-lg hover:shadow-lg hover:shadow-amber-500/50 transition-all hover:scale-105">
            {{ isRTL ? 'احجز الآن' : 'Book Now' }}
          </button>
          <button class="px-10 py-4 border-2 border-slate-300 text-slate-900 rounded-full font-semibold text-lg hover:border-amber-400 transition-all hover:scale-105">
            {{ isRTL ? 'تواصل معنا' : 'Contact Us' }}
          </button>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useAppStore } from '@/stores/app'

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)
</script>

<style scoped>
@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(40px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-fade-in-up {
  animation: fade-in-up 1s ease-out;
  animation-fill-mode: both;
}
</style>
