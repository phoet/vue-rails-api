<template>
  <div>
    <h1>Sign-Up</h1>
    <form>
      <input type="text" required name="name" v-model="name" placeholder="Name">
      <input type="email" required name="email" v-model="email" placeholder="E-Mail">
      <input type="password" required name="password" v-model="password" placeholder="Password">
      <button type="submit" @click.prevent="signup">Sign-Up</button>
    </form>
    <h1>Log-In</h1>
    <form>
      <input type="email" required name="email" v-model="email" placeholder="E-Mail">
      <input type="password" required name="password" v-model="password" placeholder="Password">
      <button type="submit" @click.prevent="login">Log-in</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      error: null,
      name: '',
      email: '',
      password: '',
    };
  },
  methods: {
    signup() {
    },
    async login() {
      this.error = null;

      const data = {
        email: this.email,
        password: this.password,
      };

      try {
        const response = await this.$http.post('http://localhost:3000/api/authenticate.json', data);
        console.log(response.body);
      } catch (e) {
        this.error = e;
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
