<template>
  <div class="bg-white rounded-3xl shadow-2xl p-8 max-w-4xl mx-auto">
    <div class="text-center mb-8">
      <h2 class="text-3xl font-black text-gray-800 mb-4">احجز إقامتك الآن</h2>
      <div class="h-1 w-16 bg-gradient-to-r from-blue-500 to-purple-500 mx-auto rounded-full"></div>
    </div>

    <form @submit.prevent="handleBooking" class="space-y-6">
      <!-- Date Selection -->
      <div class="grid md:grid-cols-2 gap-6">
        <div class="space-y-2">
          <label class="block text-sm font-semibold text-gray-700">
            <i class="fas fa-calendar-alt text-blue-500 mr-2"></i>
            تاريخ الوصول
          </label>
          <input
            type="date"
            v-model="bookingData.checkIn"
            @change="calculatePrice"
            :min="minDate"
            class="w-full p-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:ring-4 focus:ring-blue-500/20 transition-all duration-300"
            required
          />
        </div>
        
        <div class="space-y-2">
          <label class="block text-sm font-semibold text-gray-700">
            <i class="fas fa-calendar-check text-purple-500 mr-2"></i>
            تاريخ المغادرة
          </label>
          <input
            type="date"
            v-model="bookingData.checkOut"
            @change="calculatePrice"
            :min="bookingData.checkIn"
            class="w-full p-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:ring-4 focus:ring-blue-500/20 transition-all duration-300"
            required
          />
        </div>
      </div>

      <!-- Guests and Room Selection -->
      <div class="grid md:grid-cols-2 gap-6">
        <div class="space-y-2">
          <label class="block text-sm font-semibold text-gray-700">
            <i class="fas fa-users text-green-500 mr-2"></i>
            عدد الضيوف
          </label>
          <select
            v-model="bookingData.guests"
            @change="calculatePrice"
            class="w-full p-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:ring-4 focus:ring-blue-500/20 transition-all duration-300"
            required
          >
            <option value="">اختر عدد الضيوف</option>
            <option v-for="n in 8" :key="n" :value="n">{{ n }} {{ n === 1 ? 'ضيف' : 'ضيوف' }}</option>
          </select>
        </div>
        
        <div class="space-y-2" v-if="!roomId">
          <label class="block text-sm font-semibold text-gray-700">
            <i class="fas fa-bed text-teal-500 mr-2"></i>
            نوع الغرفة
          </label>
          <select
            v-model="bookingData.roomId"
            @change="calculatePrice"
            class="w-full p-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:ring-4 focus:ring-blue-500/20 transition-all duration-300"
            required
          >
            <option value="">اختر نوع الغرفة</option>
            <option v-for="room in availableRooms" :key="room.id" :value="room.id">
              {{ room.name }} - {{ room.price_per_night }} ج.م/ليلة
            </option>
          </select>
        </div>
      </div>

      <!-- Promo Code -->
      <div class="space-y-2">
        <label class="block text-sm font-semibold text-gray-700">
          <i class="fas fa-tag text-orange-500 mr-2"></i>
          كود الخصم (اختياري)
        </label>
        <div class="flex gap-3">
          <input
            type="text"
            v-model="bookingData.promoCode"
            placeholder="أدخل كود الخصم"
            class="flex-1 p-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:ring-4 focus:ring-blue-500/20 transition-all duration-300"
          />
          <button
            type="button"
            @click="applyPromoCode"
            :disabled="!bookingData.promoCode || applyingPromo"
            class="px-6 py-4 bg-gradient-to-r from-orange-500 to-red-500 text-white rounded-xl font-semibold hover:from-orange-600 hover:to-red-600 disabled:opacity-50 disabled:cursor-not-allowed transition-all duration-300"
          >
            <i class="fas fa-check mr-2" v-if="!applyingPromo"></i>
            <i class="fas fa-spinner fa-spin mr-2" v-else></i>
            تطبيق
          </button>
        </div>
        <p v-if="promoMessage" class="text-sm" :class="promoMessage.type === 'success' ? 'text-green-600' : 'text-red-600'">
          {{ promoMessage.text }}
        </p>
      </div>

      <!-- Special Requests -->
      <div class="space-y-2">
        <label class="block text-sm font-semibold text-gray-700">
          <i class="fas fa-comment-alt text-indigo-500 mr-2"></i>
          طلبات خاصة (اختياري)
        </label>
        <textarea
          v-model="bookingData.specialRequests"
          placeholder="أي طلبات خاصة أو ملاحظات..."
          rows="3"
          class="w-full p-4 border-2 border-gray-200 rounded-xl focus:border-blue-500 focus:ring-4 focus:ring-blue-500/20 transition-all duration-300 resize-none"
        ></textarea>
      </div>

      <!-- Price Breakdown -->
      <div v-if="priceBreakdown" class="bg-gradient-to-br from-blue-50 to-purple-50 rounded-2xl p-6 space-y-4 animate-fade-in-up">
        <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center">
          <i class="fas fa-calculator text-blue-600 mr-3"></i>
          تفاصيل السعر
        </h3>
        
        <div class="space-y-3">
          <div class="flex justify-between items-center">
            <span class="text-gray-600">السعر الأساسي ({{ priceBreakdown.nights }} ليلة)</span>
            <span class="font-semibold">{{ priceBreakdown.subtotal.toFixed(2) }} ج.م</span>
          </div>
          
          <div v-if="priceBreakdown.extra_guest_fee > 0" class="flex justify-between items-center">
            <span class="text-gray-600">رسوم الضيوف الإضافيين</span>
            <span class="font-semibold">{{ priceBreakdown.extra_guest_fee.toFixed(2) }} ج.م</span>
          </div>
          
          <div class="flex justify-between items-center">
            <span class="text-gray-600">رسوم التنظيف</span>
            <span class="font-semibold">{{ priceBreakdown.cleaning_fee.toFixed(2) }} ج.م</span>
          </div>
          
          <div class="flex justify-between items-center">
            <span class="text-gray-600">رسوم الخدمة</span>
            <span class="font-semibold">{{ priceBreakdown.service_fee.toFixed(2) }} ج.م</span>
          </div>
          
          <div v-if="priceBreakdown.long_stay_discount > 0" class="flex justify-between items-center text-green-600">
            <span>خصم الإقامة الطويلة</span>
            <span class="font-semibold">-{{ priceBreakdown.long_stay_discount.toFixed(2) }} ج.م</span>
          </div>
          
          <div v-if="priceBreakdown.promo_discount > 0" class="flex justify-between items-center text-green-600">
            <span>خصم كود الخصم ({{ priceBreakdown.promo_code }})</span>
            <span class="font-semibold">-{{ priceBreakdown.promo_discount.toFixed(2) }} ج.م</span>
          </div>
          
          <hr class="border-gray-300">
          
          <div class="flex justify-between items-center">
            <span class="text-gray-600">الضريبة ({{ (priceBreakdown.tax_rate * 100).toFixed(0) }}%)</span>
            <span class="font-semibold">{{ priceBreakdown.tax_amount.toFixed(2) }} ج.م</span>
          </div>
          
          <hr class="border-gray-400">
          
          <div class="flex justify-between items-center text-xl font-black">
            <span class="text-gray-800">المجموع الإجمالي</span>
            <span class="text-gradient">{{ priceBreakdown.total_amount.toFixed(2) }} ج.م</span>
          </div>
        </div>
      </div>

      <!-- Availability Status -->
      <div v-if="availabilityChecked" class="p-4 rounded-xl animate-bounce-in" :class="isAvailable ? 'bg-green-50 border-2 border-green-200' : 'bg-red-50 border-2 border-red-200'">
        <div class="flex items-center">
          <i :class="isAvailable ? 'fas fa-check-circle text-green-600' : 'fas fa-times-circle text-red-600'" class="text-xl mr-3"></i>
          <span :class="isAvailable ? 'text-green-800' : 'text-red-800'" class="font-semibold">
            {{ isAvailable ? 'الغرفة متاحة للحجز!' : 'عذراً، الغرفة غير متاحة في هذه التواريخ' }}
          </span>
        </div>
      </div>

      <!-- Submit Button -->
      <button
        type="submit"
        :disabled="!canBook || isLoading"
        class="w-full bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 disabled:from-gray-400 disabled:to-gray-500 text-white py-4 px-8 rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 disabled:scale-100 shadow-xl hover:shadow-2xl disabled:shadow-none"
      >
        <i v-if="isLoading" class="fas fa-spinner fa-spin mr-3"></i>
        <i v-else class="fas fa-credit-card mr-3"></i>
        {{ isLoading ? 'جاري المعالجة...' : 'احجز الآن' }}
      </button>
    </form>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, watch } from 'vue'
import { useRouter } from 'vue-router'

const props = defineProps({
  roomId: {
    type: Number,
    default: null
  }
})

const router = useRouter()

// Reactive data
const bookingData = ref({
  checkIn: '',
  checkOut: '',
  guests: '',
  roomId: props.roomId || '',
  promoCode: '',
  specialRequests: ''
})

const priceBreakdown = ref(null)
const availableRooms = ref([
  { id: 1, name: 'غرفة ديلوكس بإطلالة بحرية', price_per_night: 800 },
  { id: 2, name: 'جناح رئاسي', price_per_night: 1200 },
  { id: 3, name: 'غرفة عائلية', price_per_night: 600 }
])

const isLoading = ref(false)
const applyingPromo = ref(false)
const promoMessage = ref(null)
const availabilityChecked = ref(false)
const isAvailable = ref(false)

// Computed properties
const minDate = computed(() => {
  const today = new Date()
  return today.toISOString().split('T')[0]
})

const canBook = computed(() => {
  return bookingData.value.checkIn && 
         bookingData.value.checkOut && 
         bookingData.value.guests && 
         bookingData.value.roomId && 
         isAvailable.value
})

// Methods
const calculatePrice = async () => {
  if (!bookingData.value.checkIn || !bookingData.value.checkOut || !bookingData.value.guests || !bookingData.value.roomId) {
    return
  }

  isLoading.value = true
  
  try {
    // Simulate API call
    await new Promise(resolve => setTimeout(resolve, 1000))
    
    const room = availableRooms.value.find(r => r.id == bookingData.value.roomId)
    const checkIn = new Date(bookingData.value.checkIn)
    const checkOut = new Date(bookingData.value.checkOut)
    const nights = Math.ceil((checkOut - checkIn) / (1000 * 60 * 60 * 24))
    
    const basePrice = room.price_per_night
    const subtotal = basePrice * nights
    const extraGuestFee = bookingData.value.guests > 2 ? (bookingData.value.guests - 2) * 50 * nights : 0
    const cleaningFee = 100
    const serviceFee = subtotal * 0.05
    const longStayDiscount = nights >= 7 ? subtotal * 0.10 : (nights >= 3 ? subtotal * 0.05 : 0)
    const promoDiscount = bookingData.value.promoCode ? subtotal * 0.10 : 0
    const taxRate = 0.14
    
    const totalBeforeTax = subtotal + extraGuestFee + cleaningFee + serviceFee - longStayDiscount - promoDiscount
    const taxAmount = totalBeforeTax * taxRate
    const totalAmount = totalBeforeTax + taxAmount
    
    priceBreakdown.value = {
      base_price: basePrice,
      nights: nights,
      subtotal: subtotal,
      extra_guest_fee: extraGuestFee,
      cleaning_fee: cleaningFee,
      service_fee: serviceFee,
      long_stay_discount: longStayDiscount,
      promo_discount: promoDiscount,
      promo_code: bookingData.value.promoCode,
      tax_rate: taxRate,
      tax_amount: taxAmount,
      total_amount: totalAmount
    }
    
    // Check availability
    availabilityChecked.value = true
    isAvailable.value = Math.random() > 0.2 // 80% chance of availability
    
  } catch (error) {
    console.error('Error calculating price:', error)
  } finally {
    isLoading.value = false
  }
}

const applyPromoCode = async () => {
  applyingPromo.value = true
  promoMessage.value = null
  
  try {
    await new Promise(resolve => setTimeout(resolve, 1000))
    
    const validCodes = ['WELCOME10', 'SUMMER20', 'NEWUSER', 'WEEKEND15']
    
    if (validCodes.includes(bookingData.value.promoCode.toUpperCase())) {
      promoMessage.value = {
        type: 'success',
        text: 'تم تطبيق كود الخصم بنجاح!'
      }
      calculatePrice()
    } else {
      promoMessage.value = {
        type: 'error',
        text: 'كود الخصم غير صحيح'
      }
    }
  } catch (error) {
    promoMessage.value = {
      type: 'error',
      text: 'حدث خطأ في تطبيق كود الخصم'
    }
  } finally {
    applyingPromo.value = false
  }
}

const handleBooking = async () => {
  if (!canBook.value) return
  
  isLoading.value = true
  
  try {
    // Simulate booking API call
    await new Promise(resolve => setTimeout(resolve, 2000))
    
    // Redirect to confirmation page
    router.push({
      path: '/booking/confirmation',
      query: {
        roomId: bookingData.value.roomId,
        checkIn: bookingData.value.checkIn,
        checkOut: bookingData.value.checkOut,
        guests: bookingData.value.guests,
        total: priceBreakdown.value.total_amount
      }
    })
  } catch (error) {
    console.error('Booking error:', error)
    alert('حدث خطأ في عملية الحجز. يرجى المحاولة مرة أخرى.')
  } finally {
    isLoading.value = false
  }
}

// Set default dates on mount
onMounted(() => {
  const today = new Date()
  const tomorrow = new Date(today)
  tomorrow.setDate(tomorrow.getDate() + 1)
  
  bookingData.value.checkIn = today.toISOString().split('T')[0]
  bookingData.value.checkOut = tomorrow.toISOString().split('T')[0]
})

// Watch for changes in booking data
watch(() => bookingData.value.promoCode, () => {
  promoMessage.value = null
})
</script>

