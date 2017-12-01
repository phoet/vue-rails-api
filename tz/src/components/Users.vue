<template>
  <div>
    <h1>Users</h1>

    <h2>Manage Users</h2>

    <h3>Create</h3>
    <Form :submit="create">
      <input type="text" required name="name" v-model="name" placeholder="Name">
      <input type="email" required name="email" v-model="email" placeholder="E-Mail">
      <input type="password" required name="password" v-model="password" placeholder="Password">
      <button type="submit">Create</button>
    </Form>

    <h3>List</h3>

    <p v-if="users.length === 0" key="empty">No Data</p>

    <transition-group name="fade">
      <div v-for="user in users" key="user">
        <Form :submit="() => update(user)">
          <input type="text" required name="name" v-model="user.name" placeholder="Name">
          <input type="email" required name="email" v-model="user.email" placeholder="E-Mail">
          <button type="submit">Update</button>
          <button type="button" @click.prevent="destroy(user)">Destroy</button>
        </Form>
      </div>
    </transition-group>

  </div>
</template>

<script>
export default {
  data() {
    return {
      name: null,
      email: null,
      password: null,
      users: [],
    };
  },
  methods: {
    async create() {
      const data = {
        user: {
          name: this.name,
          email: this.email,
          password: this.password,
        },
      };
      const created = await this.$root.post('users', data);
      if (created) {
        this.users.push(created);
      }
    },
    async update(user) {
      const data = { user };
      const updated = await this.$root.patch(`users/${user.id}`, data);
      if (updated) {
        Object.assign(user, updated);
      }
    },
    async destroy(user) {
      await this.$root.delete(`users/${user.id}`);
      this.users = this.users.filter(u => u.id !== user.id);
    },
  },
  async mounted() {
    const users = await this.$root.get('users');
    if (users) {
      this.users = users;
    }
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
