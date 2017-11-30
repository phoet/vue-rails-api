<template>
  <transition name="fade">
    <div v-if="flash" class="flash">
      {{ flash }}
      <a @click="hide">x</a>
    </div>
  </transition>
</template>

<script>
export default {
  computed: {
    flash() {
      if (this.$root.error) {
        return this.$root.error.error ? this.$root.error.error : this.$root.error;
      }
      return null;
    },
  },
  methods: {
    hide() {
      this.$root.error = null;
    },
  },
};
</script>

<style scoped>

</style>
