<template>
    <div>
        <el-container style="height: 500px;">
            <!-- 表头 -->
            <el-header style="font-size: 40px; background-color: #b0c4de9e; display: flex; justify-content: space-between; height: 70px">
              <img :src="logoImg" style=" width: 88px; margin-top: 5px; margin-bottom: 5px">
              <el-button type="text" @click="goToRootRoute" style="color: slategray">回到首页</el-button>
            </el-header>
            <el-container>
                <!-- 左侧 -->
                <el-aside width="250px">
                    <el-menu :default-openeds="['1']">
                        <el-submenu index="1">
                            <template slot="title"><i class="el-icon-message"> NBUACM </i></template>
                            <el-menu-item-group>

                              <el-menu-item class="el-icon-s-data" index="1-1" @click="handleMenuSelect(0)"> 排名 </el-menu-item>

                              <el-menu-item class="el-icon-s-claim" index="1-2" @click="handleMenuSelect(1)"> 比赛 </el-menu-item>
                               
                              <el-menu-item class="el-icon-s-opportunity" index="1-3" @click="handleMenuSelect(2)"> 题目 </el-menu-item>
                               
                              <el-menu-item class="el-icon-s-comment" index="1-4" @click="handleMenuSelect(3)"> 博客 </el-menu-item>
                              
                              <el-menu-item class="el-icon-s-custom" index="1-5" @click="handleMenuSelect(4)"> 用户列表 </el-menu-item>
                              
                              <el-menu-item class="el-icon-setting" index="1-6" @click="handleMenuSelect(5)"> 设置 </el-menu-item>
                              
                              <el-menu-item class="el-icon-s-management" index="1-7" @click="handleMenuSelect(6)"> 荣誉墙 </el-menu-item>

                              <el-menu-item class="el-icon-s-test" index="1-8" @click="handleMenuSelect(7)"> 个人用户 </el-menu-item>

                              <el-menu-item class="el-icon-s-test" index="1-9" @click="handleMenuSelect(8)"> 登录测试 </el-menu-item>

                              <el-menu-item class="el-icon-s-test" index="1-10" @click="handleMenuSelect(9)"> 题单 </el-menu-item>
                            </el-menu-item-group>
                        </el-submenu>
                    </el-menu>
                </el-aside>
                <!-- 主体 -->
                <el-main >
                  <router-view></router-view>
                </el-main>
            </el-container>
        </el-container>
    </div>
  </template>
  
<script>
  import logoImg from "../assets/logo.png"
  export default{
    data() {
      return {
        logoImg: logoImg,
        tabs: [ 
            { name: '排名', url: '/user/ranking' },
            { name: '比赛', url: '/user/competition'},
            { name: '题目', url: '/user/problem' },
            { name: '博客', url: '/user/blog' },
            { name: '用户列表', url: '/user/userList' },
            { name: '设置', url: '/user/setting'},
            { name: '荣誉墙', url: '/user/honor' },
            { name: '个人用户', url: '/user/individual' },
            { name: '登录测试', url: '/user/loginTest'},
            { name: '题单',url: '/user/problemLists'},
        ]
      }
    },
    methods: {
      handleMenuSelect(index) {
        console.log(index)
        // console.log(this.tabs[0].name)
        const route = this.tabs[index].url;
        this.$router.push(route);
      },
      goToRootRoute() {
        this.$router.replace('/');
      }
    },
  }
  </script>
  <style>
  .el-aside::-webkit-scrollbar {
    display: none;
  }
  .el-menu{
   border:0!important;
  }
    /* 调整el-menu的宽度和高度 */
    .el-menu {
    width: 200px; /* 根据需要调整宽度 */
    height: auto; /* 可以设置为自动高度，或设置具体数值 */
  }

  /* 调整el-menu-item的字体大小 */
  .el-menu-item {
    font-size: 16px; /* 根据需要调整字体大小 */
  }

  /* 调整el-submenu的字体大小 */
  .el-submenu .el-submenu__title,
  .el-submenu .el-menu-item-group > .el-submenu__title,
  .el-submenu .el-menu-item-group > .el-menu-item {
    font-size: 16px; /* 根据需要调整字体大小 */
  }
</style>