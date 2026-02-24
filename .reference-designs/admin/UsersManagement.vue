<template>
  <div class="admin-management">
    <!-- Header with Search -->
    <div class="header-section">
      <div class="management-header">
        <h1>{{ $t("admin.users") }}</h1>
        <div class="header-meta">
          <span class="badge">{{ filteredUsers.length }} {{ $t("admin.total") }}</span>
        </div>
      </div>

      <!-- Filter Bar -->
      <div class="filter-bar">
        <input
          v-model="searchQuery"
          type="text"
          :placeholder="$t('common.search')"
          class="search-input"
          aria-label="Search users by name or email"
        />
        <select v-model="filterRole" class="filter-select" aria-label="Filter by role">
          <option value="">{{ $t("common.allRoles") }}</option>
          <option value="admin">Admin</option>
          <option value="staff">Staff</option>
          <option value="guest">Guest</option>
        </select>
      </div>
    </div>

    <!-- Error Banner -->
    <div v-if="error" class="error-banner" role="alert">
      <span>⚠️ {{ error }}</span>
      <button @click="error = null">✕</button>
    </div>

    <!-- Success Banner -->
    <div v-if="success" class="success-banner" role="status">
      <span>✓ {{ success }}</span>
      <button @click="success = null">✕</button>
    </div>

    <!-- Loading State -->
    <div v-if="loading" class="loading-container" aria-busy="true">
      <div class="spinner"></div>
      <p>{{ $t("common.loading") }}</p>
    </div>

    <!-- Users Table -->
    <div v-else class="table-wrapper">
      <table class="data-table" aria-label="Users list">
        <thead>
          <tr>
            <th>{{ $t("admin.id") }}</th>
            <th>{{ $t("user.name") }}</th>
            <th>{{ $t("user.email") }}</th>
            <th>{{ $t("user.phone") }}</th>
            <th>{{ $t("user.role") }}</th>
            <th>{{ $t("user.active") }}</th>
            <th>{{ $t("admin.created") }}</th>
            <th>{{ $t("admin.actions") }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-if="filteredUsers.length === 0">
            <td colspan="8" class="empty-row">{{ $t("admin.noUsers") }}</td>
          </tr>
          <tr v-for="user in filteredUsers" :key="user.id">
            <td>#{{ user.id }}</td>
            <td>
              <strong>{{ user.full_name }}</strong>
            </td>
            <td>
              <a :href="`mailto:${user.email}`" class="email-link">{{ user.email }}</a>
            </td>
            <td>{{ user.phone ?? "—" }}</td>
            <td>
              <span :class="`role-badge role-${user.role?.toLowerCase()}`">
                {{ user.role?.toUpperCase() }}
              </span>
            </td>
            <td>
              <button
                v-if="user.is_active"
                @click="toggleUserActive(user.id, false)"
                :disabled="updatingId === user.id"
                class="action-btn active"
              >
                Deactivate
              </button>
              <button
                v-else
                @click="toggleUserActive(user.id, true)"
                :disabled="updatingId === user.id"
                class="action-btn inactive"
              >
                Activate
              </button>
            </td>
            <td>{{ formatDate(user.created_at) }}</td>
            <td>
              <div class="action-group">
                <button
                  @click="deleteUser(user.id)"
                  :disabled="updatingId === user.id"
                  class="action-btn-icon danger"
                  title="Delete user"
                >
                  ✕
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from "vue";
import { authApi, type User } from "../../api/auth";

const users = ref<User[]>([]);
const loading = ref(false);
const error = ref<string | null>(null);
const success = ref<string | null>(null);
const updatingId = ref<number | null>(null);
const searchQuery = ref("");
const filterRole = ref("");

const filteredUsers = computed(() => {
  return users.value.filter((user) => {
    const matchesSearch =
      user.full_name.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
      user.email.toLowerCase().includes(searchQuery.value.toLowerCase());
    const matchesRole = !filterRole.value || user.role === filterRole.value;
    return matchesSearch && matchesRole;
  });
});

async function fetchUsers() {
  loading.value = true;
  error.value = null;
  try {
    const response = await authApi.adminGetAllUsers();
    users.value = response.data;
  } catch (err: unknown) {
    const axiosErr = err as { response?: { data?: { error?: string } } };
    error.value = axiosErr.response?.data?.error ?? "Failed to load users";
  } finally {
    loading.value = false;
  }
}

async function toggleUserActive(userId: number, isActive: boolean) {
  updatingId.value = userId;
  error.value = null;
  try {
    await authApi.adminToggleUserActive(userId, isActive);
    const idx = users.value.findIndex((u) => u.id === userId);
    if (idx !== -1 && users.value[idx]) {
      users.value[idx]!.is_active = isActive;
    }
    success.value = `User ${isActive ? "activated" : "deactivated"}`;
    setTimeout(() => (success.value = null), 3000);
  } catch (err: unknown) {
    const axiosErr = err as { response?: { data?: { error?: string } } };
    error.value = axiosErr.response?.data?.error ?? "Failed to update user";
  } finally {
    updatingId.value = null;
  }
}

async function deleteUser(userId: number) {
  if (!confirm("Are you sure you want to delete this user? This action cannot be undone.")) return;
  updatingId.value = userId;
  error.value = null;
  try {
    await authApi.adminDeleteUser(userId);
    users.value = users.value.filter((u) => u.id !== userId);
    success.value = "User deleted successfully";
    setTimeout(() => (success.value = null), 3000);
  } catch (err: unknown) {
    const axiosErr = err as { response?: { data?: { error?: string } } };
    error.value = axiosErr.response?.data?.error ?? "Failed to delete user";
  } finally {
    updatingId.value = null;
  }
}

function formatDate(dateStr: string): string {
  return new Date(dateStr).toLocaleDateString("ar-EG", {
    year: "numeric",
    month: "short",
    day: "numeric",
  });
}

onMounted(fetchUsers);
</script>

