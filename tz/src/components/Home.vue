<template>
  <div>
    <h1>Home</h1>

    <h2>My TimeZones</h2>

    <h3>Create</h3>
    <Form :submit="create">
      <input type="text" required name="name" v-model="name" placeholder="Name">
      <select required v-model="key">
        <option v-for="name in tzNames" :value="name" key="name">{{name}}</option>
      </select>
      <button type="submit">Create</button>
    </Form>

    <h3>List</h3>
    <Form :submit="filterList">
      <input type="filter" required name="filter" v-model="filter" placeholder="Filter by Name">
      <button type="submit">Filter</button>
      <button type="button" @click.prevent="resetList">Reset</button>
    </Form>

    <p v-if="timeZones.length === 0" key="empty">No Data</p>

    <div v-for="tz in timeZones" key="tz">
      <Form :submit="() => update(tz)">
        {{ tz.id }}
        <input type="text" required name="name" v-model="tz.name" placeholder="Name">
        {{ tz.key }}
        <Ticker :location="tz.key" />
        <button type="submit">Update</button>
        <button type="button" @click.prevent="destroy(tz)">Destroy</button>
      </Form>
    </div>

  </div>
</template>

<script>
export default {
  data() {
    return {
      filter: null,
      name: null,
      key: null,
      timeZones: [],
      tzNames: [
        'Europe/Berlin',
        'Europe/London',
      ],
    };
  },
  methods: {
    async filterList() {
      const params = {
        name: this.filter,
      };
      const tzs = await this.$root.get('time_zones', params);
      if (tzs) {
        this.timeZones = tzs;
      }
    },
    async resetList() {
      this.filter = null;
      await this.list();
    },
    async list() {
      const tzs = await this.$root.get('time_zones');
      if (tzs) {
        this.timeZones = tzs;
      }
    },
    async create() {
      const data = {
        name: this.name,
        key: this.key,
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
    await this.list();
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
