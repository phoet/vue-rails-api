<template>
  <div v-if="errors.length > 0" class="flash">
    <a href="#" class="close" @click="hide">[x]</a>
    <ul v-for="error in errors" key="error">
      <li v-for="message in messages(error)" key="message">{{ message }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  computed: {
    errors() {
      return this.$root.errors;
    },
  },
  methods: {
    messages(error) {
      if (error.error) {
        return [error.error];
      } else if (Object.keys(error)) {
        return Object.keys(error).map(prop => `${prop} ${error[prop]}`);
      }
      return [error];
    },
    hide() {
      this.$root.errors = [];
    },
  },
};
</script>

<style scoped>
.flash {
  display: inline-block;
  position: relative;
  border: 1px solid black;
}
ul {
  padding: 25px;
  margin: 0px;
}
li {
  display: inline-block;
  list-style: none;
}
.close {
  position: absolute;
  top: 5px;
  right: -10px;
  background-color: white;
}
</style>
