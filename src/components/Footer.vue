<template>
  <footer class="bg-gray-100 text-gray-600 py-8 mt-12 border-t border-gray-200">
    <div class="container mx-auto text-center">
        <p class="font-bold text-primary text-lg mb-4">_bysukabunga</p>
        <div class="flex justify-center space-x-6 mb-4">
            <a href="https://instagram.com/_bysukabunga" target="_blank" class="hover:text-primary transition flex flex-col items-center">
                <i class="fab fa-instagram text-2xl"></i>
                <span class="text-xs mt-1">Instagram</span>
            </a>
            <a href="https://tiktok.com/@_bysukabunga" target="_blank" class="hover:text-primary transition flex flex-col items-center">
                <i class="fab fa-tiktok text-2xl"></i>
                 <span class="text-xs mt-1">TikTok</span>
            </a>
            <a href="https://threads.net/@_bysukabunga" target="_blank" class="hover:text-primary transition flex flex-col items-center">
                <i class="fab fa-threads text-2xl"></i>
                 <span class="text-xs mt-1">Threads</span>
            </a>
            <a href="https://wa.me/60145005580" target="_blank" class="hover:text-green-600 transition flex flex-col items-center">
                <i class="fab fa-whatsapp text-2xl"></i>
                 <span class="text-xs mt-1">WhatsApp</span>
            </a>
        </div>
        <p class="text-sm">© {{ new Date().getFullYear() }} _bysukabunga. All rights reserved.</p>
    </div>
  </footer>
</template>

<script setup>
// Note: FontAwesome icons will need to be included in index.html
</script>
