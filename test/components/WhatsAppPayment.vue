<template>
  <div class="bg-white rounded-lg shadow-lg p-6 max-w-md mx-auto">
    <div class="text-center mb-6">
      <div class="w-16 h-16 bg-green-500 rounded-full flex items-center justify-center mx-auto mb-4">
        <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 24 24">
          <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893A11.821 11.821 0 0020.885 3.488"/>
        </svg>
      </div>
      <h3 class="text-xl font-bold text-gray-900 mb-2">إتمام الحجز عبر واتساب</h3>
      <p class="text-gray-600">سيتم توجيهك لإتمام عملية الدفع عبر واتساب</p>
    </div>

    <div class="bg-green-50 border border-green-200 rounded-lg p-4 mb-6">
      <div class="flex items-start">
        <div class="flex-shrink-0">
          <svg class="w-5 h-5 text-green-400" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
          </svg>
        </div>
        <div class="mr-3">
          <h4 class="text-sm font-medium text-green-800">تعليمات الدفع</h4>
          <div class="mt-2 text-sm text-green-700">
            <ul class="list-disc list-inside space-y-1">
              <li>سيتم إرسال تفاصيل الحجز عبر واتساب</li>
              <li>يرجى إرسال إثبات الدفع للرقم المحدد</li>
              <li>سيتم تأكيد الحجز خلال 24 ساعة</li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="space-y-4">
      <div class="flex justify-between items-center py-2 border-b">
        <span class="text-gray-600">إجمالي المبلغ:</span>
        <span class="text-xl font-bold text-gray-900">{{ totalAmount }} ريال</span>
      </div>

      <button 
        @click="sendToWhatsApp"
        class="w-full bg-green-500 hover:bg-green-600 text-white font-bold py-3 px-4 rounded-lg transition-colors duration-200 flex items-center justify-center"
      >
        <svg class="w-5 h-5 ml-2" fill="currentColor" viewBox="0 0 24 24">
          <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893A11.821 11.821 0 0020.885 3.488"/>
        </svg>
        إتمام الحجز عبر واتساب
      </button>

      <p class="text-xs text-gray-500 text-center">
        بالضغط على الزر أعلاه، أنت توافق على شروط وأحكام المنتجع
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
interface Props {
  bookingData: {
    roomName: string
    checkIn: string
    checkOut: string
    guests: number
    totalAmount: number
    customerName: string
    customerPhone: string
  }
  totalAmount: number
}

const props = defineProps<Props>()

const sendToWhatsApp = () => {
  const whatsappNumber = "+966501234567" // رقم المنتجع
  
  const message = `
🏨 *حجز جديد - منتجع الخيمة*

👤 *اسم العميل:* ${props.bookingData.customerName}
📱 *رقم الهاتف:* ${props.bookingData.customerPhone}
🏠 *نوع الغرفة:* ${props.bookingData.roomName}
📅 *تاريخ الوصول:* ${props.bookingData.checkIn}
📅 *تاريخ المغادرة:* ${props.bookingData.checkOut}
👥 *عدد الضيوف:* ${props.bookingData.guests}
💰 *إجمالي المبلغ:* ${props.totalAmount} ريال

يرجى تأكيد الحجز وإرسال تفاصيل الدفع.
  `.trim()

  const encodedMessage = encodeURIComponent(message)
  const whatsappUrl = `https://wa.me/${whatsappNumber.replace('+', '')}?text=${encodedMessage}`
  
  // فتح واتساب في نافذة جديدة
  window.open(whatsappUrl, '_blank')
  
  // إرسال البيانات لـ n8n للأتمتة
  sendToN8N()
}

const sendToN8N = async () => {
  try {
    const webhookUrl = 'http://localhost:5678/webhook/alkhayma-booking'
    
    await fetch(webhookUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        type: 'whatsapp_booking',
        booking: props.bookingData,
        timestamp: new Date().toISOString(),
        status: 'pending_payment'
      })
    })
  } catch (error) {
    console.log('n8n webhook not available:', error)
  }
}
</script>
