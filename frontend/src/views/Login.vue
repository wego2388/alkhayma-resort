<template>
  <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-blue-50 py-12 px-6">
    <div class="max-w-md w-full">
      <!-- Logo/Title -->
      <div class="text-center mb-8">
        <h1 class="font-display text-5xl font-bold text-slate-900 mb-2">
          {{ isRTL ? 'الخيمة' : 'El Kheima' }}
        </h1>
        <p class="text-slate-600">{{ isRTL ? 'لوحة تحكم الأدمن' : 'Admin Dashboard' }}</p>
      </div>

      <div class="bg-white rounded-3xl shadow-luxury-lg p-8">
        <h2 class="font-display text-3xl font-bold mb-6 text-center text-slate-900">{{ t('auth.login') }}</h2>

        <form @submit.prevent="handleLogin" class="space-y-6">
          <div>
            <label class="block mb-2 font-semibold text-slate-700">
              {{ t('auth.email') }}
            </label>
            <input 
              v-model="email" 
              type="email" 
              required 
              class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-amber-500 focus:ring-2 focus:ring-amber-200 transition-all outline-none"
              placeholder="admin@alkhayma.com"
              autocomplete="email"
            />
          </div>

          <div>
            <label class="block mb-2 font-medium text-slate-700">
              <span class="flex items-center gap-2">
                <span>🔒</span>
                <span>{{ t('auth.password') }}</span>
              </span>
            </label>
            <input 
              v-model="password" 
              :type="showPassword ? 'text' : 'password'" 
              required 
              class="input"
              placeholder="••••••••"
              autocomplete="current-password"
            />
            <button 
              type="button" 
              @click="showPassword = !showPassword"
              class="text-sm text-slate-900 hover:underline mt-1"
            >
              {{ showPassword ? (isRTL ? 'إخفاء' : 'Hide') : (isRTL ? 'إظهار' : 'Show') }}
            </button>
          </div>

          <div v-if="authStore.error" class="bg-red-50 border border-red-200 text-red-600 px-4 py-3 rounded-lg text-sm">
            {{ authStore.error }}
          </div>

          <button 
            type="submit" 
            :disabled="authStore.loading" 
            class="w-full bg-gradient-to-r from-amber-500 to-amber-600 hover:from-amber-600 hover:to-amber-700 text-white py-4 rounded-xl font-semibold text-lg shadow-lg hover:shadow-xl transition-all duration-300"
          >
            <span v-if="authStore.loading">⏳ {{ t('common.loading') }}</span>
            <span v-else>🔓 {{ t('auth.submit') }}</span>
          </button>
        </form>

        <!-- Demo Credentials -->
        <div class="mt-6 p-4 bg-blue-50 rounded-lg border border-blue-200">
          <p class="text-sm font-semibold text-blue-800 mb-2">
            {{ isRTL ? '🔑 بيانات تجريبية:' : '🔑 Demo Credentials:' }}
          </p>
          <p class="text-xs text-blue-700">
            <strong>Email:</strong> admin@alkhayma.com<br>
            <strong>Password:</strong> admin
          </p>
        </div>
      </div>

      <!-- Back to Home -->
      <div class="text-center mt-6">
        <router-link to="/" class="text-slate-600 hover:text-slate-900 transition-colors">
          ← {{ isRTL ? 'العودة للرئيسية' : 'Back to Home' }}
        </router-link>
      </div>
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

const email = ref('admin@alkhayma.com')
const password = ref('')
const showPassword = ref(false)
const isRTL = computed(() => appStore.isRTL)

async function handleLogin() {
  const success = await authStore.login({ username: email.value, password: password.value })
  if (success) {
    router.push('/dashboard')
  }
}
</script>
