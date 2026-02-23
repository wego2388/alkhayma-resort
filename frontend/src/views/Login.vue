<template>
  <div class="container mx-auto px-4 py-12">
    <div class="max-w-md mx-auto card">
      <h1 class="text-3xl font-bold mb-6 text-center">{{ t('auth.login') }}</h1>

      <form @submit.prevent="handleLogin" class="space-y-4">
        <div>
          <label class="block mb-2 font-medium">{{ t('auth.email') }}</label>
          <input v-model="email" type="email" required class="input" />
        </div>

        <div>
          <label class="block mb-2 font-medium">{{ t('auth.password') }}</label>
          <input v-model="password" type="password" required class="input" />
        </div>

        <div v-if="authStore.error" class="text-red-600 text-sm">
          {{ authStore.error }}
        </div>

        <button type="submit" :disabled="authStore.loading" class="btn-primary w-full">
          {{ authStore.loading ? t('common.loading') : t('auth.submit') }}
        </button>
      </form>

      <p class="mt-4 text-center text-gray-600">
        {{ isRTL ? 'ليس لديك حساب؟' : "Don't have an account?" }}
        <router-link to="/register" class="text-primary-600 hover:underline">
          {{ t('auth.register') }}
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

const email = ref('')
const password = ref('')
const isRTL = computed(() => appStore.isRTL)

async function handleLogin() {
  const success = await authStore.login({ username: email.value, password: password.value })
  if (success) {
    router.push('/')
  }
}
</script>
