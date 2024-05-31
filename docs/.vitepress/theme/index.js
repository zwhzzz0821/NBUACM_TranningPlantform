// https://vitepress.dev/guide/custom-theme
import { h } from 'vue'
import DefaultTheme from 'vitepress/theme'
import './style.css'
import Honor from "./components/Honor.vue";
import Activities from "./components/Activities.vue";
import 'element-plus/dist/index.css';
import ElementPlus from 'element-plus';
import TeamMembers from "./components/TeamMembers.vue";
import Avatar from './components/Avatar.vue';
import TeacherList from "./components/TeacherList.vue";

/** @type {import('vitepress').Theme} */
export default {
    extends: DefaultTheme,
    Layout: () => {
        return h(DefaultTheme.Layout, null, {
            // https://vitepress.dev/guide/extending-default-theme#layout-slots
            // 'nav-bar-content-after': () => h(Avatar),
        })
    },
    enhanceApp({ app, router, siteData }) {
        // app.honor('Honor', Honor)
        app.use(ElementPlus);
        app.component('Honor', Honor);
        app.component('Activities', Activities);
        app.component('TeamMembers', TeamMembers);
        app.component('TeacherList', TeacherList);

    }
}
