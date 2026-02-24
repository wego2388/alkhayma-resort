import { useHead } from '@vueuse/head'

export function useStructuredData() {
  const hotelSchema = {
    '@context': 'https://schema.org',
    '@type': 'Hotel',
    name: 'Al Khayma Resort',
    description: 'Luxury beachfront resort in Sharm El Sheikh, Egypt',
    image: 'https://alkhaymaresort.com/og-image.jpg',
    address: {
      '@type': 'PostalAddress',
      streetAddress: 'Sharm El Sheikh',
      addressLocality: 'South Sinai',
      addressCountry: 'EG'
    },
    geo: {
      '@type': 'GeoCoordinates',
      latitude: 27.9158,
      longitude: 34.3300
    },
    telephone: '+20-100-420-5444',
    email: 'info@alkhayma.com',
    starRating: {
      '@type': 'Rating',
      ratingValue: '5'
    },
    priceRange: '$$$',
    amenityFeature: [
      { '@type': 'LocationFeatureSpecification', name: 'Private Beach' },
      { '@type': 'LocationFeatureSpecification', name: 'Restaurant' },
      { '@type': 'LocationFeatureSpecification', name: 'Water Sports' },
      { '@type': 'LocationFeatureSpecification', name: 'Spa' }
    ]
  }

  const localBusinessSchema = {
    '@context': 'https://schema.org',
    '@type': 'LocalBusiness',
    name: 'Al Khayma Resort',
    image: 'https://alkhaymaresort.com/og-image.jpg',
    '@id': 'https://alkhaymaresort.com',
    url: 'https://alkhaymaresort.com',
    telephone: '+20-100-420-5444',
    address: {
      '@type': 'PostalAddress',
      streetAddress: 'Sharm El Sheikh',
      addressLocality: 'South Sinai',
      addressCountry: 'EG'
    },
    openingHoursSpecification: {
      '@type': 'OpeningHoursSpecification',
      dayOfWeek: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
      opens: '00:00',
      closes: '23:59'
    }
  }

  useHead({
    script: [
      {
        type: 'application/ld+json',
        children: JSON.stringify(hotelSchema)
      },
      {
        type: 'application/ld+json',
        children: JSON.stringify(localBusinessSchema)
      }
    ]
  })
}
