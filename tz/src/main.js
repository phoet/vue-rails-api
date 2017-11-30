// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import VueResource from 'vue-resource';
import App from './App';
import router from './router';

Vue.config.productionTip = false;

Vue.use(VueResource);

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  data: {
    token: null,
    errors: [],
  },
  methods: {
    async post(path, data) {
      try {
        const headers = {};
        if (this.token) {
          headers.Authorization = this.token;
        }
        const response = await this.$http.post(`http://localhost:3000/api/${path}.json`, data, headers);
        return response.body;
      } catch (response) {
        this.errors.push(response.body);
      }
      return null;
    },
  },
  template: '<App/>',
  components: { App },
});
