<template>
  <footer class="bg-gradient-to-br from-gray-900 via-slate-800 to-gray-900 text-white relative overflow-hidden">
    <!-- Background Pattern -->
    <div class="absolute inset-0 opacity-5">
      <div class="absolute top-0 left-0 w-full h-full" style="background-image: radial-gradient(circle at 25% 25%, #3b82f6 2px, transparent 2px); background-size: 50px 50px;"></div>
    </div>
    
    <!-- Floating Elements -->
    <div class="absolute top-10 right-10 w-20 h-20 bg-blue-500/10 rounded-full animate-float"></div>
    <div class="absolute bottom-20 left-10 w-16 h-16 bg-purple-500/10 rounded-full animate-float-delay"></div>

    <div class="relative z-10">
      <!-- Main Footer Content -->
      <div class="container mx-auto px-4 py-16">
        <div class="grid lg:grid-cols-4 md:grid-cols-2 gap-12">
          <!-- Brand Section -->
          <div class="lg:col-span-1 space-y-6">
            <div class="flex items-center space-x-3 space-x-reverse">
              <div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center">
                <i class="fas fa-umbrella-beach text-white text-xl"></i>
              </div>
              <div>
                <h3 class="text-2xl font-black">الخيمة بيتش ريزورت</h3>
                <p class="text-blue-200 text-sm">Luxury Beach Resort</p>
              </div>
            </div>
            
            <p class="text-gray-300 leading-relaxed">
              منتجع فاخر على شاطئ البحر الأحمر يوفر تجربة استثنائية تجمع بين الراحة والأناقة والطبيعة الخلابة.
            </p>
            
            <!-- Social Media -->
            <div class="flex space-x-4 space-x-reverse">
              <a href="#" class="w-10 h-10 bg-blue-600 hover:bg-blue-700 rounded-full flex items-center justify-center transition-colors duration-300 group">
                <i class="fab fa-facebook-f group-hover:scale-110 transition-transform"></i>
              </a>
              <a href="#" class="w-10 h-10 bg-pink-600 hover:bg-pink-700 rounded-full flex items-center justify-center transition-colors duration-300 group">
                <i class="fab fa-instagram group-hover:scale-110 transition-transform"></i>
              </a>
              <a href="#" class="w-10 h-10 bg-blue-400 hover:bg-blue-500 rounded-full flex items-center justify-center transition-colors duration-300 group">
                <i class="fab fa-twitter group-hover:scale-110 transition-transform"></i>
              </a>
              <a href="#" class="w-10 h-10 bg-red-600 hover:bg-red-700 rounded-full flex items-center justify-center transition-colors duration-300 group">
                <i class="fab fa-youtube group-hover:scale-110 transition-transform"></i>
              </a>
            </div>
          </div>

          <!-- Quick Links -->
          <div class="space-y-6">
            <h4 class="text-xl font-bold text-white mb-6 relative">
              روابط سريعة
              <div class="absolute bottom-0 left-0 w-12 h-0.5 bg-gradient-to-r from-blue-500 to-purple-500 rounded-full"></div>
            </h4>
            <nav class="space-y-3">
              <router-link to="/" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-home mr-3 group-hover:text-blue-400"></i>
                الرئيسية
              </router-link>
              <router-link to="/rooms" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-bed mr-3 group-hover:text-purple-400"></i>
                الغرف والأجنحة
              </router-link>
              <router-link to="/restaurant" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-utensils mr-3 group-hover:text-green-400"></i>
                المطعم والكافيه
              </router-link>
              <router-link to="/activities" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-swimmer mr-3 group-hover:text-teal-400"></i>
                الأنشطة والترفيه
              </router-link>
              <router-link to="/beach" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-umbrella-beach mr-3 group-hover:text-orange-400"></i>
                الشاطئ الخاص
              </router-link>
              <router-link to="/gallery" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-images mr-3 group-hover:text-pink-400"></i>
                معرض الصور
              </router-link>
            </nav>
          </div>

          <!-- Services -->
          <div class="space-y-6">
            <h4 class="text-xl font-bold text-white mb-6 relative">
              خدماتنا المميزة
              <div class="absolute bottom-0 left-0 w-12 h-0.5 bg-gradient-to-r from-green-500 to-teal-500 rounded-full"></div>
            </h4>
            <nav class="space-y-3">
              <router-link to="/events" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-calendar-alt mr-3 group-hover:text-blue-400"></i>
                الفعاليات والمؤتمرات
              </router-link>
              <router-link to="/about" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-info-circle mr-3 group-hover:text-purple-400"></i>
                عن المنتجع
              </router-link>
              <router-link to="/team" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-users mr-3 group-hover:text-green-400"></i>
                فريق العمل
              </router-link>
              <router-link to="/location" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-map-marker-alt mr-3 group-hover:text-red-400"></i>
                الموقع والوصول
              </router-link>
              <router-link to="/faq" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-question-circle mr-3 group-hover:text-yellow-400"></i>
                الأسئلة الشائعة
              </router-link>
              <router-link to="/contact" class="block text-gray-300 hover:text-white hover:translate-x-2 transition-all duration-300 group">
                <i class="fas fa-phone mr-3 group-hover:text-teal-400"></i>
                تواصل معنا
              </router-link>
            </nav>
          </div>

          <!-- Contact Info -->
          <div class="space-y-6">
            <h4 class="text-xl font-bold text-white mb-6 relative">
              معلومات التواصل
              <div class="absolute bottom-0 left-0 w-12 h-0.5 bg-gradient-to-r from-orange-500 to-red-500 rounded-full"></div>
            </h4>
            
            <div class="space-y-4">
              <div class="flex items-start space-x-3 space-x-reverse group">
                <div class="w-10 h-10 bg-blue-600/20 rounded-lg flex items-center justify-center flex-shrink-0 group-hover:bg-blue-600/30 transition-colors">
                  <i class="fas fa-map-marker-alt text-blue-400"></i>
                </div>
                <div>
                  <p class="text-white font-semibold">العنوان</p>
                  <p class="text-gray-300 text-sm">شاطئ البحر الأحمر، الغردقة، مصر</p>
                </div>
              </div>
              
              <div class="flex items-start space-x-3 space-x-reverse group">
                <div class="w-10 h-10 bg-green-600/20 rounded-lg flex items-center justify-center flex-shrink-0 group-hover:bg-green-600/30 transition-colors">
                  <i class="fas fa-phone text-green-400"></i>
                </div>
                <div>
                  <p class="text-white font-semibold">الهاتف</p>
                  <p class="text-gray-300 text-sm">+20 123 456 789</p>
                </div>
              </div>
              
              <div class="flex items-start space-x-3 space-x-reverse group">
                <div class="w-10 h-10 bg-purple-600/20 rounded-lg flex items-center justify-center flex-shrink-0 group-hover:bg-purple-600/30 transition-colors">
                  <i class="fas fa-envelope text-purple-400"></i>
                </div>
                <div>
                  <p class="text-white font-semibold">البريد الإلكتروني</p>
                  <p class="text-gray-300 text-sm">info@alkhayma-resort.com</p>
                </div>
              </div>
              
              <div class="flex items-start space-x-3 space-x-reverse group">
                <div class="w-10 h-10 bg-orange-600/20 rounded-lg flex items-center justify-center flex-shrink-0 group-hover:bg-orange-600/30 transition-colors">
                  <i class="fas fa-clock text-orange-400"></i>
                </div>
                <div>
                  <p class="text-white font-semibold">ساعات العمل</p>
                  <p class="text-gray-300 text-sm">24/7 - خدمة على مدار الساعة</p>
                </div>
              </div>
            </div>

            <!-- Newsletter Signup -->
            <div class="bg-gradient-to-r from-blue-600/20 to-purple-600/20 rounded-2xl p-6 border border-blue-500/20">
              <h5 class="text-white font-bold mb-3">اشترك في النشرة الإخبارية</h5>
              <p class="text-gray-300 text-sm mb-4">احصل على أحدث العروض والأخبار</p>
              <div class="flex gap-2">
                <input 
                  type="email" 
                  placeholder="بريدك الإلكتروني"
                  class="flex-1 px-4 py-2 bg-white/10 border border-white/20 rounded-lg text-white placeholder-gray-400 focus:outline-none focus:border-blue-400 transition-colors"
                />
                <button class="bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 px-4 py-2 rounded-lg transition-colors">
                  <i class="fas fa-paper-plane"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Awards & Certifications -->
      <div class="border-t border-gray-700 py-8">
        <div class="container mx-auto px-4">
          <div class="text-center mb-8">
            <h4 class="text-xl font-bold text-white mb-4">الجوائز والشهادات</h4>
          </div>
          <div class="flex flex-wrap justify-center items-center gap-8 opacity-60 hover:opacity-100 transition-opacity duration-300">
            <div class="flex items-center space-x-2 space-x-reverse">
              <i class="fas fa-award text-yellow-400 text-2xl"></i>
              <span class="text-gray-300">أفضل منتجع 2025</span>
            </div>
            <div class="flex items-center space-x-2 space-x-reverse">
              <i class="fas fa-star text-yellow-400 text-2xl"></i>
              <span class="text-gray-300">5 نجوم</span>
            </div>
            <div class="flex items-center space-x-2 space-x-reverse">
              <i class="fas fa-leaf text-green-400 text-2xl"></i>
              <span class="text-gray-300">صديق للبيئة</span>
            </div>
            <div class="flex items-center space-x-2 space-x-reverse">
              <i class="fas fa-shield-alt text-blue-400 text-2xl"></i>
              <span class="text-gray-300">معتمد دولياً</span>
            </div>
          </div>
        </div>
      </div>

      <!-- Bottom Bar -->
      <div class="border-t border-gray-700 py-6">
        <div class="container mx-auto px-4">
          <div class="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
            <div class="text-gray-400 text-sm">
              © 2026 الخيمة بيتش ريزورت. جميع الحقوق محفوظة.
            </div>
            
            <div class="flex flex-wrap items-center gap-6 text-sm">
              <router-link to="/privacy" class="text-gray-400 hover:text-white transition-colors">
                سياسة الخصوصية
              </router-link>
              <router-link to="/terms" class="text-gray-400 hover:text-white transition-colors">
                الشروط والأحكام
              </router-link>
              <router-link to="/cookies" class="text-gray-400 hover:text-white transition-colors">
                سياسة الكوكيز
              </router-link>
              <router-link to="/sitemap" class="text-gray-400 hover:text-white transition-colors">
                خريطة الموقع
              </router-link>
            </div>
            
            <div class="flex items-center space-x-4 space-x-reverse">
              <span class="text-gray-400 text-sm">صُنع بـ</span>
              <i class="fas fa-heart text-red-500 animate-pulse"></i>
              <span class="text-gray-400 text-sm">في مصر</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

