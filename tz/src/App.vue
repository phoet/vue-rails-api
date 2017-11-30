<template>
  <div id="app">
    <Flash />
    <router-view/>
  </div>
</template>

<script>
import Flash from '@/components/Flash';

export default {
  components: {
    Flash,
  },
  computed: {
    flash() {
      return this.$root.error;
    },
  },
  methods: {
    hide() {
      this.$root.error = null;
    },
  },
};
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
