<template>
  <div @click="$emit('view-details')" class="bg-white rounded-2xl shadow-md overflow-hidden hover:shadow-2xl transition duration-500 transform hover:-translate-y-2 border border-purple-50 group cursor-pointer">
    <div class="h-72 overflow-hidden bg-gray-100 relative">
      <img :src="Array.isArray(images) ? images[0] : images" :alt="title" class="w-full h-full object-cover transition duration-500 group-hover:scale-110" />
      <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-20 transition duration-300"></div>
    </div>
    <div class="p-5">
      <h3 class="text-lg font-bold text-gray-800 mb-2 truncate">{{ title }}</h3>
      <p class="text-primary font-semibold">{{ price }}</p>
      <button class="w-full mt-4 bg-primary text-white py-2 rounded-lg hover:bg-purple-dark transition active:scale-95 text-sm font-medium">
        View Details
      </button>
    </div>
  </div>
</template>

<script setup>
defineProps({
  images: [String, Array],
  title: String,
  price: String
})
</script>
