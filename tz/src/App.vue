<template>
  <div id="app">
    <Flash />
    <Spinner />
    <Navigation />
    <router-view/>
  </div>
</template>

<script>
import Flash from '@/components/Flash';
import Spinner from '@/components/Spinner';
import Navigation from '@/components/Navigation';

export default {
  components: {
    Flash,
    Spinner,
    Navigation,
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
