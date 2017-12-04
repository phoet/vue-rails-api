import Vue from 'vue';
import Router from 'vue-router';
import Login from '@/components/Login';
import Home from '@/components/Home';
import Users from '@/components/Users';
import TimeZones from '@/components/TimeZones';

Vue.use(Router);

const router = new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login,
    },
    {
      path: '/home',
      name: 'Home',
      component: Home,
    },
    {
      path: '/users',
      name: 'Users',
      component: Users,
    },
    {
      path: '/users/:userId/time_zones',
      name: 'TimeZones',
      component: TimeZones,
    },
  ],
});

router.beforeEach((to, from, next) => {
  console.log(to, from);
  if (to.path === '/') {
    next();
  } else {
    const token = Vue.localStorage.get('token');
    next(token ? true : '/');
  }
});

export default router;
