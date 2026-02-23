<template>
  <div class="min-h-screen bg-gradient-to-b from-gray-50 to-white">
    <!-- Hero Section -->
    <section class="relative h-screen overflow-hidden">
      <!-- Background -->
      <div class="absolute inset-0 w-full h-full">
        <div class="absolute inset-0 bg-gradient-to-br from-blue-900/80 via-purple-900/60 to-teal-900/70 z-10"></div>
        <div class="w-full h-full bg-gradient-to-br from-blue-600 via-purple-600 to-teal-500 animate-gradient-shift"></div>
        
        <!-- Floating Elements -->
        <div class="absolute top-20 left-10 w-20 h-20 bg-white/10 rounded-full animate-float flex items-center justify-center">
          <i class="fas fa-utensils text-white text-2xl"></i>
        </div>
        <div class="absolute top-40 right-20 w-16 h-16 bg-blue-400/20 rounded-full animate-float-delay flex items-center justify-center">
          <i class="fas fa-wine-glass text-white text-xl"></i>
        </div>
        <div class="absolute bottom-32 left-1/4 w-12 h-12 bg-purple-400/20 rounded-full animate-float-slow flex items-center justify-center">
          <i class="fas fa-fish text-white"></i>
        </div>
      </div>

      <!-- Content -->
      <div class="relative z-20 h-full flex items-center justify-center px-4">
        <div class="max-w-5xl text-center text-white">
          <!-- Award Badge -->
          <div class="inline-flex items-center gap-2 px-6 py-3 bg-yellow-500/20 backdrop-blur-xl rounded-full text-yellow-400 font-semibold mb-8 border border-yellow-400/40 animate-fade-in-up shadow-2xl">
            <i class="fas fa-star animate-spin-slow"></i>
            <span>مطعم حائز على جوائز</span>
          </div>
          
          <!-- Title -->
          <h1 class="text-6xl md:text-8xl font-black mb-6 animate-fade-in-up">
            <span class="bg-gradient-to-r from-white via-yellow-100 to-white bg-clip-text text-transparent leading-tight">
              مطعم الخيمة
            </span>
          </h1>
          
          <!-- Subtitle -->
          <p class="text-2xl md:text-3xl mb-4 font-light leading-relaxed animate-fade-in-up-delay">
            تجربة طعام استثنائية على شاطئ البحر الأحمر
          </p>
          <p class="text-lg md:text-xl mb-12 text-blue-100 max-w-3xl mx-auto animate-fade-in-up-delay-2">
            استمتع بأشهى المأكولات البحرية الطازجة والأطباق العالمية في أجواء رومانسية خلابة
          </p>

          <!-- CTA Button -->
          <div class="animate-fade-in-up-delay-3">
            <a
              href="#menu"
              class="group inline-flex items-center gap-3 px-12 py-6 bg-gradient-to-r from-yellow-500 to-orange-500 text-white rounded-full font-bold text-lg hover:from-orange-500 hover:to-yellow-500 transition-all duration-500 transform hover:scale-110 shadow-2xl hover:shadow-yellow-500/50 relative overflow-hidden"
            >
              <span class="absolute inset-0 bg-gradient-to-r from-transparent via-white/30 to-transparent translate-x-[-200%] group-hover:translate-x-[200%] transition-transform duration-1000"></span>
              <i class="fas fa-book-open group-hover:rotate-12 transition-transform duration-300"></i>
              <span class="relative z-10">استكشف القائمة</span>
              <i class="fas fa-arrow-left group-hover:translate-x-2 transition-transform duration-300"></i>
            </a>
          </div>

          <!-- Stats -->
          <div class="flex justify-center gap-12 mt-16 flex-wrap animate-fade-in-up-delay-3">
            <div class="group text-center transform hover:scale-110 transition-all duration-300">
              <div class="text-5xl font-bold bg-gradient-to-r from-yellow-400 to-orange-400 bg-clip-text text-transparent mb-2 group-hover:animate-pulse">
                15+
              </div>
              <div class="text-sm text-white/80 font-semibold">سنوات خبرة</div>
            </div>
            
            <div class="w-px bg-gradient-to-b from-transparent via-yellow-400/50 to-transparent"></div>
            
            <div class="group text-center transform hover:scale-110 transition-all duration-300">
              <div class="text-5xl font-bold bg-gradient-to-r from-yellow-400 to-orange-400 bg-clip-text text-transparent mb-2 group-hover:animate-pulse">
                100+
              </div>
              <div class="text-sm text-white/80 font-semibold">أطباق مميزة</div>
            </div>
            
            <div class="w-px bg-gradient-to-b from-transparent via-yellow-400/50 to-transparent"></div>
            
            <div class="group text-center transform hover:scale-110 transition-all duration-300">
              <div class="text-5xl font-bold bg-gradient-to-r from-yellow-400 to-orange-400 bg-clip-text text-transparent mb-2 group-hover:animate-pulse">
                10K+
              </div>
              <div class="text-sm text-white/80 font-semibold">ضيف سعيد</div>
            </div>
          </div>
        </div>
      </div>

      <!-- Scroll Indicator -->
      <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce z-20">
        <a href="#about" class="flex flex-col items-center gap-2 group cursor-pointer">
          <span class="text-white/80 text-sm font-semibold group-hover:text-yellow-400 transition-colors">
            اكتشف المزيد
          </span>
          <div class="w-6 h-10 border-2 border-yellow-400/50 rounded-full flex justify-center">
            <div class="w-1 h-3 bg-yellow-400/70 rounded-full mt-2 animate-pulse"></div>
          </div>
        </a>
      </div>
    </section>

    <!-- About Section -->
    <section id="about" class="py-24 px-4 bg-gradient-to-b from-white to-gray-50">
      <div class="max-w-7xl mx-auto">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
          <!-- Text Content -->
          <div class="space-y-6 animate-fade-in-up">
            <div class="inline-block px-4 py-2 bg-yellow-500/10 rounded-full text-yellow-600 font-semibold text-sm">
              عن مطعمنا
            </div>
            <h2 class="text-4xl md:text-5xl font-black text-gray-800">
              تجربة طعام لا تُنسى
            </h2>
            <p class="text-gray-700 text-lg leading-relaxed">
              يقدم مطعم الخيمة تجربة طعام استثنائية تجمع بين النكهات العالمية والمأكولات البحرية الطازجة من البحر الأحمر. 
              مع إطلالة خلابة على الشاطئ وأجواء رومانسية ساحرة، نضمن لك وجبة لا تُنسى.
            </p>
            
            <!-- Features -->
            <div class="grid grid-cols-2 gap-4 pt-6">
              <div class="flex items-center gap-3 p-4 bg-white rounded-xl shadow-sm hover:shadow-md transition-shadow">
                <div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-teal-500 rounded-full flex items-center justify-center text-white text-xl">
                  🌊
                </div>
                <span class="font-semibold text-gray-800">إطلالة بحرية</span>
              </div>
              <div class="flex items-center gap-3 p-4 bg-white rounded-xl shadow-sm hover:shadow-md transition-shadow">
                <div class="w-12 h-12 bg-gradient-to-br from-purple-500 to-pink-500 rounded-full flex items-center justify-center text-white text-xl">
                  🎵
                </div>
                <span class="font-semibold text-gray-800">موسيقى حية</span>
              </div>
              <div class="flex items-center gap-3 p-4 bg-white rounded-xl shadow-sm hover:shadow-md transition-shadow">
                <div class="w-12 h-12 bg-gradient-to-br from-green-500 to-emerald-500 rounded-full flex items-center justify-center text-white text-xl">
                  🌿
                </div>
                <span class="font-semibold text-gray-800">مكونات طازجة</span>
              </div>
              <div class="flex items-center gap-3 p-4 bg-white rounded-xl shadow-sm hover:shadow-md transition-shadow">
                <div class="w-12 h-12 bg-gradient-to-br from-red-500 to-orange-500 rounded-full flex items-center justify-center text-white text-xl">
                  💝
                </div>
                <span class="font-semibold text-gray-800">أجواء رومانسية</span>
              </div>
            </div>
          </div>

          <!-- Images -->
          <div class="grid grid-cols-2 gap-4 animate-fade-in-up">
            <div class="space-y-4">
              <img
                src="https://images.unsplash.com/photo-1559339352-11d035aa65de?w=500"
                alt="Restaurant Interior"
                class="w-full h-64 object-cover rounded-2xl shadow-lg hover:scale-105 transition-transform duration-500"
              />
              <img
                src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500"
                alt="Fine Dining"
                class="w-full h-48 object-cover rounded-2xl shadow-lg"
              />
            </div>
            <div class="space-y-4 pt-8">
              <img
                src="https://images.unsplash.com/photo-1544025162-d76694265947?w=500"
                alt="Chef Cooking"
                class="w-full h-48 object-cover rounded-2xl shadow-lg"
              />
              <img
                src="https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500"
                alt="Delicious Food"
                class="w-full h-64 object-cover rounded-2xl shadow-lg"
              />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Menu Section -->
    <section id="menu" class="py-20 px-4 bg-gradient-to-br from-yellow-50 to-orange-50">
      <div class="max-w-7xl mx-auto">
        <div class="text-center mb-16">
          <div class="inline-block px-4 py-2 bg-yellow-500/10 rounded-full text-yellow-600 font-semibold text-sm mb-4">
            ⭐ قائمة الطعام
          </div>
          <h2 class="text-4xl md:text-5xl font-black text-gray-800 mb-6">
            أطباقنا المميزة
          </h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
            تشكيلة متنوعة من أشهى الأطباق المحضرة بعناية من أجود المكونات
          </p>
        </div>

        <!-- Menu Categories -->
        <div class="flex justify-center gap-4 mb-12 flex-wrap">
          <button
            v-for="category in menuCategories"
            :key="category.id"
            @click="selectedCategory = category.id"
            :class="[
              'px-6 py-3 rounded-full font-semibold transition-all duration-300 transform hover:scale-105',
              selectedCategory === category.id
                ? 'bg-gradient-to-r from-yellow-500 to-orange-500 text-white shadow-lg'
                : 'bg-white text-gray-700 hover:bg-gray-50 border-2 border-gray-200 hover:border-yellow-400'
            ]"
          >
            <span class="text-xl mr-2">{{ category.icon }}</span>
            {{ category.name }}
          </button>
        </div>

        <!-- Menu Items -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div
            v-for="item in filteredMenu"
            :key="item.id"
            class="group bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2"
          >
            <!-- Image -->
            <div class="relative h-48 overflow-hidden">
              <img
                :src="item.image"
                :alt="item.name"
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
              />
              <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent"></div>
              
              <!-- Price -->
              <div class="absolute bottom-4 left-4">
                <div class="px-4 py-2 bg-white/90 backdrop-blur-sm rounded-full shadow-lg">
                  <span class="text-xl font-bold text-yellow-600">{{ item.price }} ريال</span>
                </div>
              </div>

              <!-- Rating -->
              <div class="absolute top-4 right-4">
                <div class="px-3 py-1 bg-yellow-400 text-yellow-900 rounded-full text-sm font-bold">
                  <i class="fas fa-star mr-1"></i>{{ item.rating }}
                </div>
              </div>
            </div>

            <!-- Content -->
            <div class="p-6">
              <h3 class="text-xl font-bold text-gray-800 mb-2 group-hover:text-yellow-600 transition-colors">
                {{ item.name }}
              </h3>
              <p class="text-gray-600 text-sm mb-4 line-clamp-2">
                {{ item.description }}
              </p>
              
              <!-- Order Button -->
              <button
                @click="orderItem(item)"
                class="w-full px-4 py-3 bg-gradient-to-r from-yellow-500 to-orange-500 text-white rounded-xl font-semibold hover:shadow-lg transition-all duration-300 transform hover:scale-105 flex items-center justify-center gap-2"
              >
                <i class="fas fa-shopping-cart"></i>
                اطلب الآن
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Contact Section -->
    <section class="py-20 bg-gradient-to-r from-blue-600 via-purple-600 to-teal-600 text-white">
      <div class="max-w-6xl mx-auto px-4 text-center">
        <h2 class="text-4xl font-black mb-6">
          احجز طاولتك الآن
        </h2>
        <p class="text-xl mb-8 max-w-2xl mx-auto">
          استمتع بتجربة طعام لا تُنسى في أجمل مطعم على شاطئ البحر الأحمر
        </p>
        
        <div class="flex flex-col sm:flex-row gap-6 justify-center">
          <a
            href="tel:+966501234567"
            class="px-10 py-4 bg-yellow-500 text-gray-900 rounded-full font-bold text-lg hover:bg-yellow-400 transition-all duration-300 transform hover:scale-105 shadow-xl flex items-center justify-center gap-3"
          >
            <i class="fas fa-phone"></i>
            اتصل الآن
          </a>
          <a
            href="https://wa.me/966501234567"
            target="_blank"
            class="px-10 py-4 bg-green-500 text-white rounded-full font-bold text-lg hover:bg-green-400 transition-all duration-300 transform hover:scale-105 shadow-xl flex items-center justify-center gap-3"
          >
            <i class="fab fa-whatsapp"></i>
            واتساب
          </a>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'

// Menu Categories
const menuCategories = ref([
  { id: 'seafood', name: 'مأكولات بحرية', icon: '🦞' },
  { id: 'grills', name: 'مشاوي', icon: '🥩' },
  { id: 'pasta', name: 'معكرونة', icon: '🍝' },
  { id: 'desserts', name: 'حلويات', icon: '🍰' },
  { id: 'drinks', name: 'مشروبات', icon: '🥤' }
])

const selectedCategory = ref('seafood')

// Sample Menu Data
const menuItems = ref([
  {
    id: 1,
    name: 'سمك السلمون المشوي',
    description: 'سمك السلمون الطازج مشوي مع الخضار الموسمية وصوص الليمون',
    price: 120,
    rating: 4.8,
    category: 'seafood',
    image: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=500'
  },
  {
    id: 2,
    name: 'جمبري مقلي',
    description: 'جمبري طازج مقلي مع البهارات الخاصة وسلطة خضراء',
    price: 95,
    rating: 4.7,
    category: 'seafood',
    image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=500'
  },
  {
    id: 3,
    name: 'ستيك لحم مشوي',
    description: 'قطعة لحم طرية مشوية على الفحم مع البطاطس المحمرة',
    price: 150,
    rating: 4.9,
    category: 'grills',
    image: 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=500'
  },
  {
    id: 4,
    name: 'دجاج مشوي',
    description: 'دجاج مشوي بالأعشاب والتوابل مع الأرز البسمتي',
    price: 85,
    rating: 4.6,
    category: 'grills',
    image: 'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500'
  },
  {
    id: 5,
    name: 'باستا الفريدو',
    description: 'معكرونة فيتوتشيني بصوص الكريمة والجبن الطازج',
    price: 70,
    rating: 4.5,
    category: 'pasta',
    image: 'https://images.unsplash.com/photo-1621996346565-e3dbc353d2e5?w=500'
  },
  {
    id: 6,
    name: 'تيراميسو',
    description: 'حلوى تيراميسو إيطالية أصلية بالقهوة والماسكاربوني',
    price: 45,
    rating: 4.8,
    category: 'desserts',
    image: 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=500'
  }
])

const filteredMenu = computed(() => {
  return menuItems.value.filter(item => item.category === selectedCategory.value)
})

const orderItem = (item: any) => {
  const message = `مرحباً، أود طلب: ${item.name} - ${item.price} ريال`
  const whatsappUrl = `https://wa.me/966501234567?text=${encodeURIComponent(message)}`
  window.open(whatsappUrl, '_blank')
}

onMounted(() => {
  // Initialize animations
  const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
  }

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible')
      }
    })
  }, observerOptions)

  const animatedElements = document.querySelectorAll('.animate-fade-in-up')
  animatedElements.forEach(el => observer.observe(el))
})
</script>
