<template>
  <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-primary-50 to-primary-100 py-12 px-4">
    <div class="max-w-md w-full">
      <!-- Logo/Title -->
      <div class="text-center mb-8">
        <h1 class="text-4xl font-bold text-primary-600 mb-2">
          {{ isRTL ? 'الخيمة' : 'Al Khayma' }}
        </h1>
        <p class="text-gray-600">{{ isRTL ? 'لوحة تحكم الأدمن' : 'Admin Dashboard' }}</p>
      </div>

      <div class="card shadow-xl">
        <h2 class="text-2xl font-bold mb-6 text-center">{{ t('auth.login') }}</h2>

        <form @submit.prevent="handleLogin" class="space-y-4">
          <div>
            <label class="block mb-2 font-medium text-gray-700">
              <span class="flex items-center gap-2">
                <span>📧</span>
                <span>{{ t('auth.email') }}</span>
              </span>
            </label>
            <input 
              v-model="email" 
              type="email" 
              required 
              class="input"
              placeholder="admin@alkhayma.com"
              autocomplete="email"
            />
          </div>

          <div>
            <label class="block mb-2 font-medium text-gray-700">
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
              class="text-sm text-primary-600 hover:underline mt-1"
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
            class="btn-primary w-full py-3 text-lg"
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
        <router-link to="/" class="text-gray-600 hover:text-primary-600 transition-colors">
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
