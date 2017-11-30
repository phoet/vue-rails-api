<template>
  <div id="app">
    <Flash />
    <Spinner />
    <router-view/>
  </div>
</template>

<script>
import Flash from '@/components/Flash';
import Spinner from '@/components/Spinner';

export default {
  components: {
    Flash,
    Spinner,
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
