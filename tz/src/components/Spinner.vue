<template>
  <div v-if="loading" class="spinner">
    ... LOADING ...
  </div>
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
