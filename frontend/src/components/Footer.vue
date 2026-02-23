<template>
  <footer class="bg-gray-900 text-white py-12">
    <div class="container mx-auto px-4">
      <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
        <!-- About -->
        <div>
          <h3 class="text-xl font-bold mb-4">{{ isRTL ? 'منتجع الخيمة' : 'Al Khayma Resort' }}</h3>
          <p class="text-gray-400">
            {{ isRTL
              ? 'منتجع فاخر على شاطئ البحر يقدم تجربة لا تُنسى'
              : 'Luxury beachfront resort offering unforgettable experiences'
            }}
          </p>
        </div>

        <!-- Quick Links -->
        <div>
          <h3 class="text-xl font-bold mb-4">{{ isRTL ? 'روابط سريعة' : 'Quick Links' }}</h3>
          <ul class="space-y-2">
            <li><router-link to="/rooms" class="text-gray-400 hover:text-white">{{ t('nav.rooms') }}</router-link></li>
            <li><router-link to="/restaurant" class="text-gray-400 hover:text-white">{{ t('nav.restaurant') }}</router-link></li>
            <li><router-link to="/activities" class="text-gray-400 hover:text-white">{{ t('nav.activities') }}</router-link></li>
          </ul>
        </div>

        <!-- Contact -->
        <div>
          <h3 class="text-xl font-bold mb-4">{{ isRTL ? 'اتصل بنا' : 'Contact' }}</h3>
          <ul class="space-y-2 text-gray-400">
            <li>
              <a href="tel:+201004205444" class="hover:text-white">+20 100 420 5444</a>
            </li>
            <li>
              <a href="mailto:info@alkhayma.com" class="hover:text-white">info@alkhayma.com</a>
            </li>
            <li>
              <a href="https://wa.me/201004205444" target="_blank" class="hover:text-white flex items-center gap-2">
                <span>📱</span>
                <span>{{ isRTL ? 'واتساب' : 'WhatsApp' }}</span>
              </a>
            </li>
            <li>{{ isRTL ? 'شرم الشيخ، مصر' : 'Sharm El Sheikh, Egypt' }}</li>
          </ul>
        </div>

        <!-- Social -->
        <div>
          <h3 class="text-xl font-bold mb-4">{{ isRTL ? 'تابعنا' : 'Follow Us' }}</h3>
          <div class="flex space-x-4 rtl:space-x-reverse">
            <a href="#" class="text-gray-400 hover:text-white">Facebook</a>
            <a href="#" class="text-gray-400 hover:text-white">Instagram</a>
            <a href="#" class="text-gray-400 hover:text-white">Twitter</a>
          </div>
        </div>
      </div>

      <div class="border-t border-gray-800 mt-8 pt-8 text-center text-gray-400">
        <p>&copy; 2026 Al Khayma Resort. All rights reserved.</p>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'

const { t } = useI18n()
const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)
</script>
