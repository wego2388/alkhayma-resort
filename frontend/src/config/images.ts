/**
 * Centralized Image Configuration
 * Change images here without touching component code
 */

export const IMAGES = {
  // Hero Images
  hero: {
    home: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=1920&q=80',
    rooms: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=1920&q=80',
    restaurant: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=1920&q=80',
    activities: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=1920&q=80',
    events: 'https://images.unsplash.com/photo-1519167758481-83f29da8c2b6?w=1920&q=80',
    gallery: 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=1920&q=80',
    about: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1920&q=80',
    contact: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=1920&q=80'
  },

  // Restaurant Section
  restaurant: {
    italian: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=800&q=80',
    cafe: 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=800&q=80',
    dining: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800&q=80'
  },

  // Room Types
  rooms: {
    deluxe: 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&q=80',
    suite: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=80',
    villa: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80',
    standard: 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800&q=80'
  },

  // Activities
  activities: {
    diving: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800&q=80',
    spa: 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&q=80',
    beach: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80',
    pool: 'https://images.unsplash.com/photo-1576013551627-0cc20b96c2a7?w=800&q=80'
  },

  // Placeholders
  placeholder: {
    room: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&q=80',
    food: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400&q=80',
    activity: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&q=80',
    default: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=400&q=80'
  },

  // Logo & Branding
  branding: {
    logo: '/logo.png',
    logoWhite: '/logo-white.png',
    favicon: '/favicon.ico'
  }
}

/**
 * Get image URL with fallback
 * @param path - Dot notation path (e.g., 'hero.home')
 * @param fallback - Fallback image URL
 */
export function getImage(path: string, fallback?: string): string {
  const keys = path.split('.')
  let value: any = IMAGES

  for (const key of keys) {
    value = value?.[key]
    if (!value) break
  }

  return value || fallback || IMAGES.placeholder.default
}

/**
 * Preload critical images
 */
export function preloadImages(paths: string[]) {
  paths.forEach(path => {
    const img = new Image()
    img.src = getImage(path)
  })
}
