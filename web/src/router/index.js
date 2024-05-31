import Vue from "vue";
import VueRouter from "vue-router"


Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        component: () => import('../components/login.vue'),
    },
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
                path: 'userList',
                component: () => import('../components/userList.vue'),

            },
            {
                path: 'problem',
                component: () => import('../components/problem.vue'),
            },
            {
                path: 'blog/:problemId/:uid',
                component: () => import('../components/blog.vue'),
            },
            {
                path: 'post/:problemId',
                component: () => import('../components/post.vue'),
            },//individual
            {
                path: '/user/individual',
                component: () => import('../components/IndividualInfoShow.vue')
            },
            {
                path: '/user/loginTest',
                component: () => import('../components/loginTest.vue')
            },//problemLists
            {
                path: '/user/problemLists',
                component: () => import('../components/problemLists.vue')
            }
            ,
            {
                path: '/user/pushProblemlist',
                component: () => import('../components/pushProblemlist.vue'),
            }
            
        ]
    },
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router