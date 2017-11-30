<template>
  <div>
    <h1>Home</h1>

    <transition-group name="fade" mode="outin">
      <p v-if="timeZones.length === 0" key="empty">No Data</p>
      <form v-for="tz in timeZones" key="tz">
        <input type="text" required name="description" v-model="tz.description" placeholder="Description">
        {{ tz.name }}
        {{ tz.current_time }}
        <button type="button" @click.prevent="update(tz)">Update</button>
        <button type="button" @click.prevent="destroy(tz)">Destroy</button>
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
    async update(tz) {
      const data = {
        time_zone: tz,
      };
      const updated = await this.$root.patch(`time_zones/${tz.id}`, data);
      if (updated) {
        Object.assign(tz, updated);
      }
    },
    async destroy(tz) {
      await this.$root.delete(`time_zones/${tz.id}`);
      this.timeZones = this.timeZones.filter(zone => zone.id !== tz.id);
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
