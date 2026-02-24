<template>
  <div class="min-h-screen bg-gradient-to-br from-slate-50 via-white to-blue-50">
    <!-- Hero Section -->
    <section class="relative h-[70vh] flex items-center justify-center overflow-hidden">
      <div class="absolute inset-0">
        <div class="absolute inset-0 bg-gradient-to-br from-slate-900 via-blue-900 to-slate-800"></div>
        <div class="absolute inset-0 opacity-10" style="background-image: url('data:image/svg+xml,%3Csvg width=\'60\' height=\'60\' viewBox=\'0 0 60 60\' xmlns=\'http://www.w3.org/2000/svg\'%3E%3Cg fill=\'none\' fill-rule=\'evenodd\'%3E%3Cg fill=\'%23ffffff\' fill-opacity=\'1\'%3E%3Cpath d=\'M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z\'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E');"></div>
      </div>
      
      <div class="relative z-10 text-center text-white px-4 max-w-4xl mx-auto">
        <h1 class="font-display text-6xl md:text-7xl font-bold mb-6 tracking-tight">
          {{ isRTL ? 'تواصل معنا' : 'Get in Touch' }}
        </h1>
        <div class="h-0.5 w-20 bg-gradient-to-r from-transparent via-white to-transparent mx-auto mb-8"></div>
        <p class="text-xl md:text-2xl text-slate-200 font-light">
          {{ isRTL ? 'نحن هنا لخدمتك على مدار الساعة' : 'We are here to serve you 24/7' }}
        </p>
      </div>
    </section>

    <!-- Contact Section -->
    <section class="py-24 -mt-32 relative z-20">
      <div class="container mx-auto px-4">
        <div class="grid lg:grid-cols-2 gap-12 max-w-7xl mx-auto">
          <!-- Contact Form -->
          <div class="glass-dark rounded-3xl p-10 shadow-luxury-lg">
            <h2 class="font-display text-4xl font-bold text-slate-900 mb-8">
              {{ isRTL ? 'أرسل رسالة' : 'Send Message' }}
            </h2>
            
            <form @submit.prevent="submitForm" class="space-y-6">
              <div class="space-y-2">
                <label class="block text-sm font-semibold text-slate-700 tracking-wide">
                  {{ isRTL ? 'الاسم' : 'Full Name' }}
                </label>
                <input v-model="form.name" type="text" required class="w-full px-5 py-4 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-luxury outline-none bg-white/50" />
              </div>

              <div class="space-y-2">
                <label class="block text-sm font-semibold text-slate-700 tracking-wide">
                  {{ isRTL ? 'البريد الإلكتروني' : 'Email Address' }}
                </label>
                <input v-model="form.email" type="email" required class="w-full px-5 py-4 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-luxury outline-none bg-white/50" />
              </div>

              <div class="space-y-2">
                <label class="block text-sm font-semibold text-slate-700 tracking-wide">
                  {{ isRTL ? 'رقم الهاتف' : 'Phone Number' }}
                </label>
                <input v-model="form.phone" type="tel" class="w-full px-5 py-4 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-luxury outline-none bg-white/50" />
              </div>

              <div class="space-y-2">
                <label class="block text-sm font-semibold text-slate-700 tracking-wide">
                  {{ isRTL ? 'الموضوع' : 'Subject' }}
                </label>
                <input v-model="form.subject" type="text" required class="w-full px-5 py-4 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-luxury outline-none bg-white/50" />
              </div>

              <div class="space-y-2">
                <label class="block text-sm font-semibold text-slate-700 tracking-wide">
                  {{ isRTL ? 'الرسالة' : 'Message' }}
                </label>
                <textarea v-model="form.message" required rows="5" class="w-full px-5 py-4 rounded-xl border border-slate-200 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition-luxury outline-none bg-white/50 resize-none"></textarea>
              </div>

              <button type="submit" :disabled="submitting" class="w-full bg-gradient-to-r from-slate-900 to-blue-900 text-white py-5 rounded-xl font-semibold text-lg hover:shadow-luxury transition-luxury disabled:opacity-50">
                {{ submitting ? (isRTL ? 'جاري الإرسال...' : 'Sending...') : (isRTL ? 'إرسال الرسالة' : 'Send Message') }}
              </button>
            </form>
          </div>

          <!-- Contact Info -->
          <div class="space-y-6">
            <!-- Location -->
            <div class="glass-dark rounded-3xl p-8 hover:shadow-luxury transition-luxury group">
              <div class="flex items-start gap-6">
                <div class="w-16 h-16 rounded-2xl bg-gradient-to-br from-blue-500 to-blue-600 flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-luxury shadow-lg">
                  <IconLocation :size="28" class="text-white" />
                </div>
                <div>
                  <h3 class="font-display text-2xl font-bold text-slate-900 mb-3">
                    {{ isRTL ? 'العنوان' : 'Location' }}
                  </h3>
                  <p class="text-slate-600 text-lg leading-relaxed">
                    {{ isRTL ? 'شرم الشيخ، جنوب سيناء، مصر' : 'Sharm El Sheikh, South Sinai, Egypt' }}
                  </p>
                </div>
              </div>
            </div>

            <!-- Phone -->
            <div class="glass-dark rounded-3xl p-8 hover:shadow-luxury transition-luxury group">
              <div class="flex items-start gap-6">
                <div class="w-16 h-16 rounded-2xl bg-gradient-to-br from-green-500 to-emerald-600 flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-luxury shadow-lg">
                  <IconPhone :size="28" class="text-white" />
                </div>
                <div>
                  <h3 class="font-display text-2xl font-bold text-slate-900 mb-3">
                    {{ isRTL ? 'الهاتف' : 'Phone' }}
                  </h3>
                  <p class="text-slate-600 text-lg mb-2">+20 100 420 5444</p>
                  <a href="https://wa.me/201004205444" target="_blank" class="inline-flex items-center gap-2 text-green-600 hover:text-green-700 font-semibold transition-luxury">
                    <span>{{ isRTL ? 'واتساب' : 'WhatsApp' }}</span>
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.890-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z"/></svg>
                  </a>
                </div>
              </div>
            </div>

            <!-- Email -->
            <div class="glass-dark rounded-3xl p-8 hover:shadow-luxury transition-luxury group">
              <div class="flex items-start gap-6">
                <div class="w-16 h-16 rounded-2xl bg-gradient-to-br from-purple-500 to-purple-600 flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-luxury shadow-lg">
                  <IconMail :size="28" class="text-white" />
                </div>
                <div>
                  <h3 class="font-display text-2xl font-bold text-slate-900 mb-3">
                    {{ isRTL ? 'البريد الإلكتروني' : 'Email' }}
                  </h3>
                  <p class="text-slate-600 text-lg">info@alkhayma.com</p>
                  <p class="text-slate-600 text-lg">reservations@alkhayma.com</p>
                </div>
              </div>
            </div>

            <!-- Hours -->
            <div class="glass-dark rounded-3xl p-8 hover:shadow-luxury transition-luxury group">
              <div class="flex items-start gap-6">
                <div class="w-16 h-16 rounded-2xl bg-gradient-to-br from-amber-500 to-orange-600 flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-luxury shadow-lg">
                  <IconClock :size="28" class="text-white" />
                </div>
                <div>
                  <h3 class="font-display text-2xl font-bold text-slate-900 mb-3">
                    {{ isRTL ? 'ساعات العمل' : 'Working Hours' }}
                  </h3>
                  <p class="text-slate-600 text-lg font-semibold">{{ isRTL ? 'متاح 24/7' : 'Available 24/7' }}</p>
                  <p class="text-slate-500 mt-1">{{ isRTL ? 'خدمة العملاء على مدار الساعة' : 'Round-the-clock service' }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Location Section -->
    <LocationSection />
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import IconLocation from '@/components/icons/IconLocation.vue'
import IconPhone from '@/components/icons/IconPhone.vue'
import IconMail from '@/components/icons/IconMail.vue'
import IconClock from '@/components/icons/IconClock.vue'
import LocationSection from '@/components/sections/LocationSection.vue'

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const form = ref({
  name: '',
  email: '',
  phone: '',
  subject: '',
  message: ''
})

const submitting = ref(false)

async function submitForm() {
  submitting.value = true
  
  setTimeout(() => {
    toast.success(
      isRTL.value ? 'تم الإرسال بنجاح!' : 'Message Sent!',
      isRTL.value ? 'سنتواصل معك قريباً' : 'We will contact you soon'
    )
    
    form.value = {
      name: '',
      email: '',
      phone: '',
      subject: '',
      message: ''
    }
    
    submitting.value = false
  }, 1500)
}
</script>
    <!-- Hero Section -->
    <section class="relative h-96 flex items-center justify-center overflow-hidden">
      <div class="absolute inset-0 bg-gradient-to-r from-primary-800 via-blue-800 to-teal-800"></div>
      <div class="absolute inset-0 bg-black/30"></div>
      
      <div class="relative z-10 text-center text-white px-4 max-w-4xl mx-auto">
        <h1 class="text-5xl md:text-6xl font-black mb-6 animate-fade-in-up">
          {{ isRTL ? 'اتصل بنا' : 'Contact Us' }}
        </h1>
        <div class="h-1 w-24 bg-gradient-to-r from-white to-blue-200 mx-auto mb-6 rounded-full"></div>
        <p class="text-xl md:text-2xl mb-8 animate-fade-in-up-delay">
          {{ isRTL ? 'نحن هنا للإجابة على جميع استفساراتكم' : 'We are here to answer all your questions' }}
        </p>
      </div>
    </section>

    <!-- Contact Section -->
    <section class="py-20">
      <div class="container mx-auto px-4">
        <div class="grid lg:grid-cols-2 gap-12">
          <!-- Contact Form -->
          <div class="card">
            <h2 class="text-3xl font-bold text-slate-900 mb-6">
              {{ isRTL ? 'أرسل لنا رسالة' : 'Send us a Message' }}
            </h2>
            
            <form @submit.prevent="submitForm" class="space-y-6">
              <div>
                <label class="block text-sm font-bold text-slate-700 mb-2">
                  {{ isRTL ? 'الاسم' : 'Name' }} *
                </label>
                <input v-model="form.name" type="text" required class="input w-full" :placeholder="isRTL ? 'أدخل اسمك' : 'Enter your name'" />
              </div>

              <div>
                <label class="block text-sm font-bold text-slate-700 mb-2">
                  {{ isRTL ? 'البريد الإلكتروني' : 'Email' }} *
                </label>
                <input v-model="form.email" type="email" required class="input w-full" placeholder="example@email.com" />
              </div>

              <div>
                <label class="block text-sm font-bold text-slate-700 mb-2">
                  {{ isRTL ? 'رقم الهاتف' : 'Phone' }}
                </label>
                <input v-model="form.phone" type="tel" class="input w-full" placeholder="+20 100 420 5444" />
              </div>

              <div>
                <label class="block text-sm font-bold text-slate-700 mb-2">
                  {{ isRTL ? 'الموضوع' : 'Subject' }} *
                </label>
                <input v-model="form.subject" type="text" required class="input w-full" :placeholder="isRTL ? 'موضوع الرسالة' : 'Message subject'" />
              </div>

              <div>
                <label class="block text-sm font-bold text-slate-700 mb-2">
                  {{ isRTL ? 'الرسالة' : 'Message' }} *
                </label>
                <textarea v-model="form.message" required rows="5" class="input w-full" :placeholder="isRTL ? 'اكتب رسالتك هنا...' : 'Write your message here...'"></textarea>
              </div>

              <button type="submit" :disabled="submitting" class="w-full btn-primary py-4 text-lg">
                <span v-if="submitting" class="inline-block animate-spin mr-2">⏳</span>
                {{ submitting ? (isRTL ? 'جاري الإرسال...' : 'Sending...') : (isRTL ? '📧 إرسال الرسالة' : '📧 Send Message') }}
              </button>
            </form>
          </div>

          <!-- Contact Info -->
          <div class="space-y-6">
            <!-- Info Cards -->
            <div class="card hover:shadow-xl transition-all">
              <div class="flex items-start gap-4">
                <div class="w-14 h-14 bg-slate-100 rounded-full flex items-center justify-center text-2xl flex-shrink-0">
                  📍
                </div>
                <div>
                  <h3 class="text-xl font-bold text-slate-900 mb-2">
                    {{ isRTL ? 'العنوان' : 'Address' }}
                  </h3>
                  <p class="text-slate-600">
                    {{ isRTL ? 'شرم الشيخ، جنوب سيناء، مصر' : 'Sharm El Sheikh, South Sinai, Egypt' }}
                  </p>
                </div>
              </div>
            </div>

            <div class="card hover:shadow-xl transition-all">
              <div class="flex items-start gap-4">
                <div class="w-14 h-14 bg-green-100 rounded-full flex items-center justify-center text-2xl flex-shrink-0">
                  📞
                </div>
                <div>
                  <h3 class="text-xl font-bold text-slate-900 mb-2">
                    {{ isRTL ? 'الهاتف' : 'Phone' }}
                  </h3>
                  <p class="text-slate-600">+20 100 420 5444</p>
                  <a href="https://wa.me/201004205444" target="_blank" class="text-green-600 hover:text-green-700 font-semibold mt-2 inline-block">
                    💬 {{ isRTL ? 'واتساب' : 'WhatsApp' }}
                  </a>
                </div>
              </div>
            </div>

            <div class="card hover:shadow-xl transition-all">
              <div class="flex items-start gap-4">
                <div class="w-14 h-14 bg-blue-100 rounded-full flex items-center justify-center text-2xl flex-shrink-0">
                  📧
                </div>
                <div>
                  <h3 class="text-xl font-bold text-slate-900 mb-2">
                    {{ isRTL ? 'البريد الإلكتروني' : 'Email' }}
                  </h3>
                  <p class="text-slate-600">info@alkhayma.com</p>
                  <p class="text-slate-600">reservations@alkhayma.com</p>
                </div>
              </div>
            </div>

            <div class="card hover:shadow-xl transition-all">
              <div class="flex items-start gap-4">
                <div class="w-14 h-14 bg-purple-100 rounded-full flex items-center justify-center text-2xl flex-shrink-0">
                  🕐
                </div>
                <div>
                  <h3 class="text-xl font-bold text-slate-900 mb-2">
                    {{ isRTL ? 'ساعات العمل' : 'Working Hours' }}
                  </h3>
                  <p class="text-slate-600">{{ isRTL ? 'متاح 24/7' : 'Available 24/7' }}</p>
                  <p class="text-sm text-slate-500 mt-1">{{ isRTL ? 'خدمة العملاء على مدار الساعة' : 'Customer service around the clock' }}</p>
                </div>
              </div>
            </div>

            <!-- Social Media -->
            <div class="card bg-gradient-to-br from-primary-500 to-blue-600 text-white">
              <h3 class="text-2xl font-bold mb-4">{{ isRTL ? 'تابعنا' : 'Follow Us' }}</h3>
              <div class="flex gap-4">
                <a href="#" class="w-12 h-12 bg-white/20 hover:bg-white/30 rounded-full flex items-center justify-center text-xl transition-all transform hover:scale-110">
                  📘
                </a>
                <a href="#" class="w-12 h-12 bg-white/20 hover:bg-white/30 rounded-full flex items-center justify-center text-xl transition-all transform hover:scale-110">
                  📷
                </a>
                <a href="#" class="w-12 h-12 bg-white/20 hover:bg-white/30 rounded-full flex items-center justify-center text-xl transition-all transform hover:scale-110">
                  🐦
                </a>
                <a href="#" class="w-12 h-12 bg-white/20 hover:bg-white/30 rounded-full flex items-center justify-center text-xl transition-all transform hover:scale-110">
                  ▶️
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Map Section -->
    <section class="py-12 bg-white">
      <div class="container mx-auto px-4">
        <div class="card">
          <h2 class="text-3xl font-bold text-slate-900 mb-6 text-center">
            {{ isRTL ? 'موقعنا' : 'Our Location' }}
          </h2>
          <div class="aspect-video bg-slate-200 rounded-lg overflow-hidden">
            <iframe 
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d55251.37706051479!2d34.32!3d27.91!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14528b2d4c5a8c3d%3A0x8c7e6d8c5a8c7e6d!2sSharm%20El-Sheikh%2C%20Egypt!5e0!3m2!1sen!2s!4v1234567890"
              width="100%" 
              height="100%" 
              style="border:0;" 
              allowfullscreen="" 
              loading="lazy"
            ></iframe>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const form = ref({
  name: '',
  email: '',
  phone: '',
  subject: '',
  message: ''
})

const submitting = ref(false)

async function submitForm() {
  submitting.value = true
  
  // Simulate API call
  setTimeout(() => {
    toast.success(
      isRTL.value ? 'تم الإرسال بنجاح!' : 'Message Sent!',
      isRTL.value ? 'سنتواصل معك قريباً' : 'We will contact you soon'
    )
    
    // Reset form
    form.value = {
      name: '',
      email: '',
      phone: '',
      subject: '',
      message: ''
    }
    
    submitting.value = false
  }, 1500)
}
</script>

<style scoped>
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

.animate-fade-in-up {
  animation: fade-in-up 1s ease-out;
}

.animate-fade-in-up-delay {
  animation: fade-in-up 1s ease-out 0.2s both;
}
</style>
