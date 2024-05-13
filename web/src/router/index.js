import Vue from "vue";
import VueRouter from "vue-router"


Vue.use(VueRouter)

const routes = [
    {
        path: '/user',
        component: () => import('../views/UserLayout.vue'),
        children:[
            {
                path: '/user/test',
                component: () => import('../views/test.vue'),
            },
            {
                path: '/user/trybootstrap',
                component: () => import('../views/trybootstrap.vue'),
            },
            {
                path: '/user/userList',
                component: () => import('../views/userList.vue'),
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
