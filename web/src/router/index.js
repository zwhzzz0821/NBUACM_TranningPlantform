import Vue from "vue";
import VueRouter from "vue-router"


Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        component: () => import('../views/login.vue'),
    },
    {
        path: '/user',
        component: () => import('../views/UserLayout.vue'),
        children:[
            {//用户列表
                path: '/user/userList',
                component: () => import('../components/admin/adminMember.vue'),
            },
            {
                path: 'ranking',
                component: () => import('../components/rank.vue'),
            },
            {//题目
                path: '/user/problem',
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
            {//个人信息展示
                path: '/user/individual',
                component: () => import('../components/IndividualInfoShow.vue')
            },
            {
                path: '/user/problemLists',
                component: () => import('../components/problemLists.vue')
            },
            {//创建题单
                path: '/user/pushProblemlist',
                component: () => import('../components/pushProblemlist.vue'),
            },
            {//
                path: '/user/ProblemList',
                component: () => import('../components/admin/adminProblemList.vue'),
            },
            {
                path: '/user/ranking',
                component: () => import('../components/admin/adminRanking.vue'),
            },
            {
                path: '/user/setting',
                component: () => import('../components/admin/adminSetting.vue'),
            }
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
            {//训练功能
                path: '/admin/ProblemList',
                component: () => import('../components/admin/adminProblemList.vue')  
            },
            {
                path: '/admin/Setting',
                component: () => import('../components/admin/adminSetting.vue')  
            },
            {//创建题单
                path:'/admin/NewProblemList',
                component: () => import('../components/pushProblemlist.vue')
            },
            {//个人信息
                path: '/admin/individual',
                component: () => import('../components/IndividualInfoShow.vue')
            }
        ]
    }
]

const router = new VueRouter({
    mode: 'hash',
    base: process.env.BASE_URL,
    routes
})

export default router