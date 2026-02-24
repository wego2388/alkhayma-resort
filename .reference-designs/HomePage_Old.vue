<template>
  <div class="min-h-screen">
    <!-- Hero Section with Video Background -->
    <section class="relative h-screen flex items-center justify-center overflow-hidden">
      <!-- Video Background -->
      <div class="absolute inset-0 w-full h-full">
        <div class="absolute inset-0 bg-gradient-to-r from-blue-900/70 via-purple-900/50 to-teal-900/70 z-10"></div>
        <div class="w-full h-full bg-gradient-to-br from-blue-600 via-purple-600 to-teal-500 animate-gradient-shift"></div>
        <!-- Floating Elements -->
        <div class="absolute top-20 left-10 w-20 h-20 bg-white/10 rounded-full animate-float"></div>
        <div class="absolute top-40 right-20 w-16 h-16 bg-blue-400/20 rounded-full animate-float-delay"></div>
        <div class="absolute bottom-32 left-1/4 w-12 h-12 bg-purple-400/20 rounded-full animate-float-slow"></div>
      </div>

      <!-- Hero Content -->
      <div class="relative z-20 text-center text-white px-4 max-w-6xl mx-auto">
        <div class="animate-fade-in-up">
          <h1 class="text-6xl md:text-8xl font-black mb-6 bg-gradient-to-r from-white via-blue-100 to-purple-100 bg-clip-text text-transparent leading-tight">
            الخيمة بيتش ريزورت
          </h1>
          <div class="h-1 w-32 bg-gradient-to-r from-blue-400 to-purple-400 mx-auto mb-8 rounded-full"></div>
        </div>
        
        <div class="animate-fade-in-up-delay">
          <p class="text-2xl md:text-3xl mb-4 font-light leading-relaxed">
            تجربة استثنائية على شاطئ البحر الأحمر
          </p>
          <p class="text-lg md:text-xl mb-12 text-blue-100 max-w-3xl mx-auto">
            استمتع بأجمل اللحظات في منتجع فاخر يجمع بين الراحة والأناقة والطبيعة الخلابة
          </p>
        </div>

        <!-- Quick Search Bar -->
        <div class="animate-fade-in-up-delay-2 mb-12">
          <div class="bg-white/95 backdrop-blur-lg rounded-2xl p-6 shadow-2xl max-w-4xl mx-auto">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 items-end">
              <div>
                <label class="block text-gray-700 text-sm font-semibold mb-2">تاريخ الوصول</label>
                <input type="date" v-model="searchData.checkIn" class="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-semibold mb-2">تاريخ المغادرة</label>
                <input type="date" v-model="searchData.checkOut" class="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
              </div>
              <div>
                <label class="block text-gray-700 text-sm font-semibold mb-2">عدد الضيوف</label>
                <select v-model="searchData.guests" class="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                  <option value="1">ضيف واحد</option>
                  <option value="2">ضيفان</option>
                  <option value="3">3 ضيوف</option>
                  <option value="4">4 ضيوف</option>
                  <option value="5">5+ ضيوف</option>
                </select>
              </div>
              <div>
                <button @click="searchRooms" class="w-full bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white p-3 rounded-lg font-semibold transition-all duration-300 transform hover:scale-105 shadow-lg">
                  <i class="fas fa-search mr-2"></i>
                  ابحث الآن
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Action Buttons -->
        <div class="animate-fade-in-up-delay-3 flex flex-col sm:flex-row gap-6 justify-center">
          <router-link
            to="/rooms"
            class="group bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white px-10 py-4 rounded-full text-lg font-bold transition-all duration-300 transform hover:scale-105 shadow-2xl hover:shadow-blue-500/25"
          >
            <i class="fas fa-bed mr-3 group-hover:animate-bounce"></i>
            احجز غرفتك الآن
          </router-link>
          <router-link
            to="/gallery"
            class="group bg-white/20 backdrop-blur-sm hover:bg-white/30 text-white px-10 py-4 rounded-full text-lg font-bold transition-all duration-300 border-2 border-white/30 hover:border-white/50"
          >
            <i class="fas fa-images mr-3 group-hover:animate-pulse"></i>
            استكشف المنتجع
          </router-link>
        </div>
      </div>

      <!-- Scroll Indicator -->
      <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce">
        <div class="w-6 h-10 border-2 border-white/50 rounded-full flex justify-center">
          <div class="w-1 h-3 bg-white/70 rounded-full mt-2 animate-pulse"></div>
        </div>
      </div>
    </section>

    <!-- Features Section with Modern Cards -->
    <section class="py-20 bg-gradient-to-br from-gray-50 to-blue-50 relative overflow-hidden">
      <!-- Background Pattern -->
      <div class="absolute inset-0 opacity-5">
        <div class="absolute top-0 left-0 w-full h-full" style="background-image: radial-gradient(circle at 25% 25%, #3b82f6 2px, transparent 2px); background-size: 50px 50px;"></div>
      </div>

      <div class="container mx-auto px-4 relative z-10">
        <div class="text-center mb-16 animate-fade-in-up">
          <h2 class="text-5xl font-black text-gray-800 mb-6">
            مرافق استثنائية
          </h2>
          <div class="h-1 w-24 bg-gradient-to-r from-blue-500 to-purple-500 mx-auto mb-6 rounded-full"></div>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
            اكتشف عالماً من الرفاهية والراحة مع مرافقنا المتميزة المصممة لتلبية جميع احتياجاتك
          </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
          <!-- Pool Feature -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 animate-fade-in-up">
            <div class="relative mb-6">
              <div class="w-20 h-20 bg-gradient-to-br from-blue-400 to-blue-600 rounded-2xl flex items-center justify-center mx-auto group-hover:scale-110 transition-transform duration-300">
                <i class="fas fa-swimming-pool text-white text-3xl"></i>
              </div>
              <div class="absolute -top-2 -right-2 w-6 h-6 bg-blue-200 rounded-full animate-ping"></div>
            </div>
            <h3 class="text-2xl font-bold text-gray-800 mb-4 text-center">مسابح فاخرة</h3>
            <p class="text-gray-600 text-center leading-relaxed">مسابح متعددة بإطلالة بحرية خلابة مع خدمة 5 نجوم</p>
          </div>

          <!-- Restaurant Feature -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 animate-fade-in-up-delay">
            <div class="relative mb-6">
              <div class="w-20 h-20 bg-gradient-to-br from-green-400 to-green-600 rounded-2xl flex items-center justify-center mx-auto group-hover:scale-110 transition-transform duration-300">
                <i class="fas fa-utensils text-white text-3xl"></i>
              </div>
              <div class="absolute -top-2 -right-2 w-6 h-6 bg-green-200 rounded-full animate-ping"></div>
            </div>
            <h3 class="text-2xl font-bold text-gray-800 mb-4 text-center">مطاعم عالمية</h3>
            <p class="text-gray-600 text-center leading-relaxed">تشكيلة متنوعة من المأكولات العالمية والمحلية الفاخرة</p>
          </div>

          <!-- Spa Feature -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 animate-fade-in-up-delay-2">
            <div class="relative mb-6">
              <div class="w-20 h-20 bg-gradient-to-br from-purple-400 to-purple-600 rounded-2xl flex items-center justify-center mx-auto group-hover:scale-110 transition-transform duration-300">
                <i class="fas fa-spa text-white text-3xl"></i>
              </div>
              <div class="absolute -top-2 -right-2 w-6 h-6 bg-purple-200 rounded-full animate-ping"></div>
            </div>
            <h3 class="text-2xl font-bold text-gray-800 mb-4 text-center">سبا ومنتجع صحي</h3>
            <p class="text-gray-600 text-center leading-relaxed">علاجات استرخاء وتجديد شباب على أيدي خبراء متخصصين</p>
          </div>

          <!-- Beach Feature -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 animate-fade-in-up-delay-3">
            <div class="relative mb-6">
              <div class="w-20 h-20 bg-gradient-to-br from-teal-400 to-teal-600 rounded-2xl flex items-center justify-center mx-auto group-hover:scale-110 transition-transform duration-300">
                <i class="fas fa-umbrella-beach text-white text-3xl"></i>
              </div>
              <div class="absolute -top-2 -right-2 w-6 h-6 bg-teal-200 rounded-full animate-ping"></div>
            </div>
            <h3 class="text-2xl font-bold text-gray-800 mb-4 text-center">شاطئ خاص</h3>
            <p class="text-gray-600 text-center leading-relaxed">شاطئ رملي خاص بمياه صافية وأنشطة مائية متنوعة</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Rooms Preview Section -->
    <section class="py-20 bg-white relative overflow-hidden">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 animate-fade-in-up">
          <h2 class="text-5xl font-black text-gray-800 mb-6">
            غرف وأجنحة فاخرة
          </h2>
          <div class="h-1 w-24 bg-gradient-to-r from-blue-500 to-purple-500 mx-auto mb-6 rounded-full"></div>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
            اختر من بين مجموعة متنوعة من الغرف والأجنحة المصممة بعناية لتوفير أقصى درجات الراحة والفخامة
          </p>
        </div>

        <div class="grid md:grid-cols-3 gap-8 mb-12">
          <!-- Room Card 1 -->
          <div class="group bg-white rounded-3xl overflow-hidden shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2">
            <div class="relative h-64 bg-gradient-to-br from-blue-400 to-blue-600 overflow-hidden">
              <div class="absolute inset-0 bg-black/20"></div>
              <div class="absolute bottom-4 left-4 text-white">
                <div class="bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full text-sm font-semibold">
                  من 800 ج.م / ليلة
                </div>
              </div>
              <div class="absolute top-4 right-4">
                <div class="bg-yellow-400 text-yellow-900 px-3 py-1 rounded-full text-sm font-bold">
                  ⭐ 4.9
                </div>
              </div>
            </div>
            <div class="p-6">
              <h3 class="text-2xl font-bold text-gray-800 mb-2">غرفة ديلوكس بإطلالة بحرية</h3>
              <p class="text-gray-600 mb-4">غرفة فسيحة مع شرفة خاصة وإطلالة مباشرة على البحر</p>
              <div class="flex items-center justify-between">
                <div class="flex items-center space-x-2 space-x-reverse">
                  <i class="fas fa-users text-blue-500"></i>
                  <span class="text-sm text-gray-600">2-4 ضيوف</span>
                </div>
                <button class="bg-gradient-to-r from-blue-600 to-purple-600 text-white px-6 py-2 rounded-full font-semibold hover:shadow-lg transition-all duration-300">
                  احجز الآن
                </button>
              </div>
            </div>
          </div>

          <!-- Room Card 2 -->
          <div class="group bg-white rounded-3xl overflow-hidden shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2">
            <div class="relative h-64 bg-gradient-to-br from-purple-400 to-purple-600 overflow-hidden">
              <div class="absolute inset-0 bg-black/20"></div>
              <div class="absolute bottom-4 left-4 text-white">
                <div class="bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full text-sm font-semibold">
                  من 1200 ج.م / ليلة
                </div>
              </div>
              <div class="absolute top-4 right-4">
                <div class="bg-yellow-400 text-yellow-900 px-3 py-1 rounded-full text-sm font-bold">
                  ⭐ 5.0
                </div>
              </div>
            </div>
            <div class="p-6">
              <h3 class="text-2xl font-bold text-gray-800 mb-2">جناح رئاسي</h3>
              <p class="text-gray-600 mb-4">جناح فاخر مع صالة منفصلة وجاكوزي خاص</p>
              <div class="flex items-center justify-between">
                <div class="flex items-center space-x-2 space-x-reverse">
                  <i class="fas fa-users text-purple-500"></i>
                  <span class="text-sm text-gray-600">4-6 ضيوف</span>
                </div>
                <button class="bg-gradient-to-r from-purple-600 to-pink-600 text-white px-6 py-2 rounded-full font-semibold hover:shadow-lg transition-all duration-300">
                  احجز الآن
                </button>
              </div>
            </div>
          </div>

          <!-- Room Card 3 -->
          <div class="group bg-white rounded-3xl overflow-hidden shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2">
            <div class="relative h-64 bg-gradient-to-br from-teal-400 to-teal-600 overflow-hidden">
              <div class="absolute inset-0 bg-black/20"></div>
              <div class="absolute bottom-4 left-4 text-white">
                <div class="bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full text-sm font-semibold">
                  من 600 ج.م / ليلة
                </div>
              </div>
              <div class="absolute top-4 right-4">
                <div class="bg-yellow-400 text-yellow-900 px-3 py-1 rounded-full text-sm font-bold">
                  ⭐ 4.8
                </div>
              </div>
            </div>
            <div class="p-6">
              <h3 class="text-2xl font-bold text-gray-800 mb-2">غرفة عائلية</h3>
              <p class="text-gray-600 mb-4">غرفة واسعة مثالية للعائلات مع سريرين منفصلين</p>
              <div class="flex items-center justify-between">
                <div class="flex items-center space-x-2 space-x-reverse">
                  <i class="fas fa-users text-teal-500"></i>
                  <span class="text-sm text-gray-600">4-8 ضيوف</span>
                </div>
                <button class="bg-gradient-to-r from-teal-600 to-blue-600 text-white px-6 py-2 rounded-full font-semibold hover:shadow-lg transition-all duration-300">
                  احجز الآن
                </button>
              </div>
            </div>
          </div>
        </div>

        <div class="text-center">
          <router-link
            to="/rooms"
            class="inline-flex items-center bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white px-8 py-4 rounded-full text-lg font-bold transition-all duration-300 transform hover:scale-105 shadow-xl"
          >
            <span>عرض جميع الغرف</span>
            <i class="fas fa-arrow-left mr-3 group-hover:translate-x-1 transition-transform"></i>
          </router-link>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-gradient-to-r from-blue-600 via-purple-600 to-teal-600 relative overflow-hidden">
      <div class="absolute inset-0 bg-black/20"></div>
      <div class="container mx-auto px-4 relative z-10">
        <div class="text-center text-white">
          <h2 class="text-5xl font-black mb-6">
            ابدأ رحلتك الآن
          </h2>
          <p class="text-xl mb-8 max-w-2xl mx-auto leading-relaxed">
            احجز إقامتك اليوم واستمتع بتجربة لا تُنسى في أجمل منتجع على البحر الأحمر
          </p>
          <div class="flex flex-col sm:flex-row gap-6 justify-center">
            <router-link
              to="/rooms"
              class="bg-white text-blue-600 px-10 py-4 rounded-full text-lg font-bold hover:bg-gray-100 transition-all duration-300 transform hover:scale-105 shadow-xl"
            >
              احجز الآن
            </router-link>
            <router-link
              to="/contact"
              class="border-2 border-white text-white px-10 py-4 rounded-full text-lg font-bold hover:bg-white hover:text-blue-600 transition-all duration-300"
            >
              تواصل معنا
            </router-link>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const searchData = ref({
  checkIn: '',
  checkOut: '',
  guests: '2'
})

const searchRooms = () => {
  router.push({
    path: '/rooms',
    query: {
      checkIn: searchData.value.checkIn,
      checkOut: searchData.value.checkOut,
      guests: searchData.value.guests
    }
  })
}

onMounted(() => {
  // Set default dates
  const today = new Date()
  const tomorrow = new Date(today)
  tomorrow.setDate(tomorrow.getDate() + 1)
  
  searchData.value.checkIn = today.toISOString().split('T')[0]
  searchData.value.checkOut = tomorrow.toISOString().split('T')[0]
})
</script>
          <h2 class="heading-display text-4xl md:text-5xl lg:text-6xl mb-4 gradient-text">
            Experience Luxury
          </h2>
          <p class="text-gray-600 text-lg max-w-2xl mx-auto">
            Discover our world-class amenities and services designed for your perfect getaway
          </p>
        </div>

        <div ref="servicesGrid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
          <router-link 
            v-for="(service, index) in services" 
            :key="service.name"
            :to="service.link"
            class="service-card card group cursor-pointer"
            :style="{ animationDelay: `${index * 0.1}s` }"
          >
            <div class="p-8 text-center">
              <div class="text-5xl md:text-6xl mb-6 transform group-hover:scale-110 transition-transform duration-300">
                {{ service.icon }}
              </div>
              <h3 class="text-xl md:text-2xl font-bold mb-3 text-gray-800 group-hover:text-ocean-deep-600 transition-colors">
                {{ service.name }}
              </h3>
              <p class="text-gray-600 mb-4 text-sm md:text-base">
                {{ service.description }}
              </p>
              <span class="inline-flex items-center gap-2 text-ocean-deep-600 font-semibold group-hover:gap-4 transition-all">
                Explore <span>→</span>
              </span>
            </div>
          </router-link>
        </div>
      </div>
    </section>

    <!-- Featured Packages -->
    <section class="section-padding relative overflow-hidden">
      <!-- Background Pattern -->
      <div class="absolute inset-0 opacity-5">
        <div class="absolute inset-0" style="background-image: radial-gradient(circle, #0284c7 1px, transparent 1px); background-size: 30px 30px;"></div>
      </div>

      <div class="container-responsive relative z-10">
        <div class="text-center mb-12">
          <span class="badge badge-gold mb-4">Special Offers</span>
          <h2 class="heading-display text-4xl md:text-5xl lg:text-6xl mb-4 text-gray-800">
            Featured Packages
          </h2>
          <p class="text-gray-600 text-lg max-w-2xl mx-auto">
            Exclusive deals crafted for an unforgettable experience
          </p>
        </div>
        
        <div v-if="loading" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
          <div v-for="i in 3" :key="i" class="card p-6 animate-pulse">
            <div class="h-48 bg-gray-200 rounded-xl mb-4"></div>
            <div class="h-6 bg-gray-200 rounded mb-2"></div>
            <div class="h-4 bg-gray-200 rounded"></div>
          </div>
        </div>
        
        <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
          <div v-for="pkg in packages" :key="pkg.id" class="card-premium group cursor-pointer">
            <div class="relative h-56 bg-gradient-to-br from-ocean-deep-400 via-teal-glow-400 to-ocean-deep-500 flex items-center justify-center overflow-hidden">
              <div class="absolute inset-0 bg-black/10 group-hover:bg-black/0 transition-colors"></div>
              <span class="text-white text-6xl md:text-7xl relative z-10 transform group-hover:scale-110 transition-transform">🏖️</span>
            </div>
            
            <div class="p-6 bg-white">
              <div class="flex justify-between items-start mb-3">
                <h3 class="text-xl md:text-2xl font-bold text-gray-800">{{ pkg.name }}</h3>
                <span class="badge badge-success shimmer">
                  Save ${{ pkg.savings }}
                </span>
              </div>
              
              <p class="text-gray-600 mb-6 text-sm md:text-base">{{ pkg.description }}</p>
              
              <div class="flex justify-between items-center">
                <div>
                  <span class="text-3xl md:text-4xl font-bold gradient-text">${{ pkg.price }}</span>
                </div>
                <button class="btn-gold">Book Now</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Chat Bubble -->
    <ChatBubble />

    <!-- Testimonials -->
    <section class="section-padding bg-gradient-to-b from-white to-ocean-deep-50">
      <div class="container-responsive">
        <div class="text-center mb-12">
          <span class="badge badge-primary mb-4">Testimonials</span>
          <h2 class="heading-display text-4xl md:text-5xl lg:text-6xl mb-4 text-gray-800">
            What Our Guests Say
          </h2>
          <p class="text-gray-600 text-lg max-w-2xl mx-auto">
            Real experiences from real travelers
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
          <div v-for="review in testimonials" :key="review.name" class="glass p-8 rounded-2xl hover:shadow-2xl transition-all duration-300">
            <div class="flex items-center mb-6">
              <div class="w-12 h-12 rounded-full bg-gradient-to-br from-ocean-deep-400 to-teal-glow-400 flex items-center justify-center text-2xl mr-4">
                {{ review.flag }}
              </div>
              <div>
                <h4 class="font-bold text-gray-800 text-base md:text-lg">{{ review.name }}</h4>
                <div class="text-sand-gold-500 text-lg">{{ '★'.repeat(review.rating) }}</div>
              </div>
            </div>
            <p class="text-gray-600 text-sm md:text-base leading-relaxed italic">
              "{{ review.text }}"
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Banner -->
    <section class="relative h-96 md:h-[500px] flex items-center justify-center overflow-hidden">
      <div class="absolute inset-0 gradient-animated"></div>
      
      <!-- Overlay Pattern -->
      <div class="absolute inset-0 opacity-10">
        <div class="absolute inset-0" style="background-image: url('data:image/svg+xml,%3Csvg width=\'60\' height=\'60\' viewBox=\'0 0 60 60\' xmlns=\'http://www.w3.org/2000/svg\'%3E%3Cg fill=\'none\' fill-rule=\'evenodd\'%3E%3Cg fill=\'%23ffffff\' fill-opacity=\'1\'%3E%3Cpath d=\'M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z\'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E');"></div>
      </div>

      <div class="relative z-10 text-center text-white px-4 max-w-4xl mx-auto">
        <h2 class="heading-display text-4xl md:text-5xl lg:text-6xl mb-6">
          Book Your Escape Today
        </h2>
        <p class="text-xl md:text-2xl mb-8 font-light">
          Limited time offers available • Best price guaranteed
        </p>
        <div class="flex gap-4 justify-center flex-wrap">
          <router-link to="/rooms" class="glass-dark px-8 py-4 rounded-xl text-lg font-bold hover:bg-white/30 transition-all shadow-xl">
            Browse Rooms
          </router-link>
          <router-link to="/beach" class="btn-gold px-8 py-4 text-lg">
            View Beach Access
          </router-link>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'
import BookingWidget from '@/components/smart/BookingWidget.vue'
import ChatBubble from '@/components/smart/ChatBubble.vue'
import { apiClient } from '@/api'

gsap.registerPlugin(ScrollTrigger)

const servicesGrid = ref<HTMLElement>()
const loading = ref(true)
const packages = ref<any[]>([])

const services = [
  { name: 'Luxury Rooms', icon: '🏨', description: 'Comfortable rooms with sea view', link: '/rooms' },
  { name: 'Private Beach', icon: '🏖️', description: 'VIP and standard beach access', link: '/beach' },
  { name: 'Restaurant', icon: '🍽️', description: 'Fine dining experience', link: '#' },
  { name: 'Cafe', icon: '☕', description: 'Coffee and light snacks', link: '#' },
  { name: 'Activities', icon: '🏄', description: 'Water sports and more', link: '#' },
  { name: 'Events', icon: '🎉', description: 'Special occasions', link: '#' }
]

const testimonials = [
  { name: 'John Smith', flag: '🇺🇸', rating: 5, text: 'Amazing experience! The beach is pristine and the service is exceptional.' },
  { name: 'Ahmed Hassan', flag: '🇪🇬', rating: 5, text: 'أفضل منتجع زرته! الخدمة ممتازة والموقع رائع.' },
  { name: 'Maria Garcia', flag: '🇪🇸', rating: 5, text: 'Perfect vacation spot. Will definitely come back!' }
]

async function fetchHomeData() {
  loading.value = true
  try {
    const response = await apiClient.get('/products/home')
    packages.value = response.data.packages || []
  } catch (e) {
    // Fallback data
    packages.value = [
      { id: 1, name: 'Weekend Getaway', description: '2 nights + breakfast', price: 299, savings: 50 },
      { id: 2, name: 'Family Package', description: '3 nights + all meals', price: 599, savings: 100 },
      { id: 3, name: 'Luxury Escape', description: '5 nights + VIP beach', price: 999, savings: 200 }
    ]
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  fetchHomeData()
  
  if (servicesGrid.value) {
    gsap.from('.service-card', {
      scrollTrigger: {
        trigger: servicesGrid.value,
        start: 'top 80%'
      },
      y: 50,
      opacity: 0,
      duration: 0.6,
      stagger: 0.1
    })
  }
})
</script>

