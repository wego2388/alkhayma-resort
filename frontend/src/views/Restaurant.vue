<template>
  <div class="min-h-screen bg-gradient-to-br from-slate-50 to-blue-50">
    <!-- Luxury Hero Section -->
    <section class="relative h-screen flex items-center justify-center overflow-hidden">
      <!-- Background Image with Parallax -->
      <div 
        class="absolute inset-0 bg-cover bg-center bg-no-repeat"
        :style="{ 
          backgroundImage: `url(${getImage('hero.restaurant')})`,
          transform: `translateY(${scrollY * 0.5}px)`
        }"
      ></div>
      
      <!-- Dark Overlay -->
      <div class="absolute inset-0 bg-gradient-to-br from-slate-900/90 via-slate-800/85 to-blue-900/90"></div>
      
      <!-- Decorative Elements -->
      <div class="absolute inset-0 opacity-20">
        <div class="absolute top-20 left-20 w-72 h-72 bg-amber-500 rounded-full blur-3xl animate-pulse-subtle"></div>
        <div class="absolute bottom-20 right-20 w-96 h-96 bg-blue-500 rounded-full blur-3xl animate-pulse-subtle" style="animation-delay: 1s"></div>
      </div>

      <!-- Content -->
      <div class="relative z-10 container mx-auto px-6 max-w-7xl text-center">
        <!-- Subtitle -->
        <div class="mb-6 animate-fade-in-up" style="animation-delay: 0.2s">
          <span class="inline-block px-6 py-2 bg-amber-500/20 backdrop-blur-sm border border-amber-400/30 rounded-full text-amber-400 text-sm font-semibold tracking-wider uppercase">
            {{ isRTL ? 'تجربة طهي استثنائية' : 'Exceptional Culinary Experience' }}
          </span>
        </div>

        <!-- Main Title -->
        <h1 class="font-display text-6xl md:text-8xl font-bold mb-8 text-white animate-fade-in-up" style="animation-delay: 0.4s">
          {{ isRTL ? 'المطعم والكافيه' : 'Restaurant & Cafe' }}
        </h1>

        <!-- Gold Divider -->
        <div class="flex items-center justify-center gap-4 mb-8 animate-fade-in-up" style="animation-delay: 0.6s">
          <div class="h-px w-20 bg-gradient-to-r from-transparent to-amber-400"></div>
          <div class="w-2 h-2 bg-amber-400 rounded-full"></div>
          <div class="h-px w-20 bg-gradient-to-l from-transparent to-amber-400"></div>
        </div>

        <!-- Description -->
        <p class="text-xl md:text-2xl text-white/90 max-w-3xl mx-auto leading-relaxed mb-12 animate-fade-in-up" style="animation-delay: 0.8s">
          {{ isRTL 
            ? 'استمتع بأشهى المأكولات العالمية والمحلية في أجواء فاخرة تطل على البحر الأحمر' 
            : 'Savor exquisite international and local cuisine in a luxurious setting overlooking the Red Sea' 
          }}
        </p>

        <!-- Stats -->
        <div class="flex flex-wrap justify-center gap-8 mb-12 animate-fade-in-up" style="animation-delay: 1s">
          <div class="text-center">
            <div class="text-4xl font-bold text-amber-400 mb-2">50+</div>
            <div class="text-white/70 text-sm uppercase tracking-wider">{{ isRTL ? 'أطباق مميزة' : 'Signature Dishes' }}</div>
          </div>
          <div class="w-px h-16 bg-white/20"></div>
          <div class="text-center">
            <div class="text-4xl font-bold text-amber-400 mb-2">4.9</div>
            <div class="text-white/70 text-sm uppercase tracking-wider">{{ isRTL ? 'تقييم الضيوف' : 'Guest Rating' }}</div>
          </div>
          <div class="w-px h-16 bg-white/20"></div>
          <div class="text-center">
            <div class="text-4xl font-bold text-amber-400 mb-2">24/7</div>
            <div class="text-white/70 text-sm uppercase tracking-wider">{{ isRTL ? 'خدمة الغرف' : 'Room Service' }}</div>
          </div>
        </div>

        <!-- CTA Buttons -->
        <div class="flex flex-wrap justify-center gap-6 animate-fade-in-up" style="animation-delay: 1.2s">
          <button 
            @click="scrollToMenu"
            class="group px-10 py-5 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-full font-semibold text-lg shadow-2xl hover:shadow-amber-500/50 hover:scale-105 transition-all duration-300 flex items-center gap-3"
          >
            <span>{{ isRTL ? 'استكشف القائمة' : 'Explore Menu' }}</span>
            <svg class="w-5 h-5 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
            </svg>
          </button>
        </div>
      </div>

      <!-- Scroll Indicator -->
      <div class="absolute bottom-10 left-1/2 -translate-x-1/2 animate-bounce">
        <svg class="w-6 h-6 text-white/50" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"/>
        </svg>
      </div>
    </section>


    <!-- Special Offers Section -->
    <section class="relative py-24 bg-white overflow-hidden">
      <div class="container mx-auto px-6 max-w-7xl">
        <!-- Section Header -->
        <div class="text-center mb-16">
          <span class="inline-block px-6 py-2 bg-amber-50 border border-amber-200 rounded-full text-amber-700 text-sm font-semibold tracking-wider uppercase mb-6">
            {{ isRTL ? 'عروض خاصة' : 'Special Offers' }}
          </span>
          <h2 class="font-display text-5xl md:text-6xl font-bold text-slate-900 mb-6">
            {{ isRTL ? 'باقات مميزة' : 'Exclusive Packages' }}
          </h2>
          <div class="flex items-center justify-center gap-4 mb-6">
            <div class="h-px w-20 bg-gradient-to-r from-transparent to-amber-400"></div>
            <div class="w-2 h-2 bg-amber-400 rounded-full"></div>
            <div class="h-px w-20 bg-gradient-to-l from-transparent to-amber-400"></div>
          </div>
        </div>

        <!-- Offers Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-16">
          <!-- Pizza Night -->
          <div class="group relative bg-gradient-to-br from-slate-50 to-white rounded-3xl p-8 border-2 border-slate-100 hover:border-amber-400 transition-all duration-500 hover:shadow-luxury-lg">
            <div class="absolute top-4 right-4 px-4 py-1 bg-red-500 text-white text-xs font-bold rounded-full">
              {{ isRTL ? 'وفر 20%' : 'Save 20%' }}
            </div>
            <div class="w-20 h-20 bg-gradient-to-br from-amber-400 to-amber-600 rounded-2xl flex items-center justify-center text-4xl mb-6 group-hover:scale-110 transition-transform duration-500">
              🍕
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'ليلة البيتزا' : 'Pizza Night' }}
            </h3>
            <p class="text-slate-600 mb-6">
              {{ isRTL ? 'بيتزا كبيرة + مشروبات + سلطة' : 'Large Pizza + Drinks + Salad' }}
            </p>
            <div class="flex items-baseline gap-2 mb-6">
              <span class="text-4xl font-bold text-amber-600">250</span>
              <span class="text-slate-500 line-through">300</span>
              <span class="text-slate-600">{{ isRTL ? 'جنيه' : 'EGP' }}</span>
            </div>
          </div>

          <!-- Romantic Dinner -->
          <div class="group relative bg-gradient-to-br from-pink-50 to-white rounded-3xl p-8 border-2 border-pink-100 hover:border-pink-400 transition-all duration-500 hover:shadow-luxury-lg">
            <div class="absolute top-4 right-4 px-4 py-1 bg-pink-500 text-white text-xs font-bold rounded-full">
              {{ isRTL ? 'الأكثر طلباً' : 'Popular' }}
            </div>
            <div class="w-20 h-20 bg-gradient-to-br from-pink-400 to-red-600 rounded-2xl flex items-center justify-center text-4xl mb-6 group-hover:scale-110 transition-transform duration-500">
              💕
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'عشاء رومانسي' : 'Romantic Dinner' }}
            </h3>
            <p class="text-slate-600 mb-6">
              {{ isRTL ? 'عشاء لشخصين + شموع + موسيقى' : 'Dinner for 2 + Candles + Music' }}
            </p>
            <div class="flex items-baseline gap-2 mb-6">
              <span class="text-4xl font-bold text-pink-600">500</span>
              <span class="text-slate-600">{{ isRTL ? 'جنيه' : 'EGP' }}</span>
            </div>
          </div>

          <!-- Pasta Combo -->
          <div class="group relative bg-gradient-to-br from-orange-50 to-white rounded-3xl p-8 border-2 border-orange-100 hover:border-orange-400 transition-all duration-500 hover:shadow-luxury-lg">
            <div class="w-20 h-20 bg-gradient-to-br from-orange-400 to-red-600 rounded-2xl flex items-center justify-center text-4xl mb-6 group-hover:scale-110 transition-transform duration-500">
              🍝
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'كومبو الباستا' : 'Pasta Combo' }}
            </h3>
            <p class="text-slate-600 mb-6">
              {{ isRTL ? 'باستا + مشروب + خبز بالثوم' : 'Pasta + Drink + Garlic Bread' }}
            </p>
            <div class="flex items-baseline gap-2 mb-6">
              <span class="text-4xl font-bold text-orange-600">180</span>
              <span class="text-slate-600">{{ isRTL ? 'جنيه' : 'EGP' }}</span>
            </div>
          </div>

          <!-- Morning Coffee -->
          <div class="group relative bg-gradient-to-br from-blue-50 to-white rounded-3xl p-8 border-2 border-blue-100 hover:border-blue-400 transition-all duration-500 hover:shadow-luxury-lg">
            <div class="w-20 h-20 bg-gradient-to-br from-blue-400 to-blue-600 rounded-2xl flex items-center justify-center text-4xl mb-6 group-hover:scale-110 transition-transform duration-500">
              ☕
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'قهوة الصباح' : 'Morning Coffee' }}
            </h3>
            <p class="text-slate-600 mb-6">
              {{ isRTL ? 'قهوة + كرواسون + عصير' : 'Coffee + Croissant + Juice' }}
            </p>
            <div class="flex items-baseline gap-2 mb-6">
              <span class="text-4xl font-bold text-blue-600">80</span>
              <span class="text-slate-600">{{ isRTL ? 'جنيه' : 'EGP' }}</span>
            </div>
          </div>

          <!-- Sunset Drink -->
          <div class="group relative bg-gradient-to-br from-purple-50 to-white rounded-3xl p-8 border-2 border-purple-100 hover:border-purple-400 transition-all duration-500 hover:shadow-luxury-lg">
            <div class="w-20 h-20 bg-gradient-to-br from-purple-400 to-pink-600 rounded-2xl flex items-center justify-center text-4xl mb-6 group-hover:scale-110 transition-transform duration-500">
              🌅
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'مشروب الغروب' : 'Sunset Drink' }}
            </h3>
            <p class="text-slate-600 mb-6">
              {{ isRTL ? 'مشروب مميز + حلى + إطلالة' : 'Signature Drink + Dessert + View' }}
            </p>
            <div class="flex items-baseline gap-2 mb-6">
              <span class="text-4xl font-bold text-purple-600">120</span>
              <span class="text-slate-600">{{ isRTL ? 'جنيه' : 'EGP' }}</span>
            </div>
          </div>

          <!-- Hookah Lounge -->
          <div class="group relative bg-gradient-to-br from-indigo-50 to-white rounded-3xl p-8 border-2 border-indigo-100 hover:border-indigo-400 transition-all duration-500 hover:shadow-luxury-lg">
            <div class="w-20 h-20 bg-gradient-to-br from-indigo-400 to-purple-600 rounded-2xl flex items-center justify-center text-4xl mb-6 group-hover:scale-110 transition-transform duration-500">
              💨
            </div>
            <h3 class="text-2xl font-bold text-slate-900 mb-3">
              {{ isRTL ? 'شيشة ولاونج' : 'Hookah Lounge' }}
            </h3>
            <p class="text-slate-600 mb-6">
              {{ isRTL ? 'شيشة فاخرة + مشروب + جلسة' : 'Premium Hookah + Drink + Seating' }}
            </p>
            <div class="flex items-baseline gap-2 mb-6">
              <span class="text-4xl font-bold text-indigo-600">150</span>
              <span class="text-slate-600">{{ isRTL ? 'جنيه' : 'EGP' }}</span>
            </div>
          </div>
        </div>

        <!-- Menu Button -->
        <div class="text-center">
          <button 
            @click="showMenuModal = true"
            class="group inline-flex items-center gap-3 px-12 py-5 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-full font-bold text-lg shadow-luxury-lg hover:shadow-amber-500/50 hover:scale-105 transition-all duration-300"
          >
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
            </svg>
            <span>{{ isRTL ? 'عرض القائمة الكاملة' : 'View Full Menu' }}</span>
            <svg class="w-5 h-5 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
            </svg>
          </button>
        </div>
      </div>
    </section>

    <!-- Menu Modal -->
    <div v-if="showMenuModal" class="fixed inset-0 bg-black/80 backdrop-blur-sm flex items-center justify-center z-50 p-4 animate-fade-in" @click.self="showMenuModal = false">
      <div class="bg-white rounded-3xl max-w-6xl w-full max-h-[90vh] overflow-hidden shadow-luxury-lg animate-scale-in">
        <!-- Modal Header -->
        <div class="sticky top-0 bg-gradient-to-r from-amber-500 to-amber-600 text-white px-8 py-6 flex items-center justify-between z-10">
          <div>
            <h3 class="text-3xl font-bold mb-1">{{ isRTL ? 'قائمة الطعام' : 'Our Menu' }}</h3>
            <p class="text-white/90">{{ isRTL ? 'اختر من تشكيلتنا المميزة' : 'Choose from our exclusive selection' }}</p>
          </div>
          <button @click="showMenuModal = false" class="w-12 h-12 bg-white/20 hover:bg-white/30 rounded-full flex items-center justify-center transition">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <!-- Modal Content -->
        <div class="p-8 overflow-y-auto max-h-[calc(90vh-120px)]">
          <!-- Category Filter -->
          <div class="flex flex-wrap gap-3 mb-8 sticky top-0 bg-white py-4 z-10 border-b">
            <button 
              @click="selectedType = 'all'" 
              :class="selectedType === 'all' ? 'bg-amber-500 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'"
              class="px-6 py-2 rounded-full font-semibold transition"
            >
              {{ isRTL ? 'الكل' : 'All' }}
            </button>
            <button 
              @click="selectedType = 'restaurant'" 
              :class="selectedType === 'restaurant' ? 'bg-amber-500 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'"
              class="px-6 py-2 rounded-full font-semibold transition"
            >
              {{ isRTL ? 'المطعم' : 'Restaurant' }}
            </button>
            <button 
              @click="selectedType = 'cafe'" 
              :class="selectedType === 'cafe' ? 'bg-amber-500 text-white' : 'bg-slate-100 text-slate-700 hover:bg-slate-200'"
              class="px-6 py-2 rounded-full font-semibold transition"
            >
              {{ isRTL ? 'الكافيه' : 'Cafe' }}
            </button>
          </div>

          <!-- Products Grid in Modal -->
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div 
              v-for="product in filteredProducts" 
              :key="product.id" 
              class="flex gap-4 p-4 bg-slate-50 rounded-2xl hover:bg-slate-100 transition group cursor-pointer"
              @click="orderProduct(product); showMenuModal = false"
            >
              <img 
                :src="product.image_url || getDefaultImage(product.type)" 
                :alt="displayName(product)" 
                class="w-24 h-24 object-cover rounded-xl group-hover:scale-105 transition" 
              />
              <div class="flex-1">
                <h4 class="font-bold text-slate-900 mb-1">{{ displayName(product) }}</h4>
                <p class="text-sm text-slate-600 line-clamp-2 mb-2">{{ displayDescription(product) }}</p>
                <div class="flex items-center justify-between">
                  <span class="text-xl font-bold text-amber-600">
                    {{ formatPrice(Number(product.price), currentLocale) }}
                  </span>
                  <span class="text-xs px-3 py-1 bg-amber-100 text-amber-700 rounded-full font-semibold">
                    {{ isRTL ? 'اطلب' : 'Order' }}
                  </span>
                </div>
              </div>
            </div>
          </div>

          <!-- Empty State in Modal -->
          <div v-if="filteredProducts.length === 0" class="text-center py-12">
            <div class="text-6xl mb-4">🍽️</div>
            <p class="text-slate-500">{{ isRTL ? 'لا توجد منتجات' : 'No products found' }}</p>
          </div>
        </div>
      </div>
    </div>

    <div class="container mx-auto px-6 max-w-7xl py-12" ref="menuSection">
      <!-- Category Tabs -->
      <div class="flex flex-wrap justify-center gap-4 mb-12">
        <button 
          @click="selectedType = 'all'" 
          :class="selectedType === 'all' ? 'bg-gradient-to-r from-amber-500 to-amber-600 text-white shadow-luxury scale-105' : 'bg-white text-slate-700 hover:bg-slate-50 border-2 border-slate-200'"
          class="px-8 py-4 rounded-xl font-semibold text-lg transition-all duration-400"
        >
          {{ isRTL ? 'الكل' : 'All' }}
          <span class="ml-2 px-3 py-1 bg-white/20 rounded-full text-sm font-bold">
            {{ products.length }}
          </span>
        </button>
        <button 
          @click="selectedType = 'restaurant'" 
          :class="selectedType === 'restaurant' ? 'bg-gradient-to-r from-amber-500 to-amber-600 text-white shadow-luxury scale-105' : 'bg-white text-slate-700 hover:bg-slate-50 border-2 border-slate-200'"
          class="px-8 py-4 rounded-xl font-semibold text-lg transition-all duration-400"
        >
          {{ isRTL ? 'المطعم' : 'Restaurant' }}
          <span class="ml-2 px-3 py-1 bg-white/20 rounded-full text-sm font-bold">
            {{ restaurantCount }}
          </span>
        </button>
        <button 
          @click="selectedType = 'cafe'" 
          :class="selectedType === 'cafe' ? 'bg-gradient-to-r from-amber-500 to-amber-600 text-white shadow-luxury scale-105' : 'bg-white text-slate-700 hover:bg-slate-50 border-2 border-slate-200'"
          class="px-8 py-4 rounded-xl font-semibold text-lg transition-all duration-400"
        >
          {{ isRTL ? 'الكافيه' : 'Cafe' }}
          <span class="ml-2 px-3 py-1 bg-white/20 rounded-full text-sm font-bold">
            {{ cafeCount }}
          </span>
        </button>
      </div>

      <!-- Loading Skeletons -->
      <div v-if="loading" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div v-for="i in 6" :key="i" class="bg-white rounded-3xl shadow-lg overflow-hidden animate-pulse">
          <div class="h-64 bg-slate-200"></div>
          <div class="p-8 space-y-4">
            <div class="h-6 bg-slate-200 rounded w-3/4"></div>
            <div class="h-4 bg-slate-200 rounded w-full"></div>
            <div class="h-4 bg-slate-200 rounded w-2/3"></div>
            <div class="flex justify-between items-center pt-4">
              <div class="h-8 bg-slate-200 rounded w-24"></div>
              <div class="h-10 bg-slate-200 rounded-xl w-28"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Products Grid -->
      <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div 
          v-for="product in filteredProducts" 
          :key="product.id" 
          class="bg-white rounded-2xl shadow-md hover:shadow-2xl transition-all duration-300 overflow-hidden group"
        >
          <!-- Image -->
          <div class="relative overflow-hidden h-56">
            <img 
              :src="product.image_url || getDefaultImage(product.type)" 
              :alt="displayName(product)" 
              class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500" 
            />
          </div>
          
          <!-- Content -->
          <div class="p-6">
            <h3 class="text-2xl font-bold mb-2 text-slate-900">{{ displayName(product) }}</h3>
            <p class="text-slate-600 mb-4 line-clamp-2 min-h-[3rem]">{{ displayDescription(product) }}</p>
            
            <div class="flex justify-between items-center pt-4 border-t">
              <div>
                <p class="text-sm text-slate-500 mb-1">{{ isRTL ? 'السعر' : 'Price' }}</p>
                <span class="text-3xl font-bold text-slate-900">
                  {{ formatPrice(Number(product.price), currentLocale) }}
                </span>
              </div>
              <button 
                @click="orderProduct(product)" 
                class="bg-amber-500 hover:bg-primary-700 text-white px-6 py-3 rounded-xl font-semibold transition-all duration-300 hover:scale-105 shadow-md hover:shadow-lg"
              >
                {{ isRTL ? '🛒 اطلب الآن' : '🛒 Order Now' }}
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Empty State -->
      <div v-if="!loading && filteredProducts.length === 0" class="text-center py-20">
        <div class="text-8xl mb-4">{{ selectedType === 'restaurant' ? '🍽️' : '☕' }}</div>
        <p class="text-2xl text-slate-500 font-semibold">
          {{ isRTL ? 'لا توجد منتجات متاحة حالياً' : 'No products available at the moment' }}
        </p>
      </div>
    </div>

    <!-- Guest Info Modal -->
    <Transition name="modal">
      <div v-if="showGuestModal" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4" @click.self="showGuestModal = false">
        <Transition name="modal-content">
          <div v-if="showGuestModal" class="bg-white rounded-2xl p-8 max-w-md w-full shadow-2xl">
            <h3 class="text-2xl font-bold text-slate-900 mb-6 text-center">
              {{ isRTL ? '📝 معلومات الطلب' : '📝 Order Information' }}
            </h3>
            
            <div class="space-y-4 mb-6">
              <div>
                <label class="block text-sm font-semibold text-slate-700 mb-2">
                  {{ isRTL ? 'الاسم' : 'Name' }} *
                </label>
                <input v-model="guestInfo.name" type="text" class="input w-full" :placeholder="isRTL ? 'أدخل اسمك' : 'Enter your name'" required />
              </div>
              
              <div>
                <label class="block text-sm font-semibold text-slate-700 mb-2">
                  {{ isRTL ? 'البريد الإلكتروني' : 'Email' }} *
                </label>
                <input v-model="guestInfo.email" type="email" class="input w-full" :placeholder="isRTL ? 'example@email.com' : 'example@email.com'" required />
              </div>
              
              <div>
                <label class="block text-sm font-semibold text-slate-700 mb-2">
                  {{ isRTL ? 'رقم الهاتف' : 'Phone' }} *
                </label>
                <input v-model="guestInfo.phone" type="tel" class="input w-full" :placeholder="isRTL ? '+20 123 456 7890' : '+20 123 456 7890'" required />
              </div>
            </div>
            
            <div class="flex gap-3">
              <button @click="showGuestModal = false" class="flex-1 btn-secondary" :disabled="submitting">
                {{ isRTL ? 'إلغاء' : 'Cancel' }}
              </button>
              <button @click="confirmOrder" class="flex-1 btn-primary" :disabled="submitting">
                <span v-if="submitting" class="inline-block animate-spin mr-2">⏳</span>
                {{ submitting ? (isRTL ? 'جاري الطلب...' : 'Ordering...') : (isRTL ? 'تأكيد الطلب' : 'Confirm Order') }}
              </button>
            </div>
          </div>
        </Transition>
      </div>
    </Transition>

    <!-- Success Modal -->
    <Transition name="modal">
      <div v-if="showSuccessModal" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4" @click.self="showSuccessModal = false">
        <Transition name="modal-content">
          <div v-if="showSuccessModal" class="bg-white rounded-2xl p-8 max-w-md w-full shadow-2xl">
            <div class="text-center mb-6">
              <div class="text-6xl mb-4 animate-bounce">✅</div>
              <h3 class="text-2xl font-bold text-slate-900 mb-2">
                {{ isRTL ? 'تم الطلب بنجاح!' : 'Order Placed Successfully!' }}
              </h3>
              <p class="text-slate-600">
                {{ isRTL ? `رقم الطلب: #${lastBookingId}` : `Order ID: #${lastBookingId}` }}
              </p>
            </div>
            <button @click="showSuccessModal = false" class="w-full btn-primary">
              {{ isRTL ? 'إغلاق' : 'Close' }}
            </button>
          </div>
        </Transition>
      </div>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useAuthStore } from '@/stores/auth'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import { productsApi } from '@/api/products'
import { bookingsApi } from '@/api/bookings'
import { formatPrice } from '@/utils/currency'
import { getImage } from '@/config/images'
import type { Product } from '@/types'

const { t } = useI18n()
const router = useRouter()
const authStore = useAuthStore()
const appStore = useAppStore()
const toast = useToast()

// Parallax scroll effect
const scrollY = ref(0)
const menuSection = ref<HTMLElement | null>(null)

const handleScroll = () => {
  scrollY.value = window.scrollY
}

const scrollToMenu = () => {
  menuSection.value?.scrollIntoView({ behavior: 'smooth' })
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll, { passive: true })
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})

const products = ref<Product[]>([])
const loading = ref(true)
const submitting = ref(false)
const selectedType = ref('all')
const showMenuModal = ref(false)
const showGuestModal = ref(false)
const showSuccessModal = ref(false)
const lastBookingId = ref(0)
const selectedProduct = ref<Product | null>(null)
const guestInfo = ref({
  name: '',
  email: '',
  phone: ''
})
const isRTL = computed(() => appStore.isRTL)
const currentLocale = computed(() => appStore.currentLocale)

const filteredProducts = computed(() => {
  if (selectedType.value === 'all') return products.value
  return products.value.filter(p => p.type === selectedType.value)
})

const restaurantCount = computed(() => 
  products.value.filter(p => p.type === 'restaurant').length
)

const cafeCount = computed(() => 
  products.value.filter(p => p.type === 'cafe').length
)

const displayName = (product: Product) => isRTL.value ? product.name_ar : product.name
const displayDescription = (product: Product) => isRTL.value ? product.description_ar : product.description

function getDefaultImage(type: string) {
  return type === 'restaurant' 
    ? 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=600'
    : 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600'
}

async function loadProducts() {
  try {
    const allProducts = await productsApi.getAll({ is_active: true })
    // Load only restaurant and cafe products
    products.value = allProducts.filter(p => 
      ['restaurant', 'cafe', 'product'].includes(p.type) // 'product' for backward compatibility
    )
  } catch (error) {
    console.error('Failed to load products:', error)
  } finally {
    loading.value = false
  }
}

async function orderProduct(product: Product) {
  selectedProduct.value = product
  showGuestModal.value = true
}

async function confirmOrder() {
  // Validation
  if (!guestInfo.value.name.trim()) {
    toast.error(
      isRTL.value ? 'خطأ' : 'Error',
      isRTL.value ? 'يرجى إدخال الاسم' : 'Please enter your name'
    )
    return
  }

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  if (!emailRegex.test(guestInfo.value.email)) {
    toast.error(
      isRTL.value ? 'خطأ' : 'Error',
      isRTL.value ? 'يرجى إدخال بريد إلكتروني صحيح' : 'Please enter a valid email'
    )
    return
  }

  const phoneRegex = /^[\d\s\+\-\(\)]+$/
  if (!phoneRegex.test(guestInfo.value.phone) || guestInfo.value.phone.length < 10) {
    toast.error(
      isRTL.value ? 'خطأ' : 'Error',
      isRTL.value ? 'يرجى إدخال رقم هاتف صحيح' : 'Please enter a valid phone number'
    )
    return
  }

  if (!selectedProduct.value) return

  submitting.value = true

  try {
    const booking = await bookingsApi.create({
      product_id: selectedProduct.value.id,
      booking_type: selectedType.value,
      booking_date: new Date().toISOString(),
      guests: 1,
      total_price: Number(selectedProduct.value.price),
      guest_name: guestInfo.value.name,
      guest_email: guestInfo.value.email,
      guest_phone: guestInfo.value.phone
    })
    
    lastBookingId.value = booking.id
    showGuestModal.value = false
    showSuccessModal.value = true
    
    toast.success(
      isRTL.value ? 'تم الطلب بنجاح!' : 'Order Placed!',
      isRTL.value ? `رقم الطلب: #${booking.id}` : `Order ID: #${booking.id}`
    )
    
    // Reset form
    guestInfo.value = { name: '', email: '', phone: '' }
  } catch (error: any) {
    toast.error(
      isRTL.value ? 'فشل الطلب' : 'Order Failed',
      error.response?.data?.detail || (isRTL.value ? 'حدث خطأ، حاول مرة أخرى' : 'An error occurred, please try again')
    )
  } finally {
    submitting.value = false
  }
}

onMounted(() => {
  loadProducts()
})
</script>

<style scoped>
.modal-enter-active, .modal-leave-active {
  transition: opacity 0.3s ease;
}
.modal-enter-from, .modal-leave-to {
  opacity: 0;
}

.modal-content-enter-active {
  transition: all 0.3s ease;
}
.modal-content-leave-active {
  transition: all 0.2s ease;
}
.modal-content-enter-from {
  opacity: 0;
  transform: scale(0.9) translateY(-20px);
}
.modal-content-leave-to {
  opacity: 0;
  transform: scale(0.95);
}

@keyframes fade-in {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes scale-in {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.animate-fade-in {
  animation: fade-in 0.3s ease-out;
}

.animate-scale-in {
  animation: scale-in 0.3s ease-out;
}
</style>

