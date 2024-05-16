import Vue from 'vue'
import App from './App.vue'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import Vant from 'vant';
import 'vant/lib/index.css';
import echarts from 'echarts';
import VueMarkdownEditor from "@kangc/v-md-editor";
import "@kangc/v-md-editor/lib/style/base-editor.css";
import VMdPreview from "@kangc/v-md-editor/lib/preview";
import "@kangc/v-md-editor/lib/style/preview.css";
import vuepressTheme from "@kangc/v-md-editor/lib/theme/vuepress.js";
import "@kangc/v-md-editor/lib/theme/style/vuepress.css";
import BootstrapVue from 'bootstrap-vue';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import 'bootstrap/dist/css/bootstrap.css';
import VMdEditor from '@kangc/v-md-editor';
import '@kangc/v-md-editor/lib/style/base-editor.css';
import githubTheme from '@kangc/v-md-editor/lib/theme/github.js';
import '@kangc/v-md-editor/lib/theme/style/github.css';

Vue.config.productionTip = false
import hljs from 'highlight.js';

VMdEditor.use(githubTheme, {
  Hljs: hljs,
});
Vue.use(Vant);
Vue.use(ElementUI);
Vue.use(BootstrapVue);

function getUser() {
    return JSON.parse(localStorage.getItem('user'));
}

function timeStamp(value) {
    let date = new Date(value*1000); //时间戳为10位需*1000，时间戳为13位的话不需乘1000
    let year = date.getFullYear();
    let month = ("0" + (date.getMonth() + 1)).slice(-2);
    let sdate = ("0" + date.getDate()).slice(-2);
    let hour = ("0" + date.getHours()).slice(-2);
    let minute = ("0" + date.getMinutes()).slice(-2);
    let second = ("0" + date.getSeconds()).slice(-2);
    let result = year + "." + month + "." + sdate + " " + hour + ":" + minute + ":" + second;
    // 返回
    return result;
}
Vue.prototype.$getUser=getUser
Vue.prototype.$formatTime = timeStamp
Vue.prototype.$echarts = echarts
Vue.use(echarts);
Vue.use(VMdEditor);
new Vue({
    router,
    render: function (h) {
        return h(App)
    }
}).$mount('#app')
