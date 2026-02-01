<template>
  <nav class="bg-white/90 backdrop-blur-md text-primary p-4 shadow-sm sticky top-0 z-50 border-b border-purple-100">
    <div class="container mx-auto flex justify-between items-center">
      <router-link to="/" class="text-2xl font-bold tracking-tight hover:opacity-80 transition">_bysukabunga</router-link>
      <div class="space-x-1">
        <router-link to="/" class="active:text-primary hover:bg-purple-50 px-4 py-2 rounded-full transition font-medium">Home</router-link>
        <router-link to="/admin" class="hover:bg-purple-50 px-4 py-2 rounded-full transition font-medium">Admin</router-link>
      </div>
    </div>
  </nav>
</template>

<script setup>
</script>
