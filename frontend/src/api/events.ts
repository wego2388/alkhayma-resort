import apiClient from './client'
import type { Event } from '@/types'

export const eventsApi = {
  async getAll(params?: { category?: string; is_active?: boolean }): Promise<Event[]> {
    const { data } = await apiClient.get('/api/events', { params })
    return data
  },

  async getById(id: number): Promise<Event> {
    const { data } = await apiClient.get(`/api/events/${id}`)
    return data
  },

  async create(event: Partial<Event>): Promise<Event> {
    const { data } = await apiClient.post('/api/events', event)
    return data
  },

  async update(id: number, event: Partial<Event>): Promise<Event> {
    const { data} = await apiClient.put(`/api/events/${id}`, event)
    return data
  },

  async delete(id: number): Promise<void> {
    await apiClient.delete(`/api/events/${id}`)
  }
}
