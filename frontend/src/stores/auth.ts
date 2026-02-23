import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import { authApi } from '@/api/auth'
import type { User, LoginCredentials, RegisterData } from '@/types'

export const useAuthStore = defineStore('auth', () => {
  const user = ref<User | null>(null)
  const token = ref<string | null>(localStorage.getItem('token'))
  const loading = ref(false)
  const error = ref<string | null>(null)

  const isAuthenticated = computed(() => !!token.value)
  const isAdmin = computed(() => user.value?.role === 'admin')

  async function login(credentials: LoginCredentials) {
    loading.value = true
    error.value = null
    try {
      const response = await authApi.login(credentials)
      token.value = response.access_token
      localStorage.setItem('token', response.access_token)
      await fetchUser()
      return true
    } catch (e: any) {
      error.value = e.response?.data?.detail || 'Login failed'
      return false
    } finally {
      loading.value = false
    }
  }

  async function register(userData: RegisterData) {
    loading.value = true
    error.value = null
    try {
      await authApi.register(userData)
      return true
    } catch (e: any) {
      error.value = e.response?.data?.detail || 'Registration failed'
      return false
    } finally {
      loading.value = false
    }
  }

  async function fetchUser() {
    if (!token.value) return
    try {
      user.value = await authApi.getMe()
    } catch (e) {
      logout()
    }
  }

  function logout() {
    user.value = null
    token.value = null
    localStorage.removeItem('token')
  }

  return {
    user,
    token,
    loading,
    error,
    isAuthenticated,
    isAdmin,
    login,
    register,
    fetchUser,
    logout
  }
})
