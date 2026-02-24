export interface User {
  id: number
  email: string
  full_name: string
  phone?: string
  role: string
  is_active: boolean
  created_at: string
}

export interface Room {
  id: number
  name: string
  name_ar: string
  description?: string
  description_ar?: string
  type: string
  capacity: number
  base_price: number
  image_url?: string
  amenities: string[]
  is_active: boolean
  created_at: string
}

export interface Product {
  id: number
  name: string
  name_ar: string
  description?: string
  description_ar?: string
  type: string
  price: number
  image_url?: string
  duration?: number
  is_active: boolean
  created_at: string
}

export interface Event {
  id: number
  name: string
  name_ar: string
  description?: string
  description_ar?: string
  category: string
  price: number
  image_url?: string
  duration?: number
  schedule_time?: string
  schedule_days?: string
  max_guests?: number
  location?: string
  location_ar?: string
  is_active: boolean
  created_at: string
}

export interface Booking {
  id: number
  user_id: number
  room_id?: number
  product_id?: number
  booking_type: string
  check_in?: string
  check_out?: string
  booking_date?: string
  guests: number
  total_price: number
  status: string
  special_requests?: string
  created_at: string
}

export interface Payment {
  id: number
  booking_id: number
  amount: number
  payment_method: string
  status: string
  transaction_id?: string
  payment_date: string
}

export interface Review {
  id: number
  user_id: number
  room_id?: number
  product_id?: number
  rating: number
  comment?: string
  comment_ar?: string
  is_approved: boolean
  created_at: string
}

export interface LoginCredentials {
  username: string
  password: string
}

export interface RegisterData {
  email: string
  password: string
  full_name: string
  phone?: string
}

export interface AuthResponse {
  access_token: string
  token_type: string
}
