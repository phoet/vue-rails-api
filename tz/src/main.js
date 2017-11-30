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
    token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MTIxMTk2MjJ9.SZrUZaJL9AVS-rEy_-SGPoGAnbCX3EjjHCt_i0RqUko',
    // token: null,
    errors: [],
    loading: false,
  },
  methods: {
    async get(path) {
      return this.request('get', path);
    },
    async post(path, data) {
      return this.request('post', path, data);
    },
    async patch(path, data) {
      return this.request('patch', path, data);
    },
    async delete(path) {
      return this.request('delete', path);
    },
    async request(method, path, ...rest) {
      this.loading = true;
      try {
        const headers = {};
        if (this.token) {
          headers.Authorization = this.token;
        }
        const url = `http://localhost:3000/api/${path}.json`;
        const response = await this.$http[method](url, ...rest, { headers });
        return response.body;
      } catch (response) {
        this.errors.push(response.body);
      } finally {
        this.loading = false;
      }
      return null;
    },
  },
  template: '<App/>',
  components: { App },
});
