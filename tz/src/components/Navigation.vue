<template>
  <nav>
    <ul>
      <span v-if="loggedIn">
        <li>
          hi {{ description }}
        </li>
        <li>
          <a href="#" @click.prevent="logout">Log-Out</a>
        </li>
        <li>
          <a href="#" @click.prevent="home">Home</a>
        </li>
        <li v-if="isUserManager">
          <a href="#" @click.prevent="users">Users</a>
        </li>
      </span>
      <span v-else>
        <li>
          <a href="#" @click.prevent="login">Log-In</a>
        </li>
      </span>
    </ul>
  </nav>
</template>

<script>
export default {
  computed: {
    loggedIn() {
      return this.$root.loggedIn;
    },
    isUserManager() {
      return this.$root.isUserManager;
    },
    isAdmin() {
      return this.$root.isAdmin;
    },
    description() {
      return `${this.$root.user.name}  -  ${this.$root.user.role}`;
    },
  },
  methods: {
    login() {
      this.$router.push('/');
    },
    home() {
      this.$router.push('/home');
    },
    users() {
      this.$router.push('/users');
    },
    timeZones() {
      this.$router.push('/time-zones');
    },
    logout() {
      this.$root.logout();
      this.$router.push('/');
    },
  },
};
</script>

<style scoped>
li {
  display: inline-block;
  list-style: none;
}
</style>
