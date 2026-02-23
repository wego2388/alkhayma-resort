import { defineStore } from 'pinia'
import { ref } from 'vue'
import { useI18n } from 'vue-i18n'

export const useAppStore = defineStore('app', () => {
  const { locale } = useI18n()
  
  const currentLocale = ref(localStorage.getItem('locale') || 'en')
  const isRTL = ref(currentLocale.value === 'ar')

  function setLocale(newLocale: 'en' | 'ar') {
    currentLocale.value = newLocale
    locale.value = newLocale
    isRTL.value = newLocale === 'ar'
    localStorage.setItem('locale', newLocale)
    document.documentElement.setAttribute('dir', newLocale === 'ar' ? 'rtl' : 'ltr')
    document.documentElement.setAttribute('lang', newLocale)
  }

  // Initialize on load
  setLocale(currentLocale.value as 'en' | 'ar')

  return {
    currentLocale,
    isRTL,
    setLocale
  }
})
