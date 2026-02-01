<template>
  <div class="min-h-screen bg-purple-50 flex flex-col">
    <Navbar />
    
    <div class="flex-grow flex items-center justify-center p-4">
      <!-- Login Form -->
      <div v-if="!isLoggedIn" class="bg-white p-8 rounded-xl shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-bold text-center mb-6 text-primary">Admin Login</h2>
        <form @submit.prevent="handleLogin" class="space-y-4">
          <div>
            <label class="block text-sm font-medium text-gray-700">Email</label>
            <input type="email" v-model="email" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring focus:ring-primary focus:ring-opacity-50 p-2 border" required>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700">Password</label>
            <input type="password" v-model="password" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring focus:ring-primary focus:ring-opacity-50 p-2 border" required>
          </div>
          <button type="submit" class="w-full bg-primary text-white py-2 rounded-lg hover:bg-purple-dark transition">
            Login
          </button>
        </form>
      </div>

      <!-- Dashboard -->
      <div v-else class="bg-white p-8 rounded-xl shadow-lg w-full max-w-2xl">
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-2xl font-bold text-primary">Upload Product</h2>
          <button @click="logout" class="text-gray-500 hover:text-red-500 text-sm">Logout</button>
        </div>
        
        <form @submit.prevent="handleUpload" class="space-y-6">
          <div class="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center hover:bg-gray-50 transition cursor-pointer relative">
            <input type="file" @change="onFileSelected" class="absolute inset-0 w-full h-full opacity-0 cursor-pointer" accept="image/*">
            <div v-if="!previewUrl">
              <i class="fas fa-cloud-upload-alt text-4xl text-gray-400 mb-2"></i>
              <p class="text-gray-500">Click to upload image</p>
            </div>
            <img v-else :src="previewUrl" class="max-h-48 mx-auto rounded-lg shadow-sm" />
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium text-gray-700">Product Title</label>
              <input type="text" v-model="productTitle" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring focus:ring-primary focus:ring-opacity-50 p-2 border" placeholder="e.g. Lavender Bliss" required>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700">Price (RM)</label>
              <input type="text" v-model="productPrice" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring focus:ring-primary focus:ring-opacity-50 p-2 border" placeholder="e.g. 50" required>
            </div>
          </div>

          <button type="submit" :disabled="uploading" class="w-full bg-primary text-white py-2 rounded-lg hover:bg-purple-dark transition disabled:opacity-50 flex justify-center items-center">
            <div v-if="uploading" class="animate-spin rounded-full h-5 w-5 border-b-2 border-white mr-2"></div>
            {{ uploading ? 'Uploading...' : 'Publish Product' }}
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import Navbar from '../components/Navbar.vue'

const isLoggedIn = ref(false)
const email = ref('')
const password = ref('')
const productTitle = ref('')
const productPrice = ref('')
const previewUrl = ref(null)
const uploading = ref(false)

const handleLogin = () => {
  // Mock login for UI demo
  if (email.value && password.value) {
    isLoggedIn.value = true
  }
}

const logout = () => {
  isLoggedIn.value = false
  email.value = ''
  password.value = ''
}

const onFileSelected = (event) => {
  const file = event.target.files[0]
  if (file) {
    previewUrl.value = URL.createObjectURL(file)
  }
}

const handleUpload = () => {
  uploading.value = true
  // Mock upload
  setTimeout(() => {
    alert('Product uploaded successfully! (Mock)')
    uploading.value = false
    productTitle.value = ''
    productPrice.value = ''
    previewUrl.value = null
  }, 1500)
}
</script>
