import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'

export function useLocale() {
  const { t, locale } = useI18n()
  const appStore = useAppStore()
  
  const currentLocale = computed(() => appStore.currentLocale)
  const isRTL = computed(() => appStore.isRTL)
  
  function toggleLocale() {
    const newLocale = currentLocale.value === 'en' ? 'ar' : 'en'
    appStore.setLocale(newLocale)
  }
  
  return {
    t,
    locale,
    currentLocale,
    isRTL,
    toggleLocale
  }
}
