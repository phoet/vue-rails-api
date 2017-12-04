<template>
  <div>

    <h1>
      <span @click="toggle = true">Log-In</span> / <span @click="toggle = false">Sign-Up</span>
    </h1>

    <Form :submit="login" v-if="toggle">
      <input type="email" required name="email" v-model="email" placeholder="E-Mail">
      <input type="password" required name="password" v-model="password" placeholder="Password">
      <button type="submit">Log-in</button>
    </Form>

    <Form :submit="signup" v-else>
      <input type="text" required name="name" v-model="name" placeholder="Name">
      <input type="email" required name="email" v-model="email" placeholder="E-Mail">
      <input type="password" required name="password" v-model="password" placeholder="Password">
      <button type="submit">Sign-Up</button>
    </Form>

  </div>
</template>

<script>
export default {
  data() {
    return {
      toggle: true,
      name: '',
      email: '',
      password: '',
    };
  },
  methods: {
    async signup() {
      const data = {
        name: this.name,
        email: this.email,
        password: this.password,
      };

      const auth = await this.$root.post('signup', data);
      if (auth) {
        this.$root.login(auth.auth_token);
        this.$router.push('/home');
      }
    },
    async login() {
      const data = {
        email: this.email,
        password: this.password,
      };

      const auth = await this.$root.post('authenticate', data);
      if (auth) {
        this.$root.login(auth.auth_token);
        this.$router.push('/home');
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
