<template>
  <div>
    <h1>Home</h1>

    <transition-group name="fade" mode="outin">
      <form v-for="tz in timeZones" key="tz">
        <input type="text" required name="description" v-model="tz.description" placeholder="Description">
        {{ tz.name }}
        {{ tz.now }}
        <button type="button" @click.prevent="update(tz.id)">Update</button>
        <button type="button" @click.prevent="destroy(tz.id)">Destroy</button>
      </form>
    </transition-group>


    <!-- <h1 @click="toggle = !toggle">Log-In</h1>
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
    </transition> -->

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
    update() {

    },
    destroy() {

    },
  },
  async mounted() {
    try {
      const headers = {
        Authorization: this.$root.token,
      };
      const response = await this.$http.get('http://localhost:3000/api/time_zones.json', { headers });
      this.timeZones = response.body;
    } catch (e) {
      this.error = e;
    }
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
