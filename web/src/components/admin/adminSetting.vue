<template>
<div>
    <div class="block"><el-avatar :size="50" :src="userInfo.imageURL"></el-avatar></div>
    <el-radio-group v-model="labelPosition" size="small">
        <el-radio-button label="left">左对齐</el-radio-button>
        <el-radio-button label="right">右对齐</el-radio-button>
        <el-radio-button label="top">顶部对齐</el-radio-button>
    </el-radio-group>
    <div style="margin: 20px;"></div>
    <el-form :label-position="labelPosition" label-width="80px" :model="userInfo">
    <el-form-item label="uid/学号">
        <el-input v-model="userInfo.uid" disabled></el-input>
    </el-form-item>
    <el-form-item label="密码">
        <el-input v-model="userInfo.password" disabled></el-input>
    </el-form-item>
    <el-form-item label="姓名">
        <el-input v-model="userInfo.username" disabled></el-input>
    </el-form-item>
    <el-form-item label="CF名称">
        <el-input v-model="userInfo.codeforceshandle" disabled></el-input>
    </el-form-item>
    <el-form-item label="手机号">
        <el-input v-model="userInfo.phone" disabled></el-input>
    </el-form-item>
    <el-form-item label="邮箱">
        <el-input v-model="userInfo.email" disabled></el-input>
    </el-form-item>
    <el-form-item label="性别">
        <el-input v-model="userInfo.gender" disabled></el-input>
    </el-form-item>


    </el-form>

    <!-- 触发修改个人信息的按钮 -->
    <el-button type="primary" @click="openDialog">修改个人信息</el-button>
    <!-- 修改个人信息的对话框 -->
    <el-dialog :visible.sync="dialogVisible" title="修改个人信息">
        <el-form :model="userInfoForm" label-width="100px">
            <el-form-item label="uid/学号">
                <el-input v-model="userInfoForm.uid" disabled></el-input>
            </el-form-item>
            <el-form-item label="密码">
                <el-input v-model="userInfoForm.password"></el-input>
            </el-form-item>
            <el-form-item label="姓名">
                <el-input v-model="userInfoForm.username"></el-input>
            </el-form-item>
            <el-form-item label="CF名称">
                <el-input v-model="userInfoForm.codeforceshandle"></el-input>
            </el-form-item>
            <el-form-item label="手机号">
                <el-input v-model="userInfoForm.phone"></el-input>
            </el-form-item>
            <el-form-item label="邮箱">
                <el-input v-model="userInfoForm.email"></el-input>
            </el-form-item>
            <el-form-item label="性别">
                <el-radio-group v-model="userInfoForm.gender">
                    <el-radio label="男"></el-radio>
                    <el-radio label="女"></el-radio>
                </el-radio-group>
            </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
            <el-button @click="dialogVisible = false">取消</el-button>
            <el-button type="primary" @click="saveUserInfo">保存</el-button>
        </span>
    </el-dialog>

</div>
</template>
<script>
import request from "../../util/request";
import { Toast } from 'vant';
export default {
    data() {
        return {
            dialogVisible: false, // 控制对话框显示
            userInfoForm: {}, // 修改个人信息用的表单数据绑定
            labelPosition: 'right',
            userInfo:{},
        }
    },
    methods:{
        openDialog() {
            // 显示对话框前，复制userInfo到userInfoForm
            this.userInfoForm = Object.assign({}, this.userInfo);
            this.dialogVisible = true;
        },
        saveUserInfo() {
            // 这里添加保存用户信息的逻辑
            // 例如，你可以在这里调用API来更新服务器上的信息
            console.log('更新用户信息:', this.userInfoForm);
            
            request.post('/user/changeuserinfo',this.userInfoForm).then(res => {
                console.log("res:",res);
                // 更新成功后，关闭对话框
                this.dialogVisible = false;
                this.getUserInfo();
            });
        },
        getUserInfo() {
            request.get('/user/getuser',{
                params:{
                    uid:this.$store.state.userInfo.uid
                }
            }).then(res => {
                this.userInfo = res.user;
                this.updateStoreUserInfo();
            });
        },
        updateStoreUserInfo() {
            this.$store.state.userInfo = this.userInfo;
        },
    },
    created() {
        
    },
    mounted() {
        this.getUserInfo();
    },
    watch:{
        
    }
}

</script>
<style scoped>

</style>