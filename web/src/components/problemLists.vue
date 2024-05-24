<template>
<div>
    <el-table
        :data="problemLists"
        border
        style="width: 100%">
        <el-table-column
            fixed
            prop="id"
            label="ID"
            width="150">
        </el-table-column>
        <el-table-column
            prop="name"
            label="表单名称"
            width="120">
        </el-table-column>
        <el-table-column
            prop="begin"
            label="开始时间"
            width="120">
        </el-table-column>
        <el-table-column
            prop="end"
            label="结束时间"
            width="120">
        </el-table-column>
        
        <el-table-column
            fixed="right"
            label="操作"
            width="100">
            <template slot-scope="scope">
            <el-button @click="handleClick(scope.row)" type="text" size="small">查看</el-button>
            <el-button type="text" size="small">编辑</el-button>
            </template>
        </el-table-column>
    </el-table>
    
    
    <!-- 弹窗，显示题单内部的题目状态 -->
    <el-dialog
    title="题目"
    :visible.sync="dialogVisible"
    width="60%"
    :before-close="handleClose">
        <el-table
        :data="problems"
        :row-style="{ height: '40px' }"
        style="width: 100%; margin-left: 0 auto">
            <el-table-column
            label="问题来源"
            width="100">
            <template slot-scope="scope">
                <div>
                <a href="https://codeforces.com/">
                    <img :src="CFLogo" style="width: 30px; margin-top: 5px; margin-bottom: 5px">
                </a>
                </div>
            </template>
            </el-table-column>
            <el-table-column
            label="问题号"
            width="100">
            <template slot-scope="scope">
                <div>{{ scope.row.problemId }}</div>
            </template>
            </el-table-column>
            <el-table-column
            label="问题名"
            >
            <template slot-scope="scope">
                <div>
                <el-link :href="generateLink(scope.row)" type="primary">
                    <div>{{ scope.row.name }}</div>
                </el-link>
                </div>
            </template>
            </el-table-column>
            <el-table-column
            label="状态"
            width="100">
            <template slot-scope="scope">
            <div :style="getStyle(scope.row.status)">
                {{ scope.row.status }}
            </div>
            </template>
            </el-table-column>
          
          
  
        </el-table>
    </el-dialog>
</div>
</template>

<script>
import request from '../util/request';
import CFLogo from "../assets/CF.png";
export default {
    data() {
        return {
            CFLogo: CFLogo,
            problemLists:[],
            dialogVisible: false,
            problems:[],
        }
    },
    methods:{
        generateLink(row) {
            return `https://codeforces.com/problemset/problem/${row.contestId}/${row.problemIndex}`;
        },

        getProblemList() {
            try {
                request.get('/ProblemList/getProblemLists',{

                }).then(res => {
                    this.problemLists = res.problemLists;
                })
            } catch(error) {
                console.log("ERROR:",error);
            }
        },

        handleClick(row) {
            this.dialogVisible = true;
            try {
                request.get('ProblemList/getProblems',{
                    params:{
                        problemListId:row.id
                    }
                }).then(res => {
                    this.problems = res.problems;
                    console.log("problems:",this.problems);
                })


            } catch(error) {
                console.log("ERROR:",error);
            }


        },

        handleClose(done) {
            this.$confirm('确认关闭？')
            .then(_ => {
                done();
            })
            .catch(_ => {});
        },

        getStyle(status) {
            switch (status) {
                case '1':
                return { backgroundColor: 'white' };
                case '2':
                return { backgroundColor: 'red' };
                case '3':
                return { backgroundColor: 'green' };
                default:
                return {};
            }
        },



    },
    created() {
        this.getProblemList();
    },
    watch:{
        
    }
}

</script>

<style>
.el-table .WA-row {
    background: rgb(243, 76, 10);
}

.el-table .AC-row {
    background: #80da4f;
}
/* 没提交 */
.el-table .notsubmission-row {  
    background: #f0f3ef;
}
</style>