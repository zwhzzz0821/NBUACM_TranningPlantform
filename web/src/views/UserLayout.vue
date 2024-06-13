<template>
    <div>
        <el-container style="height: 500px;">
            <!-- 表头 -->
            <el-header style="font-size: 40px; background-color: #b0c4de9e; display: flex; align-items: center; height: 18%; padding: 0 20px;">
                <img :src="logoImg" style="width: 35%; margin: 5px;">
                <!-- 使用flex: 1确保头像在最右端 -->
                <div style="flex: 1;"></div>
                <!-- el-dropdown用于创建下拉列表 -->
                <el-dropdown @command="handleCommand">
                  <!-- el-avatar作为下拉触发元素 -->
                  <el-avatar :size="50" :src="$store.state.userInfo.imageURL" style="margin: 0 20px;">
                    <!-- 下拉箭头 -->
                    <i class="el-icon-arrow-down el-icon--right"></i>
                  </el-avatar>
                  <el-dropdown-menu slot="dropdown">
                    <!-- 下拉菜单项 -->
                    <el-dropdown-item command="1">个人资料</el-dropdown-item>
                    <el-dropdown-item command="2">设置</el-dropdown-item>
                    <el-dropdown-item divided command="3">退出登录</el-dropdown-item>
                  </el-dropdown-menu>
                </el-dropdown>
            </el-header>
            <el-container>
                <!-- 左侧 -->
                <el-aside width="13%" class="custom-aside">
                    <el-menu :default-openeds="['1']">
                        <el-submenu index="1">
                            <template slot="title"><i class="el-icon-message" style="margin-top: 15%;"> NBUACM </i></template>
                            <el-menu-item-group>

                              <el-menu-item class="el-icon-s-data" index="1-1" @click="handleMenuSelect(0)"> 排名 </el-menu-item>

                              <el-menu-item class="el-icon-s-claim" index="1-2" @click="handleMenuSelect(1)"> 比赛 </el-menu-item>
                               
                              <el-menu-item class="el-icon-s-opportunity" index="1-3" @click="handleMenuSelect(2)"> 题目 </el-menu-item>
                               
                              <el-menu-item class="el-icon-s-custom" index="1-4" @click="handleMenuSelect(3)"> 用户列表 </el-menu-item>
                              
                              <el-menu-item class="el-icon-s-tools" index="1-5" @click="handleMenuSelect(4)"> 设置 </el-menu-item>

                              <el-menu-item class="el-icon-info" index="1-6" @click="handleMenuSelect(5)"> 个人资料 </el-menu-item>
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
  import logoImg from "../assets/qwq.png"
  export default{
    data() {
      return {
        logoImg: logoImg,
        tabs: [ 
            { name: '排名', url: '/user/ranking' },
            { name: '比赛', url: '/user/ProblemList'},
            { name: '题目', url: '/user/problem' },
            { name: '用户列表', url: '/user/userList' },
            { name: '设置', url: '/user/setting'},
            { name: '个人资料', url: '/user/individual' },
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
      },
      // 处理下拉菜单命令
      handleCommand(command) {
        switch (command) {
          case '1':
            const route = "/user/individual";
            this.$router.push(route);
            break;
          case '2':
            this.$router.push(this.tabs[4].url);
            break;
          case '3':
            // 处理退出登录点击事件
            this.logout();
            break;
          default:
            break;
        }
      },
      // 退出登录的方法
      logout() {
        this.$store.state.uid=-1;
        this.$store.state.userInfo={};
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

.custom-aside {
  width: 100%;
  height: 100%;
  /* background-color: #f5f5f5; 选择你喜欢的背景颜色 */
  border-right: 1px solid #ebebeb; /* 右侧添加边框，颜色可调整 */
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
}
</style>