<template>
  <section class="relative py-24 bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 overflow-hidden">
    <div class="container mx-auto px-6 max-w-7xl">
      <!-- Section Header -->
      <div class="text-center mb-16">
        <p class="text-amber-400 text-sm tracking-[0.3em] uppercase mb-4">
          {{ isRTL ? 'تجربة حصرية' : 'Exclusive Experience' }}
        </p>
        <h2 class="font-display text-5xl md:text-6xl font-bold text-white mb-6">
          {{ isRTL ? 'تجربة شاطئ خاص لك فقط' : 'Your Private Beach Experience' }}
        </h2>
        <div class="flex items-center justify-center gap-4 mb-6">
          <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
          <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
          <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
        </div>
        <p class="text-xl text-white/70 max-w-3xl mx-auto">
          {{ isRTL ? 'على بعد خطوات من غرفتك إلى البحر - خصوصية حصرية على الشاطئ' : 'Steps from your room to the sea - Exclusive beachfront privacy' }}
        </p>
      </div>

      <!-- Features Grid -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <!-- Feature 1 -->
        <div class="group bg-white/5 backdrop-blur-sm border border-white/10 rounded-3xl overflow-hidden hover:bg-white/10 transition-all duration-500 hover:scale-105">
          <div class="h-48 overflow-hidden">
            <img 
              src="https://images.unsplash.com/photo-1559827260-dc66d52bef19?q=80&w=2070" 
              alt="Private Sandy Beach"
              class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
            />
          </div>
          <div class="p-8">
            <h3 class="text-2xl font-bold text-white mb-4">
              {{ isRTL ? 'شاطئ رملي خاص' : 'Private Sandy Beach' }}
            </h3>
            <p class="text-white/70 leading-relaxed">
              {{ isRTL ? 'شاطئ خاص حصري لضيوفنا فقط مع رمال ناعمة ومياه صافية' : 'Exclusive private beach for our guests only with soft sand and crystal clear waters' }}
            </p>
          </div>
        </div>

        <!-- Feature 2 -->
        <div class="group bg-white/5 backdrop-blur-sm border border-white/10 rounded-3xl overflow-hidden hover:bg-white/10 transition-all duration-500 hover:scale-105">
          <div class="h-48 overflow-hidden">
            <img 
              src="https://images.unsplash.com/photo-1544148103-0773bf10d330?q=80&w=2070" 
              alt="Beach Bar"
              class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
            />
          </div>
          <div class="p-8">
            <h3 class="text-2xl font-bold text-white mb-4">
              {{ isRTL ? 'بار الشاطئ' : 'Beach Bar' }}
            </h3>
            <p class="text-white/70 leading-relaxed">
              {{ isRTL ? 'استمتع بالمشروبات المنعشة والوجبات الخفيفة مباشرة على الشاطئ' : 'Enjoy refreshing drinks and light bites right on the beach' }}
            </p>
          </div>
        </div>

        <!-- Feature 3 -->
        <div class="group bg-white/5 backdrop-blur-sm border border-white/10 rounded-3xl overflow-hidden hover:bg-white/10 transition-all duration-500 hover:scale-105">
          <div class="h-48 overflow-hidden">
            <img 
              src="https://images.unsplash.com/photo-1495954484750-af469f2f9be5?q=80&w=2070" 
              alt="Sunset Seating"
              class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
            />
          </div>
          <div class="p-8">
            <h3 class="text-2xl font-bold text-white mb-4">
              {{ isRTL ? 'جلسات الغروب' : 'Sunset Seating' }}
            </h3>
            <p class="text-white/70 leading-relaxed">
              {{ isRTL ? 'جلسات رومانسية لمشاهدة غروب الشمس الساحر على البحر الأحمر' : 'Romantic seating to watch the magical sunset over the Red Sea' }}
            </p>
          </div>
        </div>

        <!-- Feature 4 -->
        <div class="group bg-white/5 backdrop-blur-sm border border-white/10 rounded-3xl overflow-hidden hover:bg-white/10 transition-all duration-500 hover:scale-105">
          <div class="h-48 overflow-hidden">
            <img 
              src="https://images.unsplash.com/photo-1559827260-dc66d52bef19?q=80&w=2070" 
              alt="Family Play Zone"
              class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
            />
          </div>
          <div class="p-8">
            <h3 class="text-2xl font-bold text-white mb-4">
              {{ isRTL ? 'منطقة لعب عائلية' : 'Family Play Zone' }}
            </h3>
            <p class="text-white/70 leading-relaxed">
              {{ isRTL ? 'منطقة آمنة للأطفال للعب على الشاطئ الرملي الناعم' : 'Safe area for kids to play on the soft sandy beach' }}
            </p>
          </div>
        </div>

        <!-- Feature 5 -->
        <div class="group bg-white/5 backdrop-blur-sm border border-white/10 rounded-3xl overflow-hidden hover:bg-white/10 transition-all duration-500 hover:scale-105">
          <div class="h-48 overflow-hidden">
            <img 
              src="https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=2070" 
              alt="Water Sports"
              class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
            />
          </div>
          <div class="p-8">
            <h3 class="text-2xl font-bold text-white mb-4">
              {{ isRTL ? 'أنشطة مائية' : 'Water Sports' }}
            </h3>
            <p class="text-white/70 leading-relaxed">
              {{ isRTL ? 'غطس، غوص، جت سكي ورحلات بحرية في البحر الأحمر' : 'Snorkeling, diving, jet ski and boat trips in the Red Sea' }}
            </p>
          </div>
        </div>

        <!-- Feature 6 -->
        <div class="group bg-white/5 backdrop-blur-sm border border-white/10 rounded-3xl overflow-hidden hover:bg-white/10 transition-all duration-500 hover:scale-105">
          <div class="h-48 overflow-hidden">
            <img 
              src="https://images.unsplash.com/photo-1470229538611-16ba8c7ffbd7?q=80&w=2070" 
              alt="Romantic Dinners"
              class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
            />
          </div>
          <div class="p-8">
            <h3 class="text-2xl font-bold text-white mb-4">
              {{ isRTL ? 'عشاء رومانسي' : 'Romantic Dinners' }}
            </h3>
            <p class="text-white/70 leading-relaxed">
              {{ isRTL ? 'عشاء رومانسي بالشموع على الشاطئ تحت النجوم' : 'Romantic candlelight dinner on the beach under the stars' }}
            </p>
          </div>
        </div>
      </div>

      <!-- CTA -->
      <div class="text-center mt-16">
        <router-link 
          to="/activities" 
          class="inline-block bg-gradient-to-r from-amber-500 to-amber-600 hover:from-amber-600 hover:to-amber-700 text-white px-10 py-4 rounded-full font-semibold text-lg shadow-2xl hover:shadow-amber-500/50 transition-all duration-400 transform hover:scale-105"
        >
          {{ isRTL ? 'استكشف الأنشطة' : 'Explore Activities' }}
        </router-link>
      </div>
    </div>

    <!-- Decorative Elements -->
    <div class="absolute top-20 left-10 w-64 h-64 bg-amber-500/10 rounded-full blur-3xl"></div>
    <div class="absolute bottom-20 right-10 w-80 h-80 bg-blue-500/10 rounded-full blur-3xl"></div>
  </section>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useAppStore } from '@/stores/app'

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)
</script>
