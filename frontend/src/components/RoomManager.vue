<template>
  <div class="space-y-8">
    <!-- Header Stats -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      <div class="group relative bg-gradient-to-br from-blue-500 to-blue-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-blue-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-blue-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-blue-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'إجمالي الغرف' : 'Total Rooms' }}</p>
          <p class="text-4xl font-bold">{{ rooms.length }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-green-500 to-green-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-green-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-green-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-green-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'متاحة' : 'Available' }}</p>
          <p class="text-4xl font-bold">{{ rooms.filter(r => r.is_active).length }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-amber-500 to-amber-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-amber-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-amber-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-amber-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'السعة الكلية' : 'Total Capacity' }}</p>
          <p class="text-4xl font-bold">{{ totalCapacity }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-purple-500 to-purple-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-purple-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-purple-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-purple-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'متوسط السعر' : 'Avg Price' }}</p>
          <p class="text-3xl font-bold">${{ avgPrice }}</p>
        </div>
      </div>
    </div>

    <!-- Header -->
    <div class="bg-white rounded-2xl p-6 shadow-lg border border-slate-200/50">
      <div class="flex justify-between items-center">
        <div>
          <h2 class="text-2xl font-bold text-slate-900">{{ isRTL ? 'إدارة الغرف' : 'Manage Rooms' }}</h2>
          <p class="text-sm text-slate-600 mt-1">{{ rooms.length }} {{ isRTL ? 'غرفة' : 'rooms' }}</p>
        </div>
        <button @click="showAddModal = true" class="px-6 py-3 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-xl font-semibold hover:shadow-xl hover:shadow-amber-500/50 hover:scale-105 transition-all duration-300 flex items-center gap-2">
          <span class="text-xl">➕</span>
          {{ isRTL ? 'إضافة غرفة' : 'Add Room' }}
        </button>
      </div>
    </div>

    <!-- Loading -->
    <div v-if="loading" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="i in 6" :key="i" class="bg-white rounded-2xl p-6 shadow-lg animate-pulse">
        <div class="h-48 bg-slate-200 rounded-xl mb-4"></div>
        <div class="h-6 bg-slate-200 rounded mb-2"></div>
        <div class="h-4 bg-slate-200 rounded mb-3"></div>
        <div class="flex gap-2">
          <div class="flex-1 h-10 bg-slate-200 rounded"></div>
          <div class="flex-1 h-10 bg-slate-200 rounded"></div>
        </div>
      </div>
    </div>

    <!-- Rooms Grid -->
    <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="room in rooms" :key="room.id" class="group bg-white rounded-2xl shadow-lg border border-slate-200/50 overflow-hidden hover:shadow-2xl hover:scale-105 transition-all duration-300">
        <div class="relative overflow-hidden">
          <img :src="room.image_url" :alt="room.name" class="w-full h-48 object-cover group-hover:scale-110 transition-transform duration-500" />
          <div class="absolute top-3 right-3">
            <span :class="room.is_active ? 'bg-green-500' : 'bg-slate-500'" class="px-3 py-1 rounded-full text-white text-xs font-bold shadow-lg">
              {{ room.is_active ? '✓' : '✕' }}
            </span>
          </div>
          <div class="absolute bottom-3 left-3 bg-white/90 backdrop-blur-sm px-3 py-1 rounded-full">
            <span class="text-sm font-semibold text-slate-700">👥 {{ room.capacity }}</span>
          </div>
        </div>
        
        <div class="p-6">
          <h3 class="font-bold text-xl text-slate-900 mb-2">{{ isRTL ? room.name_ar : room.name }}</h3>
          <p class="text-sm text-slate-600 mb-4 line-clamp-2 min-h-[40px]">{{ isRTL ? room.description_ar : room.description }}</p>
          
          <div class="flex items-center justify-between mb-4 pb-4 border-b border-slate-200">
            <div>
              <p class="text-xs text-slate-500">{{ isRTL ? 'السعر/ليلة' : 'Price/Night' }}</p>
              <p class="text-2xl font-bold text-amber-600">${{ room.price_per_night }}</p>
            </div>
            <div class="text-right">
              <p class="text-xs text-slate-500">{{ isRTL ? 'السعة' : 'Capacity' }}</p>
              <p class="text-lg font-semibold text-slate-900">{{ room.capacity }} {{ isRTL ? 'أشخاص' : 'guests' }}</p>
            </div>
          </div>
          
          <div class="flex gap-2">
            <button @click="editRoom(room)" class="flex-1 px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors font-medium">
              ✏️ {{ isRTL ? 'تعديل' : 'Edit' }}
            </button>
            <button @click="toggleActive(room)" :class="room.is_active ? 'bg-slate-500 hover:bg-slate-600' : 'bg-green-500 hover:bg-green-600'" class="flex-1 px-4 py-2 text-white rounded-lg transition-colors font-medium">
              {{ room.is_active ? '🔒' : '✓' }}
            </button>
            <button @click="deleteRoom(room)" class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 transition-colors font-medium">
              🗑️
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- Add/Edit Modal -->
    <div v-if="showAddModal || editingRoom" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4">
      <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
        <div class="sticky top-0 bg-gradient-to-r from-amber-500 to-amber-600 text-white p-6 rounded-t-2xl">
          <h3 class="text-2xl font-bold">{{ editingRoom ? (isRTL ? 'تعديل غرفة' : 'Edit Room') : (isRTL ? 'إضافة غرفة' : 'Add Room') }}</h3>
        </div>
        
        <div class="p-6 space-y-4">
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الاسم (EN)' : 'Name (EN)' }}</label>
              <input v-model="formData.name" type="text" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
            </div>
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الاسم (AR)' : 'Name (AR)' }}</label>
              <input v-model="formData.name_ar" type="text" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" dir="rtl" />
            </div>
          </div>

          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الوصف (EN)' : 'Description (EN)' }}</label>
              <textarea v-model="formData.description" rows="3" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent"></textarea>
            </div>
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الوصف (AR)' : 'Description (AR)' }}</label>
              <textarea v-model="formData.description_ar" rows="3" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" dir="rtl"></textarea>
            </div>
          </div>

          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'السعر/ليلة' : 'Price/Night' }}</label>
              <input v-model.number="formData.price_per_night" type="number" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
            </div>
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'السعة' : 'Capacity' }}</label>
              <input v-model.number="formData.capacity" type="number" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
            </div>
          </div>

          <div>
            <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الصورة' : 'Image' }}</label>
            
            <div v-if="formData.image_url || imagePreview" class="mb-3 relative group">
              <img :src="imagePreview || formData.image_url" class="w-full h-48 object-cover rounded-xl border-2 border-slate-200" />
              <button @click="clearImage" type="button" class="absolute top-2 right-2 p-2 bg-red-500 text-white rounded-lg opacity-0 group-hover:opacity-100 transition-opacity">
                ❌
              </button>
            </div>

            <div class="flex gap-2">
              <label class="flex-1 px-4 py-3 bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-xl font-semibold hover:shadow-lg cursor-pointer text-center transition-all">
                📤 {{ isRTL ? 'رفع صورة' : 'Upload Image' }}
                <input type="file" @change="handleImageUpload" accept="image/*" class="hidden" />
              </label>
              <button @click="showUrlInput = !showUrlInput" type="button" class="px-4 py-3 bg-slate-200 text-slate-700 rounded-xl font-semibold hover:bg-slate-300 transition-colors">
                🔗
              </button>
            </div>

            <input v-if="showUrlInput" v-model="formData.image_url" type="text" :placeholder="isRTL ? 'أو أدخل رابط الصورة' : 'Or enter image URL'" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent mt-2" />
          </div>

          <div class="flex gap-3 pt-4">
            <button @click="saveRoom" class="flex-1 px-6 py-3 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-xl font-semibold hover:shadow-xl hover:shadow-amber-500/50 transition-all">
              {{ editingRoom ? (isRTL ? 'حفظ' : 'Save') : (isRTL ? 'إضافة' : 'Add') }}
            </button>
            <button @click="closeModal" class="px-6 py-3 bg-slate-200 text-slate-700 rounded-xl font-semibold hover:bg-slate-300 transition-colors">
              {{ isRTL ? 'إلغاء' : 'Cancel' }}
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import { roomsApi } from '@/api'
import type { Room } from '@/types'

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const rooms = ref<Room[]>([])
const loading = ref(false)
const showAddModal = ref(false)
const editingRoom = ref<Room | null>(null)
const imagePreview = ref('')
const showUrlInput = ref(false)

const formData = ref({
  name: '',
  name_ar: '',
  description: '',
  description_ar: '',
  price_per_night: 0,
  capacity: 2,
  image_url: ''
})

const totalCapacity = computed(() => rooms.value.reduce((sum, r) => sum + r.capacity, 0))
const avgPrice = computed(() => {
  if (rooms.value.length === 0) return 0
  return Math.round(rooms.value.reduce((sum, r) => sum + r.price_per_night, 0) / rooms.value.length)
})

async function loadRooms() {
  try {
    loading.value = true
    rooms.value = await roomsApi.getAll()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل تحميل الغرف' : 'Failed to load rooms')
  } finally {
    loading.value = false
  }
}

function editRoom(room: Room) {
  editingRoom.value = room
  formData.value = { ...room }
  imagePreview.value = ''
  showUrlInput.value = false
}

function handleImageUpload(event: Event) {
  const target = event.target as HTMLInputElement
  const file = target.files?.[0]
  if (!file) return

  if (!file.type.startsWith('image/')) {
    toast.error(isRTL.value ? 'الملف يجب أن يكون صورة' : 'File must be an image')
    return
  }

  if (file.size > 5 * 1024 * 1024) {
    toast.error(isRTL.value ? 'حجم الصورة يجب أن يكون أقل من 5MB' : 'Image size must be less than 5MB')
    return
  }

  const reader = new FileReader()
  reader.onload = (e) => {
    imagePreview.value = e.target?.result as string
    formData.value.image_url = imagePreview.value
  }
  reader.readAsDataURL(file)
  
  toast.success(isRTL.value ? 'تم رفع الصورة' : 'Image uploaded')
}

function clearImage() {
  imagePreview.value = ''
  formData.value.image_url = ''
  showUrlInput.value = false
}

async function toggleActive(room: Room) {
  try {
    await roomsApi.update(room.id, { is_active: !room.is_active })
    toast.success(isRTL.value ? 'تم التحديث' : 'Updated')
    loadRooms()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل التحديث' : 'Failed to update')
  }
}

async function deleteRoom(room: Room) {
  if (!confirm(isRTL.value ? 'هل أنت متأكد؟' : 'Are you sure?')) return
  
  try {
    await roomsApi.delete(room.id)
    toast.success(isRTL.value ? 'تم الحذف' : 'Deleted')
    loadRooms()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل الحذف' : 'Failed to delete')
  }
}

async function saveRoom() {
  if (!formData.value.name || !formData.value.name_ar) {
    toast.error(isRTL.value ? 'الاسم مطلوب' : 'Name is required')
    return
  }
  if (formData.value.price_per_night <= 0) {
    toast.error(isRTL.value ? 'السعر يجب أن يكون أكبر من صفر' : 'Price must be greater than zero')
    return
  }

  try {
    if (editingRoom.value) {
      await roomsApi.update(editingRoom.value.id, formData.value)
      toast.success(isRTL.value ? '✅ تم التحديث بنجاح' : '✅ Updated successfully')
    } else {
      await roomsApi.create(formData.value)
      toast.success(isRTL.value ? '✅ تمت الإضافة بنجاح' : '✅ Added successfully')
    }
    closeModal()
    loadRooms()
  } catch (error) {
    toast.error(isRTL.value ? '❌ فشل الحفظ' : '❌ Failed to save')
  }
}

function closeModal() {
  showAddModal.value = false
  editingRoom.value = null
  imagePreview.value = ''
  showUrlInput.value = false
  formData.value = {
    name: '',
    name_ar: '',
    description: '',
    description_ar: '',
    price_per_night: 0,
    capacity: 2,
    image_url: ''
  }
}

onMounted(() => {
  loadRooms()
})
</script>
