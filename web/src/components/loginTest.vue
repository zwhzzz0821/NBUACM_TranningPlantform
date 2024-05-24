<template>
    <el-container>

        <el-header>
            <el-button @click="loginTest">登录测试</el-button>
        </el-header>


    </el-container> 
</template>

<script>
export default {
    data() {
        return {
            userInfo:{},
            
        }
    },
    methods:{
        loginTest() {
            this.$store.state.uid = "226001634";
        },
        getUserInfo(){
            request.get('/user/getuser', {
                uid:this.$store.state.uid
            }).then(res => {
                this.userInfo = res.user;
            });

        },
    },
    mouted() {

    },
    watch:{
        
    }
}


</script>