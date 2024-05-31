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
            },
        ]
    },
    {
        path: '/admin',
        component: () => import('../views/AdminLayout.vue'),
        children:[
            {
                path: '/admin/ranking',
                component: () => import('../components/admin/adminRanking.vue'),
            },
            {
                path: '/admin/Hornour',
                component: () => import('../components/admin/adminHornour.vue'),
            },
            {
                path: '/admin/Member',
                component: () => import('../components/admin/adminMember.vue'),
            },
            {
                path: '/admin/Problem',
                component: () => import('../components/admin/adminProblem.vue')  
            },
            {
                path: '/admin/ProblemList',
                component: () => import('../components/admin/adminProblemList.vue')  
            },
            {
                path: '/admin/Setting',
                component: () => import('../components/admin/adminSetting.vue')  
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