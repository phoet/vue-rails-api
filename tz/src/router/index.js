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
      path: '/time-zones',
      name: 'TimeZones',
      component: TimeZones,
    },
  ],
});

router.beforeEach((to, from, next) => {
  console.log(to, from);
  next();
});

export default router;
