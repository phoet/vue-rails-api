<template>
  <span class="ticker">
    {{ current }}
  </span>
</template>

<script>
export default {
  data() {
    return {
      current: null,
    };
  },
  props: {
    location: {
      required: true,
    },
  },
  mounted() {
    const fn = () => {
      this.current = new Date().toLocaleString('en-US', { timeZone: this.location });
    };
    fn();
    setInterval(fn, 1000);
  },
};
</script>
