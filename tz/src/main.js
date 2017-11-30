// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import VueResource from 'vue-resource';
import App from './App';
import router from './router';
import Form from './components/Form';

Vue.config.productionTip = false;

Vue.component('Form', Form);

Vue.use(VueResource);

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  data: {
    token: null,
    errors: [],
    loading: false,
  },
  computed: {
    user() {
      if (this.token) {
        const data = window.atob(this.token.split('.')[1]);
        return JSON.parse(data).user;
      }
      return null;
    },
    isUser() {
      return this.user.role === 'user';
    },
    isUserManager() {
      return this.user.role === 'user_manager' || this.user.role === 'admin';
    },
    isAdmin() {
      return this.user.role === 'admin';
    },
    loggedIn() {
      return !!this.token;
    },
  },
  methods: {
    logout() {
      this.token = null;
    },
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
    async request(method, path, data) {
      this.loading = true;
      try {
        const headers = {};
        if (this.token) {
          headers.Authorization = this.token;
        }
        const url = `http://localhost:3000/api/${path}.json`;
        if (method === 'get') {
          const response = await this.$http.get(url, { headers });
          return response.body;
        }
        const response = await this.$http[method](url, data, { headers });
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
