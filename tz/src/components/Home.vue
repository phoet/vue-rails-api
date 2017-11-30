<template>
  <div>
    <h1>Home</h1>

    <h2>My TimeZones</h2>

    <h3>Create</h3>
    <Form :submit="create">
      <input type="text" required name="description" v-model="description" placeholder="Description">
      <select required v-model="name">
        <option v-for="name in tzNames" :value="name" key="name">{{name}}</option>
      </select>
      <button type="submit">Create</button>
    </Form>

    <h3>List</h3>
    <transition-group name="fade" mode="outin">
      <p v-if="timeZones.length === 0" key="empty">No Data</p>
      <div v-for="tz in timeZones" key="tz">
        <Form :submit="() => update(tz)">
          <input type="text" required name="description" v-model="tz.description" placeholder="Description">
          {{ tz.name }}
          {{ tz.current_time }}
          <button type="submit">Update</button>
          <button type="button" @click.prevent="destroy(tz)">Destroy</button>
        </Form>
      </div>
    </transition-group>

  </div>
</template>

<script>
export default {
  data() {
    return {
      description: null,
      name: null,
      timeZones: [],
      tzNames: [
        'Europe/Berlin',
        'Europe/London',
      ],
    };
  },
  methods: {
    async create() {
      const data = {
        description: this.description,
        name: this.name,
      };
      const created = await this.$root.post('time_zones', data);
      if (created) {
        this.timeZones.push(created);
      }
    },
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
