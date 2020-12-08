import Vue from 'vue'
import VueRouter from 'vue-router'
import login from "@/components/login";
import Main from "@/components/Main";
import heatData from "@/components/heatData";
import chart from "@/components/chart";
import graph from "@/components/graph";
import DynamicGraph from "@/components/DynamicGraph";
import user from "@/components/user";
import manage from "@/components/manage";

Vue.use(VueRouter)

const routes = [
    {
        path: '/login',
        name: 'login',
        component: login
    },
    {
        path: '/',
        name: 'Main',
        redirect: '/heatData',
        component: Main,
        children: [
             {
                path: '/heatData',
                name: "heatData",
                component: heatData
            },
            {
                path: '/chart',
                name: "chart",
                component: chart
            },{
                path: '/graph',
                name: "graph",
                component: graph
            },{
                path: '/dynamic',
                name: "dynamic",
                component: DynamicGraph
            },{
                path: '/user',
                name: "user",
                component: user
            },{
                path: '/manage',
                name: "manage",
                component: manage
            },
        ]
    },

]
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
}
const router = new VueRouter({
    // mode:"history",
    // base: process.env.BASE_RUL,
    routes
})
//哨兵
router.beforeEach((to, from, next) => {
    //to 去哪
    //from 从哪来
    //next 是函数表示放行
    if (to.path === '/login') {
        return next();
    } else {
        const token = window.sessionStorage.getItem("token");
        if (!token) {
            return next('login');
        }
        next();
    }
})


export default router
