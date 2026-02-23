import apiClient from './client'
import type { Product } from '@/types'

export const productsApi = {
  async getAll(params?: { type?: string; is_active?: boolean }): Promise<Product[]> {
    const { data } = await apiClient.get('/api/products', { params })
    return data
  },

  async getById(id: number): Promise<Product> {
    const { data } = await apiClient.get(`/api/products/${id}`)
    return data
  },

  async create(product: Partial<Product>): Promise<Product> {
    const { data } = await apiClient.post('/api/products', product)
    return data
  },

  async update(id: number, product: Partial<Product>): Promise<Product> {
    const { data } = await apiClient.put(`/api/products/${id}`, product)
    return data
  },

  async delete(id: number): Promise<void> {
    await apiClient.delete(`/api/products/${id}`)
  }
}
