<template>
  <form @submit="submit" onsubmit="return false;">
    <slot />
  </form>
</template>

<script>
export default {
  props: {
    submit: {
      type: Function,
      required: true,
    },
  },
};
</script>
