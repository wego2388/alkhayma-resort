import apiClient from './client'
import type { Room } from '@/types'

export const roomsApi = {
  async getAll(params?: { type?: string; is_active?: boolean }): Promise<Room[]> {
    const { data } = await apiClient.get('/api/rooms', { params })
    return data
  },

  async getById(id: number): Promise<Room> {
    const { data } = await apiClient.get(`/api/rooms/${id}`)
    return data
  },

  async create(room: Partial<Room>): Promise<Room> {
    const { data } = await apiClient.post('/api/rooms', room)
    return data
  },

  async update(id: number, room: Partial<Room>): Promise<Room> {
    const { data } = await apiClient.put(`/api/rooms/${id}`, room)
    return data
  },

  async delete(id: number): Promise<void> {
    await apiClient.delete(`/api/rooms/${id}`)
  }
}
