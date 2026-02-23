import apiClient from './client'
import type { Booking, Room } from '@/types'

export const bookingsApi = {
  async getAll(params?: { status?: string }): Promise<Booking[]> {
    const { data } = await apiClient.get('/api/bookings', { params })
    return data
  },

  async getById(id: number): Promise<Booking> {
    const { data } = await apiClient.get(`/api/bookings/${id}`)
    return data
  },

  async create(booking: Partial<Booking>): Promise<Booking> {
    const { data } = await apiClient.post('/api/bookings', booking)
    return data
  },

  async update(id: number, booking: Partial<Booking>): Promise<Booking> {
    const { data } = await apiClient.put(`/api/bookings/${id}`, booking)
    return data
  },

  async checkAvailability(checkIn: string, checkOut: string, guests: number): Promise<Room[]> {
    const { data } = await apiClient.get('/api/bookings/availability/rooms', {
      params: { check_in: checkIn, check_out: checkOut, guests }
    })
    return data
  }
}
