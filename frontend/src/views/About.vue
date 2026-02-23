<template>
  <div class="container mx-auto px-4 py-12">
    <h1 class="text-4xl font-bold mb-8">{{ isRTL ? 'من نحن' : 'About Us' }}</h1>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
      <div>
        <img src="https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800" 
          alt="Resort" class="w-full h-96 object-cover rounded-lg shadow-lg" />
      </div>

      <div class="space-y-6">
        <h2 class="text-3xl font-bold">{{ isRTL ? 'منتجع الخيمة' : 'Al Khayma Resort' }}</h2>
        
        <p class="text-gray-700 leading-relaxed">
          {{ isRTL 
            ? 'منتجع الخيمة هو وجهة فاخرة على شاطئ البحر في المملكة العربية السعودية. نقدم تجربة استثنائية تجمع بين الفخامة والراحة والضيافة العربية الأصيلة.'
            : 'Al Khayma Resort is a luxury beachfront destination in Saudi Arabia. We offer an exceptional experience combining luxury, comfort, and authentic Arabian hospitality.'
          }}
        </p>

        <p class="text-gray-700 leading-relaxed">
          {{ isRTL
            ? 'مع غرف فاخرة، مطاعم عالمية، وأنشطة مائية مثيرة، نضمن لك إقامة لا تُنسى مع عائلتك وأصدقائك.'
            : 'With luxury rooms, world-class restaurants, and exciting water activities, we guarantee an unforgettable stay with your family and friends.'
          }}
        </p>

        <div class="grid grid-cols-2 gap-4 pt-6">
          <div class="text-center p-4 bg-primary-50 rounded-lg">
            <p class="text-3xl font-bold text-primary-600">50+</p>
            <p class="text-gray-600">{{ isRTL ? 'غرفة فاخرة' : 'Luxury Rooms' }}</p>
          </div>
          <div class="text-center p-4 bg-primary-50 rounded-lg">
            <p class="text-3xl font-bold text-primary-600">10+</p>
            <p class="text-gray-600">{{ isRTL ? 'سنوات خبرة' : 'Years Experience' }}</p>
          </div>
          <div class="text-center p-4 bg-primary-50 rounded-lg">
            <p class="text-3xl font-bold text-primary-600">5000+</p>
            <p class="text-gray-600">{{ isRTL ? 'ضيف سعيد' : 'Happy Guests' }}</p>
          </div>
          <div class="text-center p-4 bg-primary-50 rounded-lg">
            <p class="text-3xl font-bold text-primary-600">4.9</p>
            <p class="text-gray-600">{{ isRTL ? 'تقييم' : 'Rating' }}</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Mission & Vision -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-16">
      <div class="card">
        <h3 class="text-2xl font-bold mb-4">{{ isRTL ? 'رؤيتنا' : 'Our Vision' }}</h3>
        <p class="text-gray-700">
          {{ isRTL
            ? 'أن نكون الوجهة السياحية الأولى في المملكة العربية السعودية، نقدم تجارب استثنائية تتجاوز توقعات ضيوفنا.'
            : 'To be the premier tourist destination in Saudi Arabia, offering exceptional experiences that exceed our guests\' expectations.'
          }}
        </p>
      </div>

      <div class="card">
        <h3 class="text-2xl font-bold mb-4">{{ isRTL ? 'مهمتنا' : 'Our Mission' }}</h3>
        <p class="text-gray-700">
          {{ isRTL
            ? 'تقديم خدمات ضيافة عالمية المستوى مع الحفاظ على الأصالة العربية والاهتمام بأدق التفاصيل.'
            : 'Delivering world-class hospitality services while maintaining Arabian authenticity and attention to detail.'
          }}
        </p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useAppStore } from '@/stores/app'

const appStore = useAppStore()
const isRTL = computed(() => appStore.isRTL)
</script>
