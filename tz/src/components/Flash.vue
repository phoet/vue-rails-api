<template>
  <transition name="fade">
    <div v-if="errors.length > 0" class="flash">
      <ul v-for="error in errors" key="error">
        <li>{{ message(error) }}</li>
      </ul>
      {{ flash }}
      <a @click="hide">x</a>
    </div>
  </transition>
</template>

<script>
export default {
  computed: {
    errors() {
      return this.$root.errors;
    },
  },
  methods: {
    message(error) {
      return error.error ? error.error : error;
    },
    hide() {
      this.$root.errors = [];
    },
  },
};
</script>

<style scoped>
ul {
  display: inline-block;
}
li {
  list-style: none;
}
</style>
