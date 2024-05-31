<template>
    <div>
        <el-container style="height: 500px;">
            <!-- 表头 -->
            <el-header style="font-size: 40px; background-color: #b0c4de9e; display: flex; justify-content: space-between; height: 18%">
              <img :src="logoImg" style=" width: 35%; margin-top: 5px; margin-bottom: 5px">
              <el-button type="text" @click="goToRootRoute" style="color: slategray">回到首页</el-button>
            </el-header>
            <el-container>
                <!-- 左侧 -->
                <el-aside width="250px" class="custom-aside">
                    <el-menu :default-openeds="['1']">
                        <el-submenu index="1">
                            <template slot="title"><i class="el-icon-message"> NBUACM </i></template>
                            <el-menu-item-group>

                              <el-menu-item class="el-icon-s-data" index="1-1" @click="handleMenuSelect(0)"> 排名 </el-menu-item>

                              <el-menu-item class="el-icon-s-claim" index="1-2" @click="handleMenuSelect(1)"> 训练 </el-menu-item>
                               
                              <el-menu-item class="el-icon-s-opportunity" index="1-3" @click="handleMenuSelect(2)"> 题目 </el-menu-item>
                               
                              <el-menu-item class="el-icon-s-custom" index="1-4" @click="handleMenuSelect(3)"> 人员管理 </el-menu-item>
                              
                              <el-menu-item class="el-icon-setting" index="1-5" @click="handleMenuSelect(4)"> 设置 </el-menu-item>
                              
                              <el-menu-item class="el-icon-s-management" index="1-6" @click="handleMenuSelect(5)"> 荣誉墙编辑 </el-menu-item>

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
            { name: '排名', url: '/admin/ranking' },
            { name: '训练', url: '/admin/ProblemList'},
            { name: '题目', url: '/admin/Problem' },
            { name: '人员管理', url: '/admin/Member' },
            { name: '设置', url: '/admin/Setting'},
            { name: '荣誉墙编辑', url: '/admin/Hornour' },
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

.custom-aside {
  width: 100%;
  height: 208%;
  /* background-color: #f5f5f5; 选择你喜欢的背景颜色 */
  border-right: 1px solid #ebebeb; /* 右侧添加边框，颜色可调整 */
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
}
</style>