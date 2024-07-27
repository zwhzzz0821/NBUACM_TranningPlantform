<template>
    <div>
        <el-button type="primary" @click="routerBack">返回</el-button>
        <el-container style="width: 100%; margin: 15px;">
            <el-card style="width: 200%; margin: 0px">
                <el-form label-width="80px" :model="notice">
                    <el-form-item label="发布人">
                        <el-input v-model="notice.author" disabled></el-input>
                    </el-form-item>
                    <el-form-item label="主题">
                        <el-input v-model="notice.title"></el-input>
                    </el-form-item>
                </el-form>
            </el-card>
        </el-container>
    
        <el-container style="width: 100%; margin: 15px">
              <v-md-editor v-model="notice.info" height="px"></v-md-editor>
              <el-button type="primary" @click="createNotice">创建新通知</el-button>
        </el-container>
    </div>
</template>
      
<script>
import { Toast } from "vant";
import request from "../../util/request"
import { MathJax } from 'mathjax-vue'
export default {
    data() {
        return {
            notice: {},
            uid: null, 
            problem: null,
            rating: 0,
            blogText: "",
            NewInfo: "",
            id: 0,   //这个是通知的id
            title:""
        }
    },
    methods: {

        createNotice() {
            request.post('/Notice/addNew', {
                author:this.notice.author,
                date:this.GetNowTimeStamp(),
                title:this.notice.title,
                info:this.notice.info
            }).then(res => {
                if(res.code === 200) {
                    Toast.success("创建成功");
                    this.jumpToAdminNoticeList()
                } else {
                    Toast.fail("创建失败");
                }
            });
        },

        GetNowTimeStamp() {
            return Math.floor(Date.now() / 1000); // 获取当前时间的10位时间戳
        },

        jumpToAdminNoticeList() {
            // this.$router.push({ path: '/admin/adminNotice' });  //跳转回通知页面
            this.routerBack()  //还是直接用back吧
        },

        routerBack() {
            this.$router.back()
        },

    },
    components: {
        MathJax,
    },
    created() {
        // console.log("store:",this.$store.state.userInfo)
        this.notice.author = this.$store.state.userInfo.username;

    },
}
</script>
    
<style scoped>
.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
</style>