<script setup lang="ts">
import LuxSection from '@/components/ui/LuxSection.vue'
import LuxTitle from '@/components/ui/LuxTitle.vue'

const features = [
  {
    image: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?q=80&w=2070',
    title: 'Private Beach',
    titleAr: 'شاطئ خاص',
    description: 'Exclusive private beach with crystal clear waters and premium services',
    descriptionAr: 'شاطئ خاص حصري بمياه صافية وخدمات مميزة'
  },
  {
    image: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=2070',
    title: 'Italian Restaurant',
    titleAr: 'مطعم إيطالي',
    description: 'Authentic Italian cuisine with breathtaking sea views',
    descriptionAr: 'مطبخ إيطالي أصيل بإطلالة خلابة على البحر'
  },
  {
    image: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=2070',
    title: 'Water Sports',
    titleAr: 'رياضات مائية',
    description: 'Exciting water activities including diving, snorkeling and jet ski',
    descriptionAr: 'أنشطة مائية مثيرة تشمل الغوص والغطس والجت سكي'
  },
  {
    image: 'https://images.unsplash.com/photo-1495954484750-af469f2f9be5?q=80&w=2070',
    title: 'Sunset Views',
    titleAr: 'إطلالات الغروب',
    description: 'Breathtaking panoramic views of the Red Sea sunset',
    descriptionAr: 'إطلالات بانورامية خلابة على غروب البحر الأحمر'
  }
]
</script>

<template>
  <LuxSection>
    <LuxTitle subtitle="WHY EL KHEIMA">
      Experience Paradise
    </LuxTitle>

    <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
      <div 
        v-for="(feature, i) in features" 
        :key="i"
        class="group bg-white rounded-3xl overflow-hidden shadow-lg hover:shadow-luxury-lg transition-all duration-500 hover:-translate-y-2"
      >
        <div class="relative h-48 overflow-hidden">
          <img 
            :src="feature.image" 
            :alt="feature.title"
            class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
          />
          <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
        </div>
        <div class="p-6 text-center">
          <h3 class="font-display text-xl font-bold text-slate-900 mb-3">
            {{ feature.title }}
          </h3>
          <p class="text-slate-600 text-sm leading-relaxed">
            {{ feature.description }}
          </p>
        </div>
      </div>
    </div>
  </LuxSection>
</template>
