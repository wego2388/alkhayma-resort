import { useHead } from '@vueuse/head'
import { computed } from 'vue'
import { useAppStore } from '@/stores/app'

interface MetaOptions {
  title: string
  titleAr: string
  description: string
  descriptionAr: string
  image?: string
  url?: string
}

export function useMeta(options: MetaOptions) {
  const appStore = useAppStore()
  const isRTL = computed(() => appStore.isRTL)
  
  const title = computed(() => 
    isRTL.value ? options.titleAr : options.title
  )
  
  const description = computed(() => 
    isRTL.value ? options.descriptionAr : options.description
  )
  
  const baseUrl = 'https://alkhaymaresort.com'
  const defaultImage = `${baseUrl}/og-image.jpg`
  
  useHead({
    title: title.value,
    meta: [
      { name: 'description', content: description.value },
      { property: 'og:title', content: title.value },
      { property: 'og:description', content: description.value },
      { property: 'og:image', content: options.image || defaultImage },
      { property: 'og:url', content: options.url || baseUrl },
      { property: 'og:type', content: 'website' },
      { name: 'twitter:card', content: 'summary_large_image' },
      { name: 'twitter:title', content: title.value },
      { name: 'twitter:description', content: description.value },
      { name: 'twitter:image', content: options.image || defaultImage },
    ],
    link: [
      { rel: 'canonical', href: options.url || baseUrl }
    ]
  })
}
