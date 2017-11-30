<template>
  <nav>
    <ul>
      <span v-if="loggedIn">
        <li>
          <a href="#" @click.prevent="logout">Log-Out</a>
        </li>
        <li v-if="isUserManager">
          <a href="#" @click.prevent="timeZones">TimeZones</a>
        </li>
        <li v-if="isAdmin">
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
  },
  methods: {
    login() {
      this.$router.push('/');
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
