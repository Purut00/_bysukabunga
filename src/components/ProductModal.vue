<template>
  <div v-if="isOpen" class="fixed inset-0 z-50 flex items-center justify-center p-4">
    <!-- Backdrop -->
    <div @click="close" class="absolute inset-0 bg-black/50 backdrop-blur-sm transition-opacity" aria-hidden="true"></div>
    
    <!-- Modal Content -->
    <div class="relative bg-white rounded-2xl shadow-2xl w-full max-w-3xl overflow-hidden flex flex-col md:flex-row animate-in fade-in zoom-in duration-300">
      
      <!-- Close Button -->
      <button @click="close" class="absolute top-4 right-4 z-10 w-10 h-10 flex items-center justify-center rounded-full bg-black/20 text-white hover:bg-black/40 transition">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>

      <!-- Product Image -->
      <div class="md:w-1/2 h-64 md:h-auto bg-gray-100 relative">
        <img :src="product.image" :alt="product.title" class="absolute inset-0 w-full h-full object-cover">
      </div>

      <!-- Product Information -->
      <div class="md:w-1/2 p-8 flex flex-col">
        <h2 class="text-3xl font-bold text-gray-800 mb-2">{{ product.title }}</h2>
        <p class="text-2xl font-semibold text-primary mb-6">{{ product.price }}</p>
        
        <div class="flex-grow overflow-y-auto mb-6 pr-2">
          <h4 class="text-sm font-bold text-gray-400 uppercase tracking-wider mb-2">Description</h4>
          <p class="text-gray-600 leading-relaxed whitespace-pre-line">{{ product.description }}</p>
        </div>

        <button class="w-full bg-primary text-white py-3 rounded-xl font-bold hover:bg-purple-dark transition shadow-lg transform active:scale-95">
          Contact to Buy
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  isOpen: Boolean,
  product: Object,
});

const emit = defineEmits(['close']);

const close = () => {
  emit('close');
};
</script>
