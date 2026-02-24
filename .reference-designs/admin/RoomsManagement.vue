<template>
  <div class="admin-management">
    <!-- Header with Actions -->
    <div class="header-section">
      <div class="management-header">
        <h1>{{ $t("admin.rooms") }}</h1>
        <div class="header-meta">
          <span class="badge">{{ filteredRooms.length }} {{ $t("admin.total") }}</span>
          <button class="btn btn-primary" @click="showAddForm = true">
            + {{ $t("admin.addNew") }}
          </button>
        </div>
      </div>

      <!-- Filter Bar -->
      <div class="filter-bar">
        <input
          v-model="searchQuery"
          type="text"
          :placeholder="$t('common.search')"
          class="search-input"
          aria-label="Search rooms"
        />
        <select v-model="filterStatus" class="filter-select" aria-label="Filter by status">
          <option value="">{{ $t("common.allStatuses") }}</option>
          <option value="available">{{ $t("room.status.available") }}</option>
          <option value="occupied">{{ $t("room.status.occupied") }}</option>
          <option value="maintenance">{{ $t("room.status.maintenance") }}</option>
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

    <!-- Rooms Table -->
    <div v-else class="table-wrapper">
      <table class="data-table" aria-label="Rooms list">
        <thead>
          <tr>
            <th>{{ $t("admin.id") }}</th>
            <th>{{ $t("room.number") }}</th>
            <th>{{ $t("room.type") }}</th>
            <th>{{ $t("room.status") }}</th>
            <th>{{ $t("room.pricePerNight") }}</th>
            <th>{{ $t("room.capacity") }}</th>
            <th>{{ $t("room.rating") }}</th>
            <th>{{ $t("room.active") }}</th>
            <th>{{ $t("admin.actions") }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-if="filteredRooms.length === 0">
            <td colspan="9" class="empty-row">{{ $t("admin.noRooms") }}</td>
          </tr>
          <tr v-for="room in filteredRooms" :key="room.id">
            <td>#{{ room.id }}</td>
            <td>
              <strong>{{ room.room_number }}</strong>
            </td>
            <td>
              <span :class="`type-badge type-${room.room_type?.toLowerCase()}`">
                {{ room.room_type?.toUpperCase() }}
              </span>
            </td>
            <td>
              <select
                :value="room.status"
                :disabled="updatingId === room.id"
                class="status-select"
                aria-label="Change room status"
                @change="(e) => updateRoomStatus(room.id, (e.target as HTMLSelectElement).value)"
              >
                <option value="available">AVAILABLE</option>
                <option value="occupied">OCCUPIED</option>
                <option value="maintenance">MAINTENANCE</option>
              </select>
            </td>
            <td>EGP {{ room.price_per_night?.toFixed(2) }}</td>
            <td>{{ room.capacity }} {{ $t("room.persons") }}</td>
            <td>⭐ {{ room.rating?.toFixed(1) ?? "—" }}</td>
            <td>
              <button
                v-if="room.is_active"
                @click="toggleRoomActive(room.id, false)"
                :disabled="updatingId === room.id"
                class="action-btn active"
              >
                Deactivate
              </button>
              <button
                v-else
                @click="toggleRoomActive(room.id, true)"
                :disabled="updatingId === room.id"
                class="action-btn inactive"
              >
                Activate
              </button>
            </td>
            <td>
              <div class="action-group">
                <button
                  @click="editRoom(room)"
                  :disabled="updatingId === room.id"
                  class="action-btn-icon"
                  title="Edit room"
                >
                  ✎
                </button>
                <button
                  @click="deleteRoom(room.id)"
                  :disabled="updatingId === room.id"
                  class="action-btn-icon danger"
                  title="Delete room"
                >
                  ✕
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Add/Edit Modal -->
    <div v-if="showAddForm || editingRoom" class="modal-overlay" @click.self="closeForm">
      <div class="modal">
        <div class="modal-header">
          <h2>{{ editingRoom ? $t("admin.editRoom") : $t("admin.addNewRoom") }}</h2>
          <button @click="closeForm" class="close-btn">✕</button>
        </div>
        <form @submit.prevent="saveRoom" class="form">
          <div class="form-group">
            <label for="room_number">{{ $t("room.number") }}</label>
            <input
              id="room_number"
              v-model="formData.room_number"
              type="text"
              required
              class="form-input"
            />
          </div>
          <div class="form-group">
            <label for="room_type">{{ $t("room.type") }}</label>
            <select id="room_type" v-model="formData.room_type" required class="form-input">
              <option value="">Select Type</option>
              <option value="standard">Standard</option>
              <option value="deluxe">Deluxe</option>
              <option value="suite">Suite</option>
              <option value="beach">Beach</option>
            </select>
          </div>
          <div class="form-group">
            <label for="capacity">{{ $t("room.capacity") }}</label>
            <input
              id="capacity"
              v-model.number="formData.capacity"
              type="number"
              min="1"
              required
              class="form-input"
            />
          </div>
          <div class="form-group">
            <label for="price">{{ $t("room.pricePerNight") }}</label>
            <input
              id="price"
              v-model.number="formData.price_per_night"
              type="number"
              min="0"
              step="0.01"
              required
              class="form-input"
            />
          </div>
          <div class="form-group">
            <label for="description_en">{{ $t("room.description") }} (EN)</label>
            <textarea
              id="description_en"
              v-model="formData.description_en"
              class="form-input"
              rows="3"
            ></textarea>
          </div>
          <div class="form-group">
            <label>
              <input v-model="formData.is_active" type="checkbox" />
              {{ $t("common.active") }}
            </label>
          </div>
          <div class="form-actions">
            <button type="submit" class="btn btn-primary" :disabled="saving">
              {{ saving ? $t("common.saving") : $t("common.save") }}
            </button>
            <button type="button" @click="closeForm" class="btn btn-secondary">
              {{ $t("common.cancel") }}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from "vue";
import { roomApi, type Room, type RoomCreate } from "../../api/rooms";

const rooms = ref<Room[]>([]);
const loading = ref(false);
const error = ref<string | null>(null);
const success = ref<string | null>(null);
const updatingId = ref<number | null>(null);
const saving = ref(false);
const showAddForm = ref(false);
const editingRoom = ref<Room | null>(null);
const searchQuery = ref("");
const filterStatus = ref("");

const formData = ref<RoomCreate>({
  room_number: "",
  room_type: "",
  price_per_night: 0,
  capacity: 1,
  description_en: "",
  is_active: true,
});

const filteredRooms = computed(() => {
  return rooms.value.filter((room) => {
    const matchesSearch =
      room.room_number.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
      room.room_type.toLowerCase().includes(searchQuery.value.toLowerCase());
    const matchesStatus = !filterStatus.value || room.status === filterStatus.value;
    return matchesSearch && matchesStatus;
  });
});

async function fetchRooms() {
  loading.value = true;
  error.value = null;
  try {
    const response = await roomApi.getAll();
    rooms.value = response.data;
  } catch (err: unknown) {
    const axiosErr = err as { response?: { data?: { error?: string } } };
    error.value = axiosErr.response?.data?.error ?? "Failed to load rooms";
  } finally {
    loading.value = false;
  }
}

async function updateRoomStatus(roomId: number, status: string) {
  updatingId.value = roomId;
  error.value = null;
  try {
    await roomApi.adminUpdateStatus(roomId, status);
    const idx = rooms.value.findIndex((r) => r.id === roomId);
    if (idx !== -1 && rooms.value[idx]) {
      rooms.value[idx]!.status = status;
    }
    success.value = "Status updated successfully";
    setTimeout(() => (success.value = null), 3000);
  } catch (err: unknown) {
    const axiosErr = err as { response?: { data?: { error?: string } } };
    error.value = axiosErr.response?.data?.error ?? "Failed to update status";
  } finally {
    updatingId.value = null;
  }
}

async function toggleRoomActive(roomId: number, isActive: boolean) {
  updatingId.value = roomId;
  error.value = null;
  try {
    await roomApi.adminToggleActive(roomId, isActive);
    const idx = rooms.value.findIndex((r) => r.id === roomId);
    if (idx !== -1 && rooms.value[idx]) {
      rooms.value[idx]!.is_active = isActive;
    }
    success.value = `Room ${isActive ? "activated" : "deactivated"}`;
    setTimeout(() => (success.value = null), 3000);
  } catch (err: unknown) {
    const axiosErr = err as { response?: { data?: { error?: string } } };
    error.value = axiosErr.response?.data?.error ?? "Failed to update room";
  } finally {
    updatingId.value = null;
  }
}

function editRoom(room: Room) {
  editingRoom.value = room;
  formData.value = {
    room_number: room.room_number,
    room_type: room.room_type,
    price_per_night: room.price_per_night,
    capacity: room.capacity,
    description_en: room.description_en,
    is_active: room.is_active,
  };
  showAddForm.value = false;
}

async function saveRoom() {
  saving.value = true;
  error.value = null;
  try {
    if (editingRoom.value) {
      await roomApi.adminUpdate(editingRoom.value.id, formData.value);
      const idx = rooms.value.findIndex((r) => r.id === editingRoom.value!.id);
      if (idx !== -1 && rooms.value[idx]) {
        rooms.value[idx] = { ...rooms.value[idx], ...formData.value };
      }
      success.value = "Room updated successfully";
    } else {
      const response = await roomApi.adminCreate(formData.value);
      rooms.value.push(response.data);
      success.value = "Room created successfully";
    }
    closeForm();
    setTimeout(() => (success.value = null), 3000);
  } catch (err: unknown) {
    const axiosErr = err as { response?: { data?: { error?: string } } };
    error.value = axiosErr.response?.data?.error ?? "Failed to save room";
  } finally {
    saving.value = false;
  }
}

async function deleteRoom(roomId: number) {
  if (!confirm("Are you sure you want to delete this room?")) return;
  updatingId.value = roomId;
  error.value = null;
  try {
    await roomApi.adminDelete(roomId);
    rooms.value = rooms.value.filter((r) => r.id !== roomId);
    success.value = "Room deleted successfully";
    setTimeout(() => (success.value = null), 3000);
  } catch (err: unknown) {
    const axiosErr = err as { response?: { data?: { error?: string } } };
    error.value = axiosErr.response?.data?.error ?? "Failed to delete room";
  } finally {
    updatingId.value = null;
  }
}

function closeForm() {
  showAddForm.value = false;
  editingRoom.value = null;
  formData.value = {
    room_number: "",
    room_type: "",
    price_per_night: 0,
    capacity: 1,
    description_en: "",
    is_active: true,
  };
}

onMounted(fetchRooms);
</script>

