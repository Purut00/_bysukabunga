<template>
  <div class="min-h-screen flex flex-col">
    <Navbar />
    
    <!-- Hero Section -->
    <!-- Hero Section -->
    <header class="bg-gradient-to-br from-primary to-purple-900 py-24 px-4 text-center text-white relative overflow-hidden">
      <div class="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10"></div>
      <div class="relative z-10">
        <h1 class="text-5xl md:text-7xl font-extrabold mb-6 tracking-tight drop-shadow-md">_bysukabunga</h1>
        <p class="text-xl md:text-2xl text-purple-100 max-w-2xl mx-auto font-light leading-relaxed">
          Handcrafted soap flowers for every occasion. <br><span class="font-semibold text-white">Elegant, Fragrant, Everlasting.</span>
        </p>
        <a href="#gallery" class="inline-block mt-10 px-10 py-4 bg-white text-primary rounded-full font-bold hover:bg-purple-100 transition shadow-xl transform hover:-translate-y-1 hover:scale-105">
          Browse Collection
        </a>
      </div>
    </header>

    <!-- Gallery Section -->
    <section id="gallery" class="py-16 px-4 container mx-auto flex-grow">
      <h2 class="text-3xl font-bold text-center text-gray-800 mb-12">Our Collection</h2>
      
      <div v-if="loading" class="text-center text-gray-500">
        <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
        Loading products...
      </div>

      <div v-else class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
        <ProductCard 
          v-for="product in products" 
          :key="product.id"
          :title="product.title"
          :price="product.price"
          :images="product.images"
          @view-details="openModal(product)"
        />
      </div>
    </section>

    <!-- Contact Section (Integrated into Footer but can be separate if needed) -->
    
    <Footer />

    <ProductModal 
      :isOpen="isModalOpen" 
      :product="selectedProduct || {}" 
      @close="closeModal" 
    />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import Navbar from '../components/Navbar.vue'
import Footer from '../components/Footer.vue'
import ProductCard from '../components/ProductCard.vue'
import ProductModal from '../components/ProductModal.vue'

const products = ref([])
const loading = ref(true)
const selectedProduct = ref(null)
const isModalOpen = ref(false)

const openModal = (product) => {
  selectedProduct.value = product
  isModalOpen.value = true
}

const closeModal = () => {
  isModalOpen.value = false
  setTimeout(() => {
    selectedProduct.value = null
  }, 300) // Clear after animation
}

// Dummy Data Generator
const loadDummyData = () => {
  const dummyImages = [
    'https://images.unsplash.com/photo-1596436889106-be35e843f974?auto=format&fit=crop&q=80&w=500',
    'https://images.unsplash.com/photo-1606041008023-472dfb5e530f?auto=format&fit=crop&q=80&w=500',
    'https://images.unsplash.com/photo-1563241527-3af6e1742427?auto=format&fit=crop&q=80&w=500',
    'https://images.unsplash.com/photo-1582794543139-8ac5f6f7c61f?auto=format&fit=crop&q=80&w=500',
    'https://images.unsplash.com/photo-1464530888919-0a6288206b99?auto=format&fit=crop&q=80&w=500',
  ]
  
  setTimeout(() => {
    products.value = Array.from({ length: 10 }, (_, i) => ({
      id: i + 1,
      title: `Soap Flower Bouquet #${i + 1}`,
      price: `RM ${50 + (i * 10)}`,
    images: [
        dummyImages[i % dummyImages.length],
        dummyImages[(i + 1) % dummyImages.length],
        dummyImages[(i + 2) % dummyImages.length]
      ],
      description: `Experience the elegance of our handcrafted Soap Flower Bouquet #${i + 1}. \n\nEach petal is meticulously sculpted from high-quality soap, offering a realistic look and a gentle, soothing fragrance. Perfect for gifting, home decor, or a special treat for yourself.\n\nType: Handcrafted Soap Flower\nFragrance: Gentle Floral\nDurability: Long-lasting (Avoid water and direct sunlight)`
    }))
    loading.value = false
  }, 800)
}

onMounted(() => {
  loadDummyData()
})
</script>
