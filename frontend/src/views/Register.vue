<template>
  <div class="container mx-auto px-4 py-12">
    <div class="max-w-md mx-auto card">
      <h1 class="text-3xl font-bold mb-6 text-center">{{ t('auth.register') }}</h1>

      <form @submit.prevent="handleRegister" class="space-y-4">
        <div>
          <label class="block mb-2 font-medium">{{ t('auth.fullName') }}</label>
          <input v-model="fullName" type="text" required class="input" />
        </div>

        <div>
          <label class="block mb-2 font-medium">{{ t('auth.email') }}</label>
          <input v-model="email" type="email" required class="input" />
        </div>

        <div>
          <label class="block mb-2 font-medium">{{ t('auth.phone') }}</label>
          <input v-model="phone" type="tel" class="input" placeholder="+966501234567" />
        </div>

        <div>
          <label class="block mb-2 font-medium">{{ t('auth.password') }}</label>
          <input v-model="password" type="password" required minlength="6" class="input" />
        </div>

        <div v-if="authStore.error" class="text-red-600 text-sm">
          {{ authStore.error }}
        </div>

        <button type="submit" :disabled="authStore.loading" class="btn-primary w-full">
          {{ authStore.loading ? t('common.loading') : t('auth.submit') }}
        </button>
      </form>

      <p class="mt-4 text-center text-slate-600">
        {{ isRTL ? 'لديك حساب؟' : 'Already have an account?' }}
        <router-link to="/login" class="text-slate-900 hover:underline">
          {{ t('auth.login') }}
        </router-link>
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useAuthStore } from '@/stores/auth'
import { useAppStore } from '@/stores/app'

const { t } = useI18n()
const router = useRouter()
const authStore = useAuthStore()
const appStore = useAppStore()

const fullName = ref('')
const email = ref('')
const phone = ref('')
const password = ref('')
const isRTL = computed(() => appStore.isRTL)

async function handleRegister() {
  const success = await authStore.register({
    email: email.value,
    password: password.value,
    full_name: fullName.value,
    phone: phone.value
  })
  
  if (success) {
    alert(isRTL.value ? 'تم إنشاء الحساب بنجاح! يمكنك تسجيل الدخول الآن' : 'Account created successfully! You can now login')
    router.push('/login')
  }
}
</script>
