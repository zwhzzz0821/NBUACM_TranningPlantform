import Vue from "vue";
import VueRouter from "vue-router"


Vue.use(VueRouter)

const routes = [
    {
        path: '/user',
        component: () => import('../views/UserLayout.vue'),
        children:[
            {
                path: 'problem',
                component: () => import('../components/problem.vue')
            }
        ]
    }
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router
