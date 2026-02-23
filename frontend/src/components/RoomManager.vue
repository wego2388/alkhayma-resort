<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex justify-between items-center">
      <div>
        <h2 class="text-3xl font-bold text-gray-900">{{ isRTL ? 'إدارة الغرف' : 'Manage Rooms' }}</h2>
        <p class="text-gray-600 mt-1">{{ rooms.length }} {{ isRTL ? 'غرفة' : 'rooms' }}</p>
      </div>
      <button @click="showAddModal = true" class="btn-primary flex items-center gap-2 shadow-lg hover:shadow-xl">
        <span class="text-xl">➕</span>
        {{ isRTL ? 'إضافة غرفة' : 'Add Room' }}
      </button>
    </div>

    <!-- Loading -->
    <div v-if="loading" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="i in 6" :key="i" class="card animate-pulse">
        <div class="h-48 bg-gray-200 rounded-lg mb-3"></div>
        <div class="h-6 bg-gray-200 rounded mb-2"></div>
        <div class="h-4 bg-gray-200 rounded mb-3"></div>
        <div class="flex gap-2">
          <div class="flex-1 h-10 bg-gray-200 rounded"></div>
          <div class="flex-1 h-10 bg-gray-200 rounded"></div>
        </div>
      </div>
    </div>

    <!-- Rooms Grid -->
    <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="room in rooms" :key="room.id" class="card hover:shadow-2xl transition-all duration-300 group border-2 border-transparent hover:border-primary-200">
        <div class="relative overflow-hidden rounded-xl mb-4">
          <img :src="room.image_url" :alt="room.name" class="w-full h-48 object-cover group-hover:scale-110 transition-transform duration-500" />
          <div class="absolute top-3 right-3">
            <span :class="room.is_active ? 'bg-green-500' : 'bg-gray-500'" class="px-3 py-1 rounded-full text-white text-xs font-bold shadow-lg">
              {{ room.is_active ? (isRTL ? '✓ نشط' : '✓ Active') : (isRTL ? '✕ غير نشط' : '✕ Inactive') }}
            </span>
          </div>
          <div class="absolute bottom-3 left-3 bg-white/90 backdrop-blur-sm px-3 py-1 rounded-full">
            <span class="text-sm font-semibold text-gray-700">👥 {{ room.capacity }} {{ isRTL ? 'أشخاص' : 'guests' }}</span>
          </div>
        </div>
        
        <h3 class="font-bold text-xl text-gray-900 mb-2">{{ isRTL ? room.name_ar : room.name }}</h3>
        <p class="text-sm text-gray-600 mb-4 line-clamp-2 min-h-[40px]">{{ isRTL ? room.description_ar : room.description }}</p>
        
        <div class="flex items-center justify-between mb-4 pb-4 border-b">
          <div>
            <p class="text-xs text-gray-500">{{ isRTL ? 'السعر/ليلة' : 'Price/Night' }}</p>
            <p class="text-2xl font-bold text-primary-600">${{ room.price_per_night }}</p>
          </div>
          <div class="text-right">
            <p class="text-xs text-gray-500">{{ isRTL ? 'رقم الغرفة' : 'Room ID' }}</p>
            <p class="text-lg font-mono font-bold text-gray-700">#{{ room.id }}</p>
          </div>
        </div>
        
        <div class="flex gap-2">
          <button @click="editRoom(room)" class="flex-1 bg-gradient-to-r from-blue-500 to-blue-600 text-white px-4 py-2.5 rounded-lg hover:from-blue-600 hover:to-blue-700 text-sm font-semibold transition-all hover:shadow-lg flex items-center justify-center gap-2">
            <span>✏️</span>
            {{ isRTL ? 'تعديل' : 'Edit' }}
          </button>
          <button @click="deleteRoom(room.id)" class="flex-1 bg-gradient-to-r from-red-500 to-red-600 text-white px-4 py-2.5 rounded-lg hover:from-red-600 hover:to-red-700 text-sm font-semibold transition-all hover:shadow-lg flex items-center justify-center gap-2">
            <span>🗑️</span>
            {{ isRTL ? 'حذف' : 'Delete' }}
          </button>
        </div>
      </div>
    </div>

    <!-- Empty State -->
    <div v-if="!loading && rooms.length === 0" class="card text-center py-16">
      <div class="text-8xl mb-4">🏨</div>
      <h3 class="text-2xl font-bold text-gray-900 mb-2">{{ isRTL ? 'لا توجد غرف' : 'No Rooms Yet' }}</h3>
      <p class="text-gray-600 mb-6">{{ isRTL ? 'ابدأ بإضافة غرفة جديدة' : 'Start by adding a new room' }}</p>
      <button @click="showAddModal = true" class="btn-primary">
        ➕ {{ isRTL ? 'إضافة غرفة' : 'Add Room' }}
      </button>
    </div>

    <!-- Add/Edit Modal -->
    <Transition name="modal">
      <div v-if="showAddModal || editingRoom" class="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4" @click.self="closeModal">
        <Transition name="modal-content">
          <div v-if="showAddModal || editingRoom" class="bg-white rounded-2xl p-8 max-w-3xl w-full max-h-[90vh] overflow-y-auto shadow-2xl">
            <div class="flex items-center justify-between mb-6">
              <h3 class="text-3xl font-bold text-gray-900">
                {{ editingRoom ? (isRTL ? '✏️ تعديل غرفة' : '✏️ Edit Room') : (isRTL ? '➕ إضافة غرفة' : '➕ Add Room') }}
              </h3>
              <button @click="closeModal" class="text-3xl text-gray-400 hover:text-gray-600 transition-colors">×</button>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">{{ isRTL ? 'الاسم (EN)' : 'Name (EN)' }} *</label>
                <input v-model="formData.name" type="text" class="input w-full" placeholder="Deluxe Suite" />
              </div>
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">{{ isRTL ? 'الاسم (AR)' : 'Name (AR)' }} *</label>
                <input v-model="formData.name_ar" type="text" class="input w-full" placeholder="جناح فاخر" />
              </div>
              <div class="col-span-1 md:col-span-2">
                <label class="block text-sm font-bold text-gray-700 mb-2">{{ isRTL ? 'الوصف (EN)' : 'Description (EN)' }} *</label>
                <textarea v-model="formData.description" class="input w-full" rows="3" placeholder="Spacious room with ocean view..."></textarea>
              </div>
              <div class="col-span-1 md:col-span-2">
                <label class="block text-sm font-bold text-gray-700 mb-2">{{ isRTL ? 'الوصف (AR)' : 'Description (AR)' }} *</label>
                <textarea v-model="formData.description_ar" class="input w-full" rows="3" placeholder="غرفة واسعة مع إطلالة على البحر..."></textarea>
              </div>
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">{{ isRTL ? 'السعر/ليلة ($)' : 'Price/Night ($)' }} *</label>
                <input v-model.number="formData.price_per_night" type="number" min="0" class="input w-full" placeholder="150" />
              </div>
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">{{ isRTL ? 'السعة (أشخاص)' : 'Capacity (Guests)' }} *</label>
                <input v-model.number="formData.capacity" type="number" min="1" max="10" class="input w-full" placeholder="2" />
              </div>
              <div class="col-span-1 md:col-span-2">
                <label class="block text-sm font-bold text-gray-700 mb-2">{{ isRTL ? 'رابط الصورة' : 'Image URL' }} *</label>
                <input v-model="formData.image_url" type="text" class="input w-full" placeholder="https://images.unsplash.com/..." />
                <p class="text-xs text-gray-500 mt-1">{{ isRTL ? 'استخدم رابط صورة من Unsplash أو مصدر آخر' : 'Use image URL from Unsplash or other source' }}</p>
              </div>
              <div class="col-span-1 md:col-span-2">
                <label class="flex items-center gap-3 p-4 bg-gray-50 rounded-lg cursor-pointer hover:bg-gray-100 transition-colors">
                  <input v-model="formData.is_active" type="checkbox" class="w-5 h-5 text-primary-600" />
                  <div>
                    <span class="font-bold text-gray-900">{{ isRTL ? 'نشط' : 'Active' }}</span>
                    <p class="text-xs text-gray-600">{{ isRTL ? 'الغرفة متاحة للحجز' : 'Room is available for booking' }}</p>
                  </div>
                </label>
              </div>
            </div>

            <div class="flex gap-3 mt-8">
              <button @click="closeModal" class="flex-1 btn-secondary py-3" :disabled="saving">
                {{ isRTL ? 'إلغاء' : 'Cancel' }}
              </button>
              <button @click="saveRoom" class="flex-1 btn-primary py-3" :disabled="saving">
                <span v-if="saving" class="inline-block animate-spin mr-2">⏳</span>
                {{ saving ? (isRTL ? 'جاري الحفظ...' : 'Saving...') : (isRTL ? '💾 حفظ' : '💾 Save') }}
              </button>
            </div>
          </div>
        </Transition>
      </div>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import apiClient from '@/api/client'

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const rooms = ref<any[]>([])
const showAddModal = ref(false)
const editingRoom = ref<any>(null)
const saving = ref(false)
const loading = ref(true)

const formData = ref({
  name: '',
  name_ar: '',
  description: '',
  description_ar: '',
  price_per_night: 0,
  capacity: 2,
  image_url: '',
  is_active: true
})

async function loadRooms() {
  loading.value = true
  try {
    const response = await apiClient.get('/api/rooms')
    console.log('Rooms loaded:', response.data)
    rooms.value = response.data
  } catch (error) {
    console.error('Failed to load rooms:', error)
    toast.error(isRTL.value ? 'فشل التحميل' : 'Failed to load')
  } finally {
    loading.value = false
  }
}

function editRoom(room: any) {
  editingRoom.value = room
  formData.value = { ...room }
}

async function saveRoom() {
  saving.value = true
  try {
    if (editingRoom.value) {
      await apiClient.put(`/api/rooms/${editingRoom.value.id}`, formData.value)
      toast.success(isRTL.value ? 'تم التحديث' : 'Updated')
    } else {
      await apiClient.post('/api/rooms', formData.value)
      toast.success(isRTL.value ? 'تمت الإضافة' : 'Added')
    }
    closeModal()
    loadRooms()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل الحفظ' : 'Failed to save')
  } finally {
    saving.value = false
  }
}

async function deleteRoom(id: number) {
  if (!confirm(isRTL.value ? 'هل أنت متأكد؟' : 'Are you sure?')) return
  
  try {
    await apiClient.delete(`/api/rooms/${id}`)
    toast.success(isRTL.value ? 'تم الحذف' : 'Deleted')
    loadRooms()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل الحذف' : 'Failed to delete')
  }
}

function closeModal() {
  showAddModal.value = false
  editingRoom.value = null
  formData.value = {
    name: '',
    name_ar: '',
    description: '',
    description_ar: '',
    price_per_night: 0,
    capacity: 2,
    image_url: '',
    is_active: true
  }
}

onMounted(() => {
  loadRooms()
})
</script>

<style scoped>
.modal-enter-active, .modal-leave-active {
  transition: opacity 0.3s ease;
}
.modal-enter-from, .modal-leave-to {
  opacity: 0;
}

.modal-content-enter-active {
  transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
}
.modal-content-leave-active {
  transition: all 0.2s ease;
}
.modal-content-enter-from {
  opacity: 0;
  transform: scale(0.9) translateY(-30px);
}
.modal-content-leave-to {
  opacity: 0;
  transform: scale(0.95);
}

.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
