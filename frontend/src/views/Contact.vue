<template>
  <div class="container mx-auto px-4 py-12">
    <h1 class="text-4xl font-bold mb-8">{{ isRTL ? 'اتصل بنا' : 'Contact Us' }}</h1>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
      <!-- Contact Form -->
      <div class="card">
        <h2 class="text-2xl font-bold mb-6">{{ isRTL ? 'أرسل لنا رسالة' : 'Send us a message' }}</h2>
        
        <form @submit.prevent="handleSubmit" class="space-y-4">
          <div>
            <label class="block mb-2 font-medium">{{ isRTL ? 'الاسم' : 'Name' }}</label>
            <input v-model="form.name" type="text" required class="input" />
          </div>

          <div>
            <label class="block mb-2 font-medium">{{ isRTL ? 'البريد الإلكتروني' : 'Email' }}</label>
            <input v-model="form.email" type="email" required class="input" />
          </div>

          <div>
            <label class="block mb-2 font-medium">{{ isRTL ? 'الهاتف' : 'Phone' }}</label>
            <input v-model="form.phone" type="tel" class="input" />
          </div>

          <div>
            <label class="block mb-2 font-medium">{{ isRTL ? 'الرسالة' : 'Message' }}</label>
            <textarea v-model="form.message" required class="input" rows="5"></textarea>
          </div>

          <button type="submit" :disabled="loading" class="btn-primary w-full">
            {{ loading ? t('common.loading') : (isRTL ? 'إرسال' : 'Send') }}
          </button>
        </form>
      </div>

      <!-- Contact Info -->
      <div class="space-y-6">
        <div class="card">
          <h3 class="text-xl font-bold mb-4">{{ isRTL ? 'معلومات الاتصال' : 'Contact Information' }}</h3>
          
          <div class="space-y-4">
            <div class="flex items-start gap-3">
              <span class="text-2xl">📍</span>
              <div>
                <p class="font-semibold">{{ isRTL ? 'العنوان' : 'Address' }}</p>
                <p class="text-gray-600">
                  {{ isRTL 
                    ? 'كورنيش جدة، المملكة العربية السعودية'
                    : 'Jeddah Corniche, Saudi Arabia'
                  }}
                </p>
              </div>
            </div>

            <div class="flex items-start gap-3">
              <span class="text-2xl">📞</span>
              <div>
                <p class="font-semibold">{{ isRTL ? 'الهاتف' : 'Phone' }}</p>
                <p class="text-gray-600">+966 50 123 4567</p>
              </div>
            </div>

            <div class="flex items-start gap-3">
              <span class="text-2xl">✉️</span>
              <div>
                <p class="font-semibold">{{ isRTL ? 'البريد' : 'Email' }}</p>
                <p class="text-gray-600">info@alkhayma.com</p>
              </div>
            </div>

            <div class="flex items-start gap-3">
              <span class="text-2xl">🕐</span>
              <div>
                <p class="font-semibold">{{ isRTL ? 'ساعات العمل' : 'Working Hours' }}</p>
                <p class="text-gray-600">{{ isRTL ? 'على مدار الساعة' : '24/7' }}</p>
              </div>
            </div>
          </div>
        </div>

        <div class="card bg-primary-50">
          <h3 class="text-xl font-bold mb-4">{{ isRTL ? 'تابعنا' : 'Follow Us' }}</h3>
          <div class="flex gap-4">
            <a href="#" class="text-3xl hover:scale-110 transition-transform">📘</a>
            <a href="#" class="text-3xl hover:scale-110 transition-transform">📷</a>
            <a href="#" class="text-3xl hover:scale-110 transition-transform">🐦</a>
            <a href="#" class="text-3xl hover:scale-110 transition-transform">💼</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'

const { t } = useI18n()
const appStore = useAppStore()

const form = ref({
  name: '',
  email: '',
  phone: '',
  message: ''
})

const loading = ref(false)
const isRTL = computed(() => appStore.isRTL)

async function handleSubmit() {
  loading.value = true
  
  // Simulate API call
  await new Promise(resolve => setTimeout(resolve, 1000))
  
  alert(isRTL.value 
    ? 'شكراً لتواصلك معنا! سنرد عليك قريباً.'
    : 'Thank you for contacting us! We will get back to you soon.'
  )
  
  form.value = { name: '', email: '', phone: '', message: '' }
  loading.value = false
}
</script>
