[1mdiff --git a/docs/.vitepress/config.mjs b/docs/.vitepress/config.mjs[m
[1mindex 920260b..20ddd6b 100644[m
[1m--- a/docs/.vitepress/config.mjs[m
[1m+++ b/docs/.vitepress/config.mjs[m
[36m@@ -1,140 +1,10 @@[m
 import { defineConfig } from 'vitepress'[m
[31m-import mathjax3 from 'markdown-it-mathjax3';[m
[31m-[m
[31m-const customElements = [[m
[31m-  'mjx-container',[m
[31m-  'mjx-assistive-mml',[m
[31m-  'math',[m
[31m-  'maction',[m
[31m-  'maligngroup',[m
[31m-  'malignmark',[m
[31m-  'menclose',[m
[31m-  'merror',[m
[31m-  'mfenced',[m
[31m-  'mfrac',[m
[31m-  'mi',[m
[31m-  'mlongdiv',[m
[31m-  'mmultiscripts',[m
[31m-  'mn',[m
[31m-  'mo',[m
[31m-  'mover',[m
[31m-  'mpadded',[m
[31m-  'mphantom',[m
[31m-  'mroot',[m
[31m-  'mrow',[m
[31m-  'ms',[m
[31m-  'mscarries',[m
[31m-  'mscarry',[m
[31m-  'mscarries',[m
[31m-  'msgroup',[m
[31m-  'mstack',[m
[31m-  'mlongdiv',[m
[31m-  'msline',[m
[31m-  'mstack',[m
[31m-  'mspace',[m
[31m-  'msqrt',[m
[31m-  'msrow',[m
[31m-  'mstack',[m
[31m-  'mstack',[m
[31m-  'mstyle',[m
[31m-  'msub',[m
[31m-  'msup',[m
[31m-  'msubsup',[m
[31m-  'mtable',[m
[31m-  'mtd',[m
[31m-  'mtext',[m
[31m-  'mtr',[m
[31m-  'munder',[m
[31m-  'munderover',[m
[31m-  'semantics',[m
[31m-  'math',[m
[31m-  'mi',[m
[31m-  'mn',[m
[31m-  'mo',[m
[31m-  'ms',[m
[31m-  'mspace',[m
[31m-  'mtext',[m
[31m-  'menclose',[m
[31m-  'merror',[m
[31m-  'mfenced',[m
[31m-  'mfrac',[m
[31m-  'mpadded',[m
[31m-  'mphantom',[m
[31m-  'mroot',[m
[31m-  'mrow',[m
[31m-  'msqrt',[m
[31m-  'mstyle',[m
[31m-  'mmultiscripts',[m
[31m-  'mover',[m
[31m-  'mprescripts',[m
[31m-  'msub',[m
[31m-  'msubsup',[m
[31m-  'msup',[m
[31m-  'munder',[m
[31m-  'munderover',[m
[31m-  'none',[m
[31m-  'maligngroup',[m
[31m-  'malignmark',[m
[31m-  'mtable',[m
[31m-  'mtd',[m
[31m-  'mtr',[m
[31m-  'mlongdiv',[m
[31m-  'mscarries',[m
[31m-  'mscarry',[m
[31m-  'msgroup',[m
[31m-  'msline',[m
[31m-  'msrow',[m
[31m-  'mstack',[m
[31m-  'maction',[m
[31m-  'semantics',[m
[31m-  'annotation',[m
[31m-  'annotation-xml',[m
[31m-];[m
[31m-[m
 [m
[32m+[m[32m// https://vitepress.dev/reference/site-config[m
 export default defineConfig({[m
   lang: 'zh-CN',[m
   title: "NBU ACM",[m
   description: "NBU ACM WEBSITE 宁波大学ACM程序设计协会",[m
[31m-  markdown: {[m
[31m-    config: (md) => {[m
[31m-      md.use(mathjax3);[m
[31m-    },[m
[31m-  },[m
[31m-  vue: {[m
[31m-    template: {[m
[31m-      compilerOptions: {[m
[31m-        isCustomElement: (tag) => customElements.includes(tag),[m
[31m-      },[m
[31m-    },[m
[31m-  },[m
[31m-  head: [[m
[31m-    [[m
[31m-      "meta",[m
[31m-      {[m
[31m-        name:"referrer",[m
[31m-        content:"no-referrer"[m
[31m-      }[m
[31m-    ],[m
[31m-    ['link', { rel: 'icon', href: 'icon/favicon.ico' }],[m
[31m-[m
[31m-    // 修正渲染[m
[31m-    ['style', {}, `mjx-container > svg { display: inline-block; }`],[m
[31m-    // Google Analytics[m
[31m-    ['script', { async: '', src: 'https://www.googletagmanager.com/gtag/js?id=G-2ZJJQNKSP7' }],[m
[31m-    ['script', {}, `window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('js', new Date());gtag('config', 'G-2ZJJQNKSP7');`],[m
[31m-    // Baidu Analytics[m
[31m-    ['meta', { name: 'baidu-site-verification', content: 'codeva-3xs6buZQq7' }],[m
[31m-    // 360 Analytics[m
[31m-    ['meta', { name: '360-site-verification', content: '5f6b7e089e84559f4236b519637a2d50' }],[m
[31m-    // Sougou Analytics[m
[31m-    ['meta', { name: 'sogou_site_verification', content: 'BCj2PJBWHq' }],[m
[31m-    // Bytedance Analytics[m
[31m-    ['meta', { name: 'bytedance-verification-code', content: 'TKlifQgLT+gHFABWwZMH' }],[m
[31m-    // Shenma Analytics[m
[31m-    ['meta', { name: 'shenma-site-verification', content: '087f881b8e2608d58766e411ceef89f0_1688214039' }],[m
[31m-  ],[m
[31m-[m
   themeConfig: {[m
     // https://vitepress.dev/reference/default-theme-config[m
     logo: "icon/logo.png",[m
[36m@@ -143,35 +13,26 @@[m [mexport default defineConfig({[m
       { text: 'Honor', link: '/honor'},[m
       { text: 'Resources',[m
         items: [[m
[31m-          { text: '基础', link: '/resource/basic', },[m
[31m-          { text: '背包问题', link: '/resource/knacksack', },[m
[31m-          { text: '线段🌲', link: '/resource/segtr', },[m
[31m-          { text: '图', link: '/resource/graph', },[m
[32m+[m[32m          { text: '基础', link: '/basic/index', },[m
[32m+[m[32m          { text: '字符串', link: '/string/index', },[m
[32m+[m[32m          { text: '数学', link: '/math/index', },[m
[32m+[m[32m          { text: '数据结构', link: '/struct/index', },[m
         ][m
       },[m
[31m-      { text: 'About US', link: '/about/intro'},[m
[31m-      { text: '队员链接', link: 'http://123.60.188.56:8080/' },[m
[31m-      { text: '管理员链接', link: 'http://123.60.188.56:8080/'}[m
[32m+[m[32m      { text: 'About US', link: '/about/constitution'},[m
[32m+[m[32m      { text: '队员链接', link: 'http://www.nbuoj.com' },[m
[32m+[m[32m      { text: '管理员链接', link: 'http://www.nbuoj.com'}[m
     ],[m
 [m
     sidebar: [[m
       {[m
         text: '关于我们',[m
         items: [[m
[31m-          { text: '社团成员', link: '/about/member' },[m
[31m-          { text: '社团活动', link: '/about/activities' },[m
[31m-          { text: '加入我们', link: '/about/joinus' },[m
[31m-          { text: '社团章程', link: '/about/constitution' },[m
[31m-        ][m
[31m-      },[m
[31m-      {[m
[31m-        text: '学习资源',[m
[31m-        items: [[m
[31m-          { text: '入门指南 by zwh', link: '/resource/guide'},[m
[31m-          { text: '个人算法学习笔记 by cyb', link: '/resource/cybnote'},[m
[31m-          { text: 'NBU CS GUIDE', link: 'https://sayoriaaa.github.io/nbu-icicles/'},[m
[32m+[m[32m          { text: '社团章程', link: '/about/member' },[m
[32m+[m[32m          { text: '社团简介', link: '/api-examples' },[m
[32m+[m[32m          { text: '社团活动', link: '/about/activities' }[m
         ][m
[31m-      },[m
[32m+[m[32m      }[m
     ],[m
 [m
     socialLinks: [[m
[36m@@ -182,7 +43,6 @@[m [mexport default defineConfig({[m
       { icon: {svg: '<?xml version="1.0" encoding="UTF-8" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="158px" height="231px" viewBox="0 0 158 231" enable-background="new 0 0 158 231" xml:space="preserve">  <image id="image0" width="158" height="231" x="0" y="0"    xlink:href="data:image/png;base64,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" /></svg>'}, link: 'https://www.luogu.com.cn/'},[m
     ],[m
 [m
[31m-[m
     footer: {[m
       message: 'WELCOME to WEBSITE of NBUACM',[m
       copyright: 'Copyright © 2024-present NBUACM'[m
[1mdiff --git a/docs/.vitepress/theme/components/Activities.vue b/docs/.vitepress/theme/components/Activities.vue[m
[1mindex 62b7975..ea246da 100644[m
[1m--- a/docs/.vitepress/theme/components/Activities.vue[m
[1m+++ b/docs/.vitepress/theme/components/Activities.vue[m
[36m@@ -1 +1,13 @@[m
[31m-<template>  <div class="activities">    <div class="carousel">      <div class="carousel-inner" :style="{ transform: `translateX(-${currentIndex * 100}%)` }">        <div class="carousel-item" v-for="(activity, index) in activities" :key="index">          <img :src="activity.image" :alt="activity.title" class="activity-image" />          <div class="activity-info">            <h3>{{ activity.title }}</h3>            <p>{{ activity.description }}</p>          </div>        </div>      </div>      <button class="carousel-control prev" @click="prevSlide">‹</button>      <button class="carousel-control next" @click="nextSlide">›</button>    </div>    <div class="carousel-indicators">      <span v-for="(activity, index) in activities" :key="index" :class="{ active: currentIndex === index }" @click="goToSlide(index)"></span>    </div>  </div></template><script>export default {  data() {    return {      currentIndex: 0,      activities: [        {          image: '/img/2024bucpc.png',          title: '2024“札记杯”宁波大学第二十一届大学生程序设计竞赛',          description: '编程乐趣？我们满足你！增强问题分析与解决能力，提升团队之间的协作能力，享受算法带来的乐趣！',        },        {          image: '/img/summertrain.png',          title: '2023年程序设计协会暑期集训',          description: '宁波大学ACM集训队举办的2023年暑期集训，提升编程技能，备战各类编程竞赛。',        },        {          image: '/img/4.png',          title: '2024年宁波大学程序设计大赛',          description: '宁波大学ACM集训队组织、参与2024年宁波大学程序设计大赛。',        },        {          image: '/img/3.png',          title: '2023-2024学年协会日常集训',          description: '宁波大学ACM集训队组织日常集训',        },      ],      autoPlayInterval: null,    };  },  methods: {    nextSlide() {      this.currentIndex = (this.currentIndex + 1) % this.activities.length;    },    prevSlide() {      this.currentIndex = (this.currentIndex - 1 + this.activities.length) % this.activities.length;    },    goToSlide(index) {      this.currentIndex = index;    },    startAutoPlay() {      this.autoPlayInterval = setInterval(this.nextSlide, 3000);    },    stopAutoPlay() {      clearInterval(this.autoPlayInterval);      this.autoPlayInterval = null;    },  },  mounted() {    this.startAutoPlay();  },  beforeUnmount() {    this.stopAutoPlay();  },};</script><style scoped>.activities {  width: 100%;  max-width: 800px;  margin: 0 auto;  position: relative;}.carousel {  position: relative;  overflow: hidden;}.carousel-inner {  display: flex;  transition: transform 1s ease;}.carousel-item {  min-width: 100%;  box-sizing: border-box;}.activity-image {  width: 800px;  height: 600px;  object-fit: cover;  border-radius: 8px;}.activity-info {  padding: 10px;  text-align: center;}.activity-info h3 {  margin: 10px 0;}.activity-info p {  color: #666;}.carousel-control {  position: absolute;  top: 45%;  transform: translateY(-50%);  background-color: rgba(0, 0, 0, 0.5);  color: white;  border: none;  font-size: 2em;  cursor: pointer;  padding: 10px;  border-radius: 50%;}.carousel-control.prev {  left: 10px;}.carousel-control.next {  right: 10px;}.carousel-indicators {  display: flex;  justify-content: center;  margin-top: 10px;}.carousel-indicators span {  width: 10px;  height: 10px;  margin: 0 5px;  background-color: #ccc;  border-radius: 50%;  display: inline-block;  cursor: pointer;}.carousel-indicators span.active {  background-color: #333;}</style>[m
\ No newline at end of file[m
[32m+[m[32m<template>[m
[32m+[m[32m  https://codepen.io/JavaScriptJunkie/pen/ZMMRRQ[m
[32m+[m[32m</template>[m
[32m+[m
[32m+[m[32m<script>[m
[32m+[m[32mexport default {[m
[32m+[m[32m  name: "Activities"[m
[32m+[m[32m}[m
[32m+[m[32m</script>[m
[32m+[m
[32m+[m[32m<style scoped>[m
[32m+[m
[32m+[m[32m</style>[m
[1mdiff --git a/docs/.vitepress/theme/components/Honor.vue b/docs/.vitepress/theme/components/Honor.vue[m
[1mindex 3ef5177..f9848f7 100644[m
[1m--- a/docs/.vitepress/theme/components/Honor.vue[m
[1m+++ b/docs/.vitepress/theme/components/Honor.vue[m
[36m@@ -35,52 +35,52 @@[m [mexport default {[m
       options: [[m
         {[m
           background:[m
[31m-              '/img/cyb.JPG',[m
[32m+[m[32m              '.vitepress/theme/styles/img/cyb.JPG',[m
           icon: 'fas fa-walking',[m
           main: 'ICPC武汉邀请赛 铜奖',[m
           sub: '陈一波 严齐航 胡健山',[m
         },[m
         {[m
           background:[m
[31m-              '/img/zwhjn.JPG',[m
[32m+[m[32m              '.vitepress/theme/styles/img/zwhjn.JPG',[m
           icon: 'fas fa-snowflake',[m
           main: 'ICPC济南区域赛 银奖',[m
           sub: '朱文豪 赵瑞杰 李嘉琪',[m
         },[m
         {[m
           background:[m
[31m-              '/img/zwhnj.JPG',[m
[32m+[m[32m              '.vitepress/theme/styles/img/zwhnj.JPG',[m
           icon: 'fas fa-tree',[m
           main: 'ICPC济南区域赛 银奖',[m
           sub: '朱文豪 赵瑞杰 李嘉琪',[m
         },[m
         {[m
           background:[m
[31m-              '/img/lhfxa.JPG',[m
[32m+[m[32m              '.vitepress/theme/styles/img/zwhqhd.JPG',[m
           icon: 'fas fa-tint',[m
[31m-          main: 'ICPC西安区域赛 银奖',[m
[31m-          sub: '梁航锋 李浩 林成峰',[m
[32m+[m[32m          main: 'ICPC济南区域赛 银奖',[m
[32m+[m[32m          sub: '朱文豪 赵瑞杰 李嘉琪',[m
         },[m
         {[m
           background:[m
[31m-              '/img/zwhqhd.JPG',[m
[32m+[m[32m              '.vitepress/theme/styles/img/zwhqhd.JPG',[m
           icon: 'fas fa-tint',[m
           main: 'ICPC济南区域赛 银奖',[m
           sub: '朱文豪 赵瑞杰 李嘉琪',[m
         },[m
         {[m
           background:[m
[31m-              '/img/hzwsy.JPG',[m
[32m+[m[32m              '.vitepress/theme/styles/img/zwhqhd.JPG',[m
           icon: 'fas fa-tint',[m
[31m-          main: 'ICPC沈阳区域赛 银奖',[m
[31m-          sub: '胡值闻 蒋轶波 吴凯晟',[m
[32m+[m[32m          main: 'ICPC济南区域赛 银奖',[m
[32m+[m[32m          sub: '朱文豪 赵瑞杰 李嘉琪',[m
         },[m
         {[m
           background:[m
[31m-              '/img/lh.png',[m
[32m+[m[32m              '.vitepress/theme/styles/img/zwhqhd.JPG',[m
           icon: 'fas fa-tint',[m
[31m-          main: 'ICPC昆明邀请赛 金奖',[m
[31m-          sub: '李浩 吴镇桥 沈天佑',[m
[32m+[m[32m          main: 'ICPC济南区域赛 银奖',[m
[32m+[m[32m          sub: '朱文豪 赵瑞杰 李嘉琪',[m
         },[m
       ],[m
     };[m
[36m@@ -94,7 +94,7 @@[m [mexport default {[m
 </script>[m
 [m
 <style scoped>[m
[31m-[m
[32m+[m[32m$optionDefaultColours: #ED5565, #FC6E51, #FFCE54, #2ECC71, #5D9CEC, #AC92EC;[m
 [m
 body {[m
   display: flex;[m
[1mdiff --git a/docs/.vitepress/theme/components/TeacherCard.vue b/docs/.vitepress/theme/components/TeacherCard.vue[m
[1mdeleted file mode 100644[m
[1mindex 649f9db..0000000[m
[1m--- a/docs/.vitepress/theme/components/TeacherCard.vue[m
[1m+++ /dev/null[m
[36m@@ -1,70 +0,0 @@[m
[31m-<template>[m
[31m-  <div class="teacher-card">[m
[31m-    <div @click="toggleDetails" class="card-header">[m
[31m-      <img :src="teacher.photo" alt="Teacher Photo" class="teacher-photo">[m
[31m-      <div class="card-info">[m
[31m-        <h3 class="teacher-name">{{ teacher.name }}</h3>[m
[31m-        <p class="teacher-brief">{{ teacher.brief }}</p>[m
[31m-      </div>[m
[31m-    </div>[m
[31m-    <div v-if="showDetails" class="card-details">[m
[31m-      <p>{{ teacher.details }}</p>[m
[31m-    </div>[m
[31m-  </div>[m
[31m-</template>[m
[31m-[m
[31m-<script>[m
[31m-export default {[m
[31m-  name: 'TeacherCard',[m
[31m-  props: {[m
[31m-    teacher: {[m
[31m-      type: Object,[m
[31m-      required: true[m
[31m-    }[m
[31m-  },[m
[31m-  data() {[m
[31m-    return {[m
[31m-      showDetails: false[m
[31m-    };[m
[31m-  },[m
[31m-  methods: {[m
[31m-    toggleDetails() {[m
[31m-      this.showDetails = !this.showDetails;[m
[31m-    }[m
[31m-  }[m
[31m-};[m
[31m-</script>[m
[31m-[m
[31m-<style scoped>[m
[31m-.teacher-card {[m
[31m-  border: 1px solid #ddd;[m
[31m-  border-radius: 8px;[m
[31m-  overflow: hidden;[m
[31m-  margin: 10px;[m
[31m-  width: 100%;[m
[31m-  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);[m
[31m-}[m
[31m-.card-header {[m
[31m-  cursor: pointer;[m
[31m-}[m
[31m-.teacher-photo {[m
[31m-  width: 100%;[m
[31m-  height: 300px;[m
[31m-  object-fit: cover;[m
[31m-}[m
[31m-.card-info {[m
[31m-  padding: 10px;[m
[31m-}[m
[31m-.teacher-name {[m
[31m-  font-size: 1.2em;[m
[31m-  margin: 0;[m
[31m-}[m
[31m-.teacher-brief {[m
[31m-  color: #666;[m
[31m-  margin: 5px 0 0;[m
[31m-}[m
[31m-.card-details {[m
[31m-  padding: 10px;[m
[31m-  border-top: 1px solid #ddd;[m
[31m-}[m
[31m-</style>[m
[1mdiff --git a/docs/.vitepress/theme/components/TeacherList.vue b/docs/.vitepress/theme/components/TeacherList.vue[m
[1mdeleted file mode 100644[m
[1mindex 67e6a8a..0000000[m
[1m--- a/docs/.vitepress/theme/components/TeacherList.vue[m
[1m+++ /dev/null[m
[36m@@ -1,77 +0,0 @@[m
[31m-<template>[m
[31m-  <div class="teacher-list">[m
[31m-    <TeacherCard[m
[31m-        v-for="teacher in teachers"[m
[31m-        :key="teacher.id"[m
[31m-        :teacher="teacher"[m
[31m-    />[m
[31m-  </div>[m
[31m-</template>[m
[31m-[m
[31m-<script>[m
[31m-import TeacherCard from './TeacherCard.vue';[m
[31m-[m
[31m-export default {[m
[31m-  name: 'TeacherList',[m
[31m-  components: {[m
[31m-    TeacherCard[m
[31m-  },[m
[31m-  data() {[m
[31m-    return {[m
[31m-      teachers: [[m
[31m-        {[m
[31m-          id: 1,[m
[31m-          name: '辛宇',[m
[31m-          photo: 'img/teacher/xy.png',[m
[31m-          brief: '副教授',[m
[31m-          details: '研究方向：人工智能，大数据'[m
[31m-        },[m
[31m-        {[m
[31m-          id: 2,[m
[31m-          name: '陈叶芳',[m
[31m-          photo: 'img/teacher/img.png',[m
[31m-          brief: '我是简要介绍',[m
[31m-          details: '我是详细介绍我是详细介绍'[m
[31m-        },[m
[31m-        {[m
[31m-          id: 2,[m
[31m-          name: '陈叶芳',[m
[31m-          photo: 'img/teacher/img.png',[m
[31m-          brief: '我是简要介绍',[m
[31m-          details: '我是详细介绍我是详细介'[m
[31m-        },[m
[31m-        {[m
[31m-          id: 2,[m
[31m-          name: '陈叶芳',[m
[31m-          photo: 'img/teacher/img.png',[m
[31m-          brief: '我是简要介绍',[m
[31m-          details: '我是详细介绍我是详细介绍'[m
[31m-        },[m
[31m-        {[m
[31m-          id: 2,[m
[31m-          name: '陈叶芳',[m
[31m-          photo: 'img/teacher/img.png',[m
[31m-          brief: '我是简要介绍',[m
[31m-          details: '我是详细介绍我是详细介绍'[m
[31m-        },[m
[31m-        {[m
[31m-          id: 2,[m
[31m-          name: '陈叶芳',[m
[31m-          photo: 'img/teacher/img.png',[m
[31m-          brief: '我是简要介绍',[m
[31m-          details: '我是详细介绍我是详细介绍'[m
[31m-        },[m
[31m-      ][m
[31m-    };[m
[31m-  }[m
[31m-};[m
[31m-</script>[m
[31m-[m
[31m-<style scoped>[m
[31m-.teacher-list {[m
[31m-  display: grid;[m
[31m-  grid-template-columns: repeat(4, 1fr);[m
[31m-  gap: 10px;[m
[31m-  padding: 10px;[m
[31m-}[m
[31m-</style>[m
[1mdiff --git a/docs/.vitepress/theme/components/TeamMembers.vue b/docs/.vitepress/theme/components/TeamMembers.vue[m
[1mdeleted file mode 100644[m
[1mindex bc139ea..0000000[m
[1m--- a/docs/.vitepress/theme/components/TeamMembers.vue[m
[1m+++ /dev/null[m
[36m@@ -1,142 +0,0 @@[m
[31m-<template>[m
[31m-  <div class="team-members">[m
[31m-    <div v-for="(row, rowIndex) in memberRows" :key="rowIndex" class="member-row">[m
[31m-      <div v-for="(member, index) in row" :key="member.id" :class="['member', { left: index === 0, right: index === 1 }]" @click="toggleDetails(rowIndex * 2 + index)">[m
[31m-        <img :src="member.image" alt="Member photo" class="member-image" />[m
[31m-        <div class="member-info">[m
[31m-          <h3>{{ member.name }}</h3>[m
[31m-          <p>{{ member.position }}</p>[m
[31m-          <transition name="fade">[m
[31m-            <p v-if="member.showDetails" class="details">{{ member.details }}</p>[m
[31m-          </transition>[m
[31m-        </div>[m
[31m-      </div>[m
[31m-    </div>[m
[31m-  </div>[m
[31m-</template>[m
[31m-[m
[31m-<script>[m
[31m-export default {[m
[31m-  data() {[m
[31m-    return {[m
[31m-      members: [[m
[31m-        {[m
[31m-          id: 1,[m
[31m-          name: '梁航锋',[m
[31m-          position: 'ACM协会会长',[m
[31m-          details: '梁航锋，中共预备党员，21级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',[m
[31m-          image: '/img/member/lhf.png',[m
[31m-          showDetails: false[m
[31m-        },[m
[31m-        {[m
[31m-          id: 2,[m
[31m-          name: '林成峰',[m
[31m-          position: 'ACM协会副会长',[m
[31m-          details: '林成峰，共青团员，21级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',[m
[31m-          image: '/img/member/IMG_1113.JPG',[m
[31m-          showDetails: false[m
[31m-        },[m
[31m-        {[m
[31m-          id: 3,[m
[31m-          name: '赵瑞杰',[m
[31m-          position: 'ACM协会副会长',[m
[31m-          details: '赵瑞杰，共青团员，21级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',[m
[31m-          image: '/img/member/IMG_1112.JPG',[m
[31m-          showDetails: false[m
[31m-        },[m
[31m-        {[m
[31m-          id: 4,[m
[31m-          name: '朱文豪',[m
[31m-          position: 'ACM协会宣传部部长',[m
[31m-          details: '梁航锋，中共预备党员，21级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',[m
[31m-          image: '/img/member/IMG_1111.JPG',[m
[31m-          showDetails: false[m
[31m-        },[m
[31m-        {[m
[31m-          id: 5,[m
[31m-          name: '赖诗亮',[m
[31m-          position: 'ACM协会成员',[m
[31m-          details: '赖诗亮，发展对象，22级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',[m
[31m-          image: '/img/member/IMG_1114.JPG',[m
[31m-          showDetails: false[m
[31m-        },[m
[31m-        {[m
[31m-          id: 6,[m
[31m-          name: '陈炳灿',[m
[31m-          position: 'ACM协会社团部部长',[m
[31m-          details: '陈炳灿，22级计算机科学与技术专业学生。曾获国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖；曾获浙江省大学生程序设计竞赛三等奖两项、团体程序设计天梯赛个人三等奖两项、宁波大学程序设计竞赛特等奖一项等省级、校级奖项十余项。',[m
[31m-          image: '/img/member/IMG_1116.JPG',[m
[31m-          showDetails: false[m
[31m-        },[m
[31m-      ][m
[31m-    };[m
[31m-  },[m
[31m-  computed: {[m
[31m-    memberRows() {[m
[31m-      const rows = [];[m
[31m-      for (let i = 0; i < this.members.length; i += 2) {[m
[31m-        rows.push(this.members.slice(i, i + 2));[m
[31m-      }[m
[31m-      return rows;[m
[31m-    }[m
[31m-  },[m
[31m-  methods: {[m
[31m-    toggleDetails(index) {[m
[31m-      this.members[index].showDetails = !this.members[index].showDetails;[m
[31m-    }[m
[31m-  }[m
[31m-};[m
[31m-</script>[m
[31m-[m
[31m-<style scoped>[m
[31m-.team-members {[m
[31m-  display: flex;[m
[31m-  flex-direction: column;[m
[31m-}[m
[31m-[m
[31m-.member-row {[m
[31m-  display: flex;[m
[31m-  justify-content: space-between;[m
[31m-  margin-bottom: 20px;[m
[31m-}[m
[31m-[m
[31m-.member {[m
[31m-  flex: 0 0 48%;[m
[31m-  display: flex;[m
[31m-  align-items: center;[m
[31m-  padding: 10px;[m
[31m-  border: 1px solid #ccc;[m
[31m-  border-radius: 8px;[m
[31m-  transition: transform 0.3s;[m
[31m-  cursor: pointer;[m
[31m-}[m
[31m-[m
[31m-.member:hover {[m
[31m-  transform: scale(1.05);[m
[31m-}[m
[31m-[m
[31m-.left .member-image {[m
[31m-  margin-right: 15px;[m
[31m-}[m
[31m-[m
[31m-.right .member-image {[m
[31m-  margin-left: 15px;[m
[31m-  order: 2;[m
[31m-}[m
[31m-[m
[31m-.member-image {[m
[31m-  width: 100px;[m
[31m-  height: 100px;[m
[31m-  border-radius: 50%;[m
[31m-}[m
[31m-[m
[31m-.member-info {[m
[31m-  flex: 1;[m
[31m-}[m
[31m-[m
[31m-.details {[m
[31m-  margin-top: 10px;[m
[31m-  color: #555;[m
[31m-}[m
[31m-[m
[31m-</style>[m
[1mdiff --git a/docs/.vitepress/theme/index.js b/docs/.vitepress/theme/index.js[m
[1mindex 40445f6..f9a32cd 100644[m
[1m--- a/docs/.vitepress/theme/index.js[m
[1m+++ b/docs/.vitepress/theme/index.js[m
[36m@@ -6,9 +6,8 @@[m [mimport Honor from "./components/Honor.vue";[m
 import Activities from "./components/Activities.vue";[m
 import 'element-plus/dist/index.css';[m
 import ElementPlus from 'element-plus';[m
[31m-import TeamMembers from "./components/TeamMembers.vue";[m
[31m-import Avatar from './components/Avatar.vue';[m
[31m-import TeacherList from "./components/TeacherList.vue";[m
[32m+[m
[32m+[m[32mimport Avatar from './components/Avatar.vue'[m
 [m
 /** @type {import('vitepress').Theme} */[m
 export default {[m
[36m@@ -22,10 +21,8 @@[m [mexport default {[m
     enhanceApp({ app, router, siteData }) {[m
         // app.honor('Honor', Honor)[m
         app.use(ElementPlus);[m
[31m-        app.component('Honor', Honor);[m
[31m-        app.component('Activities', Activities);[m
[31m-        app.component('TeamMembers', TeamMembers);[m
[31m-        app.component('TeacherList', TeacherList);[m
[32m+[m[32m        app.component('Honor', Honor)[m
[32m+[m[32m        app.component('Activities', Activities)[m
 [m
     }[m
 }[m
[1mdiff --git a/docs/public/img/cyb.JPG b/docs/.vitepress/theme/styles/img/cyb.JPG[m
[1msimilarity index 100%[m
[1mrename from docs/public/img/cyb.JPG[m
[1mrename to docs/.vitepress/theme/styles/img/cyb.JPG[m
[1mdiff --git a/docs/public/img/teacher/zwhjn.JPG b/docs/.vitepress/theme/styles/img/zwhjn.JPG[m
[1msimilarity index 100%[m
[1mrename from docs/public/img/teacher/zwhjn.JPG[m
[1mrename to docs/.vitepress/theme/styles/img/zwhjn.JPG[m
[1mdiff --git a/docs/public/img/teacher/zwhnj.JPG b/docs/.vitepress/theme/styles/img/zwhnj.JPG[m
[1msimilarity index 100%[m
[1mrename from docs/public/img/teacher/zwhnj.JPG[m
[1mrename to docs/.vitepress/theme/styles/img/zwhnj.JPG[m
[1mdiff --git a/docs/public/img/teacher/zwhqhd.JPG b/docs/.vitepress/theme/styles/img/zwhqhd.JPG[m
[1msimilarity index 100%[m
[1mrename from docs/public/img/teacher/zwhqhd.JPG[m
[1mrename to docs/.vitepress/theme/styles/img/zwhqhd.JPG[m
[1mdiff --git a/docs/README.md b/docs/README.md[m
[1mindex 7b1272c..cedd15b 100644[m
[1m--- a/docs/README.md[m
[1m+++ b/docs/README.md[m
[36m@@ -1,8 +1,5 @@[m
 npm run docs:dev[m
 [m
[31m-npm install vue[m
 [m
[31m-npm install markdown-it-mathjax3 -D[m
 [m
[31m-[m
[31m-https://codepen.io/z-/pen/OBPJKK[m
[32m+[m[32mhttps://codepen.io/z-/pen/OBPJKK[m
\ No newline at end of file[m
[1mdiff --git a/docs/about/activities.md b/docs/about/activities.md[m
[1mindex bdd78cd..a3aa8f7 100644[m
[1m--- a/docs/about/activities.md[m
[1m+++ b/docs/about/activities.md[m
[36m@@ -1,58 +1,41 @@[m
[31m-# 主要活动[m
[31m-[m
[31m-## 1. 第20届浙江省大学生程序设计竞赛[m
[31m-- **活动时间**: 2023.04.15[m
[31m-- **活动地点**: 杭州师范大学[m
[31m-- **活动负责人**: 陈叶芳[m
[31m-- **活动参加人数**: 25[m
[31m-- **活动内容**:[m
[31m-  大学生程序设计竞赛旨在培养大学生创新思维和运用计算机分析问题、团队协作解决问题的实际能力，激发学生对计算机算法、编程的学习兴趣，提升大学生综合素质。在2023年4月15日，李国庆老师和罗思惠老师带领我们ACM程序设计协会全体成员，前往杭州师范大学参加第20届浙江省大学生程序设计竞赛。最终我们斩获了银奖2项，铜奖3项。[m
[31m-- **活动照片**:[m
[31m-[m
[31m-  ![活动照片](img/省赛图片.png)[m
[31m-[m
[31m-- **活动影响**:[m
[31m-  [2023.04.23 活动报道](https://eecs.nbu.edu.cn/info/1230/7302.htm)[m
[31m-[m
[31m-## 2. 宁波大学第二十届大学生程序设计竞赛[m
[31m-- **活动时间**: 2023.05.14[m
[31m-- **活动地点**: 宁波大学严信才楼[m
[31m-- **活动负责人**: 陈叶芳[m
[31m-- **活动参加人数**: 25[m
[31m-- **活动内容**:[m
[31m-  2023年5月14日，由教务处主办、信息科学与工程学院承办的宁波大学第二十届大学生程序设计竞赛在东校区严信才实验楼顺利举行。我们ACM程序设计协会全员参加，由会长李嘉琪组织命题。此次比赛共有来自全校各个学院的共100支队伍近300位同学参赛，旨在培养大学生创新思维和运用计算机分析问题、团队协作解决问题的实际能力，激发学生对计算机算法、编程的学习兴趣，提升大学生综合素质。[m
[31m-- **活动照片**:[m
[31m-  ![活动照片](img/校赛图片.png)[m
[31m-- **活动影响**:[m
[31m-  [2023.05.18 活动报道](https://eecs.nbu.edu.cn/info/1230/7866.htm)[m
[31m-[m
[31m-## 3. 2023ACM暑期集训[m
[31m-- **活动时间**: 2023.07.15-2023.08.17[m
[31m-- **活动地点**: 宁波大学严信才楼[m
[31m-- **活动负责人**: 陈叶芳[m
[31m-- **活动参加人数**: 28[m
[31m-- **活动内容**:[m
[31m-  本次暑期集训，旨在提高我们全体创新思维和运用计算机分析问题、团队协作解决问题的实际能力，为即将到来的CCPC、ICPC等赛事做好准备。我们参加了2023牛客暑期多校训练营和2023“钉耙编程”中国大学生算法设计超级联赛共计20场比赛。整个集训流程为，每周一、周二、周四、周五，各参加一场时长5个小时的比赛，周三和周六进行补题和交流。最后，我们全体成员参加了CCPC网络赛作为本次活动的收尾。[m
[31m-- **活动照片**:[m
[31m-  ![活动照片](img/2023ACM暑期集训图片.png)[m
[31m-- **活动影响**:[m
[31m-  [2023.08.17 活动报道](https://eecs.nbu.edu.cn/info/1230/7866.htm)[m
[31m-[m
[31m-## 4. CCPC、ICPC等赛事[m
[31m-- **活动时间**: 2023.10.14-2023.12.10[m
[31m-- **活动地点**: 各大承办比赛高校[m
[31m-- **活动负责人**: 陈叶芳[m
[31m-- **活动参加人数**: 25[m
[31m-- **活动内容**:[m
[31m-  CCPC、ICPC等赛事致力于用计算机解决现实世界的问题，以此培养大学生合作、创造、创新以及承受挑战的能力。我们协会成员在这个赛季每周三周六都会到严信才楼进行集中训练，以保持良好的状态，也有效提高了我们的思维能力。[m
[31m-- **活动照片**:[m
[31m-  ![活动照片](img/CCPCICPC等赛事图片/图片1.png)[m
[31m-  ![活动照片](img/CCPCICPC等赛事图片/图片2.png)[m
[31m-  ![活动照片](img/CCPCICPC等赛事图片/图片3.png)[m
[31m-- **活动影响**:[m
[31m-[m
[31m-  [2023.10.17 活动报道](https://www.neuq.edu.cn/info/1105/10004.htm)[m
[31m-[m
[31m-  [2023.10.26 活动报道](https://www.nwpu.edu.cn/info/1198/72988.htm)[m
[31m-[m
[31m-  [2023.11.03 活动报道](https://baijiahao.baidu.com/s?id=1781527202608109401&wfr=spider&for=pc)[m
[32m+[m[32m# 社团活动[m
[32m+[m
[32m+[m[32m| **活动名称**                       | **第20届浙江省大学生程序设计竞赛**                           |                  |              |[m
[32m+[m[32m| ---------------------------------- | ------------------------------------------------------------ | ---------------- | ------------ |[m
[32m+[m[32m| **活动时间**                       | 2023.04.15                                                   | **活动地点**     | 杭州师范大学 |[m
[32m+[m[32m| **活动负责人**                     | 陈叶芳                                                       | **活动参加人数** | 25           |[m
[32m+[m[32m| **活动内容**                       | （1.注意使用字体为仿宋，字号小四。2.字数不超过300字，需体现活动目的、主要活动流程等内容。）  大学生程序设计竞赛旨在培养大学生创新思维和运用计算机分析问题、团队协作解决问题的实际能力，激发学生对计算机算法、编程的学习兴趣，提升大学生综合素质。  在2023年4月15日，李国庆老师和罗思惠老师带领我们ACM程序设计协会全体成员，前往杭州师范大学参加第20届浙江省大学生程序设计竞赛。当日上午8点开始进行开幕式，而后展开了热身活动，随后于12:00正式开始比赛。比赛与当日17:00结束，随后我们参加了闭幕式，最后于当日晚全体回到宁波大学。  最终我们斩获了银奖2项，铜奖3项。 |                  |              |[m
[32m+[m[32m| **活动照片**                       | （建议照片包含横幅、海报等代表活动标志性物品，体现活动现场氛围。）                          ![img](file:////Users/iron/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image001.jpg) |                  |              |[m
[32m+[m[32m| **活动影响**  **（推送、报道等）** | （1.公众号推文链接+时间。2.报道链接+时间。）  2023.04.23:  https://eecs.nbu.edu.cn/info/1230/7302.htm |                  |              |[m
[32m+[m
[32m+[m[41m [m
[32m+[m
[32m+[m[32m| **活动名称**                       | **宁波大学第二十届大学生程序设计竞赛**                       |                  |                  |[m
[32m+[m[32m| ---------------------------------- | ------------------------------------------------------------ | ---------------- | ---------------- |[m
[32m+[m[32m| **活动时间**                       | 2023.05.14                                                   | **活动地点**     | 宁波大学严信才楼 |[m
[32m+[m[32m| **活动负责人**                     | 陈叶芳                                                       | **活动参加人数** | 25               |[m
[32m+[m[32m| **活动内容**                       | （1.注意使用字体为仿宋，字号小四。2.字数不超过300字，需体现活动目的、主要活动流程等内容。）  2023年5月14日，由教务处主办、信息科学与工程学院承办的宁波大学第二十届大学生程序设计竞赛在东校区严信才实验楼顺利举行。我们ACM程序设计协会全员参加，由会长李嘉琪组织命题。  在正式比赛之前，我们组织志愿者以维护赛场秩序，于赛场调试电脑是否可以正常使用，赛题也经过了我们反复修改。正式比赛于14号12:00正式开始，于当日17:00比赛结束。此次比赛共有来自全校各个学院的共100支队伍近300位同学参赛，旨在培养大学生创新思维和运用计算机分析问题、团队协作解决问题的实际能力，激发学生对计算机算法、编程的学习兴趣，提升大学生综合素质。 |                  |                  |[m
[32m+[m[32m| **活动照片**                       | （建议照片包含横幅、海报等代表活动标志性物品，体现活动现场氛围。）  ![img](file:////Users/iron/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image002.jpg) |                  |                  |[m
[32m+[m[32m| **活动影响**  **（推送、报道等）** | （1.公众号推文链接+时间。2.报道链接+时间。）  2023.05.18：  https://eecs.nbu.edu.cn/info/1230/7866.htm |                  |                  |[m
[32m+[m
[32m+[m[41m [m
[32m+[m
[32m+[m[32m| **活动名称**                       | **2023ACM****暑期集训**                                      |                  |                  |[m
[32m+[m[32m| ---------------------------------- | ------------------------------------------------------------ | ---------------- | ---------------- |[m
[32m+[m[32m| **活动时间**                       | 2023.07.15-2023.08.17                                        | **活动地点**     | 宁波大学严信才楼 |[m
[32m+[m[32m| **活动负责人**                     | 陈叶芳                                                       | **活动参加人数** | 28               |[m
[32m+[m[32m| **活动内容**                       | （1.注意使用字体为仿宋，字号小四。2.字数不超过300字，需体现活动目的、主要活动流程等内容。）  本次暑期集训，旨在提高我们全体创新思维和运用计算机分析问题、团队协作解决问题的实际能力，为即将到来的CCPC、ICPC等赛事做好准备。  我们参加了2023牛客暑期多校训练营和2023“钉耙编程”中国大学生算法设计超级联赛共计20场比赛。整个集训流程为，每周一、周二、周四、周五，各参加一场时长5个小时的比赛，周三和周六进行补题和交流。除此之外，新加入的协会成员每天都有学习任务，学习算法知识。最后，我们全体成员参加了CCPC网络赛作为本次活动的收尾。 |                  |                  |[m
[32m+[m[32m| **活动照片**                       | （建议照片包含横幅、海报等代表活动标志性物品，体现活动现场氛围。）                             ![img](file:////Users/iron/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image003.jpg) |                  |                  |[m
[32m+[m[32m| **活动影响**  **（推送、报道等）** | （1.公众号推文链接+时间。2.报道链接+时间。）  **标题：2023ACM暑期集训：锻炼创新思维与团队协作，为赛事备战**  **引言：** 宁波大学的ACM程序设计协会于2023年7月15日至8月17日期间举办了名为“2023ACM暑期集训”的活动。这次集训旨在提高参与者的创新思维和计算机问题分析能力，培养团队协作解决问题的实际能力，并为即将到来的CCPC、ICPC等赛事做好准备。  **正文：**   在为期五周的集训中，集训队共参加了20场比赛，其中包括了牛客暑期多校训练营和“钉耙编程”中国大学生算法设计超级联赛。每周一、周二、周四、周五，他们以每场比赛时长5个小时的方式，挑战各类算法题目，不断提升自己的编程技巧和应变能力。而在周三和周六，他们则进行补题和交流，分享彼此的经验和解题思路。  此外，为了确保每位新加入协会的成员都能够全面学习算法知识，他们被安排了每天的学习任务，以不断扩展自己的知识边界。  为了将集训的成果发挥到最大，集训的最后阶段，全体成员还参加了CCPC网络赛，不仅为即将到来的CCPC比赛夺得了名额，还通过实战检验了全体成员在集训中所学到的知识。  **引用：** 一位集训队队员表示：“通过这次集训，我们不仅提高了自己的编程水平，更重要的是培养了团队合作意识和解决问题的能力。我们相信这将对我们未来的竞赛表现产生积极的影响。”  **结尾：** 通过整个活动，不仅提高了全体成员解决实际问题的思维能力，还拉进了协会新老成员之间的关系，使协会氛围更加和谐。 |                  |                  |[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m| **活动名称**                       | **CCPC****、ICPC等赛事**                                     |                  |                  |[m
[32m+[m[32m| ---------------------------------- | ------------------------------------------------------------ | ---------------- | ---------------- |[m
[32m+[m[32m| **活动时间**                       | 2023.10.14-2023.12.10                                        | **活动地点**     | 各大承办比赛高校 |[m
[32m+[m[32m| **活动负责人**                     | 陈叶芳                                                       | **活动参加人数** | 25               |[m
[32m+[m[32m| **活动内容**                       | （1.注意使用字体为仿宋，字号小四。2.字数不超过300字，需体现活动目的、主要活动流程等内容。）  CCPC、ICPC等赛事致力于用计算机解决现实世界的问题，以此培养大学生合作、创造、创新以及承受挑战的能力。  2023年10月14-15日，CCPC秦皇岛站正式在东北大学秦皇岛分校举行，我们派出一支正式队伍，并斩获银奖；2023年10月21-22日，ICPC西安站正式在西北工业大学举行，我们派出了一只正式队伍，并斩获银奖；2023年11月04-05日，ICPC南京站正式在南京航空航天大学举行，我们派出的队伍又一次斩获银奖；2023年11月11-12日，ICPC沈阳站正式在东北大学举行，我们派出的队伍成功斩获铜奖。  我们协会成员在这个赛季每周三周六都会到严信才楼进行集中训练，以保持良好的状态，也有效提高了我们的思维能力。 |                  |                  |[m
[32m+[m[32m| **活动照片**                       | （建议照片包含横幅、海报等代表活动标志性物品，体现活动现场氛围。）                    ![img](file:////Users/iron/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image004.jpg)![img](file:////Users/iron/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image005.jpg)                    ![img](file:////Users/iron/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image006.jpg) |                  |                  |[m
[32m+[m[32m| **活动影响**  **（推送、报道等）** | （1.公众号推文链接+时间。2.报道链接+时间。）  2023.10.17：  https://www.neuq.edu.cn/info/1105/10004.htm  2023.10.26  https://www.nwpu.edu.cn/info/1198/72988.htm  2023.11.03：  https://baijiahao.baidu.com/s?id=1781527202608109401&wfr=spider&for=pc |                  |                  |[m
[41m+[m
[41m+ [m
\ No newline at end of file[m
[1mdiff --git "a/docs/about/img/2023ACM\346\232\221\346\234\237\351\233\206\350\256\255\345\233\276\347\211\207.png" "b/docs/about/img/2023ACM\346\232\221\346\234\237\351\233\206\350\256\255\345\233\276\347\211\207.png"[m
[1mdeleted file mode 100644[m
[1mindex c05364b..0000000[m
Binary files "a/docs/about/img/2023ACM\346\232\221\346\234\237\351\233\206\350\256\255\345\233\276\347\211\207.png" and /dev/null differ
[1mdiff --git "a/docs/about/img/CCPCICPC\347\255\211\350\265\233\344\272\213\345\233\276\347\211\207/\345\233\276\347\211\2071.png" "b/docs/about/img/CCPCICPC\347\255\211\350\265\233\344\272\213\345\233\276\347\211\207/\345\233\276\347\211\2071.png"[m
[1mdeleted file mode 100644[m
[1mindex 446a0cf..0000000[m
Binary files "a/docs/about/img/CCPCICPC\347\255\211\350\265\233\344\272\213\345\233\276\347\211\207/\345\233\276\347\211\2071.png" and /dev/null differ
[1mdiff --git "a/docs/about/img/CCPCICPC\347\255\211\350\265\233\344\272\213\345\233\276\347\211\207/\345\233\276\347\211\2072.png" "b/docs/about/img/CCPCICPC\347\255\211\350\265\233\344\272\213\345\233\276\347\211\207/\345\233\276\347\211\2072.png"[m
[1mdeleted file mode 100644[m
[1mindex 3ec0fc4..0000000[m
Binary files "a/docs/about/img/CCPCICPC\347\255\211\350\265\233\344\272\213\345\233\276\347\211\207/\345\233\276\347\211\2072.png" and /dev/null differ
[1mdiff --git "a/docs/about/img/CCPCICPC\347\255\211\350\265\233\344\272\213\345\233\276\347\211\207/\345\233\276\347\211\2073.png" "b/docs/about/img/CCPCICPC\347\255\211\350\265\233\344\272\213\345\233\276\347\211\207/\345\233\276\347\211\2073.png"[m
[1mdeleted file mode 100644[m
[1mindex bc9b92d..0000000[m
Binary files "a/docs/about/img/CCPCICPC\347\255\211\350\265\233\344\272\213\345\233\276\347\211\207/\345\233\276\347\211\2073.png" and /dev/null differ
[1mdiff --git a/docs/about/img/bmb.png b/docs/about/img/bmb.png[m
[1mdeleted file mode 100644[m
[1mindex 12ed847..0000000[m
Binary files a/docs/about/img/bmb.png and /dev/null differ
[1mdiff --git a/docs/about/img/zxq.png b/docs/about/img/zxq.png[m
[1mdeleted file mode 100644[m
[1mindex 54890e0..0000000[m
Binary files a/docs/about/img/zxq.png and /dev/null differ
[1mdiff --git "a/docs/about/img/\346\240\241\350\265\233\345\233\276\347\211\207.png" "b/docs/about/img/\346\240\241\350\265\233\345\233\276\347\211\207.png"[m
[1mdeleted file mode 100644[m
[1mindex 6a78bc7..0000000[m
Binary files "a/docs/about/img/\346\240\241\350\265\233\345\233\276\347\211\207.png" and /dev/null differ
[1mdiff --git "a/docs/about/img/\347\234\201\350\265\233\345\233\276\347\211\207.png" "b/docs/about/img/\347\234\201\350\265\233\345\233\276\347\211\207.png"[m
[1mdeleted file mode 100644[m
[1mindex dab902c..0000000[m
Binary files "a/docs/about/img/\347\234\201\350\265\233\345\233\276\347\211\207.png" and /dev/null differ
[1mdiff --git a/docs/about/intro.md b/docs/about/intro.md[m
[1mdeleted file mode 100644[m
[1mindex b5159de..0000000[m
[1m--- a/docs/about/intro.md[m
[1m+++ /dev/null[m
[36m@@ -1,150 +0,0 @@[m
[31m-# 宁波大学ACM程序设计协会[m
[31m-[m
[31m-## 协会简介[m
[31m-[m
[31m-宁波大学ACM程序设计协会是由一群对计算机科学和编程充满热情的学生组成的学术社团。协会致力于提高成员的算法设计能力、编程技能和团队合作精神，积极参与并组织各类程序设计竞赛。我们的目标是培养创新思维和实际解决问题的能力，促进计算机科学知识的传播和应用。[m
[31m-[m
[31m-## 主要活动[m
[31m-[m
[31m-### 1. 第20届浙江省大学生程序设计竞赛[m
[31m-- **活动时间**: 2023.04.15[m
[31m-- **活动地点**: 杭州师范大学[m
[31m-- **活动负责人**: 陈叶芳[m
[31m-- **活动参加人数**: 25[m
[31m-- **活动内容**:[m
[31m-  大学生程序设计竞赛旨在培养大学生创新思维和运用计算机分析问题、团队协作解决问题的实际能力，激发学生对计算机算法、编程的学习兴趣，提升大学生综合素质。在2023年4月15日，李国庆老师和罗思惠老师带领我们ACM程序设计协会全体成员，前往杭州师范大学参加第20届浙江省大学生程序设计竞赛。最终我们斩获了银奖2项，铜奖3项。[m
[31m-- **活动照片**:[m
[31m-[m
[31m-  ![活动照片](img/省赛图片.png)[m
[31m-[m
[31m-- **活动影响**:[m
[31m-  [2023.04.23 活动报道](https://eecs.nbu.edu.cn/info/1230/7302.htm)[m
[31m-[m
[31m-### 2. 宁波大学第二十届大学生程序设计竞赛[m
[31m-- **活动时间**: 2023.05.14[m
[31m-- **活动地点**: 宁波大学严信才楼[m
[31m-- **活动负责人**: 陈叶芳[m
[31m-- **活动参加人数**: 25[m
[31m-- **活动内容**:[m
[31m-  2023年5月14日，由教务处主办、信息科学与工程学院承办的宁波大学第二十届大学生程序设计竞赛在东校区严信才实验楼顺利举行。我们ACM程序设计协会全员参加，由会长李嘉琪组织命题。此次比赛共有来自全校各个学院的共100支队伍近300位同学参赛，旨在培养大学生创新思维和运用计算机分析问题、团队协作解决问题的实际能力，激发学生对计算机算法、编程的学习兴趣，提升大学生综合素质。[m
[31m-- **活动照片**:[m
[31m-  ![活动照片](img/校赛图片.png)[m
[31m-- **活动影响**:[m
[31m-  [2023.05.18 活动报道](https://eecs.nbu.edu.cn/info/1230/7866.htm)[m
[31m-[m
[31m-### 3. 2023ACM暑期集训[m
[31m-- **活动时间**: 2023.07.15-2023.08.17[m
[31m-- **活动地点**: 宁波大学严信才楼[m
[31m-- **活动负责人**: 陈叶芳[m
[31m-- **活动参加人数**: 28[m
[31m-- **活动内容**:[m
[31m-  本次暑期集训，旨在提高我们全体创新思维和运用计算机分析问题、团队协作解决问题的实际能力，为即将到来的CCPC、ICPC等赛事做好准备。我们参加了2023牛客暑期多校训练营和2023“钉耙编程”中国大学生算法设计超级联赛共计20场比赛。整个集训流程为，每周一、周二、周四、周五，各参加一场时长5个小时的比赛，周三和周六进行补题和交流。最后，我们全体成员参加了CCPC网络赛作为本次活动的收尾。[m
[31m-- **活动照片**:[m
[31m-  ![活动照片](img/2023ACM暑期集训图片.png)[m
[31m-- **活动影响**:[m
[31m-  [2023.08.17 活动报道](https://eecs.nbu.edu.cn/info/1230/7866.htm)[m
[31m-[m
[31m-### 4. CCPC、ICPC等赛事[m
[31m-- **活动时间**: 2023.10.14-2023.12.10[m
[31m-- **活动地点**: 各大承办比赛高校[m
[31m-- **活动负责人**: 陈叶芳[m
[31m-- **活动参加人数**: 25[m
[31m-- **活动内容**:[m
[31m-  CCPC、ICPC等赛事致力于用计算机解决现实世界的问题，以此培养大学生合作、创造、创新以及承受挑战的能力。我们协会成员在这个赛季每周三周六都会到严信才楼进行集中训练，以保持良好的状态，也有效提高了我们的思维能力。[m
[31m-- **活动照片**:[m
[31m-  ![活动照片](img/CCPCICPC等赛事图片/图片1.png)[m
[31m-  ![活动照片](img/CCPCICPC等赛事图片/图片2.png)[m
[31m-  ![活动照片](img/CCPCICPC等赛事图片/图片3.png)[m
[31m-- **活动影响**:[m
[31m-[m
[31m-  [2023.10.17 活动报道](https://www.neuq.edu.cn/info/1105/10004.htm)[m
[31m-[m
[31m-  [2023.10.26 活动报道](https://www.nwpu.edu.cn/info/1198/72988.htm)[m
[31m-[m
[31m-  [2023.11.03 活动报道](https://baijiahao.baidu.com/s?id=1781527202608109401&wfr=spider&for=pc)[m
[31m-[m
[31m-## 比赛介绍[m
[31m-[m
[31m-### ICPC (国际大学生程序设计竞赛)[m
[31m-ICPC，全称为国际大学生程序设计竞赛，是全球规模最大、水平最高的大学生程序设计竞赛之一。竞赛旨在培养大学生的编程能力和团队合作精神，挑战他们在规定时间内解决复杂问题的能力。每年，来自全球的大学生队伍通过区域赛选拔，最终角逐全球总决赛。[m
[31m-[m
[31m-### CCPC (中国大学生程序设计竞赛)[m
[31m-CCPC，全称为中国大学生程序设计竞赛，是中国大陆地区的高水平程序设计赛事。竞赛致力于提高大学生的算法设计和编程能力，促进高校之间的学术交流。CCPC与ICPC相似，但更具本土特色，许多中国高校都积极参与其中。[m
[31m-[m
[31m-### 浙江省程序设计大赛[m
[31m-浙江省程序设计大赛是浙江省范围内的大学生程序设计竞赛，旨在培养大学生的创新思维和编程能力。竞赛内容涵盖了数据结构、算法设计和实际编程等多个方面，为省内高校学生提供了一个展示和交流的平台。[m
[31m-[m
[31m-### 蓝桥杯[m
[31m-蓝桥杯全国软件和信息技术专业人才大赛是一项全国性的信息技术竞赛，涵盖了程序设计、软件开发、嵌入式开发等多个领域。竞赛分为校赛、省赛和全国总决赛，旨在通过比赛选拔和培养优秀的IT人才。[m
[31m-[m
[31m-### 天梯赛[m
[31m-天梯赛，全称为全国大学生程序设计天梯赛，是一项面向全国高校学生的编程竞赛。竞赛采用个人赛和团队赛相结合的形式，考察选手的编程能力、算法设计能力和问题解决能力。通过竞赛，学生们不仅能提升自己的技能，还能与来自全国各地的优秀选手交流学习。[m
[31m-[m
[31m-## ACM训练内容[m
[31m-[m
[31m-### 学习内容[m
[31m-我们的训练内容涵盖了算法和数据结构的方方面面，包括但不限于：[m
[31m-- **基础算法**: 排序算法、搜索算法、图算法等[m
[31m-- **高级算法**: 动态规划、贪心算法、分治算法等[m
[31m-- **数据结构**: 数组、链表、栈、队列、树、图、哈希表等[m
[31m-- **专题训练**: 字符串处理、数论、几何算法等[m
[31m-[m
[31m-[m
[31m-## 学习资源推荐[m
[31m-[m
[31m-### 在线平台[m
[31m-[m
[31m-- **[LeetCode](https://leetcode.com/)**: 一个非常受欢迎的在线编程平台，提供大量的算法和数据结构问题，适合从基础到进阶的练习。题目分类明确，支持多种编程语言。[m
[31m-[m
[31m-- **[HackerRank](https://www.hackerrank.com/)**: 提供多种编程挑战，从算法、数据结构到数学、数据库等多领域的练习。支持多种编程语言，并有详尽的讨论区和解题报告。[m
[31m-[m
[31m-- **[Codeforces](https://codeforces.com/)**: 一个面向竞赛编程的在线平台，提供丰富的编程比赛和训练题目。适合参加ICPC、CCPC等竞赛的训练。[m
[31m-[m
[31m-- **[AtCoder](https://atcoder.jp/)**: 日本的一个编程竞赛平台，提供高质量的竞赛和题目，题目难度范围广，从入门到高级都有。[m
[31m-[m
[31m-- **[TopCoder](https://www.topcoder.com/)**: 一个老牌的编程竞赛平台，提供多种编程挑战和竞赛。包括单人比赛、团队比赛以及马拉松比赛。[m
[31m-[m
[31m-- **[Kaggle](https://www.kaggle.com/)**: 主要面向数据科学和机器学习的竞赛平台，但也有许多编程和算法挑战。适合想要在数据分析和机器学习领域有所发展的同学。[m
[31m-[m
[31m-### 教育平台[m
[31m-[m
[31m-- **[Coursera](https://www.coursera.org/)**: 提供多种计算机科学课程，包括算法和数据结构的专业课程。推荐《Algorithms Specialization》系列课程。[m
[31m-[m
[31m-- **[edX](https://www.edx.org/)**: 提供来自顶尖大学的在线课程，许多关于算法和数据结构的课程都非常高质量。[m
[31m-[m
[31m-- **[MIT OpenCourseWare](https://ocw.mit.edu/)**: 麻省理工学院的开放课程网站，提供许多计算机科学的课程材料。推荐《Introduction to Algorithms》课程。[m
[31m-[m
[31m-### 编程练习和竞赛[m
[31m-[m
[31m-- **[SPOJ (Sphere Online Judge)](https://www.spoj.com/)**: 一个在线编程练习平台，拥有大量经典问题和竞赛题目。[m
[31m-[m
[31m-- **[UVa Online Judge](https://onlinejudge.org/)**: 提供大量编程竞赛题目，适合参加ACM ICPC等竞赛的训练。[m
[31m-[m
[31m-- **[CSES Problem Set](https://cses.fi/problemset/)**: 由芬兰计算机科学教育委员会开发，提供高质量的算法和数据结构问题。[m
[31m-[m
[31m-- **[LintCode](https://www.lintcode.com/)**: 提供多种编程挑战，特别适合面试准备和刷题。[m
[31m-[m
[31m-### 其他资源[m
[31m-[m
[31m-- **[GeeksforGeeks](https://www.geeksforgeeks.org/)**: 一个非常全面的计算机科学学习资源网站，提供详细的算法和数据结构教程、面试经验分享以及编程题目解析。[m
[31m-[m
[31m-- **[Brilliant](https://www.brilliant.org/)**: 提供互动式的学习体验，涵盖算法、数据结构、数学等多个领域，适合系统性学习和思维训练。[m
[31m-[m
[31m-- **[Exercism](https://exercism.io/)**: 提供多种编程语言的练习题目，通过 mentor 的反馈和指导帮助提升编程技能。[m
[31m-[m
[31m-- **[OI-Wiki](https://oi-wiki.org/)**: 一个面向编程竞赛的中文知识库，涵盖了算法、数据结构、编程技巧等多个方面。内容详尽，适合备战各类编程竞赛以及学习和复习相关知识。[m
[31m-[m
[31m-[m
[31m-通过这些资源，你可以系统地学习算法和数据结构，提升编程能力，并为各种编程竞赛做好准备。[m
[31m-[m
[31m-## 社团宗旨[m
[31m-[m
[31m-宁波大学ACM程序设计协会以提升学生的编程水平和团队合作能力为宗旨，通过组织和参与各类编程竞赛、集训和学术活动，激发同学们对计算机科学的兴趣和热情。协会不仅关注竞赛成绩，更注重培养成员的综合素质和实际应用能力。[m
[31m-[m
[31m-## 加入我们[m
[31m-[m
[31m-如果你对计算机编程充满热情，想要提升自己的算法设计能力，参与各类程序设计竞赛，欢迎加入宁波大学ACM程序设计协会。我们期待你的加入，与我们一同挑战自我，共同进步！[m
[31m-[m
[31m----[m
[31m-[m
[31m-以上内容即为宁波大学ACM程序设计协会的社团介绍。通过这些活动和努力，我们不断提升自身能力，并在各类比赛 中取得优异成绩。期待更多志同道合的小伙伴加入我们，共同创造更多精彩！[m
[1mdiff --git a/docs/about/joinus.md b/docs/about/joinus.md[m
[1mdeleted file mode 100644[m
[1mindex d8a43d8..0000000[m
[1m--- a/docs/about/joinus.md[m
[1m+++ /dev/null[m
[36m@@ -1,110 +0,0 @@[m
[31m-# 加入我们[m
[31m-[m
[31m-## 收获[m
[31m-[m
[31m-加入宁波大学ACM程序设计协会，你将获得：[m
[31m-[m
[31m-- **计算机思维能力**：培养系统的计算机思维，提升解决复杂问题的逻辑能力。[m
[31m-- **算法应用能力**：掌握各种算法的设计与优化，在实际问题中运用自如。[m
[31m-- **复杂问题建模能力**：学会将现实世界的复杂问题抽象为可解决的计算机模型。[m
[31m-- **编码能力**：提升编写高效、清晰代码的能力，解决高难度编程问题。[m
[31m-- **团队配合能力**：在团队项目中学会协作，提升沟通和合作能力。[m
[31m-- **抗压能力**：在高强度的训练和竞赛中锻炼自己的抗压能力和心理素质。[m
[31m-[m
[31m-## 奖项[m
[31m-[m
[31m-参与我们的训练和比赛，你将有机会获得以下荣誉：[m
[31m-[m
[31m-- **ICPC**：国际大学生程序设计竞赛，享誉全球的顶级赛事。[m
[31m-- **浙江省赛**：省级A类竞赛，展示你的编程实力。[m
[31m-- **团体程序设计天梯赛**：省级B类竞赛，提升团队合作和编程水平。[m
[31m-- **CCPC**：中国大学生程序设计竞赛，全国范围的顶级竞赛。[m
[31m-- **CSP认证**：中国计算机学会程序设计认证，权威的编程能力认证。[m
[31m-- **各类算法竞赛**：丰富的竞赛机会，提升你的实战经验和技术水平。[m
[31m-[m
[31m-## 创新学分[m
[31m-[m
[31m-参与协会活动和竞赛，你将获得创新学分，助力你的学业发展，不再为学分发愁！[m
[31m-[m
[31m-## 筛选过程[m
[31m-[m
[31m-### 第一学期[m
[31m-[m
[31m-- **题单训练**：通过精心设计的题单进行刷题训练，提升编程基础能力。[m
[31m-- **院赛**：参加院级程序设计比赛，展示你的编程能力和潜力。[m
[31m-- **第一批进入集训队**：表现优异者将有机会进入我们的集训队，接受进一步的专业训练。[m
[31m-[m
[31m-### 第二学期[m
[31m-[m
[31m-- **校赛**：参与校级程序设计竞赛，进一步筛选优秀人才。[m
[31m-- **天梯赛**：参加团体程序设计天梯赛，提升团队合作和编程能力。[m
[31m-- **CSP认证**：通过CSP认证，证明你的编程实力和技术水平。[m
[31m-- **暑假**：正式入队，参加多校训练营，接受高强度、系统化的训练。[m
[31m-[m
[31m-### 第三学期及以后[m
[31m-[m
[31m-- **ICPC**：参加国际大学生程序设计竞赛，挑战全球顶级选手。[m
[31m-- **CCPC**：参与中国大学生程序设计竞赛，展示你的编程实力。[m
[31m-- **省赛**：参加浙江省程序设计竞赛，提升和展示你的编程能力。[m
[31m-[m
[31m-## 筛选要求[m
[31m-[m
[31m-- **自主训练**：通过题单刷题和线上比赛，不断提升自己的编程能力。[m
[31m-  - **题单**：刷题数量将计入最后的选拔成绩。[m
[31m-  - **线上比赛**：在Codeforces、AtCoder等平台参加比赛，积累实战经验。[m
[31m-[m
[31m-- **线下选拔赛**：通过多种线下比赛进行严格选拔。[m
[31m-  - **院赛**：参加院级比赛，展示你的编程实力。[m
[31m-  - **校赛**：参与校级比赛，进一步提升和展示你的能力。[m
[31m-  - **其他线下赛**：包括待定的其他线下选拔赛，提升综合能力。[m
[31m-[m
[31m-## 入门资源[m
[31m-[m
[31m-- **NBU-ACM新生入门过渡题单**：通过Virtual Judge ([viudge.net](https://www.viudge.net))进行题目练习。[m
[31m-- **Vjudge入门题单使用方法**：详见PDF文档，帮助你快速上手。[m
[31m-- **入门训练经验**：由[ZWH提供的详细PDF文档](/resource/guide.md)，分享宝贵的训练经验和技巧。[m
[31m-[m
[31m-## 学习资源推荐[m
[31m-[m
[31m-### 在线平台[m
[31m-[m
[31m-- **[LeetCode](https://leetcode.com/)**：提供大量算法和数据结构问题，适合从基础到进阶的练习。[m
[31m-- **[HackerRank](https://www.hackerrank.com/)**：多领域编程挑战，支持多种编程语言。[m
[31m-- **[Codeforces](https://codeforces.com/)**：竞赛编程平台，提供丰富的编程比赛和训练题目。[m
[31m-- **[AtCoder](https://atcoder.jp/)**：日本的编程竞赛平台，题目质量高，难度覆盖广泛。[m
[31m-- **[TopCoder](https://www.topcoder.com/)**：老牌竞赛平台，提供多种编程挑战和比赛。[m
[31m-- **[Kaggle](https://www.kaggle.com/)**：数据科学和机器学习竞赛平台，也有编程和算法挑战。[m
[31m-[m
[31m-### 教育平台[m
[31m-[m
[31m-- **[Coursera](https://www.coursera.org/)**：提供专业的计算机科学课程，包括算法和数据结构。[m
[31m-- **[edX](https://www.edx.org/)**：顶尖大学的在线课程，高质量的算法和数据结构课程。[m
[31m-- **[MIT OpenCourseWare](https://ocw.mit.edu/)**：麻省理工学院的开放课程，推荐《Introduction to Algorithms》。[m
[31m-[m
[31m-### 编程练习和竞赛[m
[31m-[m
[31m-- **[SPOJ (Sphere Online Judge)](https://www.spoj.com/)**：经典问题和竞赛题目，适合系统性练习。[m
[31m-- **[UVa Online Judge](https://onlinejudge.org/)**：提供大量编程竞赛题目，适合ACM ICPC训练。[m
[31m-- **[CSES Problem Set](https://cses.fi/problemset/)**：高质量的算法和数据结构问题。[m
[31m-- **[LintCode](https://www.lintcode.com/)**：面试准备和刷题的好平台。[m
[31m-[m
[31m-### 其他资源[m
[31m-[m
[31m-- **[GeeksforGeeks](https://www.geeksforgeeks.org/)**：全面的计算机科学学习资源，详尽的教程和解析。[m
[31m-- **[Brilliant](https://www.brilliant.org/)**：互动式学习平台，涵盖算法、数据结构、数学等。[m
[31m-- **[Exercism](https://exercism.io/)**：多种编程语言练习题目，通过 mentor 的反馈提升技能。[m
[31m-- **[OI-Wiki](https://oi-wiki.org/)**：中文知识库，涵盖算法、数据结构、编程技巧等，适合竞赛准备。[m
[31m-[m
[31m-## 加入我们[m
[31m-[m
[31m-### 报名表和交流群[m
[31m-[m
[31m-- **报名表**：请扫描下方二维码填写报名表，加入我们！[m
[31m-[m
[31m-![报名表](img/bmb.png)[m
[31m-[m
[31m-- **交流群**：扫码加入我们的交流群，了解更多信息！[m
[31m-[m
[31m-![交流群](img/zxq.png)[m
[31m-[m
[31m-期待你的加入，共同创造更多精彩和辉煌！[m
[1mdiff --git a/docs/api-examples.md b/docs/api-examples.md[m
[1mnew file mode 100644[m
[1mindex 0000000..6bd8bb5[m
[1m--- /dev/null[m
[1m+++ b/docs/api-examples.md[m
[36m@@ -0,0 +1,49 @@[m
[32m+[m[32m---[m
[32m+[m[32moutline: deep[m
[32m+[m[32m---[m
[32m+[m
[32m+[m[32m# Runtime API Examples[m
[32m+[m
[32m+[m[32mThis page demonstrates usage of some of the runtime APIs provided by VitePress.[m
[32m+[m
[32m+[m[32mThe main `useData()` API can be used to access site, theme, and page data for the current page. It works in both `.md` and `.vue` files:[m
[32m+[m
[32m+[m[32m```md[m
[32m+[m[32m<script setup>[m
[32m+[m[32mimport { useData } from 'vitepress'[m
[32m+[m
[32m+[m[32mconst { theme, page, frontmatter } = useData()[m
[32m+[m[32m</script>[m
[32m+[m
[32m+[m[32m## Results[m
[32m+[m
[32m+[m[32m### Theme Data[m
[32m+[m[32m<pre>{{ theme }}</pre>[m
[32m+[m
[32m+[m[32m### Page Data[m
[32m+[m[32m<pre>{{ page }}</pre>[m
[32m+[m
[32m+[m[32m### Page Frontmatter[m
[32m+[m[32m<pre>{{ frontmatter }}</pre>[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m<script setup>[m
[32m+[m[32mimport { useData } from 'vitepress'[m
[32m+[m
[32m+[m[32mconst { site, theme, page, frontmatter } = useData()[m
[32m+[m[32m</script>[m
[32m+[m
[32m+[m[32m## Results[m
[32m+[m
[32m+[m[32m### Theme Data[m
[32m+[m[32m<pre>{{ theme }}</pre>[m
[32m+[m
[32m+[m[32m### Page Data[m
[32m+[m[32m<pre>{{ page }}</pre>[m
[32m+[m
[32m+[m[32m### Page Frontmatter[m
[32m+[m[32m<pre>{{ frontmatter }}</pre>[m
[32m+[m
[32m+[m[32m## More[m
[32m+[m
[32m+[m[32mCheck out the documentation for the [full list of runtime APIs](https://vitepress.dev/reference/runtime-api#usedata).[m
[1mdiff --git a/docs/favicon.ico b/docs/favicon.ico[m
[1mdeleted file mode 100644[m
[1mindex 38903c9..0000000[m
Binary files a/docs/favicon.ico and /dev/null differ
[1mdiff --git a/docs/honor.md b/docs/honor.md[m
[1mindex 9ce70a4..60c5aaf 100644[m
[1m--- a/docs/honor.md[m
[1m+++ b/docs/honor.md[m
[36m@@ -7,77 +7,85 @@[m [mlayout: doc[m
 # 荣誉一览[m
 ## 2023-2024 赛季[m
 [m
[31m-ICPC 共计 100 金 0 银 0 铜，CCPC 共计 10 银 10 铜，省赛共计 10 金 10 银 20 铜。[m
[32m+[m[32mICPC 共计 1 金 1 银 2 铜，CCPC 共计 1 银 1 铜，省赛共计 1 金 1 银 2 铜。[m
 [m
 ### [2024-04-13 浙江省赛](https://board.xcpcio.com/provincial-contest/2024/zhejiang)[m
 [m
 | 队伍               | 队员                     | 奖项 | 排名 |[m
[31m-| :----------------- | :----------------------- | :--- | :-- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| :----------------- | :----------------------- | :--- | :--- |[m
[32m+[m[32m| 这个彬彬交题好逊哦 | 倪铂涵、金沈扬、王健彬   | 金   | 32   |[m
[32m+[m[32m| 25科软点击就送           | 杨成艺、章恒磊、郑懿     | 银   | 68   |[m
[32m+[m[32m| 在省赛寻求AC是否搞错了什么     | 崔嘉屹、杨一郎、章心阳   | 铜   | 128   |[m
[32m+[m[32m| 疾旋鼬可爱喵         | 包涵、章宇科、黄炫榕 | 铜   | 136  |[m
[32m+[m[32m| 光之创造神             | 任益超、王啸洋、饶雁   |    | 165  |[m
[32m+[m[32m| 队友做不出题就把队友做了         | 何泓硕、卢建涛、戴城浩   |    | 223  |[m
[32m+[m[32m| 403 can't AC   | 仝梦燔、周星耀、黄逸帆   |      | 234  |[m
[32m+[m[32m| 青春acm少年不会梦到妙wa种子   | 欧阳国典、陈柳、陈镇锋   |      | 235  |[m
 [m
 ### [2024-01-13 ICPC EC Final](https://board.xcpcio.com/icpc/48th/ecfinal)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬 |      | 100  |[m
 [m
 ### [2023-12-10 ICPC 杭州](https://board.xcpcio.com/icpc/48th/hangzhou)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 夜的命名术 | 章宇科、杨悦、金沈扬 |   铜   | 264  |[m
[32m+[m[32m| 在区域赛寻求AC是否搞错了什么 | 崔嘉屹、杨一郎、章心阳 |      | 320  |[m
[32m+[m[32m| ⑨这样吧 | 王啸洋、饶雁、黄炫榕 |      | 391  |[m
 [m
 ### [2023-11-26 ICPC 合肥](https://board.xcpcio.com/icpc/48th/hefei)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬 |   银   | 97  |[m
[32m+[m[32m| 浙农专旅行者 | 王家安、丁晨涛、黄伟杰 |      | 276  |[m
 [m
 ### [2023-11-12 CCPC 深圳](https://board.xcpcio.com/ccpc/9th/shenzhen)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 浙农专旅行者 | 王家安、丁晨涛、黄伟杰 |      | 155  |[m
 [m
 ### [2023-11-12 ICPC 沈阳](https://board.xcpcio.com/icpc/48th/shenyang)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬 |   金   | 27  |[m
 [m
 ### [2023-11-05 ICPC 南京](https://board.xcpcio.com/icpc/48th/nanjing)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 夜的命名术 | 章宇科、杨悦、金沈扬 |   铜   | 150  |[m
[32m+[m[32m| 带带带带花树 | 蒋文涛、顾芝瑜、巫璐璐 |      | 302  |[m
 [m
 ### [2023-11-05 CCPC 哈尔滨](https://board.xcpcio.com/ccpc/9th/harbin)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬 |   铜   | 103  |[m
 [m
 ### [2023-10-29 CCPC 桂林](https://board.xcpcio.com/ccpc/9th/guilin)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬 |   银   | 55  |[m
 [m
 ### [2023-10-22 ICPC 西安](https://board.xcpcio.com/icpc/48th/xian)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 汪汪队 | 朱强、包涵、计妙钒 |      | 268  |[m
[32m+[m[32m| A不出来 | 黄逸帆、仝梦燔、卢广翔 |      | 337  |[m
 [m
 ### [2023-10-15 CCPC 秦皇岛](https://board.xcpcio.com/ccpc/9th/qinhuangdao)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 浙农专旅行者 | 王家安、丁晨涛、黄伟杰 |      | 184  |[m
 [m
 ## 2022-2023 赛季[m
 [m
[36m@@ -87,41 +95,193 @@[m [mICPC 共计 1 金 3 银 2 铜，CCPC 共计 5 铜。省赛 3 银 4 铜。[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬 |      | 101  |[m
 [m
 ### [2023-04-15 浙江省赛](https://board.xcpcio.com/provincial-contest/2023/zhejiang)[m
 [m
 | 队伍               | 队员                     | 奖项 | 排名 |[m
 | :----------------- | :----------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| restart            | 王子超、王荣峥、郑伊磊   | 银   | 23   |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬   | 银   | 26   |[m
[32m+[m[32m| push rbp           | 杨成艺、章恒磊、郑懿     | 银   | 53   |[m
[32m+[m[32m| 今天你签到了WA     | 丁晨涛、王家安、黄伟杰   | 铜   | 94   |[m
[32m+[m[32m| 夜的命名术         | 诸葛智棱、金沈扬、黄逸帆 | 铜   | 102  |[m
[32m+[m[32m| 带花树             | 巫璐璐、蒋文涛、顾芝瑜   | 铜   | 117  |[m
[32m+[m[32m| 红葉最多情         | 张凯伦、张翕维、金汝城   | 铜   | 119  |[m
[32m+[m[32m| 两眼花花乱蛙一通   | 官洪林、沈杨阳、龚文强   |      | 139  |[m
 [m
 ### [2023-03-25 ICPC EC Final](https://board.xcpcio.com/icpc/47th/ec-final)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬 |      | 209  |[m
[32m+[m[32m| pop rbp            | 杨成艺、章恒磊、郑懿   |      | 229  |[m
 [m
 ### [2022-12-18 ICPC 南京](https://board.xcpcio.com/icpc/47th/nanjing)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| Restart            | 王子超、王荣峥、郑伊磊 | 银   | 79   |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬 | 铜   | 109  |[m
[32m+[m[32m| 403 can't AC       | 严滢、周星耀、徐昊     |      | 271  |[m
[32m+[m[32m| $\star$ 咕咕咕     | 丁煜、仝梦燔、何泓硕   |      | 409  |[m
 [m
 ### [2022-12-04 ICPC 杭州](https://board.xcpcio.com/icpc/47th/hangzhou)[m
 [m
 | 队伍           | 队员                     | 奖项 | 排名 |[m
 | :------------- | :----------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| pop rbp        | 杨成艺、章恒磊、郑懿     | 金   | 24   |[m
[32m+[m[32m| Restart        | 王子超、王荣峥、郑伊磊   | 银   | 100  |[m
[32m+[m[32m| 我想想         | 张圯、朱强、计妙钒       |      | 325  |[m
[32m+[m[32m| 致相           | 诸葛智棱、金沈扬、黄逸帆 |      | 359  |[m
[32m+[m[32m| $\star$ 带花树 | 沈博华、蒋文涛、顾芝瑜   |      | 412  |[m
 [m
 ### [2022-11-27 ICPC 济南](https://board.xcpcio.com/icpc/47th/jinan)[m
 [m
 | 队伍                         | 队员                   | 奖项 | 排名 |[m
 | :--------------------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 法式酸甜西红柿片配黄油鸡蛋粒 | 丁杭亮、章扬、邵建皓   |      | 347  |[m
[32m+[m[32m| 打铁还需自身硬               | 卢玮浩、赵锦阳、金轲   |      | 399  |[m
[32m+[m[32m| 今天你签到了 WA              | 丁晨涛、王家安、黄伟杰 |      | 131  |[m
 [m
 ### [2022-11-27 CCPC 女生](https://board.xcpcio.com/ccpc/8th/girls)[m
 [m
 | 队伍               | 队员                   | 奖项 | 排名 |[m
 | :----------------- | :--------------------- | :--- | :--- |[m
[31m-| 软件设计小组 | 朱文豪、陈炳灿、姚婉欣   | 金   | 1   |[m
[32m+[m[32m| 扔下锄头，抄起键盘 | 严滢、朱蕴仪、诸葛智棱 | 银   | 38   |[m
[32m+[m[32m| 上林赋             | 朱冰艳、胡端、龚晓雨   | 铜   | 114  |[m
[32m+[m[32m| 啊对对队           | 巫璐璐、李馨怡、葛乐乐 | 铜   | 131  |[m
[32m+[m
[32m+[m[32m### [2022-11-20 ICPC 合肥](https://board.xcpcio.com/icpc/47th/hefei)[m
[32m+[m
[32m+[m[32m| 队伍                         | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :--------------------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| 法式酸甜西红柿片配黄油鸡蛋粒 | 丁杭亮、章扬、邵建皓   |      | 323  |[m
[32m+[m[32m| 金牌菜鸟                     | 叶露仁、姜逸辉、陈昱帆 |      | 372  |[m
[32m+[m[32m| zxw 为什么是神               | 张凯伦、张翕维、金汝城 |      | 405  |[m
[32m+[m
[32m+[m[32m### [2022-11-20 CCPC 绵阳](https://board.xcpcio.com/ccpc/8th/mianyang)[m
[32m+[m
[32m+[m[32m| 队伍               | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :----------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| 翻斗幼儿园老年班   | 杨成艺、章恒磊、郑懿   | 铜   | 106  |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬 | 铜   | 137  |[m
[32m+[m
[32m+[m[32m### [2022-11-13 CCPC 广州](https://board.xcpcio.com/ccpc/8th/guangzhou)[m
[32m+[m
[32m+[m[32m| 队伍    | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :------ | :--------------------- | :--- | :--- |[m
[32m+[m[32m| Restart | 王子超、王荣峥、郑伊磊 | 铜   | 114  |[m
[32m+[m
[32m+[m[32m### [2022-11-13 ICPC 西安](https://board.xcpcio.com/ccpc/8th/guangzhou)[m
[32m+[m
[32m+[m[32m| 队伍                             | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :------------------------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| 这个彬彬交题超勇的 jb want to ac | 倪铂涵、朱蕴仪、王健彬 | 铜   | 116  |[m
[32m+[m[32m| 金牌菜鸟                         | 叶露仁、姜逸辉、陈昱帆 |      | 231  |[m
[32m+[m[32m| 两眼花花乱蛙一通                 | 官洪林、沈杨阳、龚文强 |      | 253  |[m
[32m+[m
[32m+[m[32m### [2022-11-06 ICPC 沈阳](https://board.xcpcio.com/icpc/47th/shenyang)[m
[32m+[m
[32m+[m[32m| 队伍             | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :--------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| poprbp           | 杨成艺、章恒磊、郑懿   | 银   | 86   |[m
[32m+[m[32m| 两眼花花乱蛙一通 | 官洪林、沈杨阳、龚文强 |      | 217  |[m
[32m+[m[32m| 上林赋           | 朱冰艳、胡端、龚晓雨   |      | 334  |[m
[32m+[m[32m| 403can'tac       | 严滢、周星耀、徐昊     |      | 339  |[m
[32m+[m
[32m+[m[32m### [2022-11-06 CCPC 威海](https://board.xcpcio.com/ccpc/8th/weihai)[m
[32m+[m
[32m+[m[32m| 队伍               | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :----------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| 这个彬彬交题超勇的 | 倪铂涵、朱蕴仪、王健彬 | 铜   | 108  |[m
[32m+[m
[32m+[m[32m### [2022-10-30 CCPC 桂林](https://board.xcpcio.com/ccpc/8th/guilin)[m
[32m+[m
[32m+[m[32m| 队伍             | 队员                 | 奖项 | 排名 |[m
[32m+[m[32m| :--------------- | :------------------- | :--- | :--- |[m
[32m+[m[32m| 翻斗幼儿园老年班 | 杨成艺、章恒磊、郑懿 | 铜   | 73   |[m
[32m+[m
[32m+[m[32m## 2021-2022 赛季[m
[32m+[m
[32m+[m[32mICPC 共计 3 银 4 铜；CCPC 共计 2 银 2 铜。[m
[32m+[m
[32m+[m[32m### [2022-07-27 CCPC Final](https://board.xcpcio.com/ccpc/7th/final)[m
[32m+[m
[32m+[m[32m| 队伍                 | 队员                 | 奖项 | 排名 |[m
[32m+[m[32m| :------------------- | :------------------- | :--- | :--- |[m
[32m+[m[32m| 春田花花幼儿园青春版 | 王子超、陈城、陈重喜 |      | 79   |[m
[32m+[m
[32m+[m[32m### [2022-07-20 ICPC EC Final](https://board.xcpcio.com/icpc/46th/kunming)[m
[32m+[m
[32m+[m[32m| 队伍                 | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :------------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| 翻斗幼儿园老年班     | 杨成艺、章恒磊、郑懿   | 铜   | 120  |[m
[32m+[m[32m| 春天花花幼儿园青春版 | 王子超、陈城、陈重喜   |      | 220  |[m
[32m+[m[32m| 寒窗苦读21.5年       | 朱泽华、戴振龙、盛洪涛 |      | 221  |[m
[32m+[m
[32m+[m[32m### [2022-04-17 ICPC 昆明](https://board.xcpcio.com/icpc/46th/kunming)[m
[32m+[m
[32m+[m[32m| 队伍                 | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :------------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| 临阵磨枪，不快也光   | 朱泽华、戴振龙、盛洪涛 | 银   | 67   |[m
[32m+[m[32m| 学习使我快乐         | 薛卫东、张凌赫、张烨浩 | 银   | 94   |[m
[32m+[m[32m| 楼下大哥别过题了求求 | 周宇昕、章恒磊、郑懿   |      | 376  |[m
[32m+[m[32m| 陈莲仁不容逸         | 叶露仁、姜逸辉、陈昱帆 |      | 419  |[m
[32m+[m
[32m+[m[32m### [2022-04-16 浙江省赛](https://board.xcpcio.com/provincial-contest/2022/zjcpc)[m
[32m+[m
[32m+[m[32m| 队伍                         | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :--------------------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| push %rbp                    | 任松涛、曾唯策、杨成艺 | 银   | 37   |[m
[32m+[m[32m| 学习使我快乐                 | 张凌赫、张烨浩、薛卫东 | 银   | 41   |[m
[32m+[m[32m| 寒窗苦读21.5年               | 戴振龙、朱泽华、盛洪涛 | 银   | 55   |[m
[32m+[m[32m| 春田花花幼儿园青春版         | 王子超、陈城、陈重喜   | 铜   | 77   |[m
[32m+[m[32m| 为什么jbgg是神               | 王健彬、王荣峥、郑伊磊 | 铜   | 113  |[m
[32m+[m[32m| 陈莲仁不容逸                 | 叶露仁、姜逸辉、陈昱帆 | 铜   | 133  |[m
[32m+[m[32m| 两眼花花乱蛙一通             | 官洪林、沈杨阳、龚文强 | 铜   | 134  |[m
[32m+[m[32m| yy大队                       | 严滢、朱蕴仪、杨悦     | 铜   | 135  |[m
[32m+[m[32m| 楼下大哥别过题了求求         | 周宇昕、章恒磊、郑懿   | 铜   | 144  |[m
[32m+[m[32m| 克莱曼婷                     | 夏周全、林朝帅、陈浩   |      | 160  |[m
[32m+[m[32m| 丙烯酸酯橡胶                 | 倪铂涵、徐昊、朱冰艳   |      | 164  |[m
[32m+[m[32m| 法式酸甜西红柿片配黄油鸡蛋粒 | 丁杭亮、章扬、邵建皓   |      | 188  |[m
[32m+[m[32m| $\ast$ xygg怎么失联了        | 周星耀、潘佳彬、黄义章 |      | 241  |[m
[32m+[m
[32m+[m[32m### [2022-04-03 ICPC 澳门](https://board.xcpcio.com/icpc/46th/macau)[m
[32m+[m
[32m+[m[32m| 队伍                                 | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :----------------------------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| we are iron man                      | 朱泽华、戴振龙、盛洪涛 | 铜   | 43   |[m
[32m+[m[32m| Study make us happy                  | 薛卫东、张凌赫、张烨浩 | 铜   | 51   |[m
[32m+[m[32m| studying agriculture can't save zafu | 朱蕴仪、龚文强、严滢   |      | 69   |[m
[32m+[m[32m| $\star$ Jinx Jinx                    | 倪铂涵、徐昊、沈杨阳   |      | 72   |[m
[32m+[m
[32m+[m[32m### [2021-12-04 ICPC 南京](https://board.xcpcio.com/icpc/46th/nanjing)[m
[32m+[m
[32m+[m[32m| 队伍                 | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :------------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| 春田花花幼儿园青春版 | 王子超、陈城、陈重喜   | 银   | 36   |[m
[32m+[m[32m| Aibiyoyo             | 任松涛、曾唯策、杨成艺 |      | 270  |[m
[32m+[m[32m| 遥望星空的人         | 周宇昕、章恒磊、郑懿   |      | 317  |[m
[32m+[m[32m| 克莱曼婷             | 夏周全、林朝帅、陈浩   |      | 395  |[m
[32m+[m
[32m+[m[32m### [2021-11-28 ICPC 上海](https://board.xcpcio.com/icpc/46th/shanghai)[m
[32m+[m
[32m+[m[32m| 队伍                 | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :------------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| 蛙蛙自动机           | 周源、徐放、沈晔       |      | 271  |[m
[32m+[m[32m| 123木头人            | 葛霞霞、陈允魁、陈冉杨 |      | 310  |[m
[32m+[m[32m| 楼下大哥别过题了求求 | 周宇昕、章恒磊、郑懿   |      | 317  |[m
[32m+[m[32m| 令姜                 | 严滢、朱冰艳、龚晓雨   |      | 489  |[m
[32m+[m[32m| 三徒弟救唐僧队       | 朱蕴仪、杨悦、颜亚楠   |      | 523  |[m
[32m+[m
[32m+[m[32m### [2021-11-28 CCPC 哈尔滨](https://board.xcpcio.com/ccpc/7th/harbin)[m
[32m+[m
[32m+[m[32m| 队伍                 | 队员                   | 奖项 | 排名 |[m
[32m+[m[32m| :------------------- | :--------------------- | :--- | :--- |[m
[32m+[m[32m| 春田花花幼儿园青春版 | 王子超、陈城、陈重喜   | 银   | 69   |[m
[32m+[m[32m| Aibiyoyo             | 任松涛、曾唯策、杨成艺 |      | 205  |[m
[32m+[m[32m| 蓼菜成行             | 丁杭亮、章扬、邵建皓   |      | 233  |[m
[41m+[m
[41m+[m
 [m
[1mdiff --git a/docs/public/icon/ag.PNG b/docs/icon/ag.PNG[m
[1msimilarity index 100%[m
[1mrename from docs/public/icon/ag.PNG[m
[1mrename to docs/icon/ag.PNG[m
[1mdiff --git a/docs/public/icon/bg.png b/docs/icon/bg.png[m
[1msimilarity index 100%[m
[1mrename from docs/public/icon/bg.png[m
[1mrename to docs/icon/bg.png[m
[1mdiff --git a/docs/public/icon/bg_block.png b/docs/icon/bg_block.png[m
[1msimilarity index 100%[m
[1mrename from docs/public/icon/bg_block.png[m
[1mrename to docs/icon/bg_block.png[m
[1mdiff --git a/docs/public/icon/cff/cff.svg b/docs/icon/cff/cff.svg[m
[1msimilarity index 100%[m
[1mrename from docs/public/icon/cff/cff.svg[m
[1mrename to docs/icon/cff/cff.svg[m
[1mdiff --git a/docs/public/icon/cff/lccc.svg b/docs/icon/cff/lccc.svg[m
[1msimilarity index 100%[m
[1mrename from docs/public/icon/cff/lccc.svg[m
[1mrename to docs/icon/cff/lccc.svg[m
[1mdiff --git a/docs/public/icon/cff/lg.svg b/docs/icon/cff/lg.svg[m
[1msimilarity index 100%[m
[1mrename from docs/public/icon/cff/lg.svg[m
[1mrename to docs/icon/cff/lg.svg[m
[1mdiff --git a/docs/icon/favicon.ico b/docs/icon/favicon.ico[m
[1mnew file mode 100644[m
[1mindex 0000000..e553127[m
Binary files /dev/null and b/docs/icon/favicon.ico differ
[1mdiff --git a/docs/public/icon/icpc.png b/docs/icon/icpc.png[m
[1msimilarity index 100%[m
[1mrename from docs/public/icon/icpc.png[m
[1mrename to docs/icon/icpc.png[m
[1mdiff --git a/docs/icon/logo.png b/docs/icon/logo.png[m
[1mnew file mode 100644[m
[1mindex 0000000..e553127[m
Binary files /dev/null and b/docs/icon/logo.png differ
[1mdiff --git a/docs/public/icon/nbucpc.png b/docs/icon/nbucpc.png[m
[1msimilarity index 100%[m
[1mrename from docs/public/icon/nbucpc.png[m
[1mrename to docs/icon/nbucpc.png[m
[1mdiff --git a/docs/index.md b/docs/index.md[m
[1mindex e75d9c8..e3651b5 100644[m
[1m--- a/docs/index.md[m
[1m+++ b/docs/index.md[m
[36m@@ -12,10 +12,10 @@[m [mhero:[m
   actions:[m
     - theme: brand[m
       text: 🫡加入我们[m
[31m-      link: /about/joinus[m
[32m+[m[32m      link: /basic/[m
     - theme: alt[m
       text: 🤔️关于我们[m
[31m-      link: /about/intro[m
[32m+[m[32m      link: /about/introduction[m
 [m
 features:[m
   - icon: 👋[m
[36m@@ -60,44 +60,9 @@[m [mfeatures:[m
 <div style="height: 30px;"></div>[m
 [m
 <h1>🎁我们的荣誉</h1>[m
[31m-<p>&#20;&#20;&#20;&#20;&#20;&#20;&#20;宁波大学ACM集训队自成立以来，凭借卓越的编程实力和不懈的努力，[m
[31m-斩获了众多荣誉。在省级比赛中，多次荣获<strong>浙江省程序设计大赛</strong>二、三等奖，展示了我们在省内的领先地位。[m
[31m-在全国大学生程序设计竞赛中，我们更是表现优异，屡获金奖、银奖、铜奖，并在2016年成功打入world final总决赛，[m
[31m-彰显了我们的全国竞争力。在国际赛场上，我们积极参加ACM-ICPC、CCPC等高水平赛事，成绩斐然：[m
[31m-获得国际大学生程序设计竞赛第46届昆明站铜奖、第47届沈阳站铜奖、第47届济南站铜奖、第48届西安站银奖。[m
[31m-此外，我们还在浙江省大学生程序设计竞赛和团体程序设计天梯赛中取得多项二、三等奖，[m
[31m-在宁波大学程序设计竞赛中斩获特等奖、一等奖、二等奖等十余项省级、校级奖项。这些辉煌成就不仅是对我们实力的肯定，[m
[31m-更是对我们不懈努力和团结合作精神的最佳诠释。宁波大学ACM集训队，将继续在编程竞赛的舞台上，书写更加辉煌的篇章！</p>[m
[31m-<ul>[m
[31m-    <li><strong>省赛：</strong>多次荣获浙江省程序设计大赛二、三等奖。</li>[m
[31m-    <li><strong>区域赛：</strong>在全国大学生程序设计竞赛中取得优异成绩，获银奖、铜奖，2016年打入world final总决赛。</li>[m
[31m-    <li><strong>国际竞赛表现优异：</strong>积极参加ACM-ICPC、CCPC等国际赛事，并屡获佳绩。[m
[31m-        <ul>[m
[31m-            <li>国际大学生程序设计竞赛第46届昆明站铜奖</li>[m
[31m-            <li>国际大学生程序设计竞赛第47届沈阳站铜奖</li>[m
[31m-            <li>国际大学生程序设计竞赛第47届济南站铜奖</li>[m
[31m-            <li>国际大学生程序设计竞赛第48届西安站银奖</li>[m
[31m-            <li>浙江省大学生程序设计竞赛二、三等奖多项</li>[m
[31m-            <li>团体程序设计天梯赛团队二、三等奖多项</li>[m
[31m-            <li>宁波大学程序设计竞赛特等奖、一等奖、二等奖多项等省级、校级奖项十余项</li>[m
[31m-        </ul>[m
[31m-    </li>[m
[31m-</ul>[m
[32m+[m[32m<p>我是文案</p>[m
 <Honor/>[m
 [m
 <h1>🎡我们的活动</h1>[m
[31m-<br>[m
[32m+[m[32m<p>我是文案</p>[m
 <Activities/>[m
[31m-<br>[m
[31m-<br>[m
[31m-[m
[31m-[m
[31m-[m
[31m-<h1>🌰优秀队员</h1>[m
[31m-<br>[m
[31m-<TeamMembers/>[m
[31m-[m
[31m-[m
[31m-<br>[m
[31m-<h1>🧑‍🏫指导老师</h1>[m
[31m-<TeacherList/>[m
[1mdiff --git a/docs/public/icon/favicon.ico b/docs/public/icon/favicon.ico[m
[1mdeleted file mode 100644[m
[1mindex 38903c9..0000000[m
Binary files a/docs/public/icon/favicon.ico and /dev/null differ
[1mdiff --git a/docs/public/icon/logo.png b/docs/public/icon/logo.png[m
[1mdeleted file mode 100644[m
[1mindex 14977b5..0000000[m
Binary files a/docs/public/icon/logo.png and /dev/null differ
[1mdiff --git a/docs/public/img/2024bucpc.png b/docs/public/img/2024bucpc.png[m
[1mdeleted file mode 100644[m
[1mindex a041acd..0000000[m
Binary files a/docs/public/img/2024bucpc.png and /dev/null differ
[1mdiff --git a/docs/public/img/3.png b/docs/public/img/3.png[m
[1mdeleted file mode 100644[m
[1mindex 96917e0..0000000[m
Binary files a/docs/public/img/3.png and /dev/null differ
[1mdiff --git a/docs/public/img/4.png b/docs/public/img/4.png[m
[1mdeleted file mode 100644[m
[1mindex bd7ef0e..0000000[m
Binary files a/docs/public/img/4.png and /dev/null differ
[1mdiff --git a/docs/public/img/hzwsy.jpg b/docs/public/img/hzwsy.jpg[m
[1mdeleted file mode 100644[m
[1mindex 1112d43..0000000[m
Binary files a/docs/public/img/hzwsy.jpg and /dev/null differ
[1mdiff --git a/docs/public/img/lh.png b/docs/public/img/lh.png[m
[1mdeleted file mode 100644[m
[1mindex 80e539b..0000000[m
Binary files a/docs/public/img/lh.png and /dev/null differ
[1mdiff --git a/docs/public/img/lhfxa.JPG b/docs/public/img/lhfxa.JPG[m
[1mdeleted file mode 100644[m
[1mindex 4e3f07a..0000000[m
Binary files a/docs/public/img/lhfxa.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/member/IMG_1111.JPG b/docs/public/img/member/IMG_1111.JPG[m
[1mdeleted file mode 100644[m
[1mindex 4c46df3..0000000[m
Binary files a/docs/public/img/member/IMG_1111.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/member/IMG_1112.JPG b/docs/public/img/member/IMG_1112.JPG[m
[1mdeleted file mode 100644[m
[1mindex 6c5b302..0000000[m
Binary files a/docs/public/img/member/IMG_1112.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/member/IMG_1113.JPG b/docs/public/img/member/IMG_1113.JPG[m
[1mdeleted file mode 100644[m
[1mindex 804c766..0000000[m
Binary files a/docs/public/img/member/IMG_1113.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/member/IMG_1114.JPG b/docs/public/img/member/IMG_1114.JPG[m
[1mdeleted file mode 100644[m
[1mindex 70958c9..0000000[m
Binary files a/docs/public/img/member/IMG_1114.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/member/IMG_1115.JPG b/docs/public/img/member/IMG_1115.JPG[m
[1mdeleted file mode 100644[m
[1mindex 698283c..0000000[m
Binary files a/docs/public/img/member/IMG_1115.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/member/IMG_1116.JPG b/docs/public/img/member/IMG_1116.JPG[m
[1mdeleted file mode 100644[m
[1mindex 3679b30..0000000[m
Binary files a/docs/public/img/member/IMG_1116.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/member/lhf.png b/docs/public/img/member/lhf.png[m
[1mdeleted file mode 100644[m
[1mindex 1e2a3c3..0000000[m
Binary files a/docs/public/img/member/lhf.png and /dev/null differ
[1mdiff --git a/docs/public/img/summertrain.png b/docs/public/img/summertrain.png[m
[1mdeleted file mode 100644[m
[1mindex c05364b..0000000[m
Binary files a/docs/public/img/summertrain.png and /dev/null differ
[1mdiff --git a/docs/public/img/teacher/2022zcpc.jpg b/docs/public/img/teacher/2022zcpc.jpg[m
[1mdeleted file mode 100644[m
[1mindex 3a6d43f..0000000[m
Binary files a/docs/public/img/teacher/2022zcpc.jpg and /dev/null differ
[1mdiff --git a/docs/public/img/teacher/2024bucpc.png b/docs/public/img/teacher/2024bucpc.png[m
[1mdeleted file mode 100644[m
[1mindex a041acd..0000000[m
Binary files a/docs/public/img/teacher/2024bucpc.png and /dev/null differ
[1mdiff --git a/docs/public/img/teacher/cyb.JPG b/docs/public/img/teacher/cyb.JPG[m
[1mdeleted file mode 100644[m
[1mindex 2a13ba5..0000000[m
Binary files a/docs/public/img/teacher/cyb.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/teacher/hzwsy.jpg b/docs/public/img/teacher/hzwsy.jpg[m
[1mdeleted file mode 100644[m
[1mindex 1112d43..0000000[m
Binary files a/docs/public/img/teacher/hzwsy.jpg and /dev/null differ
[1mdiff --git a/docs/public/img/teacher/img.png b/docs/public/img/teacher/img.png[m
[1mdeleted file mode 100644[m
[1mindex e06ad81..0000000[m
Binary files a/docs/public/img/teacher/img.png and /dev/null differ
[1mdiff --git a/docs/public/img/teacher/lh.png b/docs/public/img/teacher/lh.png[m
[1mdeleted file mode 100644[m
[1mindex 80e539b..0000000[m
Binary files a/docs/public/img/teacher/lh.png and /dev/null differ
[1mdiff --git a/docs/public/img/teacher/lhfxa.JPG b/docs/public/img/teacher/lhfxa.JPG[m
[1mdeleted file mode 100644[m
[1mindex 4e3f07a..0000000[m
Binary files a/docs/public/img/teacher/lhfxa.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/teacher/summertrain.png b/docs/public/img/teacher/summertrain.png[m
[1mdeleted file mode 100644[m
[1mindex c05364b..0000000[m
Binary files a/docs/public/img/teacher/summertrain.png and /dev/null differ
[1mdiff --git a/docs/public/img/teacher/xy.png b/docs/public/img/teacher/xy.png[m
[1mdeleted file mode 100644[m
[1mindex 307a36a..0000000[m
Binary files a/docs/public/img/teacher/xy.png and /dev/null differ
[1mdiff --git a/docs/public/img/zwhjn.JPG b/docs/public/img/zwhjn.JPG[m
[1mdeleted file mode 100644[m
[1mindex 7ad1223..0000000[m
Binary files a/docs/public/img/zwhjn.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/zwhnj.JPG b/docs/public/img/zwhnj.JPG[m
[1mdeleted file mode 100644[m
[1mindex 8da54de..0000000[m
Binary files a/docs/public/img/zwhnj.JPG and /dev/null differ
[1mdiff --git a/docs/public/img/zwhqhd.JPG b/docs/public/img/zwhqhd.JPG[m
[1mdeleted file mode 100644[m
[1mindex f121aed..0000000[m
Binary files a/docs/public/img/zwhqhd.JPG and /dev/null differ
[1mdiff --git a/docs/resource/basic.md b/docs/resource/basic.md[m
[1mdeleted file mode 100644[m
[1mindex fbcf81d..0000000[m
[1m--- a/docs/resource/basic.md[m
[1m+++ /dev/null[m
[36m@@ -1,146 +0,0 @@[m
[31m-# 倍增法[m
[31m-[m
[31m-## **定义**[m
[31m-[m
[31m-倍增法（英语：binary lifting），顾名思义就是翻倍。它能够使线性的处理转化为对数级的处理，大大地优化时间复杂度。[m
[31m-[m
[31m-## **应用**[m
[31m-[m
[31m-倍增最常见的应用就是求最近公共祖先 \((Lowest Common Ancestor，LCA)\) 问题和区间最值问题 $(Range Max Question，RMQ)$ 。[m
[31m-[m
[31m-## **LCA**[m
[31m-[m
[31m-### **朴素算法**[m
[31m-[m
[31m-先将两个节点移动到同一层，然后让两个节点一步一步向上跳，直到两点相遇，时间复杂度为树的高度$O(h)$ 。当我们进行 $m(m < 1e6)$ 次查询，且节点个数 $n < 1e3$ 时，朴素算法效率就很低了，复杂度是 $O(mh)$。[m
[31m-[m
[31m-我们可以做一下简单的优化，将每个节点的每个祖先都记录下来，用数组 $f[i][j]$ 记录，$f[i][j]$ 表示第 $i$ 个节点的第 $j$ 个祖先，这样每次查询都是 $O(1)$ ，最后复杂度是 $O(n^2+m)$ ，空间复杂度是 $O(n^2)$。但是当 $n < 1e5$ 时，这样空间和时间都要超。[m
[31m-[m
[31m-[m
[31m-### **倍增**[m
[31m-[m
[31m-倍增是对朴素算法的优化，从原来的一步一步跳变为每次跳 $2^j$ 步。比如说我们要向上走 $11$ 步可以找到最近公共祖先，我们把 $11$ 写成二进程的形式 $(1011)_2$ ，我们就可以分成三次走，分别走 $2^3,2^1,2^0$ 步。因为我们每次只会走 $2$ 幂次步，那么对于每个节点，我们就不必记录其所有祖先，而只记录其 $2$ 的幂次的祖先，这样就减少了很多不必要的计算。同时我们 $f[i][j]$ 的含义变为第 $i$ 个节点的第 $2^j$ 的祖先[m
[31m-[m
[31m-现在就要想办法求出 $f[i][j]$ 数组。[m
[31m-[m
[31m-倍增求 $LCA$ 实现每次跳 $2^j$ 步的核心思想就是第 $i$ 个节点的第 $2^j$ 的祖先是 $i$ 节点的第 $2^{j-1}$ 的祖先的第 $2^{j-1}$ 的祖先。也就是说将 $2^j$ 步拆成两个 $2^{j - 1}$ 步来走。根据这个思路，我们可以写出递推式：[m
[31m-[m
[31m-$$[m
[31m-f[i][j]=f[f[i][j-1]][j-1][m
[31m-$$[m
[31m-[m
[31m-有了 $f$ 数组后，就可以求 $LCA$ 了，对于两个节点 $x,y$，我们首先要将两个节点移动到同一深度的位置，这样可以让两个节点一起向上走。移动到同一深度后，我们每次就要走尽可能大的步，但是又要保证两点走后不重合，直到两点不能走为止，此时它们的最近公共祖先就是它们的父节点，即 $f[x][0]\space or \space f[y][0]$ 。[m
[31m-[m
[31m-倍增求 $LCA$ 模板:[m
[31m-[m
[31m-```cpp[m
[31m-const int MAX = 1e6;[m
[31m-// dep[i]表示节点i的深度[m
[31m-int dep[MAX];[m
[31m-// dp[i][j]表示节点i第2^j的父节点[m
[31m-int dp[MAX][32];[m
[31m-// 邻接表存树[m
[31m-vector<int> s[MAX];[m
[31m-[m
[31m-//时间复杂度O(n)[m
[31m-void dfs(int v, int fa) {[m
[31m-    dep[v] = dep[fa] + 1;[m
[31m-    dp[v][0] = fa;[m
[31m-    //dp[i][j]代表第i个节点的第2^i个祖先[m
[31m-    //第i个节点的第2^i个祖先是第i个节点的第2^(i-1)个节点的2^(i-1)个节点[m
[31m-    //递推公式:dp[i][j]=dp[dp[i][j-1]][j-1];[m
[31m-    for (int i = 1; (1 << i) <= dep[v]; ++i)[m
[31m-        dp[v][i] = dp[dp[v][i - 1]][i - 1];[m
[31m-    //遍历子节点[m
[31m-    for (int i = 0; i < s[v].size(); ++i) {[m
[31m-        //不能回到父节点[m
[31m-        if (s[v][i] == fa)continue;[m
[31m-        dfs(s[v][i], v);[m
[31m-    }[m
[31m-}[m
[31m-[m
[31m-int lca(int x, int y) {[m
[31m-    //将深度较大的节点换到x上，就不用分类讨论了[m
[31m-    if (dep[x] < dep[y])swap(x, y);[m
[31m-    //计算出两个节点的高度差，将两个节点移到同一层[m
[31m-    int tmp = dep[x] - dep[y];[m
[31m-    //移动的过程和快速幂类似，将高度差按二进制位分解[m
[31m-    for (int i = 0; tmp; ++i) {[m
[31m-        //二进制位为1的，就移动相应步[m
[31m-        if ((tmp & (1 << i))) {[m
[31m-            x = dp[x][i];[m
[31m-            tmp ^= (1 << i);[m
[31m-        }[m
[31m-    }[m
[31m-    if (y == x)return x;[m
[31m-    //两个节点一起移动[m
[31m-    for (int i = 29; i >= 0; --i) {[m
[31m-        //移动要满足移动后两节点不重合，并且在最大步数范围内[m
[31m-        if ((1 << i) <= dep[x] && dp[x][i] != dp[y][i]) {[m
[31m-            x = dp[x][i];[m
[31m-            y = dp[y][i];[m
[31m-        }[m
[31m-    }[m
[31m-    return dp[x][0];[m
[31m-}[m
[31m-```[m
[31m-[m
[31m-## **RMQ**[m
[31m-[m
[31m-### **简介**[m
[31m-[m
[31m-$ST$ 表($Sparse Table$，稀疏表)是一种利用倍增思想来处理可重复贡献问题的数据结构。[m
[31m-[m
[31m->可重复贡献问题：$x\space opt\space x=x$，即对于问题的答案，不会因多计算几次 $x$ ，而改变，例如 $MRQ$ 问题、区间 $gcd$ 问题，他们满足 $max(x,x)=x$，$gcd(x,x)=x$。另外 $opt$ 操作要满足结合律，即运算的顺序不会对最终结果产生影响。[m
[31m-[m
[31m-**[【模板题】ST 表](https://www.luogu.com.cn/problem/P3865)**[m
[31m-[m
[31m-该模板是一个经典的 $RMQ$ 问题。[m
[31m-[m
[31m-暴力做法的话就是每次查询都遍历区间 $[l,r]$ ，来求最大值，这样很显然会超时。[m
[31m-[m
[31m-### **倍增**[m
[31m-[m
[31m-我们只记录区间 $[i,2^j]$ 的最大值，这样可以用 $O(n\lg n)$ 的时间复杂度来预处理，每次查询的时间复杂度就是 $O(\lg n)$ 。我们用表 $st[i][j]$ 来表示 $[i,2^j]$ 的区间最大值，初始状态是：[m
[31m-[m
[31m-$$[m
[31m-st[i][0]=a_i[m
[31m-$$[m
[31m-[m
[31m-根据定义我们很容易写出倍增的递推公式[m
[31m-[m
[31m-\[[m
[31m-st[i][j]=max\{ st[i][j-1],st[i+2^{j-1}][j-1]\}[m
[31m-\][m
[31m-[m
[31m-查询的过程就和 $LCA$ 问题类似，我们利用 $ST$ 表从 $l$ 移动到 $r$ 即可。[m
[31m-[m
[31m-倍增求 ST 表模板：[m
[31m-[m
[31m-```cpp[m
[31m-const int MAX = 1e6;[m
[31m-// 元素个数[m
[31m-int n;[m
[31m-int a[MAX];[m
[31m-// st[i][j]表示从i开始2^j的区间内的最大值[m
[31m-int st[MAX][32];[m
[31m-void init() {[m
[31m-    //st表初始化，st[i][0]=a[i][m
[31m-    for (int i = 1; i <= n; ++i) [m
[31m-        st[i][0] = a[i];[m
[31m-    //利用递推公式求解 st 表[m
[31m-    for (int j = 1; j < 30; ++j) [m
[31m-        for (int i = 1; i + (1 << j)-1 <= n; ++i) [m
[31m-            st[i][j] = max(st[i][j - 1], st[i + (1 << (j - 1))][j - 1]);[m
[31m-}[m
[31m-[m
[31m-int ask(int l, int r) {[m
[31m-    int rg = r - l + 1, res = -1;[m
[31m-    //利用 st 表每次移动 2^j 步，找到最大值即可[m
[31m-    for (int i = 0; l + (1 << i) - 1 <= r; ++i) [m
[31m-        if (rg & (1 << i)) [m
[31m-            res = max(res, st[l][i]),[m
[31m-            rg ^= (1 << i), l += (1 << i);[m
[31m-    return res;[m
[31m-}[m
[31m-```[m
[1mdiff --git a/docs/resource/cybnote.md b/docs/resource/cybnote.md[m
[1mdeleted file mode 100644[m
[1mindex 8458205..0000000[m
[1m--- a/docs/resource/cybnote.md[m
[1m+++ /dev/null[m
[36m@@ -1,11 +0,0 @@[m
[31m-# 个人算法学习笔记 by cyb[m
[31m-[m
[31m-分享学习到的各种数据结构和算法，数据结构和算法相关代码由 C/C++ 、Python 实现。[m
[31m-[m
[31m-详细链接见[数据结构与算法笔记](https://2418071565.github.io/DS_Algo/)[m
[31m-[m
[31m-其中示例文件见：[m
[31m-+ [倍增法](basic)[m
[31m-+ [背包问题](knacksack)[m
[31m-+ [线段🌲](segtr)[m
[31m-+ [图](graph)[m
[1mdiff --git a/docs/resource/graph.md b/docs/resource/graph.md[m
[1mdeleted file mode 100644[m
[1mindex dfdb155..0000000[m
[1m--- a/docs/resource/graph.md[m
[1m+++ /dev/null[m
[36m@@ -1,72 +0,0 @@[m
[31m-# 图的操作[m
[31m-[m
[31m-想要对一个图进行操作，首先要将其按照一定的形式存储起来，不同的存储方式有不同特点，适用于不同的场景[m
[31m-[m
[31m-## **直接存边**[m
[31m-[m
[31m-使用一个数组直接来存储边的信息，即起点、终点和边权[m
[31m-[m
[31m-```cpp[m
[31m-struct edge {[m
[31m-    int u;//起点[m
[31m-    int v;//终点[m
[31m-    int w;//边权[m
[31m-}edge[MAX];[m
[31m-```[m
[31m-遍历的太低效，一般用来辅助其他算法[m
[31m-[m
[31m-## **邻接矩阵**[m
[31m-[m
[31m-用一个二维数组$edge$来存边，$edge[u][v]$表示为从节点$u$到节点$v$的边权[m
[31m-```cpp[m
[31m-int edge[MAX][MAX];[m
[31m-```[m
[31m-优点：查询边的时间复杂度为$O(1)$[m
[31m-缺点：空间复杂度太高了$O(n^2)$，比较适用于稠密图或节点较少的图[m
[31m-[m
[31m-## **邻接表**[m
[31m-[m
[31m-一般的定义邻接表是用链表实现的，但是链表实现起来比较复杂，也没有动态数组效率，所以这里就直接用动态数组来实现了[m
[31m-[m
[31m-使用动态二维数组来存储每个节点的邻接点[m
[31m-```cpp[m
[31m-vector<int> edge[MAX];[m
[31m-```[m
[31m-存各种图都很适合，除非有特殊需求（如需要快速查询一条边是否存在，且点数较少，可以使用邻接矩阵）[m
[31m-[m
[31m-尤其适用于需要对一个点的所有出边进行排序的场合[m
[31m-[m
[31m-## **链式前向星**[m
[31m-[m
[31m-与邻接表类似，但是是用两个数组实现的。[m
[31m-[m
[31m-```cpp[m
[31m-//邻接边信息[m
[31m-struct ed {[m
[31m-    int to;         //边的终点[m
[31m-    int next;       //下一个邻接边在边数组的下标[m
[31m-    int w;          //边的权值[m
[31m-}edge[MAX];         //存储边的数组[m
[31m-[m
[31m-int head[MAX];      //存储节点头[m
[31m-int tot = 0;        //标识一个新的边节点[m
[31m-[m
[31m-//插入新边[m
[31m-void addEdge(int u, int v,int w) {[m
[31m-    edge[tot].to = v;           //记录边的终点[m
[31m-    edge[tot].next = head[u];   //相当于链表头插[m
[31m-    edge[tot].w = w;            //记录边的权值[m
[31m-    head[u] = tot++;            //更新节点头[m
[31m-}[m
[31m-```[m
[31m-#### 思路[m
[31m-与邻接表不同的是，**链式前向星**是存储邻接边的。[m
[31m-[m
[31m-如下图，就是一个有向图转化为链式前向星的大致结构图。我用不同颜色表示的不同节点的邻接边。[m
[31m-[m
[31m-![Image title](img/01.png)[m
[31m-[m
[31m-[m
[31m-所有的边都存储在一个数组中，并且可以通过结构体的$next$属性索引到同一个节点的所有邻接边，所以我们只需要记录一个邻接边的下标即可。[m
[31m-[m
[31m-$head[u]$就表示编号为$u$的节点的一个邻接边（其实是最后一个插入的邻接边，因为只有最后以邻接边才能索引前面所有的邻接边），我们可以把它就看成链表的头，每次插入边�