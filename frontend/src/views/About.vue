<template>
  <div class="min-h-screen">
    <!-- Hero Section -->
    <section class="relative h-[70vh] flex items-center justify-center overflow-hidden">
      <div 
        class="absolute inset-0 bg-cover bg-center"
        style="background-image: url('https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?q=80&w=2070')"
      ></div>
      <div class="absolute inset-0 bg-gradient-to-b from-black/70 via-black/50 to-black/70"></div>
      
      <div class="relative z-10 text-center text-white px-6 max-w-5xl mx-auto">
        <p class="text-sm tracking-[0.3em] uppercase text-amber-400 mb-4 animate-fade-in-up">
          {{ isRTL ? 'قصتنا' : 'Our Story' }}
        </p>
        <h1 class="font-display text-6xl md:text-8xl font-bold mb-6 animate-fade-in-up" style="animation-delay: 0.2s">
          {{ isRTL ? 'عن منتجع الخيمة' : 'About El Kheima' }}
        </h1>
        <div class="flex items-center justify-center gap-4 mb-6 animate-fade-in-up" style="animation-delay: 0.4s">
          <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
          <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
          <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
        </div>
        <p class="text-xl md:text-2xl text-white/90 max-w-3xl mx-auto leading-relaxed animate-fade-in-up" style="animation-delay: 0.6s">
          {{ isRTL ? 'رحلة من الحلم إلى الواقع على شواطئ البحر الأحمر' : 'A journey from dream to reality on the Red Sea shores' }}
        </p>
      </div>
    </section>

    <!-- Story Section -->
    <section class="py-24 bg-white">
      <div class="container mx-auto px-6 max-w-7xl">
        <div class="grid lg:grid-cols-2 gap-16 items-center">
          <div>
            <p class="text-amber-500 text-sm tracking-[0.3em] uppercase mb-4">
              {{ isRTL ? 'منتجع الخيمة' : 'El Kheima Resort' }}
            </p>
            
            <h2 class="font-display text-5xl md:text-6xl font-bold text-slate-900 mb-6">
              {{ isRTL ? 'شاطئ خاص على البحر الأحمر' : 'Private Beach on the Red Sea' }}
            </h2>
            
            <div class="h-1 w-20 bg-gradient-to-r from-amber-500 to-amber-600 rounded-full mb-8"></div>
            
            <div class="space-y-6 text-slate-600 text-lg leading-relaxed">
              <p>
                {{ isRTL 
                  ? 'يتميز منتجع الخيمة بشاطئ رملي خاص ومركز للرياضات المائية ومطعم فاخر، ويقع في شرم الشيخ. يتوفر خدمة الواي فاي المجانية. يبعد المنتجع 20 دقيقة بالسيارة عن مطار شرم الشيخ الدولي.'
                  : 'Featuring a private sandy beach, a watersports center and a restaurant, El Kheima Beach Resort is located in Sharm El Sheikh. Free WiFi access is available. This resort is a 20-minute drive from Sharm el-Sheikh International Airport.'
                }}
              </p>
              
              <p>
                {{ isRTL
                  ? 'تتميز أماكن الإقامة بإطلالة على البحر وتوفر تكييف هواء وشرفة. يوجد منطقة معيشة مع تلفزيون بشاشة مسطحة وطاولة طعام. المطبخ الكامل مجهز بفرن وثلاجة.'
                  : 'Featuring sea view, the accommodations provide you with air conditioning and a balcony. There is a living area with a flat-screen TV and a dining table. The full kitchen has an oven and a refrigerator.'
                }}
              </p>
              
              <p>
                {{ isRTL
                  ? 'يضم منتجع الخيمة بار ومطعم وحديقة وتراس. كما يوفر رياضات مائية وجولات سياحية برسوم إضافية. يتوفر موقف سيارات مجاني.'
                  : 'At El Kheima Beach Resort you will find a bar and a restaurant. There is also a garden and a terrace. Other facilities offered include watersports and tours at a surcharge. The property offers free parking.'
                }}
              </p>
            </div>

            <!-- Features List -->
            <div class="grid grid-cols-2 gap-4 mt-8">
              <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-amber-100 rounded-full flex items-center justify-center">
                  <svg class="w-5 h-5 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                  </svg>
                </div>
                <span class="text-slate-700 font-medium">{{ isRTL ? 'شاطئ رملي خاص' : 'Private Sandy Beach' }}</span>
              </div>
              <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-amber-100 rounded-full flex items-center justify-center">
                  <svg class="w-5 h-5 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                  </svg>
                </div>
                <span class="text-slate-700 font-medium">{{ isRTL ? 'مركز رياضات مائية' : 'Watersports Center' }}</span>
              </div>
              <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-amber-100 rounded-full flex items-center justify-center">
                  <svg class="w-5 h-5 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                  </svg>
                </div>
                <span class="text-slate-700 font-medium">{{ isRTL ? 'واي فاي مجاني' : 'Free WiFi' }}</span>
              </div>
              <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-amber-100 rounded-full flex items-center justify-center">
                  <svg class="w-5 h-5 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                  </svg>
                </div>
                <span class="text-slate-700 font-medium">{{ isRTL ? 'موقف مجاني' : 'Free Parking' }}</span>
              </div>
              <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-amber-100 rounded-full flex items-center justify-center">
                  <svg class="w-5 h-5 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                  </svg>
                </div>
                <span class="text-slate-700 font-medium">{{ isRTL ? 'إطلالة بحرية' : 'Sea View' }}</span>
              </div>
              <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-amber-100 rounded-full flex items-center justify-center">
                  <svg class="w-5 h-5 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                  </svg>
                </div>
                <span class="text-slate-700 font-medium">{{ isRTL ? 'مطبخ كامل' : 'Full Kitchen' }}</span>
              </div>
            </div>
          </div>
          
          <div class="relative">
            <div class="bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 rounded-3xl p-10 text-white shadow-2xl">
              <div class="grid grid-cols-2 gap-8">
                <div class="text-center">
                  <div class="text-6xl font-bold bg-gradient-to-br from-amber-400 to-amber-600 bg-clip-text text-transparent mb-2">120+</div>
                  <div class="text-white/70">{{ isRTL ? 'غرفة فاخرة' : 'Luxury Rooms' }}</div>
                </div>
                <div class="text-center">
                  <div class="text-6xl font-bold bg-gradient-to-br from-amber-400 to-amber-600 bg-clip-text text-transparent mb-2">4.7</div>
                  <div class="text-white/70">{{ isRTL ? 'تقييم الضيوف' : 'Guest Rating' }}</div>
                </div>
                <div class="text-center">
                  <div class="text-6xl font-bold bg-gradient-to-br from-amber-400 to-amber-600 bg-clip-text text-transparent mb-2">487+</div>
                  <div class="text-white/70">{{ isRTL ? 'ضيف سعيد' : 'Happy Guests' }}</div>
                </div>
                <div class="text-center">
                  <div class="text-6xl font-bold bg-gradient-to-br from-amber-400 to-amber-600 bg-clip-text text-transparent mb-2">#1</div>
                  <div class="text-white/70">{{ isRTL ? 'المرتبة الأولى' : 'Ranked First' }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Location Section -->
    <section class="py-24 bg-gradient-to-br from-slate-50 to-white">
      <div class="container mx-auto px-6 max-w-7xl">
        <div class="text-center mb-16">
          <p class="text-amber-500 text-sm tracking-[0.3em] uppercase mb-4">
            {{ isRTL ? 'الموقع' : 'Location' }}
          </p>
          <h2 class="font-display text-5xl md:text-6xl font-bold text-slate-900 mb-6">
            {{ isRTL ? 'موقع استراتيجي' : 'Strategic Location' }}
          </h2>
          <div class="flex items-center justify-center gap-4">
            <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
            <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
            <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
          </div>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
          <div class="bg-white rounded-3xl p-8 shadow-lg hover:shadow-luxury-lg transition-all duration-500 hover:-translate-y-2">
            <div class="w-16 h-16 bg-gradient-to-br from-amber-500 to-amber-600 rounded-full flex items-center justify-center mb-6">
              <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"/>
              </svg>
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'مطار شرم الشيخ' : 'Sharm Airport' }}
            </h3>
            <p class="text-slate-600 text-lg">
              {{ isRTL ? '20 دقيقة بالسيارة' : '20-minute drive' }}
            </p>
            <p class="text-amber-600 font-semibold mt-2">12 mi / 19 km</p>
          </div>

          <div class="bg-white rounded-3xl p-8 shadow-lg hover:shadow-luxury-lg transition-all duration-500 hover:-translate-y-2">
            <div class="w-16 h-16 bg-gradient-to-br from-blue-500 to-blue-600 rounded-full flex items-center justify-center mb-6">
              <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 21v-4m0 0V5a2 2 0 012-2h6.5l1 1H21l-3 6 3 6h-8.5l-1-1H5a2 2 0 00-2 2zm9-13.5V9"/>
              </svg>
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'محمية رأس محمد' : 'Ras Mohammed Park' }}
            </h3>
            <p class="text-slate-600 text-lg">
              {{ isRTL ? 'محمية طبيعية' : 'National Park' }}
            </p>
            <p class="text-blue-600 font-semibold mt-2">15 mi / 24 km</p>
          </div>

          <div class="bg-white rounded-3xl p-8 shadow-lg hover:shadow-luxury-lg transition-all duration-500 hover:-translate-y-2">
            <div class="w-16 h-16 bg-gradient-to-br from-green-500 to-green-600 rounded-full flex items-center justify-center mb-6">
              <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
              </svg>
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'حلبة جيبلي' : 'Ghibli Raceway' }}
            </h3>
            <p class="text-slate-600 text-lg">
              {{ isRTL ? '15 دقيقة بالسيارة' : '15-minute drive' }}
            </p>
            <p class="text-green-600 font-semibold mt-2">{{ isRTL ? 'قريب جداً' : 'Very Close' }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Values Section -->
    <section class="py-24 bg-gradient-to-br from-slate-50 to-white">
      <div class="container mx-auto px-6 max-w-7xl">
        <div class="text-center mb-16">
          <p class="text-amber-500 text-sm tracking-[0.3em] uppercase mb-4">
            {{ isRTL ? 'قيمنا' : 'Our Values' }}
          </p>
          <h2 class="font-display text-5xl md:text-6xl font-bold text-slate-900 mb-6">
            {{ isRTL ? 'ما نؤمن به' : 'What We Believe' }}
          </h2>
          <div class="flex items-center justify-center gap-4">
            <div class="h-px w-16 bg-gradient-to-r from-transparent to-amber-400"></div>
            <div class="w-2 h-2 bg-amber-400 rotate-45"></div>
            <div class="h-px w-16 bg-gradient-to-l from-transparent to-amber-400"></div>
          </div>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
          <div class="bg-white rounded-3xl p-8 text-center hover:shadow-luxury-lg transition-all duration-500 hover:-translate-y-2 border-t-4 border-amber-500">
            <div class="w-16 h-16 bg-gradient-to-br from-amber-500 to-amber-600 rounded-full flex items-center justify-center mx-auto mb-6">
              <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
              </svg>
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'التميز' : 'Excellence' }}
            </h3>
            <p class="text-slate-600">
              {{ isRTL ? 'نسعى دائماً لتقديم أفضل الخدمات والتجارب' : 'We always strive to provide the best services and experiences' }}
            </p>
          </div>

          <div class="bg-white rounded-3xl p-8 text-center hover:shadow-luxury-lg transition-all duration-500 hover:-translate-y-2 border-t-4 border-blue-500">
            <div class="w-16 h-16 bg-gradient-to-br from-blue-500 to-blue-600 rounded-full flex items-center justify-center mx-auto mb-6">
              <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
              </svg>
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'الضيافة' : 'Hospitality' }}
            </h3>
            <p class="text-slate-600">
              {{ isRTL ? 'نعامل كل ضيف كأنه فرد من العائلة' : 'We treat every guest as family' }}
            </p>
          </div>

          <div class="bg-white rounded-3xl p-8 text-center hover:shadow-luxury-lg transition-all duration-500 hover:-translate-y-2 border-t-4 border-green-500">
            <div class="w-16 h-16 bg-gradient-to-br from-green-500 to-green-600 rounded-full flex items-center justify-center mx-auto mb-6">
              <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
              </svg>
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'الاستدامة' : 'Sustainability' }}
            </h3>
            <p class="text-slate-600">
              {{ isRTL ? 'نحافظ على البيئة للأجيال القادمة' : 'We preserve the environment for future generations' }}
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Team Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-6 max-w-7xl">
        <div class="text-center mb-16">
          <h2 class="text-4xl md:text-5xl font-bold text-slate-900 mb-4">
            {{ isRTL ? 'فريقنا' : 'Our Team' }}
          </h2>
          <p class="text-xl text-slate-600 max-w-2xl mx-auto">
            {{ isRTL ? 'فريق محترف ومتفاني لخدمتكم' : 'A professional and dedicated team to serve you' }}
          </p>
        </div>

        <div class="grid md:grid-cols-4 gap-8">
          <div class="text-center group">
            <div class="w-32 h-32 mx-auto mb-4 rounded-full bg-gradient-to-br from-primary-400 to-blue-500 flex items-center justify-center text-white text-4xl font-bold group-hover:scale-110 transition-transform">
              AM
            </div>
            <h3 class="text-xl font-bold text-slate-900">{{ isRTL ? 'أحمد محمد' : 'Ahmed Mohamed' }}</h3>
            <p class="text-slate-600">{{ isRTL ? 'المدير العام' : 'General Manager' }}</p>
          </div>

          <div class="text-center group">
            <div class="w-32 h-32 mx-auto mb-4 rounded-full bg-gradient-to-br from-blue-400 to-teal-500 flex items-center justify-center text-white text-4xl font-bold group-hover:scale-110 transition-transform">
              SK
            </div>
            <h3 class="text-xl font-bold text-slate-900">{{ isRTL ? 'سارة خالد' : 'Sara Khaled' }}</h3>
            <p class="text-slate-600">{{ isRTL ? 'مدير العمليات' : 'Operations Manager' }}</p>
          </div>

          <div class="text-center group">
            <div class="w-32 h-32 mx-auto mb-4 rounded-full bg-gradient-to-br from-teal-400 to-green-500 flex items-center justify-center text-white text-4xl font-bold group-hover:scale-110 transition-transform">
              MH
            </div>
            <h3 class="text-xl font-bold text-slate-900">{{ isRTL ? 'محمد حسن' : 'Mohamed Hassan' }}</h3>
            <p class="text-slate-600">{{ isRTL ? 'رئيس الطهاة' : 'Head Chef' }}</p>
          </div>

          <div class="text-center group">
            <div class="w-32 h-32 mx-auto mb-4 rounded-full bg-gradient-to-br from-purple-400 to-pink-500 flex items-center justify-center text-white text-4xl font-bold group-hover:scale-110 transition-transform">
              LA
            </div>
            <h3 class="text-xl font-bold text-slate-900">{{ isRTL ? 'ليلى أحمد' : 'Layla Ahmed' }}</h3>
            <p class="text-slate-600">{{ isRTL ? 'مدير خدمة العملاء' : 'Customer Service Manager' }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-gradient-to-r from-primary-600 via-blue-600 to-teal-600 text-white">
      <div class="container mx-auto px-6 max-w-7xl text-center">
        <h2 class="text-4xl md:text-5xl font-bold mb-6">
          {{ isRTL ? 'انضم إلى عائلتنا' : 'Join Our Family' }}
        </h2>
        <p class="text-xl mb-8 text-blue-100 max-w-2xl mx-auto">
          {{ isRTL ? 'احجز الآن واستمتع بتجربة لا تُنسى' : 'Book now and enjoy an unforgettable experience' }}
        </p>
        <router-link
          to="/rooms"
          class="inline-block bg-white text-slate-900 px-12 py-4 rounded-full text-lg font-bold hover:bg-slate-100 transition-all transform hover:scale-105 shadow-2xl"
        >
          {{ isRTL ? '🎉 احجز الآن' : '🎉 Book Now' }}
        </router-link>
      </div>
    </section>

    <!-- Social Media Section -->
    <SocialMediaSection />
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useAppStore } from '@/stores/app'
import SocialMediaSection from '@/components/sections/SocialMediaSection.vue'

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)
</script>

<style scoped>
@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-20px); }
}

@keyframes float-delay {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-30px); }
}

@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-float {
  animation: float 6s ease-in-out infinite;
}

.animate-float-delay {
  animation: float-delay 8s ease-in-out infinite;
}

.animate-fade-in-up {
  animation: fade-in-up 1s ease-out;
}

.animate-fade-in-up-delay {
  animation: fade-in-up 1s ease-out 0.2s both;
}
</style>
