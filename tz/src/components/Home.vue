<template>
  <div>
    <h1>Home</h1>

    <transition-group name="fade" mode="outin">
      <form v-for="tz in timeZones" key="tz">
        <input type="text" required name="description" v-model="tz.description" placeholder="Description">
        {{ tz.name }}
        {{ tz.now }}
        <button type="button" @click.prevent="update(tz.id)">Update</button>
        <button type="button" @click.prevent="destroy(tz.id)">Destroy</button>
      </form>
    </transition-group>

  </div>
</template>

<script>
export default {
  data() {
    return {
      timeZones: [],
    };
  },
  methods: {
    update() {

    },
    destroy() {

    },
  },
  async mounted() {
    const tzs = await this.$root.get('time_zones');
    if (tzs) {
      this.timeZones = tzs;
    }
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
