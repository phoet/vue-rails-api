<template>
  <transition name="fade">
    <div v-if="loading" class="spinner">
      ... LOADING ...
    </div>
  </transition>
</template>

<script>
export default {
  computed: {
    loading() {
      return this.$root.loading;
    },
  },
};
</script>

<style scoped>

</style>
