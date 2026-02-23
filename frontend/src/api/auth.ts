import apiClient from './client'
import type { LoginCredentials, RegisterData, AuthResponse, User } from '@/types'

export const authApi = {
  async login(credentials: LoginCredentials): Promise<AuthResponse> {
    const formData = new URLSearchParams()
    formData.append('username', credentials.username)
    formData.append('password', credentials.password)
    
    const { data } = await apiClient.post('/api/auth/login', formData, {
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
    return data
  },

  async register(userData: RegisterData): Promise<User> {
    const { data } = await apiClient.post('/api/auth/register', userData)
    return data
  },

  async getMe(): Promise<User> {
    const { data } = await apiClient.get('/api/auth/me')
    return data
  }
}
