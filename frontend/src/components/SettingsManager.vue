<template>
  <div class="space-y-8">
    <!-- Profile Settings -->
    <div class="bg-white rounded-3xl p-8 shadow-lg border border-slate-200/50">
      <div class="flex items-center gap-4 mb-6">
        <div class="w-16 h-16 bg-gradient-to-br from-amber-500 to-amber-600 rounded-2xl flex items-center justify-center shadow-lg">
          <span class="text-4xl">👤</span>
        </div>
        <div>
          <h2 class="text-2xl font-bold text-slate-900">{{ isRTL ? 'الملف الشخصي' : 'Profile Settings' }}</h2>
          <p class="text-sm text-slate-600">{{ isRTL ? 'إدارة معلومات الحساب' : 'Manage your account information' }}</p>
        </div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الاسم الكامل' : 'Full Name' }}</label>
          <input v-model="profile.name" type="text" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
        </div>
        <div>
          <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'البريد الإلكتروني' : 'Email' }}</label>
          <input v-model="profile.email" type="email" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
        </div>
        <div>
          <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'رقم الهاتف' : 'Phone' }}</label>
          <input v-model="profile.phone" type="tel" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
        </div>
        <div>
          <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'الدور' : 'Role' }}</label>
          <input :value="profile.role" disabled class="w-full px-4 py-3 border border-slate-300 rounded-xl bg-slate-50 text-slate-500" />
        </div>
      </div>

      <div class="flex gap-3 mt-6">
        <button @click="saveProfile" class="px-6 py-3 bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-xl font-semibold hover:shadow-xl hover:scale-105 transition-all">
          {{ isRTL ? '💾 حفظ التغييرات' : '💾 Save Changes' }}
        </button>
        <button @click="resetProfile" class="px-6 py-3 bg-slate-200 text-slate-700 rounded-xl font-semibold hover:bg-slate-300 transition-colors">
          {{ isRTL ? 'إعادة تعيين' : 'Reset' }}
        </button>
      </div>
    </div>

    <!-- Security Settings -->
    <div class="bg-white rounded-3xl p-8 shadow-lg border border-slate-200/50">
      <div class="flex items-center gap-4 mb-6">
        <div class="w-16 h-16 bg-gradient-to-br from-blue-500 to-blue-600 rounded-2xl flex items-center justify-center shadow-lg">
          <span class="text-4xl">🔒</span>
        </div>
        <div>
          <h2 class="text-2xl font-bold text-slate-900">{{ isRTL ? 'الأمان' : 'Security' }}</h2>
          <p class="text-sm text-slate-600">{{ isRTL ? 'تغيير كلمة المرور والإعدادات الأمنية' : 'Change password and security settings' }}</p>
        </div>
      </div>

      <div class="space-y-4">
        <div>
          <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'كلمة المرور الحالية' : 'Current Password' }}</label>
          <input v-model="security.currentPassword" type="password" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
        </div>
        <div>
          <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'كلمة المرور الجديدة' : 'New Password' }}</label>
          <input v-model="security.newPassword" type="password" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
        </div>
        <div>
          <label class="block text-sm font-semibold text-slate-700 mb-2">{{ isRTL ? 'تأكيد كلمة المرور' : 'Confirm Password' }}</label>
          <input v-model="security.confirmPassword" type="password" class="w-full px-4 py-3 border border-slate-300 rounded-xl focus:ring-2 focus:ring-2 focus:ring-amber-500 focus:border-transparent" />
        </div>
      </div>

      <button @click="changePassword" class="mt-6 px-6 py-3 bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-xl font-semibold hover:shadow-xl hover:scale-105 transition-all">
        {{ isRTL ? '🔑 تغيير كلمة المرور' : '🔑 Change Password' }}
      </button>
    </div>

    <!-- System Settings -->
    <div class="bg-white rounded-3xl p-8 shadow-lg border border-slate-200/50">
      <div class="flex items-center gap-4 mb-6">
        <div class="w-16 h-16 bg-gradient-to-br from-purple-500 to-purple-600 rounded-2xl flex items-center justify-center shadow-lg">
          <span class="text-4xl">⚙️</span>
        </div>
        <div>
          <h2 class="text-2xl font-bold text-slate-900">{{ isRTL ? 'إعدادات النظام' : 'System Settings' }}</h2>
          <p class="text-sm text-slate-600">{{ isRTL ? 'تخصيص تجربة الاستخدام' : 'Customize your experience' }}</p>
        </div>
      </div>

      <div class="space-y-6">
        <!-- Language -->
        <div class="flex items-center justify-between p-4 bg-slate-50 rounded-xl">
          <div class="flex items-center gap-3">
            <span class="text-3xl">🌐</span>
            <div>
              <p class="font-semibold text-slate-900">{{ isRTL ? 'اللغة' : 'Language' }}</p>
              <p class="text-sm text-slate-600">{{ isRTL ? 'اختر لغة الواجهة' : 'Choose interface language' }}</p>
            </div>
          </div>
          <button @click="toggleLanguage" class="px-6 py-2 bg-white border border-slate-300 rounded-lg hover:bg-slate-50 transition-colors font-medium">
            {{ isRTL ? 'English' : 'العربية' }}
          </button>
        </div>

        <!-- Notifications -->
        <div class="flex items-center justify-between p-4 bg-slate-50 rounded-xl">
          <div class="flex items-center gap-3">
            <span class="text-3xl">🔔</span>
            <div>
              <p class="font-semibold text-slate-900">{{ isRTL ? 'الإشعارات' : 'Notifications' }}</p>
              <p class="text-sm text-slate-600">{{ isRTL ? 'تلقي إشعارات الحجوزات الجديدة' : 'Receive new booking notifications' }}</p>
            </div>
          </div>
          <label class="relative inline-flex items-center cursor-pointer">
            <input v-model="settings.notifications" type="checkbox" class="sr-only peer" />
            <div class="w-14 h-7 bg-slate-300 peer-focus:ring-4 peer-focus:ring-amber-300 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[4px] after:bg-white after:rounded-full after:h-6 after:w-6 after:transition-all peer-checked:bg-amber-500"></div>
          </label>
        </div>

        <!-- Email Notifications -->
        <div class="flex items-center justify-between p-4 bg-slate-50 rounded-xl">
          <div class="flex items-center gap-3">
            <span class="text-3xl">📧</span>
            <div>
              <p class="font-semibold text-slate-900">{{ isRTL ? 'إشعارات البريد' : 'Email Notifications' }}</p>
              <p class="text-sm text-slate-600">{{ isRTL ? 'إرسال تقارير يومية' : 'Send daily reports' }}</p>
            </div>
          </div>
          <label class="relative inline-flex items-center cursor-pointer">
            <input v-model="settings.emailNotifications" type="checkbox" class="sr-only peer" />
            <div class="w-14 h-7 bg-slate-300 peer-focus:ring-4 peer-focus:ring-amber-300 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[4px] after:bg-white after:rounded-full after:h-6 after:w-6 after:transition-all peer-checked:bg-amber-500"></div>
          </label>
        </div>

        <!-- Auto Backup -->
        <div class="flex items-center justify-between p-4 bg-slate-50 rounded-xl">
          <div class="flex items-center gap-3">
            <span class="text-3xl">💾</span>
            <div>
              <p class="font-semibold text-slate-900">{{ isRTL ? 'النسخ الاحتياطي التلقائي' : 'Auto Backup' }}</p>
              <p class="text-sm text-slate-600">{{ isRTL ? 'نسخ احتياطي يومي للبيانات' : 'Daily data backup' }}</p>
            </div>
          </div>
          <label class="relative inline-flex items-center cursor-pointer">
            <input v-model="settings.autoBackup" type="checkbox" class="sr-only peer" />
            <div class="w-14 h-7 bg-slate-300 peer-focus:ring-4 peer-focus:ring-amber-300 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[4px] after:bg-white after:rounded-full after:h-6 after:w-6 after:transition-all peer-checked:bg-amber-500"></div>
          </label>
        </div>
      </div>

      <button @click="saveSettings" class="mt-6 px-6 py-3 bg-gradient-to-r from-purple-500 to-purple-600 text-white rounded-xl font-semibold hover:shadow-xl hover:scale-105 transition-all">
        {{ isRTL ? '💾 حفظ الإعدادات' : '💾 Save Settings' }}
      </button>
    </div>

    <!-- Danger Zone -->
    <div class="bg-red-50 border-2 border-red-200 rounded-3xl p-8">
      <div class="flex items-center gap-4 mb-6">
        <div class="w-16 h-16 bg-gradient-to-br from-red-500 to-red-600 rounded-2xl flex items-center justify-center shadow-lg">
          <span class="text-4xl">⚠️</span>
        </div>
        <div>
          <h2 class="text-2xl font-bold text-red-900">{{ isRTL ? 'منطقة الخطر' : 'Danger Zone' }}</h2>
          <p class="text-sm text-red-700">{{ isRTL ? 'إجراءات لا يمكن التراجع عنها' : 'Irreversible actions' }}</p>
        </div>
      </div>

      <div class="space-y-4">
        <button @click="clearCache" class="w-full px-6 py-3 bg-white border-2 border-red-300 text-red-700 rounded-xl font-semibold hover:bg-red-50 transition-colors flex items-center justify-center gap-2">
          <span>🗑️</span>
          <span>{{ isRTL ? 'مسح الذاكرة المؤقتة' : 'Clear Cache' }}</span>
        </button>
        <button @click="exportData" class="w-full px-6 py-3 bg-white border-2 border-red-300 text-red-700 rounded-xl font-semibold hover:bg-red-50 transition-colors flex items-center justify-center gap-2">
          <span>📥</span>
          <span>{{ isRTL ? 'تصدير جميع البيانات' : 'Export All Data' }}</span>
        </button>
        <button @click="resetSystem" class="w-full px-6 py-3 bg-gradient-to-r from-red-500 to-red-600 text-white rounded-xl font-semibold hover:shadow-xl hover:scale-105 transition-all flex items-center justify-center gap-2">
          <span>⚠️</span>
          <span>{{ isRTL ? 'إعادة تعيين النظام' : 'Reset System' }}</span>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useAppStore } from '@/stores/app'
import { useToast } from '@/composables/useToast'
import { computed } from 'vue'

const appStore = useAppStore()
const toast = useToast()
const isRTL = computed(() => appStore.isRTL)

const profile = ref({
  name: 'Admin User',
  email: 'admin@alkhayma.com',
  phone: '+966 50 123 4567',
  role: 'Administrator'
})

const security = ref({
  currentPassword: '',
  newPassword: '',
  confirmPassword: ''
})

const settings = ref({
  notifications: true,
  emailNotifications: true,
  autoBackup: true
})

function saveProfile() {
  toast.success(isRTL.value ? '✅ تم حفظ الملف الشخصي' : '✅ Profile saved')
}

function resetProfile() {
  profile.value = {
    name: 'Admin User',
    email: 'admin@alkhayma.com',
    phone: '+966 50 123 4567',
    role: 'Administrator'
  }
  toast.success(isRTL.value ? '🔄 تم إعادة التعيين' : '🔄 Reset')
}

function changePassword() {
  if (!security.value.currentPassword || !security.value.newPassword) {
    toast.error(isRTL.value ? '❌ يرجى ملء جميع الحقول' : '❌ Please fill all fields')
    return
  }
  
  if (security.value.newPassword !== security.value.confirmPassword) {
    toast.error(isRTL.value ? '❌ كلمات المرور غير متطابقة' : '❌ Passwords do not match')
    return
  }
  
  toast.success(isRTL.value ? '✅ تم تغيير كلمة المرور' : '✅ Password changed')
  security.value = { currentPassword: '', newPassword: '', confirmPassword: '' }
}

function toggleLanguage() {
  appStore.toggleLanguage()
  toast.success(isRTL.value ? '✅ تم تغيير اللغة' : '✅ Language changed')
}

function saveSettings() {
  toast.success(isRTL.value ? '✅ تم حفظ الإعدادات' : '✅ Settings saved')
}

function clearCache() {
  if (!confirm(isRTL.value ? 'هل أنت متأكد من مسح الذاكرة المؤقتة؟' : 'Clear cache?')) return
  toast.success(isRTL.value ? '✅ تم مسح الذاكرة المؤقتة' : '✅ Cache cleared')
}

function exportData() {
  toast.success(isRTL.value ? '📥 جاري التصدير...' : '📥 Exporting...')
}

function resetSystem() {
  if (!confirm(isRTL.value ? '⚠️ هذا سيحذف جميع البيانات! هل أنت متأكد؟' : '⚠️ This will delete all data! Are you sure?')) return
  toast.error(isRTL.value ? '⚠️ تم إلغاء العملية' : '⚠️ Operation cancelled')
}
</script>
