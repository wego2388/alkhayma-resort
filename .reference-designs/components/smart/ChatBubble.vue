<template>
  <div class="chat-bubble-container">
    <!-- Chat Toggle Button -->
    <button
      @click="toggleChat"
      class="chat-toggle-btn"
      :aria-label="isOpen ? $t('chat.close') : $t('chat.open')"
    >
      <span v-if="!isOpen" class="icon">💬</span>
      <span v-else class="icon">✕</span>
      <span v-if="unreadCount > 0 && !isOpen" class="badge">{{ unreadCount }}</span>
    </button>

    <!-- Chat Window -->
    <Transition name="slide-up">
      <div v-if="isOpen" class="chat-window">
        <!-- Header -->
        <div class="chat-header">
          <div class="header-info">
            <span class="bot-avatar">🤖</span>
            <div class="header-text">
              <h3>{{ $t('chat.title') }}</h3>
              <span class="status" :class="{ online: isConnected }">
                {{ isConnected ? $t('chat.online') : $t('chat.offline') }}
              </span>
            </div>
          </div>
          <button @click="toggleChat" class="close-btn" aria-label="Close chat">
            ✕
          </button>
        </div>

        <!-- Messages -->
        <div ref="messagesContainer" class="messages-container">
          <div
            v-for="(message, index) in messages"
            :key="index"
            class="message"
            :class="{ user: message.role === 'user', assistant: message.role === 'assistant' }"
          >
            <div class="message-avatar">
              {{ message.role === 'user' ? '👤' : '🤖' }}
            </div>
            <div class="message-content">
              <p>{{ message.content }}</p>
              <span class="message-time">{{ formatTime(message.timestamp) }}</span>
            </div>
          </div>

          <!-- Typing Indicator -->
          <div v-if="isTyping" class="message assistant typing">
            <div class="message-avatar">🤖</div>
            <div class="typing-indicator">
              <span></span>
              <span></span>
              <span></span>
            </div>
          </div>
        </div>

        <!-- Suggested Questions -->
        <div v-if="suggestedQuestions.length > 0 && !isTyping" class="suggested-questions">
          <button
            v-for="(question, index) in suggestedQuestions"
            :key="index"
            @click="sendMessage(question)"
            class="suggestion-btn"
          >
            {{ question }}
          </button>
        </div>

        <!-- Input -->
        <div class="chat-input-container">
          <input
            v-model="newMessage"
            @keyup.enter="sendMessage(newMessage)"
            type="text"
            :placeholder="$t('chat.placeholder')"
            class="chat-input"
            :disabled="isTyping"
          />
          <button
            @click="sendMessage(newMessage)"
            class="send-btn"
            :disabled="!newMessage.trim() || isTyping"
          >
            ➤
          </button>
        </div>
      </div>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, watch, nextTick, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'

const { t } = useI18n()

interface Message {
  role: 'user' | 'assistant'
  content: string
  timestamp: Date
}

// State
const isOpen = ref(false)
const messages = ref<Message[]>([
  {
    role: 'assistant',
    content: t('chat.welcome'),
    timestamp: new Date()
  }
])
const newMessage = ref('')
const isTyping = ref(false)
const isConnected = ref(true)
const unreadCount = ref(0)
const messagesContainer = ref<HTMLDivElement>()

// Suggested questions
const suggestedQuestions = computed(() => [
  t('chat.suggestions.rooms'),
  t('chat.suggestions.pricing'),
  t('chat.suggestions.amenities'),
  t('chat.suggestions.booking')
])

// Methods
const toggleChat = () => {
  isOpen.value = !isOpen.value
  if (isOpen.value) {
    unreadCount.value = 0
    scrollToBottom()
  }
}

const formatTime = (date: Date): string => {
  return date.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' })
}

const scrollToBottom = () => {
  nextTick(() => {
    if (messagesContainer.value) {
      messagesContainer.value.scrollTop = messagesContainer.value.scrollHeight
    }
  })
}

const sendMessage = async (content: string) => {
  if (!content.trim() || isTyping.value) return

  // Add user message
  messages.value.push({
    role: 'user',
    content: content.trim(),
    timestamp: new Date()
  })

  newMessage.value = ''
  isTyping.value = true
  scrollToBottom()

  try {
    // Call AI service
    const response = await fetch('http://localhost:8001/chat', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        message: content.trim(),
        session_id: 'web-chat',
        language: localStorage.getItem('locale') || 'en'
      })
    })

    if (!response.ok) throw new Error('Failed to get response')

    const data = await response.json()

    // Add assistant response
    messages.value.push({
      role: 'assistant',
      content: data.response || t('chat.fallback'),
      timestamp: new Date()
    })
  } catch (error) {
    console.error('Chat error:', error)
    messages.value.push({
      role: 'assistant',
      content: t('chat.error'),
      timestamp: new Date()
    })
  } finally {
    isTyping.value = false
    scrollToBottom()
  }
}

// Auto-scroll on new messages
watch(messages, scrollToBottom, { deep: true })

// Track unread messages when chat is closed
watch(messages, () => {
  if (!isOpen.value) {
    unreadCount.value++
  }
}, { deep: true })

onMounted(() => {
  // Check AI service health
  fetch('http://localhost:8001/health')
    .then(() => { isConnected.value = true })
    .catch(() => { isConnected.value = false })
})
</script>

