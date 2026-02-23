import { ref } from 'vue'

interface ToastOptions {
  type?: 'success' | 'error' | 'warning' | 'info'
  message: string
  description?: string
  duration?: number
}

const toasts = ref<Array<ToastOptions & { id: number }>>([])
let nextId = 0

export function useToast() {
  function show(options: ToastOptions) {
    const id = nextId++
    toasts.value.push({ ...options, id })
    
    setTimeout(() => {
      remove(id)
    }, options.duration || 3000)
  }

  function success(message: string, description?: string) {
    show({ type: 'success', message, description })
  }

  function error(message: string, description?: string) {
    show({ type: 'error', message, description })
  }

  function warning(message: string, description?: string) {
    show({ type: 'warning', message, description })
  }

  function info(message: string, description?: string) {
    show({ type: 'info', message, description })
  }

  function remove(id: number) {
    const index = toasts.value.findIndex(t => t.id === id)
    if (index > -1) {
      toasts.value.splice(index, 1)
    }
  }

  return {
    toasts,
    show,
    success,
    error,
    warning,
    info,
    remove
  }
}
