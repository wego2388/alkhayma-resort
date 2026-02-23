<template>
  <div class="admin-management">
    <!-- Header -->
    <div class="management-header">
      <h1>{{ $t('admin.products') }}</h1>
      <div class="header-meta">
        <span class="badge">{{ products.length }} {{ $t('admin.total') }}</span>
      </div>
    </div>

    <!-- Error Banner -->
    <div v-if="error" class="error-banner" role="alert">
      <span>⚠️ {{ error }}</span>
      <button @click="error = null">✕</button>
    </div>

    <!-- Filter Tabs -->
    <div class="filter-tabs" role="tablist" aria-label="Product type filter">
      <button
        v-for="tab in tabs"
        :key="tab.value"
        :class="['tab-btn', { active: activeTab === tab.value }]"
        role="tab"
        :aria-selected="activeTab === tab.value"
        @click="activeTab = tab.value"
      >
        {{ tab.label }}
      </button>
    </div>

    <!-- Loading State -->
    <div v-if="loading" class="loading-container" aria-busy="true">
      <div class="spinner"></div>
      <p>{{ $t('common.loading') }}</p>
    </div>

    <!-- Products Table -->
    <div v-else class="table-wrapper">
      <table class="data-table" aria-label="Products list">
        <thead>
          <tr>
            <th>{{ $t('admin.id') }}</th>
            <th>{{ $t('product.name') }}</th>
            <th>{{ $t('product.type') }}</th>
            <th>{{ $t('product.price') }}</th>
            <th>{{ $t('product.capacity') }}</th>
            <th>{{ $t('product.active') }}</th>
            <th>{{ $t('admin.created') }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-if="filteredProducts.length === 0">
            <td colspan="7" class="empty-row">{{ $t('admin.noProducts') }}</td>
          </tr>
          <tr v-for="product in filteredProducts" :key="product.id">
            <td>#{{ product.id }}</td>
            <td>
              <div class="product-name">
                <strong>{{ product.name }}</strong>
                <small>{{ product.name_ar }}</small>
              </div>
            </td>
            <td>
              <span :class="`type-badge type-${product.type?.toLowerCase()}`">
                {{ product.type?.toUpperCase() }}
              </span>
            </td>
            <td>EGP {{ Number(product.base_price).toFixed(2) }}</td>
            <td>{{ product.capacity }}</td>
            <td>
              <span :class="product.is_active ? 'active-pill yes' : 'active-pill no'">
                {{ product.is_active ? $t('common.active') : $t('common.inactive') }}
              </span>
            </td>
            <td>{{ formatDate(product.created_at) }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import apiClient from '../../api/client'

interface Product {
  id: number
  name: string
  name_ar: string
  type: string
  base_price: number
  capacity: number
  is_active: boolean
  created_at: string
}

const products = ref<Product[]>([])
const loading = ref(false)
const error = ref<string | null>(null)
const activeTab = ref('all')

const tabs = [
  { value: 'all', label: 'All' },
  { value: 'beach', label: 'Beach' },
  { value: 'water_activity', label: 'Water' },
  { value: 'restaurant', label: 'Restaurant' },
  { value: 'event', label: 'Events' },
]

const filteredProducts = computed(() => {
  if (activeTab.value === 'all') return products.value
  return products.value.filter((p) => p.type?.toLowerCase() === activeTab.value)
})

async function fetchProducts() {
  loading.value = true
  error.value = null
  try {
    const response = await apiClient.get<Product[]>('/products')
    products.value = response.data
  } catch (err: unknown) {
    const axiosErr = err as { response?: { data?: { error?: string } } }
    error.value = axiosErr.response?.data?.error ?? 'Failed to load products'
  } finally {
    loading.value = false
  }
}

function formatDate(dateStr: string): string {
  return new Date(dateStr).toLocaleDateString('ar-EG', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
  })
}

onMounted(fetchProducts)
</script>

