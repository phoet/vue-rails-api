<template>
  <div>

    <h1 @click="toggle = !toggle">Log-In</h1>
    <transition name="fade">
      <form v-if="toggle">
        <input type="email" required name="email" v-model="email" placeholder="E-Mail">
        <input type="password" required name="password" v-model="password" placeholder="Password">
        <button type="submit" @click.prevent="login">Log-in</button>
      </form>
    </transition>

    <h1 @click="toggle = !toggle">Sign-Up</h1>
    <transition name="fade">
      <form v-if="!toggle">
        <input type="text" required name="name" v-model="name" placeholder="Name">
        <input type="email" required name="email" v-model="email" placeholder="E-Mail">
        <input type="password" required name="password" v-model="password" placeholder="Password">
        <button type="submit" @click.prevent="signup">Sign-Up</button>
      </form>
    </transition>

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
    signup() {
    },
    async login() {
      const data = {
        email: this.email,
        password: this.password,
      };

      const auth = await this.$root.post('authenticate', data);
      if (auth) {
        this.$root.token = auth.auth_token;
        this.$router.push('/home');
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
