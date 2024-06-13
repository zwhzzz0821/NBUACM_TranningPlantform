<template>
<div>
    <el-table :data="notices" style="width: 100%">
        <el-table-column type="expand">
            <template slot-scope="props">
                <el-form label-position="left" inline class="demo-table-expand">
                    <el-form-item label="内容">
                        <span>{{ props.row.info }}</span>
                    </el-form-item>
                </el-form>
            </template>
        </el-table-column>
        <el-table-column
        label="ID"
        prop="id">
        </el-table-column>
        <el-table-column
        label="发布人"
        prop="author">
        </el-table-column>
        <el-table-column label="更新时间" prop="date">
            <template slot-scope="props">
                <span>{{ $formatTime(props.row.date) }}</span>
            </template>
        </el-table-column>
        <el-table-column
        label="主题"
        prop="title">
        </el-table-column>
        <el-table-column label="操作">
            <template slot-scope="props">
                <div>
                    <el-button type="primary" @click="deleteNotice(props.row)" class="niceButton5">删除</el-button>
                    <el-button type="primary" @click="JumpTpUpdateNotice(props.row)" class="niceButton5">编辑</el-button>
                </div>
            </template>
        </el-table-column>
    </el-table>


</div>
</template>

<script>
import request from "../../util/request";
import { Toast } from 'vant';
export default {
    data() {
        return {
            notices:[],
        }
    },
    methods:{
        
        getAllNotices() {
            request.get('/Notice/getAll').then(res => {
                this.notices = res.notices;
                console.log("notices:",this.notices);
            });
        },

        deleteNotice(row) {
            console.log("row",row)
            request.post('/Notice/deleteOne', {
                id:row.id
            }).then(res => {
                if(res.code === 200) {
                    Toast.success("删除用户成功");
                } else {
                    Toast.fail("删除用户失败");
                }
            })
        },

        JumpTpUpdateNotice(row) {
            this.$router.push({ path: 'notice/update/' + row.id });
        },

        

    },
    created() {
        this.getAllNotices();
    },
    mounted() {
        
    },
    watch:{
        
    }
}

</script>

<style scoped>
/* 悬停添加箭头图标 */
.niceButton5 {
    display: inline-block;
    border-radius: 10px;
    border: none;
    color: #ffff;
    text-align: center;
    font-size: 15px;
    font-weight: 400;
    padding: 8px;
    width: 70px;
    height: 35px;
    transition: all 0.5s;
    cursor: pointer;
    vertical-align: middle;
  }
  .niceButton5 span {
    cursor: pointer;
    display: inline-block;
    position: relative;
    transition: 0.5s;
  }
  .niceButton5 span::after {
    content: ">";
    position: absolute;
    opacity: 0;
    top: 0;
    right: -20px;
    transition: 0.5s;
  }
  .niceButton5:hover span {
    padding-right: 30px;
  }
  .niceButton5:hover span::after {
    opacity: 1;
    right: 0;
  }
</style>