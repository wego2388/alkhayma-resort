<template>
  <div class="min-h-screen bg-gradient-to-br from-gray-50 to-blue-50">
    <!-- Hero Section -->
    <section class="relative h-96 flex items-center justify-center overflow-hidden">
      <div class="absolute inset-0 bg-gradient-to-r from-blue-800 via-indigo-800 to-purple-800"></div>
      <div class="absolute inset-0 bg-black/30"></div>
      
      <!-- Floating Elements -->
      <div class="absolute top-10 left-10 w-16 h-16 bg-white/10 rounded-full animate-float flex items-center justify-center">
        <i class="fas fa-info-circle text-white text-xl"></i>
      </div>
      <div class="absolute bottom-10 right-10 w-12 h-12 bg-blue-400/20 rounded-full animate-float-delay flex items-center justify-center">
        <i class="fas fa-heart text-white"></i>
      </div>
      
      <div class="relative z-10 text-center text-white px-4 max-w-4xl mx-auto">
        <h1 class="text-5xl md:text-6xl font-black mb-6 animate-fade-in-up">
          عن منتجع الخيمة
        </h1>
        <div class="h-1 w-24 bg-gradient-to-r from-white to-blue-200 mx-auto mb-6 rounded-full"></div>
        <p class="text-xl md:text-2xl mb-8 animate-fade-in-up-delay">
          قصة نجاح تجمع بين الضيافة العربية الأصيلة والفخامة العالمية
        </p>
      </div>
    </section>

    <!-- Story Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="grid lg:grid-cols-2 gap-16 items-center">
          <div class="animate-fade-in-up">
            <div class="inline-flex items-center bg-blue-100 text-blue-800 px-6 py-3 rounded-full mb-8">
              <i class="fas fa-book-open mr-3"></i>
              <span class="font-semibold">قصتنا</span>
            </div>
            
            <h2 class="text-4xl font-black text-gray-800 mb-6">
              رحلة من الحلم إلى الواقع
            </h2>
            
            <div class="space-y-6 text-gray-600 leading-relaxed">
              <p>
                بدأت قصة منتجع الخيمة بيتش ريزورت في عام 2010 كحلم بسيط لإنشاء وجهة سياحية استثنائية على شاطئ البحر الأحمر. كان الهدف واضحاً: تقديم تجربة ضيافة لا تُنسى تجمع بين الأصالة العربية والفخامة العالمية.
              </p>
              
              <p>
                على مدار السنوات، نمت رؤيتنا لتصبح واقعاً ملموساً. اليوم، نفخر بكوننا واحداً من أرقى المنتجعات في المنطقة، حيث نستقبل ضيوفاً من جميع أنحاء العالم في بيئة تتميز بالدفء والضيافة الأصيلة.
              </p>
              
              <p>
                نؤمن بأن كل ضيف يستحق تجربة فريدة ومميزة، لذلك نسعى باستمرار لتطوير خدماتنا ومرافقنا لنضمن أن كل لحظة تقضونها معنا تكون استثنائية.
              </p>
            </div>
          </div>
          
          <div class="relative animate-fade-in-up-delay">
            <div class="bg-gradient-to-br from-blue-400 to-purple-600 rounded-3xl p-8 text-white">
              <div class="grid grid-cols-2 gap-6 text-center">
                <div>
                  <div class="text-4xl font-black mb-2">15+</div>
                  <div class="text-blue-100">سنة من التميز</div>
                </div>
                <div>
                  <div class="text-4xl font-black mb-2">50K+</div>
                  <div class="text-blue-100">ضيف سعيد</div>
                </div>
                <div>
                  <div class="text-4xl font-black mb-2">200+</div>
                  <div class="text-blue-100">موظف محترف</div>
                </div>
                <div>
                  <div class="text-4xl font-black mb-2">25+</div>
                  <div class="text-blue-100">جائزة دولية</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Values Section -->
    <section class="py-20 bg-gradient-to-br from-gray-50 to-blue-50">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 animate-fade-in-up">
          <h2 class="text-5xl font-black text-gray-800 mb-6">
            قيمنا ومبادئنا
          </h2>
          <div class="h-1 w-24 bg-gradient-to-r from-blue-500 to-purple-500 mx-auto mb-6 rounded-full"></div>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
            نؤمن بمجموعة من القيم الأساسية التي توجه كل ما نقوم به
          </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
          <FeatureCard
            title="الضيافة الأصيلة"
            description="نقدم ضيافة عربية أصيلة تعكس كرم وحفاوة الشرق"
            icon="fas fa-heart"
            theme="red"
            :show-ping="true"
            class="animate-fade-in-up"
          />
          
          <FeatureCard
            title="الجودة والتميز"
            description="نسعى للتميز في كل تفصيل لضمان تجربة استثنائية"
            icon="fas fa-star"
            theme="orange"
            badge="5★"
            class="animate-fade-in-up-delay"
          />
          
          <FeatureCard
            title="الاستدامة البيئية"
            description="نحافظ على البيئة البحرية ونعمل بمسؤولية اجتماعية"
            icon="fas fa-leaf"
            theme="green"
            class="animate-fade-in-up-delay-2"
          />
          
          <FeatureCard
            title="الابتكار المستمر"
            description="نطور خدماتنا باستمرار لنواكب أحدث التطورات"
            icon="fas fa-lightbulb"
            theme="purple"
            class="animate-fade-in-up-delay-3"
          />
        </div>
      </div>
    </section>

    <!-- Team Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 animate-fade-in-up">
          <h2 class="text-5xl font-black text-gray-800 mb-6">
            فريق الإدارة
          </h2>
          <div class="h-1 w-24 bg-gradient-to-r from-blue-500 to-purple-500 mx-auto mb-6 rounded-full"></div>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
            فريق من الخبراء المتخصصين في صناعة الضيافة والسياحة
          </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          <!-- Team Member 1 -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 text-center">
            <div class="relative mb-6">
              <div class="w-24 h-24 bg-gradient-to-br from-blue-400 to-blue-600 rounded-full mx-auto flex items-center justify-center text-white text-2xl font-bold group-hover:scale-110 transition-transform duration-300">
                أ.م
              </div>
              <div class="absolute -bottom-2 -right-2 w-8 h-8 bg-green-500 rounded-full flex items-center justify-center">
                <i class="fas fa-check text-white text-sm"></i>
              </div>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">أحمد محمد</h3>
            <p class="text-blue-600 font-semibold mb-4">المدير العام</p>
            <p class="text-gray-600 text-sm leading-relaxed">
              خبرة 20 عاماً في إدارة المنتجعات الفاخرة والضيافة الدولية
            </p>
          </div>

          <!-- Team Member 2 -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 text-center">
            <div class="relative mb-6">
              <div class="w-24 h-24 bg-gradient-to-br from-purple-400 to-purple-600 rounded-full mx-auto flex items-center justify-center text-white text-2xl font-bold group-hover:scale-110 transition-transform duration-300">
                س.ع
              </div>
              <div class="absolute -bottom-2 -right-2 w-8 h-8 bg-green-500 rounded-full flex items-center justify-center">
                <i class="fas fa-check text-white text-sm"></i>
              </div>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">سارة علي</h3>
            <p class="text-purple-600 font-semibold mb-4">مديرة العمليات</p>
            <p class="text-gray-600 text-sm leading-relaxed">
              متخصصة في تطوير العمليات وضمان جودة الخدمات السياحية
            </p>
          </div>

          <!-- Team Member 3 -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 text-center">
            <div class="relative mb-6">
              <div class="w-24 h-24 bg-gradient-to-br from-green-400 to-green-600 rounded-full mx-auto flex items-center justify-center text-white text-2xl font-bold group-hover:scale-110 transition-transform duration-300">
                م.ح
              </div>
              <div class="absolute -bottom-2 -right-2 w-8 h-8 bg-green-500 rounded-full flex items-center justify-center">
                <i class="fas fa-check text-white text-sm"></i>
              </div>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-2">محمد حسن</h3>
            <p class="text-green-600 font-semibold mb-4">مدير الضيافة</p>
            <p class="text-gray-600 text-sm leading-relaxed">
              خبير في تجربة الضيوف وتقديم خدمات الضيافة على أعلى مستوى
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Awards Section -->
    <section class="py-20 bg-gradient-to-r from-blue-600 via-purple-600 to-teal-600">
      <div class="container mx-auto px-4">
        <div class="text-center text-white mb-16">
          <h2 class="text-5xl font-black mb-6">
            الجوائز والتقديرات
          </h2>
          <p class="text-xl mb-12 max-w-2xl mx-auto leading-relaxed">
            فخورون بالاعتراف الدولي بتميزنا في صناعة الضيافة
          </p>
        </div>
        
        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
          <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center hover:bg-white/20 transition-colors duration-300">
            <i class="fas fa-trophy text-yellow-400 text-4xl mb-4"></i>
            <h4 class="font-bold mb-2 text-white">أفضل منتجع شاطئي</h4>
            <p class="text-sm text-blue-100">جوائز السياحة العربية 2025</p>
          </div>
          
          <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center hover:bg-white/20 transition-colors duration-300">
            <i class="fas fa-medal text-yellow-400 text-4xl mb-4"></i>
            <h4 class="font-bold mb-2 text-white">التميز في الخدمة</h4>
            <p class="text-sm text-blue-100">منظمة السياحة العالمية 2024</p>
          </div>
          
          <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center hover:bg-white/20 transition-colors duration-300">
            <i class="fas fa-leaf text-green-400 text-4xl mb-4"></i>
            <h4 class="font-bold mb-2 text-white">الاستدامة البيئية</h4>
            <p class="text-sm text-blue-100">شهادة الفندقة الخضراء 2024</p>
          </div>
          
          <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-8 text-center hover:bg-white/20 transition-colors duration-300">
            <i class="fas fa-users text-blue-400 text-4xl mb-4"></i>
            <h4 class="font-bold mb-2 text-white">اختيار المسافرين</h4>
            <p class="text-sm text-blue-100">TripAdvisor 2025</p>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4 text-center">
        <h2 class="text-4xl font-black text-gray-800 mb-6">
          انضم إلى عائلة الخيمة
        </h2>
        <p class="text-xl text-gray-600 mb-8 max-w-2xl mx-auto">
          اكتشف لماذا يختارنا آلاف الضيوف كل عام لقضاء عطلاتهم المميزة
        </p>
        <div class="flex flex-col sm:flex-row gap-6 justify-center">
          <router-link
            to="/rooms"
            class="bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white px-10 py-4 rounded-full text-lg font-bold transition-all duration-300 transform hover:scale-105 shadow-xl"
          >
            احجز إقامتك الآن
          </router-link>
          <router-link
            to="/contact"
            class="border-2 border-blue-600 text-blue-600 hover:bg-blue-600 hover:text-white px-10 py-4 rounded-full text-lg font-bold transition-all duration-300"
          >
            تواصل معنا
          </router-link>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import FeatureCard from '@/components/FeatureCard.vue'
import { useMeta } from '@/composables/useSEO'

// SEO
useMeta({
  title: 'عن منتجع الخيمة - منتجع الخيمة بيتش ريزورت',
  description: 'تعرف على قصة منتجع الخيمة، رؤيتنا، قيمنا، ومرافقنا العالمية على البحر الأحمر',
  keywords: 'عن المنتجع، قصة المنتجع، رؤية، قيم، منتجع البحر الأحمر، مصر'
})
</script>
