<template>
  <div v-if="isOpen" class="fixed inset-0 z-50 flex items-center justify-center p-4">
    <!-- Backdrop -->
    <div @click="close" class="absolute inset-0 bg-black/50 backdrop-blur-sm transition-opacity" aria-hidden="true"></div>
    
    <!-- Modal Content -->
    <div class="relative bg-white rounded-2xl shadow-2xl w-full max-w-4xl overflow-hidden flex flex-col md:flex-row animate-in fade-in zoom-in duration-300 max-h-[90vh]">
      
      <!-- Close Button -->
      <button @click="close" class="absolute top-4 right-4 z-10 w-10 h-10 flex items-center justify-center rounded-full bg-black/20 text-white hover:bg-black/40 transition">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>

      <!-- Image Gallery -->
      <div class="md:w-1/2 bg-gray-100 flex flex-col">
        <!-- Main Image -->
        <div class="h-64 md:h-96 w-full relative">
           <img :src="currentImage" :alt="product.title" class="absolute inset-0 w-full h-full object-cover">
        </div>
        <!-- Thumbnails -->
        <div v-if="product.images && product.images.length > 1" class="flex p-2 gap-2 overflow-x-auto">
          <button 
            v-for="(img, index) in product.images" 
            :key="index" 
            @click="currentImage = img"
            class="flex-shrink-0 w-16 h-16 rounded-md overflow-hidden border-2 transition"
            :class="currentImage === img ? 'border-primary' : 'border-transparent opacity-70 hover:opacity-100'"
          >
            <img :src="img" class="w-full h-full object-cover">
          </button>
        </div>
      </div>

      <!-- Product Information -->
      <div class="md:w-1/2 p-6 md:p-8 flex flex-col overflow-y-auto">
        <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">{{ product.title }}</h2>
        <p class="text-2xl font-semibold text-primary mb-6">{{ product.price }}</p>
        
        <div class="flex-grow mb-6 pr-2">
          <h4 class="text-sm font-bold text-gray-400 uppercase tracking-wider mb-2">Description</h4>
          <p class="text-gray-600 leading-relaxed whitespace-pre-line text-sm md:text-base">{{ product.description }}</p>
        </div>

        <div class="space-y-3 mt-auto">
          <a :href="whatsappLink" target="_blank" class="flex items-center justify-center w-full bg-green-500 text-white py-3 rounded-xl font-bold hover:bg-green-600 transition shadow-lg transform active:scale-95">
            <i class="fab fa-whatsapp text-xl mr-2"></i> Order via WhatsApp
          </a>
          <div class="grid grid-cols-2 gap-3">
             <a :href="instagramLink" target="_blank" class="flex items-center justify-center w-full bg-gradient-to-r from-purple-500 to-pink-500 text-white py-3 rounded-xl font-bold hover:opacity-90 transition shadow-lg transform active:scale-95">
              <i class="fab fa-instagram text-xl mr-2"></i> Instagram
            </a>
             <a :href="tiktokLink" target="_blank" class="flex items-center justify-center w-full bg-black text-white py-3 rounded-xl font-bold hover:opacity-80 transition shadow-lg transform active:scale-95">
              <i class="fab fa-tiktok text-xl mr-2"></i> TikTok
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, watch } from 'vue';

const props = defineProps({
  isOpen: Boolean,
  product: Object,
});

const emit = defineEmits(['close']);
const currentImage = ref('');

// Update current image when product changes or modal opens
watch(() => props.product, (newVal) => {
  if (newVal && newVal.images && newVal.images.length > 0) {
    currentImage.value = newVal.images[0];
  } else if (newVal && newVal.image) {
    currentImage.value = newVal.image;
  }
}, { immediate: true });

const close = () => {
  emit('close');
};

const whatsappLink = computed(() => {
  const text = encodeURIComponent(`Hi, I'm interested in buying ${props.product.title}!`);
  return `https://wa.me/60123456789?text=${text}`; // Replace with actual number
});

const instagramLink = computed(() => 'https://instagram.com/_bysukabunga'); // Replace with actual ID
const tiktokLink = computed(() => 'https://tiktok.com/@_bysukabunga'); // Replace with actual ID

</script>
