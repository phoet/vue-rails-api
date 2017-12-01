<template>
  <div>
    <h1>TimeZones</h1>

    <h2>All TimeZones for User</h2>

    <Form :submit="show" key="form">
      <input type="text" required name="userId" v-model="userId" placeholder="User-ID">
      <button type="submit">Select</button>
    </Form>

    <div v-if="entered">
      <h3>Create for {{userId}}</h3>
      <Form :submit="create">
        <input type="text" required name="name" v-model="name" placeholder="Name">
        <select required v-model="key">
          <option v-for="name in tzNames" :value="name" key="name">{{name}}</option>
        </select>
        <button type="submit">Create</button>
      </Form>

      <h3>List for {{userId}}</h3>
      <transition-group name="fade" mode="outin">
        <p v-if="timeZones.length === 0" key="empty">No Data</p>
        <div v-for="tz in timeZones" key="tz">
          <Form :submit="() => update(tz)">
            {{ tz.user_id }}
            <input type="text" required name="name" v-model="tz.name" placeholder="Name">
            {{ tz.key }}
            {{ tz.current_time }}
            <button type="submit">Update</button>
            <button type="button" @click.prevent="destroy(tz)">Destroy</button>
          </Form>
        </div>
      </transition-group>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      entered: false,
      name: null,
      key: null,
      userId: null,
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
        name: this.name,
        key: this.key,
      };
      const created = await this.$root.post(`users/${this.userId}/time_zones`, data);
      if (created) {
        this.timeZones.push(created);
      }
    },
    async update(tz) {
      const data = {
        time_zone: tz,
      };
      const updated = await this.$root.patch(`users/${this.userId}/time_zones/${tz.id}`, data);
      if (updated) {
        Object.assign(tz, updated);
      }
    },
    async destroy(tz) {
      await this.$root.delete(`users/${this.userId}/time_zones/${tz.id}`);
      this.timeZones = this.timeZones.filter(zone => zone.id !== tz.id);
    },
    async show() {
      this.entered = true;

      const tzs = await this.$root.get(`users/${this.userId}/time_zones`);
      if (tzs) {
        this.timeZones = tzs;
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
