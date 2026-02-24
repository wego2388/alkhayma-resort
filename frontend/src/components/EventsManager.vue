<template>
  <div class="space-y-8">
    <!-- Header Stats -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      <div class="group relative bg-gradient-to-br from-blue-500 to-blue-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-blue-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-blue-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-blue-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'إجمالي الفعاليات' : 'Total Events' }}</p>
          <p class="text-4xl font-bold">{{ events.length }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-green-500 to-green-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-green-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-green-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-green-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'نشطة' : 'Active' }}</p>
          <p class="text-4xl font-bold">{{ events.filter(e => e.is_active).length }}</p>
        </div>
      </div>
      <div class="group relative bg-gradient-to-br from-amber-500 to-amber-600 rounded-2xl p-6 text-white hover:shadow-2xl hover:shadow-amber-500/50 transition-all duration-300 hover:scale-105 cursor-pointer">
        <div class="absolute inset-0 bg-gradient-to-br from-amber-400/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity rounded-2xl"></div>
        <div class="relative">
          <p class="text-amber-100 text-xs font-semibold uppercase tracking-wider mb-2">{{ isRTL ? 'الفئات' : 'Categories' }}</p>
          <p class="text-4xl font-bold">{{ uniqueCategories }}</p>
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
          <h2 class="text-2xl font-bold text-slate-900">{{ isRTL ? 'إدارة الفعاليات' : 'Events Management' }}</h2>
          <p class="text-sm text-slate-600 mt-1">{{ events.length }} {{ isRTL ? 'فعالية' : 'events' }}</p>
        </div>
        <button @click="showAddModal = true" class="px-6 py-3 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-xl font-semibold hover:shadow-xl hover:shadow-amber-500/50 hover:scale-105 transition-all duration-300 flex items-center gap-2">
          <span class="text-xl">➕</span>
          {{ isRTL ? 'إضافة فعالية' : 'Add Event' }}
        </button>
      </div>
    </div>

    <!-- Filters -->
    <div class="bg-white rounded-2xl p-6 shadow-lg border border-slate-200/50">
      <div class="flex flex-wrap gap-4">
        <select v-model="filterCategory" class="px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-all">
          <option value="">{{ isRTL ? 'كل الفئات' : 'All Categories' }}</option>
          <option value="yoga">🧘 {{ isRTL ? 'يوجا' : 'Yoga' }}</option>
          <option value="zumba">💃 {{ isRTL ? 'زومبا' : 'Zumba' }}</option>
          <option value="birthday">🎂 {{ isRTL ? 'أعياد ميلاد' : 'Birthday' }}</option>
          <option value="occasion">🎊 {{ isRTL ? 'مناسبات' : 'Occasions' }}</option>
        </select>
        
        <select v-model="filterStatus" class="px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-all">
          <option value="all">{{ isRTL ? 'كل الحالات' : 'All Status' }}</option>
          <option value="active">{{ isRTL ? 'نشط' : 'Active' }}</option>
          <option value="inactive">{{ isRTL ? 'غير نشط' : 'Inactive' }}</option>
        </select>
      </div>
    </div>

    <!-- Events Table -->
    <div class="bg-white rounded-2xl shadow-lg border border-slate-200/50 overflow-hidden">
      <div class="p-6 border-b border-slate-200">
        <div class="flex items-center justify-between">
          <div>
            <h3 class="text-xl font-bold text-slate-900">{{ isRTL ? 'جميع الفعاليات' : 'All Events' }}</h3>
            <p class="text-sm text-slate-600 mt-1">{{ filteredEvents.length }} {{ isRTL ? 'فعالية' : 'events' }}</p>
          </div>
          <span class="text-2xl">🎉</span>
        </div>
      </div>
      
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-slate-50 border-b border-slate-200">
            <tr>
              <th class="px-6 py-4 text-left text-sm font-semibold text-slate-900">{{ isRTL ? 'الفعالية' : 'Event' }}</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-slate-900">{{ isRTL ? 'الفئة' : 'Category' }}</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-slate-900">{{ isRTL ? 'السعر' : 'Price' }}</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-slate-900">{{ isRTL ? 'المدة' : 'Duration' }}</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-slate-900">{{ isRTL ? 'الحالة' : 'Status' }}</th>
              <th class="px-6 py-4 text-center text-sm font-semibold text-slate-900">{{ isRTL ? 'الإجراءات' : 'Actions' }}</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-slate-100">
            <tr v-if="loading">
              <td colspan="6" class="px-6 py-12 text-center">
                <div class="flex items-center justify-center gap-3">
                  <div class="w-6 h-6 border-3 border-amber-500 border-t-transparent rounded-full animate-spin"></div>
                  <span class="text-slate-600">{{ isRTL ? 'جاري التحميل...' : 'Loading...' }}</span>
                </div>
              </td>
            </tr>
            <tr v-else-if="filteredEvents.length === 0">
              <td colspan="6" class="px-6 py-12 text-center text-slate-500">
                <div class="text-6xl mb-4">🎉</div>
                {{ isRTL ? 'لا توجد فعاليات' : 'No events found' }}
              </td>
            </tr>
            <tr v-else v-for="event in filteredEvents" :key="event.id" class="hover:bg-slate-50 transition-colors">
              <td class="px-6 py-4">
                <div class="flex items-center gap-3">
                  <div class="text-3xl">{{ getCategoryEmoji(event.category) }}</div>
                  <div>
                    <p class="font-semibold text-slate-900">{{ isRTL ? event.name_ar : event.name }}</p>
                    <p class="text-sm text-slate-600">{{ event.location || '-' }}</p>
                  </div>
                </div>
              </td>
              <td class="px-6 py-4">
                <span class="px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-sm font-medium">
                  {{ event.category }}
                </span>
              </td>
              <td class="px-6 py-4 font-semibold text-slate-900">${{ event.price }}</td>
              <td class="px-6 py-4 text-slate-600">{{ event.duration }} {{ isRTL ? 'دقيقة' : 'min' }}</td>
              <td class="px-6 py-4">
                <span :class="event.is_active ? 'bg-green-100 text-green-700' : 'bg-slate-100 text-slate-700'" class="px-3 py-1 rounded-full text-sm font-medium">
                  {{ event.is_active ? (isRTL ? 'نشط' : 'Active') : (isRTL ? 'غير نشط' : 'Inactive') }}
                </span>
              </td>
              <td class="px-6 py-4">
                <div class="flex items-center justify-center gap-2">
                  <button @click="editEvent(event)" class="p-2 text-blue-600 hover:bg-blue-50 rounded-lg transition-colors" title="Edit">
                    ✏️
                  </button>
                  <button @click="toggleActive(event)" class="p-2 text-amber-600 hover:bg-amber-50 rounded-lg transition-colors" :title="event.is_active ? 'Deactivate' : 'Activate'">
                    {{ event.is_active ? '🔒' : '✓' }}
                  </button>
                  <button @click="deleteEvent(event)" class="p-2 text-red-600 hover:bg-red-50 rounded-lg transition-colors" title="Delete">
                    🗑️
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Add/Edit Modal -->
    <div v-if="showAddModal || editingEvent" class="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4">
      <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
        <div class="sticky top-0 bg-gradient-to-r from-amber-500 to-amber-600 text-white p-6 rounded-t-2xl">
          <h3 class="text-2xl font-bold">{{ editingEvent ? (isRTL ? 'تعديل فعالية' : 'Edit Event') : (isRTL ? 'إضافة فعالية' : 'Add Event') }}</h3>
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

          <div class="grid grid-cols-3 gap-4">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الفئة' : 'Category' }}</label>
              <select v-model="formData.category" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent">
                <option value="yoga">🧘 Yoga</option>
                <option value="zumba">💃 Zumba</option>
                <option value="birthday">🎂 Birthday</option>
                <option value="occasion">🎊 Occasion</option>
              </select>
            </div>
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'السعر' : 'Price' }}</label>
              <input v-model.number="formData.price" type="number" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
            </div>
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'المدة (دقيقة)' : 'Duration (min)' }}</label>
              <input v-model.number="formData.duration" type="number" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
            </div>
          </div>

          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الموقع (EN)' : 'Location (EN)' }}</label>
              <input v-model="formData.location" type="text" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
            </div>
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الحد الأقصى للضيوف' : 'Max Guests' }}</label>
              <input v-model.number="formData.max_guests" type="number" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
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
            <button @click="saveEvent" class="flex-1 px-6 py-3 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-xl font-semibold hover:shadow-xl hover:shadow-amber-500/50 transition-all">
              {{ editingEvent ? (isRTL ? 'حفظ' : 'Save') : (isRTL ? 'إضافة' : 'Add') }}
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
import { eventsApi } from '@/api'
import type { Event } from '@/types'

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const events = ref<Event[]>([])
const loading = ref(false)
const showAddModal = ref(false)
const editingEvent = ref<Event | null>(null)
const filterCategory = ref('')
const filterStatus = ref('all')
const imagePreview = ref('')
const showUrlInput = ref(false)

const formData = ref({
  name: '',
  name_ar: '',
  description: '',
  description_ar: '',
  category: 'yoga',
  price: 0,
  duration: 60,
  location: '',
  max_guests: 20,
  image_url: ''
})

const filteredEvents = computed(() => {
  return events.value.filter(event => {
    const matchesCategory = !filterCategory.value || event.category === filterCategory.value
    const matchesStatus = filterStatus.value === 'all' || 
      (filterStatus.value === 'active' && event.is_active) ||
      (filterStatus.value === 'inactive' && !event.is_active)
    return matchesCategory && matchesStatus
  })
})

const uniqueCategories = computed(() => {
  return new Set(events.value.map(e => e.category)).size
})

const avgPrice = computed(() => {
  if (events.value.length === 0) return 0
  return Math.round(events.value.reduce((sum, e) => sum + e.price, 0) / events.value.length)
})

function getCategoryEmoji(category: string) {
  const emojis: Record<string, string> = {
    yoga: '🧘',
    zumba: '💃',
    birthday: '🎂',
    occasion: '🎊'
  }
  return emojis[category] || '🎉'
}

async function loadEvents() {
  try {
    loading.value = true
    events.value = await eventsApi.getAll()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل تحميل الفعاليات' : 'Failed to load events')
  } finally {
    loading.value = false
  }
}

function editEvent(event: Event) {
  editingEvent.value = event
  formData.value = { ...event }
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

async function toggleActive(event: Event) {
  try {
    await eventsApi.update(event.id, { is_active: !event.is_active })
    toast.success(isRTL.value ? 'تم التحديث' : 'Updated')
    loadEvents()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل التحديث' : 'Failed to update')
  }
}

async function deleteEvent(event: Event) {
  if (!confirm(isRTL.value ? 'هل أنت متأكد؟' : 'Are you sure?')) return
  
  try {
    await eventsApi.delete(event.id)
    toast.success(isRTL.value ? 'تم الحذف' : 'Deleted')
    loadEvents()
  } catch (error) {
    toast.error(isRTL.value ? 'فشل الحذف' : 'Failed to delete')
  }
}

async function saveEvent() {
  if (!formData.value.name || !formData.value.name_ar) {
    toast.error(isRTL.value ? 'الاسم مطلوب' : 'Name is required')
    return
  }
  if (formData.value.price <= 0) {
    toast.error(isRTL.value ? 'السعر يجب أن يكون أكبر من صفر' : 'Price must be greater than zero')
    return
  }

  try {
    if (editingEvent.value) {
      await eventsApi.update(editingEvent.value.id, formData.value)
      toast.success(isRTL.value ? '✅ تم التحديث بنجاح' : '✅ Updated successfully')
    } else {
      await eventsApi.create(formData.value)
      toast.success(isRTL.value ? '✅ تمت الإضافة بنجاح' : '✅ Added successfully')
    }
    closeModal()
    loadEvents()
  } catch (error) {
    toast.error(isRTL.value ? '❌ فشل الحفظ' : '❌ Failed to save')
  }
}

function closeModal() {
  showAddModal.value = false
  editingEvent.value = null
  imagePreview.value = ''
  showUrlInput.value = false
  formData.value = {
    name: '',
    name_ar: '',
    description: '',
    description_ar: '',
    category: 'yoga',
    price: 0,
    duration: 60,
    location: '',
    max_guests: 20,
    image_url: ''
  }
}

onMounted(() => {
  loadEvents()
})
</script>
