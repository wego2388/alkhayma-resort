<template>
  <aside class="admin-sidebar" :class="{ 'collapsed': isCollapsed, 'mobile-open': isMobileOpen }">
    <!-- Logo -->
    <div class="sidebar-header">
      <div class="logo">
        <span class="logo-icon">🏖️</span>
        <span v-if="!isCollapsed" class="logo-text">{{ $t('admin.title') }}</span>
      </div>
      <button v-if="isMobile" class="mobile-close" @click="$emit('close')">
        ✕
      </button>
    </div>

    <!-- Navigation -->
    <nav class="sidebar-nav">
      <div class="nav-section">
        <span v-if="!isCollapsed" class="section-title">{{ $t('admin.main') }}</span>
        <router-link
          v-for="item in mainNavItems"
          :key="item.path"
          :to="item.path"
          class="nav-item"
          :class="{ 'active': $route.path === item.path }"
        >
          <span class="nav-icon">{{ item.icon }}</span>
          <span v-if="!isCollapsed" class="nav-text">{{ item.name }}</span>
          <span v-if="!isCollapsed && item.badge" class="nav-badge">{{ item.badge }}</span>
        </router-link>
      </div>

      <div class="nav-section">
        <span v-if="!isCollapsed" class="section-title">{{ $t('admin.management') }}</span>
        <router-link
          v-for="item in managementNavItems"
          :key="item.path"
          :to="item.path"
          class="nav-item"
          :class="{ 'active': $route.path === item.path }"
        >
          <span class="nav-icon">{{ item.icon }}</span>
          <span v-if="!isCollapsed" class="nav-text">{{ item.name }}</span>
          <span v-if="!isCollapsed && item.badge" class="nav-badge">{{ item.badge }}</span>
        </router-link>
      </div>

      <div class="nav-section">
        <span v-if="!isCollapsed" class="section-title">{{ $t('admin.system') }}</span>
        <router-link
          v-for="item in systemNavItems"
          :key="item.path"
          :to="item.path"
          class="nav-item"
          :class="{ 'active': $route.path === item.path }"
        >
          <span class="nav-icon">{{ item.icon }}</span>
          <span v-if="!isCollapsed" class="nav-text">{{ item.name }}</span>
        </router-link>
      </div>
    </nav>

    <!-- User Profile -->
    <div class="sidebar-footer">
      <div class="user-profile" v-if="!isCollapsed">
        <div class="user-avatar">👤</div>
        <div class="user-info">
          <span class="user-name">{{ user?.full_name || 'Admin' }}</span>
          <span class="user-role">{{ user?.role || 'Administrator' }}</span>
        </div>
      </div>
      <button v-else class="user-avatar-small">👤</button>
      
      <button class="logout-btn" @click="logout" :title="$t('auth.logout')">
        <span class="nav-icon">🚪</span>
        <span v-if="!isCollapsed">{{ $t('auth.logout') }}</span>
      </button>
    </div>

    <!-- Toggle Button (Desktop) -->
    <button
      v-if="!isMobile"
      class="toggle-btn"
      @click="$emit('toggle')"
      :title="isCollapsed ? $t('admin.expand') : $t('admin.collapse')"
    >
      {{ isCollapsed ? '→' : '←' }}
    </button>
  </aside>

  <!-- Mobile Overlay -->
  <div
    v-if="isMobile && isMobileOpen"
    class="mobile-overlay"
    @click="$emit('close')"
  ></div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import { useI18n } from 'vue-i18n'

const { t } = useI18n()
const router = useRouter()
const authStore = useAuthStore()

const props = defineProps<{
  isCollapsed: boolean
  isMobileOpen?: boolean
}>()

defineEmits<{
  toggle: []
  close: []
}>()

const isMobile = computed(() => window.innerWidth < 768)
const user = computed(() => authStore.user)

const mainNavItems = [
  { path: '/admin', icon: '📊', name: t('admin.dashboard'), badge: null },
  { path: '/admin/analytics', icon: '📈', name: t('admin.analytics'), badge: null },
]

const managementNavItems = [
  { path: '/admin/bookings', icon: '📅', name: t('admin.bookings'), badge: 12 },
  { path: '/admin/rooms', icon: '🏨', name: t('admin.rooms'), badge: null },
  { path: '/admin/products', icon: '🏖️', name: t('admin.products'), badge: null },
  { path: '/admin/users', icon: '👥', name: t('admin.users'), badge: null },
]

const systemNavItems = [
  { path: '/admin/settings', icon: '⚙️', name: t('admin.settings'), badge: null },
  { path: '/admin/logs', icon: '📝', name: t('admin.logs'), badge: null },
]

const logout = () => {
  authStore.logout()
  router.push('/login')
}
</script>

