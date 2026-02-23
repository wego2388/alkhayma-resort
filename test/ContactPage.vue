<template>
  <div class="min-h-screen bg-gradient-to-br from-gray-50 to-blue-50">
    <!-- Hero Section -->
    <section class="relative h-96 flex items-center justify-center overflow-hidden">
      <div class="absolute inset-0 bg-gradient-to-r from-teal-800 via-blue-800 to-indigo-800"></div>
      <div class="absolute inset-0 bg-black/30"></div>
      
      <!-- Floating Elements -->
      <div class="absolute top-10 left-10 w-16 h-16 bg-white/10 rounded-full animate-float flex items-center justify-center">
        <i class="fas fa-phone text-white text-xl"></i>
      </div>
      <div class="absolute bottom-10 right-10 w-12 h-12 bg-teal-400/20 rounded-full animate-float-delay flex items-center justify-center">
        <i class="fas fa-envelope text-white"></i>
      </div>
      
      <div class="relative z-10 text-center text-white px-4 max-w-4xl mx-auto">
        <h1 class="text-5xl md:text-6xl font-black mb-6 animate-fade-in-up">
          تواصل معنا
        </h1>
        <div class="h-1 w-24 bg-gradient-to-r from-white to-teal-200 mx-auto mb-6 rounded-full"></div>
        <p class="text-xl md:text-2xl mb-8 animate-fade-in-up-delay">
          نحن هنا لخدمتك على مدار الساعة لضمان تجربة استثنائية
        </p>
      </div>
    </section>

    <!-- Contact Methods Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 animate-fade-in-up">
          <h2 class="text-4xl font-black text-gray-800 mb-6">
            طرق التواصل
          </h2>
          <div class="h-1 w-24 bg-gradient-to-r from-teal-500 to-blue-500 mx-auto mb-6 rounded-full"></div>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
            اختر الطريقة الأنسب للتواصل معنا
          </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
          <!-- Phone -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 text-center border border-gray-100">
            <div class="w-20 h-20 bg-gradient-to-br from-green-400 to-green-600 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:scale-110 transition-transform duration-300 shadow-lg">
              <i class="fas fa-phone text-white text-2xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-4">الهاتف</h3>
            <div class="space-y-2 text-gray-600">
              <p class="font-semibold">+20 69 123 4567</p>
              <p class="text-sm">متاح 24/7</p>
            </div>
            <button class="mt-6 bg-green-100 text-green-700 hover:bg-green-200 px-6 py-3 rounded-xl font-semibold transition-colors duration-300">
              اتصل الآن
            </button>
          </div>

          <!-- WhatsApp -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 text-center border border-gray-100">
            <div class="w-20 h-20 bg-gradient-to-br from-green-500 to-green-700 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:scale-110 transition-transform duration-300 shadow-lg">
              <i class="fab fa-whatsapp text-white text-2xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-4">واتساب</h3>
            <div class="space-y-2 text-gray-600">
              <p class="font-semibold">+20 100 123 4567</p>
              <p class="text-sm">رد فوري</p>
            </div>
            <button class="mt-6 bg-green-100 text-green-700 hover:bg-green-200 px-6 py-3 rounded-xl font-semibold transition-colors duration-300">
              راسلنا
            </button>
          </div>

          <!-- Email -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 text-center border border-gray-100">
            <div class="w-20 h-20 bg-gradient-to-br from-blue-400 to-blue-600 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:scale-110 transition-transform duration-300 shadow-lg">
              <i class="fas fa-envelope text-white text-2xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-4">البريد الإلكتروني</h3>
            <div class="space-y-2 text-gray-600">
              <p class="font-semibold text-sm">info@alkhayma-resort.com</p>
              <p class="text-sm">رد خلال ساعة</p>
            </div>
            <button class="mt-6 bg-blue-100 text-blue-700 hover:bg-blue-200 px-6 py-3 rounded-xl font-semibold transition-colors duration-300">
              أرسل إيميل
            </button>
          </div>

          <!-- Location -->
          <div class="group bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 text-center border border-gray-100">
            <div class="w-20 h-20 bg-gradient-to-br from-red-400 to-red-600 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:scale-110 transition-transform duration-300 shadow-lg">
              <i class="fas fa-map-marker-alt text-white text-2xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-800 mb-4">الموقع</h3>
            <div class="space-y-2 text-gray-600">
              <p class="font-semibold text-sm">شرم الشيخ، مصر</p>
              <p class="text-sm">ساحل البحر الأحمر</p>
            </div>
            <button class="mt-6 bg-red-100 text-red-700 hover:bg-red-200 px-6 py-3 rounded-xl font-semibold transition-colors duration-300">
              عرض الخريطة
            </button>
          </div>
        </div>
      </div>
    </section>

    <!-- Contact Form Section -->
    <section class="py-20 bg-gradient-to-br from-gray-50 to-blue-50">
      <div class="container mx-auto px-4">
        <div class="max-w-4xl mx-auto">
          <div class="text-center mb-16 animate-fade-in-up">
            <h2 class="text-4xl font-black text-gray-800 mb-6">
              أرسل لنا رسالة
            </h2>
            <div class="h-1 w-24 bg-gradient-to-r from-teal-500 to-blue-500 mx-auto mb-6 rounded-full"></div>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto leading-relaxed">
              املأ النموذج أدناه وسنتواصل معك في أقرب وقت ممكن
            </p>
          </div>

          <div class="bg-white rounded-3xl shadow-2xl p-8 md:p-12 animate-fade-in-up-delay">
            <form @submit.prevent="submitForm" class="space-y-8">
              <div class="grid md:grid-cols-2 gap-8">
                <!-- Name -->
                <div class="space-y-2">
                  <label class="block text-sm font-bold text-gray-700">
                    الاسم الكامل *
                  </label>
                  <input
                    v-model="form.name"
                    type="text"
                    required
                    class="w-full px-4 py-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors duration-300 text-right"
                    placeholder="أدخل اسمك الكامل"
                  />
                </div>

                <!-- Email -->
                <div class="space-y-2">
                  <label class="block text-sm font-bold text-gray-700">
                    البريد الإلكتروني *
                  </label>
                  <input
                    v-model="form.email"
                    type="email"
                    required
                    class="w-full px-4 py-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors duration-300"
                    placeholder="example@email.com"
                  />
                </div>
              </div>

              <div class="grid md:grid-cols-2 gap-8">
                <!-- Phone -->
                <div class="space-y-2">
                  <label class="block text-sm font-bold text-gray-700">
                    رقم الهاتف
                  </label>
                  <input
                    v-model="form.phone"
                    type="tel"
                    class="w-full px-4 py-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors duration-300"
                    placeholder="+20 100 123 4567"
                  />
                </div>

                <!-- Subject -->
                <div class="space-y-2">
                  <label class="block text-sm font-bold text-gray-700">
                    الموضوع *
                  </label>
                  <select
                    v-model="form.subject"
                    required
                    class="w-full px-4 py-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors duration-300 text-right"
                  >
                    <option value="">اختر الموضوع</option>
                    <option value="booking">حجز غرفة</option>
                    <option value="inquiry">استفسار عام</option>
                    <option value="complaint">شكوى</option>
                    <option value="suggestion">اقتراح</option>
                    <option value="event">تنظيم فعالية</option>
                    <option value="other">أخرى</option>
                  </select>
                </div>
              </div>

              <!-- Check-in/Check-out dates for booking -->
              <div v-if="form.subject === 'booking'" class="grid md:grid-cols-2 gap-8">
                <div class="space-y-2">
                  <label class="block text-sm font-bold text-gray-700">
                    تاريخ الوصول
                  </label>
                  <input
                    v-model="form.checkin"
                    type="date"
                    class="w-full px-4 py-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors duration-300"
                  />
                </div>
                <div class="space-y-2">
                  <label class="block text-sm font-bold text-gray-700">
                    تاريخ المغادرة
                  </label>
                  <input
                    v-model="form.checkout"
                    type="date"
                    class="w-full px-4 py-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors duration-300"
                  />
                </div>
              </div>

              <!-- Message -->
              <div class="space-y-2">
                <label class="block text-sm font-bold text-gray-700">
                  الرسالة *
                </label>
                <textarea
                  v-model="form.message"
                  required
                  rows="6"
                  class="w-full px-4 py-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:outline-none transition-colors duration-300 resize-none text-right"
                  placeholder="اكتب رسالتك هنا..."
                ></textarea>
              </div>

              <!-- Privacy Policy -->
              <div class="flex items-start space-x-3 space-x-reverse">
                <input
                  v-model="form.privacy"
                  type="checkbox"
                  required
                  class="mt-1 w-5 h-5 text-blue-600 border-2 border-gray-300 rounded focus:ring-blue-500"
                />
                <label class="text-sm text-gray-600 leading-relaxed">
                  أوافق على <router-link to="/privacy" class="text-blue-600 hover:underline">سياسة الخصوصية</router-link> 
                  و <router-link to="/terms" class="text-blue-600 hover:underline">شروط الاستخدام</router-link>
                </label>
              </div>

              <!-- Submit Button -->
              <div class="text-center">
                <button
                  type="submit"
                  :disabled="isSubmitting"
                  class="bg-gradient-to-r from-teal-600 to-blue-600 hover:from-teal-700 hover:to-blue-700 disabled:from-gray-400 disabled:to-gray-500 text-white px-12 py-4 rounded-full text-lg font-bold transition-all duration-300 transform hover:scale-105 shadow-xl disabled:transform-none disabled:shadow-md"
                >
                  <i v-if="isSubmitting" class="fas fa-spinner fa-spin mr-2"></i>
                  <i v-else class="fas fa-paper-plane mr-2"></i>
                  {{ isSubmitting ? 'جاري الإرسال...' : 'إرسال الرسالة' }}
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>

    <!-- Map Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 animate-fade-in-up">
          <h2 class="text-4xl font-black text-gray-800 mb-6">
            موقعنا على الخريطة
          </h2>
          <div class="h-1 w-24 bg-gradient-to-r from-teal-500 to-blue-500 mx-auto mb-6 rounded-full"></div>
          <p class="text-xl text-gray-600 max-w-2xl mx-auto leading-relaxed">
            نقع في أجمل مواقع شرم الشيخ على ساحل البحر الأحمر
          </p>
        </div>

        <div class="bg-gray-200 rounded-3xl h-96 flex items-center justify-center animate-fade-in-up-delay">
          <div class="text-center text-gray-500">
            <i class="fas fa-map-marked-alt text-6xl mb-4"></i>
            <p class="text-xl font-semibold">خريطة تفاعلية</p>
            <p class="text-sm">سيتم إضافة الخريطة التفاعلية هنا</p>
          </div>
        </div>
      </div>
    </section>

    <!-- FAQ Section -->
    <section class="py-20 bg-gradient-to-br from-gray-50 to-blue-50">
      <div class="container mx-auto px-4">
        <div class="text-center mb-16 animate-fade-in-up">
          <h2 class="text-4xl font-black text-gray-800 mb-6">
            الأسئلة الشائعة
          </h2>
          <div class="h-1 w-24 bg-gradient-to-r from-teal-500 to-blue-500 mx-auto mb-6 rounded-full"></div>
          <p class="text-xl text-gray-600 max-w-2xl mx-auto leading-relaxed">
            إجابات على أكثر الأسئلة شيوعاً
          </p>
        </div>

        <div class="max-w-4xl mx-auto space-y-6">
          <div 
            v-for="(faq, index) in faqs" 
            :key="index"
            class="bg-white rounded-2xl shadow-lg overflow-hidden animate-fade-in-up-delay"
          >
            <button
              @click="toggleFaq(index)"
              class="w-full px-8 py-6 text-right flex items-center justify-between hover:bg-gray-50 transition-colors duration-300"
            >
              <i 
                class="fas fa-chevron-down text-blue-600 transition-transform duration-300"
                :class="{ 'rotate-180': faq.open }"
              ></i>
              <h3 class="text-lg font-bold text-gray-800">{{ faq.question }}</h3>
            </button>
            <div 
              v-show="faq.open"
              class="px-8 pb-6 text-gray-600 leading-relaxed"
            >
              {{ faq.answer }}
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Success Modal -->
    <div 
      v-if="showSuccessModal"
      class="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4"
      @click="showSuccessModal = false"
    >
      <div class="bg-white rounded-3xl p-8 max-w-md w-full text-center animate-fade-in-up">
        <div class="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
          <i class="fas fa-check text-green-600 text-3xl"></i>
        </div>
        <h3 class="text-2xl font-bold text-gray-800 mb-4">تم الإرسال بنجاح!</h3>
        <p class="text-gray-600 mb-6">
          شكراً لتواصلك معنا. سنرد عليك في أقرب وقت ممكن.
        </p>
        <button
          @click="showSuccessModal = false"
          class="bg-green-600 hover:bg-green-700 text-white px-8 py-3 rounded-full font-semibold transition-colors duration-300"
        >
          حسناً
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useMeta } from '@/composables/useSEO'

// SEO
useMeta({
  title: 'تواصل معنا - منتجع الخيمة بيتش ريزورت',
  description: 'تواصل مع منتجع الخيمة للحجوزات والاستفسارات. خدمة عملاء 24/7 عبر الهاتف والواتساب والإيميل',
  keywords: 'تواصل، اتصال، حجز، استفسار، خدمة عملاء، منتجع البحر الأحمر'
})

// Form data
const form = reactive({
  name: '',
  email: '',
  phone: '',
  subject: '',
  checkin: '',
  checkout: '',
  message: '',
  privacy: false
})

// Component state
const isSubmitting = ref(false)
const showSuccessModal = ref(false)

// FAQ data
const faqs = ref([
  {
    question: 'ما هي أوقات تسجيل الوصول والمغادرة؟',
    answer: 'تسجيل الوصول من الساعة 3:00 مساءً وتسجيل المغادرة حتى الساعة 12:00 ظهراً. يمكن ترتيب أوقات مختلفة حسب التوفر.',
    open: false
  },
  {
    question: 'هل يوجد خدمة نقل من وإلى المطار؟',
    answer: 'نعم، نوفر خدمة نقل مجانية من وإلى مطار شرم الشيخ الدولي لجميع النزلاء.',
    open: false
  },
  {
    question: 'هل يُسمح بالحيوانات الأليفة؟',
    answer: 'نعتذر، لا نسمح بالحيوانات الأليفة في المنتجع للحفاظ على راحة جميع النزلاء.',
    open: false
  },
  {
    question: 'ما هي سياسة الإلغاء؟',
    answer: 'يمكن إلغاء الحجز مجاناً حتى 48 ساعة قبل تاريخ الوصول. بعد ذلك تطبق رسوم إلغاء.',
    open: false
  },
  {
    question: 'هل يوجد واي فاي مجاني؟',
    answer: 'نعم، نوفر خدمة واي فاي مجانية عالية السرعة في جميع أنحاء المنتجع.',
    open: false
  }
])

// Methods
const toggleFaq = (index) => {
  faqs.value[index].open = !faqs.value[index].open
}

const submitForm = async () => {
  isSubmitting.value = true
  
  try {
    // Simulate API call
    await new Promise(resolve => setTimeout(resolve, 2000))
    
    // Reset form
    Object.keys(form).forEach(key => {
      if (typeof form[key] === 'boolean') {
        form[key] = false
      } else {
        form[key] = ''
      }
    })
    
    showSuccessModal.value = true
  } catch (error) {
    console.error('Error submitting form:', error)
  } finally {
    isSubmitting.value = false
  }
}
</script>

