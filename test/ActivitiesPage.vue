<template>
  <div class="min-h-screen bg-gradient-to-br from-teal-50 to-blue-50">
    <!-- Hero Section -->
    <section class="relative h-screen flex items-center justify-center overflow-hidden">
      <div class="absolute inset-0 bg-gradient-to-r from-teal-600 via-blue-600 to-indigo-600"></div>
      <div class="absolute inset-0 bg-black/30"></div>
      
      <!-- Floating Activity Elements -->
      <div class="absolute top-20 left-10 w-16 h-16 bg-white/10 rounded-full animate-float flex items-center justify-center">
        <i class="fas fa-swimmer text-white text-xl"></i>
      </div>
      <div class="absolute bottom-20 right-10 w-12 h-12 bg-teal-400/20 rounded-full animate-float-delay flex items-center justify-center">
        <i class="fas fa-volleyball-ball text-white"></i>
      </div>
      <div class="absolute top-1/3 right-1/4 w-14 h-14 bg-blue-400/20 rounded-full animate-float-slow flex items-center justify-center">
        <i class="fas fa-ship text-white"></i>
      </div>
      <div class="absolute bottom-1/3 left-1/4 w-10 h-10 bg-indigo-400/20 rounded-full animate-float flex items-center justify-center">
        <i class="fas fa-dumbbell text-white text-sm"></i>
      </div>
      
      <div class="relative z-10 text-center text-white px-4 max-w-6xl mx-auto">
        <div class="animate-fade-in-up">
          <h1 class="text-6xl md:text-8xl font-black mb-6 bg-gradient-to-r from-white via-teal-100 to-blue-100 bg-clip-text text-transparent leading-tight">
            الأنشطة والترفيه
          </h1>
          <div class="h-1 w-32 bg-gradient-to-r from-teal-400 to-blue-400 mx-auto mb-8 rounded-full"></div>
        </div>
        
        <div class="animate-fade-in-up-delay">
          <p class="text-2xl md:text-3xl mb-4 font-light leading-relaxed">
            مغامرات لا تُنسى على شاطئ البحر الأحمر
          </p>
          <p class="text-lg md:text-xl mb-12 text-teal-100 max-w-3xl mx-auto">
            اكتشف عالماً من الأنشطة المائية والرياضية والترفيهية المصممة لجميع الأعمار
          </p>
        </div>

        <!-- Activity Categories -->
        <div class="animate-fade-in-up-delay-2 grid grid-cols-2 md:grid-cols-4 gap-4 mb-12">
          <button 
            @click="scrollToSection('water-sports')"
            class="group bg-white/10 backdrop-blur-sm hover:bg-white/20 border border-white/20 rounded-2xl p-6 transition-all duration-300 transform hover:scale-105"
          >
            <i class="fas fa-swimmer text-3xl mb-3 group-hover:animate-bounce"></i>
            <p class="font-semibold">الرياضات المائية</p>
          </button>
          
          <button 
            @click="scrollToSection('beach-activities')"
            class="group bg-white/10 backdrop-blur-sm hover:bg-white/20 border border-white/20 rounded-2xl p-6 transition-all duration-300 transform hover:scale-105"
          >
            <i class="fas fa-volleyball-ball text-3xl mb-3 group-hover:animate-bounce"></i>
            <p class="font-semibold">أنشطة الشاطئ</p>
          </button>
          
          <button 
            @click="scrollToSection('fitness')"
            class="group bg-white/10 backdrop-blur-sm hover:bg-white/20 border border-white/20 rounded-2xl p-6 transition-all duration-300 transform hover:scale-105"
          >
            <i class="fas fa-dumbbell text-3xl mb-3 group-hover:animate-bounce"></i>
            <p class="font-semibold">اللياقة البدنية</p>
          </button>
          
          <button 
            @click="scrollToSection('entertainment')"
            class="group bg-white/10 backdrop-blur-sm hover:bg-white/20 border border-white/20 rounded-2xl p-6 transition-all duration-300 transform hover:scale-105"
          >
            <i class="fas fa-music text-3xl mb-3 group-hover:animate-bounce"></i>
            <p class="font-semibold">الترفيه</p>
          </button>
        </div>
      </div>

      <!-- Scroll Indicator -->
      <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce">
        <div class="w-6 h-10 border-2 border-white/50 rounded-full flex justify-center">
          <div class="w-1 h-3 bg-white/70 rounded-full mt-2 animate-pulse"></div>
        </div>
      </div>
    </section>

    <!-- Water Sports Section -->
    <section id="water-sports" class="py-20 bg-white relative overflow-hidden">
      <div class="absolute inset-0 opacity-5">
        <div class="absolute top-0 left-0 w-full h-full" style="background-image: radial-gradient(circle at 25% 25%, #0891b2 2px, transparent 2px); background-size: 50px 50px;"></div>
      </div>

      <div class="container mx-auto px-4 relative z-10">
        <div class="text-center mb-16 animate-fade-in-up">
          <div class="inline-flex items-center bg-teal-100 text-teal-800 px-6 py-3 rounded-full mb-6">
            <i class="fas fa-swimmer mr-3"></i>
            <span class="font-semibold">الرياضات المائية</span>
          </div>
          <h2 class="text-5xl font-black text-gray-800 mb-6">
            مغامرات مائية مثيرة
          </h2>
          <div class="h-1 w-24 bg-gradient-to-r from-teal-500 to-blue-500 mx-auto mb-6 rounded-full"></div>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
            استكشف عالم البحر الأحمر مع مجموعة متنوعة من الأنشطة المائية المثيرة
          </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          <!-- Diving -->
          <div class="group bg-gradient-to-br from-teal-50 to-blue-50 rounded-3xl p-8 hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2">
            <div class="relative mb-6">
              <div class="w-20 h-20 bg-gradient-to-br from-teal-400 to-blue-500 rounded-2xl flex items-center justify-center mx-auto group-hover:scale-110 transition-transform duration-300">
                <i class="fas fa-mask text-white text-3xl"></i>
              </div>
              <div class="absolute -top-2 -right-2 w-6 h-6 bg-teal-200 rounded-full animate-ping"></div>
            </div>
            <h3 class="text-2xl font-bold text-gray-800 mb-4 text-center">الغوص</h3>
            <p class="text-gray-600 text-center mb-6 leading-relaxed">اكتشف الشعاب المرجانية الخلابة والحياة البحرية المتنوعة</p>
            <div class="text-center">
              <div class="bg-teal-100 text-teal-800 px-4 py-2 rounded-full inline-block mb-4">
                <span class="font-bold">150 ج.م / شخص</span>
              </div>
              <button class="w-full bg-gradient-to-r from-teal-600 to-blue-600 text-white py-3 rounded-xl font-semibold hover:shadow-lg transition-all duration-300">
                احجز الآن
              </button>
            </div>
          </div>

          <!-- Snorkeling -->
          <div class="group bg-gradient-to-br from-blue-50 to-indigo-50 rounded-3xl p-8 hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2">
            <div class="relative mb-6">
              <div class="w-20 h-20 bg-gradient-to-br from-blue-400 to-indigo-500 rounded-2xl flex items-center justify-center mx-auto group-hover:scale-110 transition-transform duration-300">
                <i class="fas fa-swimming-pool text-white text-3xl"></i>
              </div>
              <div class="absolute -top-2 -right-2 w-6 h-6 bg-blue-200 rounded-full animate-ping"></div>
            </div>
            <h3 class="text-2xl font-bold text-gray-800 mb-4 text-center">السنوركلينج</h3>
            <p class="text-gray-600 text-center mb-6 leading-relaxed">استمتع بمشاهدة الأسماك الملونة في المياه الضحلة</p>
            <div class="text-center">
              <div class="bg-blue-100 text-blue-800 px-4 py-2 rounded-full inline-block mb-4">
                <span class="font-bold">80 ج.م / شخص</span>
              </div>
              <button class="w-full bg-gradient-to-r from-blue-600 to-indigo-600 text-white py-3 rounded-xl font-semibold hover:shadow-lg transition-all duration-300">
                احجز الآن
              </button>
            </div>
          </div>

          <!-- Jet Ski -->
          <div class="group bg-gradient-to-br from-orange-50 to-red-50 rounded-3xl p-8 hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2">
            <div class="relative mb-6">
              <div class="w-20 h-20 bg-gradient-to-br from-orange-400 to-red-500 rounded-2xl flex items-center justify-center mx-auto group-hover:scale-110 transition-transform duration-300">
                <i class="fas fa-ship text-white text-3xl"></i>
              </div>
              <div class="absolute -top-2 -right-2 w-6 h-6 bg-orange-200 rounded-full animate-ping"></div>
            </div>
            <h3 class="text-2xl font-bold text-gray-800 mb-4 text-center">جت سكي</h3>
            <p class="text-gray-600 text-center mb-6 leading-relaxed">اندفع عبر الأمواج واستمتع بالسرعة والإثارة</p>
            <div class="text-center">
              <div class="bg-orange-100 text-orange-800 px-4 py-2 rounded-full inline-block mb-4">
                <span class="font-bold">200 ج.م / 30 دقيقة</span>
              </div>
              <button class="w-full bg-gradient-to-r from-orange-600 to-red-600 text-white py-3 rounded-xl font-semibold hover:shadow-lg transition-all duration-300">
                احجز الآن
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Beach Activities Section -->
    <section id="beach-activities" class="py-20 bg-gradient-to-br from-yellow-50 to-orange-50 relative overflow-hidden">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 animate-fade-in-up">
          <div class="inline-flex items-center bg-yellow-100 text-yellow-800 px-6 py-3 rounded-full mb-6">
            <i class="fas fa-volleyball-ball mr-3"></i>
            <span class="font-semibold">أنشطة الشاطئ</span>
          </div>
          <h2 class="text-5xl font-black text-gray-800 mb-6">
            متعة على الرمال الذهبية
          </h2>
          <div class="h-1 w-24 bg-gradient-to-r from-yellow-500 to-orange-500 mx-auto mb-6 rounded-full"></div>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
            استمتع بأنشطة متنوعة على شاطئنا الخاص مع الأصدقاء والعائلة
          </p>
        </div>

        <div class="grid md:grid-cols-2 gap-12 items-center">
          <div class="space-y-8">
            <div class="flex items-start space-x-4 space-x-reverse">
              <div class="w-16 h-16 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-2xl flex items-center justify-center flex-shrink-0">
                <i class="fas fa-volleyball-ball text-white text-2xl"></i>
              </div>
              <div>
                <h3 class="text-xl font-bold text-gray-800 mb-2">كرة الطائرة الشاطئية</h3>
                <p class="text-gray-600">استمتع بمباريات مثيرة مع الأصدقاء على الرمال</p>
                <span class="text-green-600 font-semibold">مجاني</span>
              </div>
            </div>
            
            <div class="flex items-start space-x-4 space-x-reverse">
              <div class="w-16 h-16 bg-gradient-to-br from-blue-400 to-teal-500 rounded-2xl flex items-center justify-center flex-shrink-0">
                <i class="fas fa-futbol text-white text-2xl"></i>
              </div>
              <div>
                <h3 class="text-xl font-bold text-gray-800 mb-2">كرة القدم الشاطئية</h3>
                <p class="text-gray-600">مباريات كرة قدم ممتعة على الرمال الناعمة</p>
                <span class="text-green-600 font-semibold">مجاني</span>
              </div>
            </div>
            
            <div class="flex items-start space-x-4 space-x-reverse">
              <div class="w-16 h-16 bg-gradient-to-br from-purple-400 to-pink-500 rounded-2xl flex items-center justify-center flex-shrink-0">
                <i class="fas fa-chess text-white text-2xl"></i>
              </div>
              <div>
                <h3 class="text-xl font-bold text-gray-800 mb-2">ألعاب الطاولة</h3>
                <p class="text-gray-600">شطرنج، طاولة، وألعاب أخرى تحت المظلات</p>
                <span class="text-green-600 font-semibold">مجاني</span>
              </div>
            </div>
          </div>
          
          <div class="relative">
            <div class="bg-gradient-to-br from-yellow-400 to-orange-600 rounded-3xl p-8 text-white">
              <h3 class="text-2xl font-bold mb-6 text-center">جدول الأنشطة اليومية</h3>
              
              <div class="space-y-4">
                <div class="bg-white/10 rounded-xl p-4">
                  <div class="flex justify-between items-center">
                    <span class="font-semibold">9:00 ص</span>
                    <span>يوجا الشاطئ</span>
                  </div>
                </div>
                
                <div class="bg-white/10 rounded-xl p-4">
                  <div class="flex justify-between items-center">
                    <span class="font-semibold">11:00 ص</span>
                    <span>أيروبيك مائي</span>
                  </div>
                </div>
                
                <div class="bg-white/10 rounded-xl p-4">
                  <div class="flex justify-between items-center">
                    <span class="font-semibold">3:00 م</span>
                    <span>بطولة كرة طائرة</span>
                  </div>
                </div>
                
                <div class="bg-white/10 rounded-xl p-4">
                  <div class="flex justify-between items-center">
                    <span class="font-semibold">6:00 م</span>
                    <span>رقص زومبا</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Fitness Section -->
    <section id="fitness" class="py-20 bg-white relative overflow-hidden">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 animate-fade-in-up">
          <div class="inline-flex items-center bg-purple-100 text-purple-800 px-6 py-3 rounded-full mb-6">
            <i class="fas fa-dumbbell mr-3"></i>
            <span class="font-semibold">اللياقة البدنية</span>
          </div>
          <h2 class="text-5xl font-black text-gray-800 mb-6">
            حافظ على لياقتك أثناء الإجازة
          </h2>
          <div class="h-1 w-24 bg-gradient-to-r from-purple-500 to-pink-500 mx-auto mb-6 rounded-full"></div>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
            صالة رياضية مجهزة بأحدث الأجهزة وبرامج تدريب متنوعة
          </p>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
          <div class="bg-gradient-to-br from-purple-50 to-pink-50 rounded-3xl p-8 text-center hover:shadow-2xl transition-all duration-500">
            <div class="w-20 h-20 bg-gradient-to-br from-purple-400 to-pink-500 rounded-2xl flex items-center justify-center mx-auto mb-6">
              <i class="fas fa-dumbbell text-white text-3xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-4">صالة الأثقال</h3>
            <p class="text-gray-600 mb-4">أجهزة حديثة لتمارين القوة والعضلات</p>
            <span class="text-purple-600 font-semibold">مفتوح 24/7</span>
          </div>
          
          <div class="bg-gradient-to-br from-green-50 to-teal-50 rounded-3xl p-8 text-center hover:shadow-2xl transition-all duration-500">
            <div class="w-20 h-20 bg-gradient-to-br from-green-400 to-teal-500 rounded-2xl flex items-center justify-center mx-auto mb-6">
              <i class="fas fa-running text-white text-3xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-4">أجهزة الكارديو</h3>
            <p class="text-gray-600 mb-4">جهاز جري، دراجات، وأجهزة أخرى</p>
            <span class="text-green-600 font-semibold">مفتوح 24/7</span>
          </div>
          
          <div class="bg-gradient-to-br from-blue-50 to-indigo-50 rounded-3xl p-8 text-center hover:shadow-2xl transition-all duration-500">
            <div class="w-20 h-20 bg-gradient-to-br from-blue-400 to-indigo-500 rounded-2xl flex items-center justify-center mx-auto mb-6">
              <i class="fas fa-spa text-white text-3xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-4">يوجا وتأمل</h3>
            <p class="text-gray-600 mb-4">جلسات يوجا وتأمل على الشاطئ</p>
            <span class="text-blue-600 font-semibold">يومياً 7:00 ص</span>
          </div>
        </div>
      </div>
    </section>

    <!-- Entertainment Section -->
    <section id="entertainment" class="py-20 bg-gradient-to-r from-purple-600 via-pink-600 to-red-600 relative overflow-hidden">
      <div class="absolute inset-0 bg-black/20"></div>
      <div class="container mx-auto px-4 relative z-10">
        <div class="text-center text-white">
          <h2 class="text-5xl font-black mb-6">
            ترفيه لا ينتهي
          </h2>
          <p class="text-xl mb-12 max-w-2xl mx-auto leading-relaxed">
            استمتع بأمسيات لا تُنسى مع برامج ترفيهية متنوعة كل ليلة
          </p>
          
          <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">
            <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 text-center hover:bg-white/20 transition-colors duration-300">
              <i class="fas fa-music text-4xl mb-4"></i>
              <h4 class="font-bold mb-2">موسيقى حية</h4>
              <p class="text-sm text-purple-100">كل ليلة جمعة</p>
            </div>
            
            <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 text-center hover:bg-white/20 transition-colors duration-300">
              <i class="fas fa-fire text-4xl mb-4"></i>
              <h4 class="font-bold mb-2">عرض النار</h4>
              <p class="text-sm text-purple-100">كل ليلة سبت</p>
            </div>
            
            <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 text-center hover:bg-white/20 transition-colors duration-300">
              <i class="fas fa-cocktail text-4xl mb-4"></i>
              <h4 class="font-bold mb-2">حفلة الشاطئ</h4>
              <p class="text-sm text-purple-100">كل ليلة خميس</p>
            </div>
            
            <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 text-center hover:bg-white/20 transition-colors duration-300">
              <i class="fas fa-star text-4xl mb-4"></i>
              <h4 class="font-bold mb-2">ليلة الكاريوكي</h4>
              <p class="text-sm text-purple-100">كل ليلة أربعاء</p>
            </div>
          </div>
          
          <button class="bg-white text-purple-600 px-10 py-4 rounded-full text-lg font-bold hover:bg-gray-100 transition-all duration-300 transform hover:scale-105 shadow-xl">
            <i class="fas fa-calendar mr-3"></i>
            عرض جدول الفعاليات
          </button>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
const scrollToSection = (sectionId) => {
  const element = document.getElementById(sectionId)
  if (element) {
    element.scrollIntoView({ behavior: 'smooth' })
  }
}
</script>

