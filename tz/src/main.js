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
    token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJ1c2VyIjp7ImlkIjoxLCJuYW1lIjpudWxsLCJlbWFpbCI6InBob2V0bWFpbEBnb29nbGVtYWlsLmNvbSIsImNyZWF0ZWRfYXQiOiIyMDE3LTExLTI5IDIwOjM3OjMzIFVUQyIsInVwZGF0ZWRfYXQiOiIyMDE3LTExLTI5IDIwOjM3OjMzIFVUQyIsInJvbGUiOiJhZG1pbiJ9LCJleHAiOjE1MTIxMjQ1NzF9.2gWJ73eJYRLp0oxqGugy7q-_TC8DD2hbd4meKYPzXgM',
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
