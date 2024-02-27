import { createRouter, createWebHistory } from 'vue-router'
import LoveView from '../views/LoveView.vue'
import IdealView from '../views/IdealView.vue'
import ResumeView from '../views/ResumeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: ResumeView
    },
    {
      path: '/love',
      name: 'love',
      component: LoveView
    },
    {
      path: '/ideal-job',
      name: 'ideal-job',
      component: IdealView
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue')
    }
  ]
})

export default router
