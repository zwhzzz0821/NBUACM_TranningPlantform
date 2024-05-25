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
        :data="newProblems"
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
                <div :class="stateClass(scope.row.state)">
                    <div v-if="scope.row.state === 1"></div> <!-- 什么也不展示 -->
                    <div v-else-if="scope.row.state === 2">WA</div>
                    <div v-else-if="scope.row.state === 3">AC</div>
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
            newProblems:[],
            problemWithState:[],
        }
    },
    methods:{
        generateLink(row) {
            return `https://codeforces.com/problemset/problem/${row.contestId}/${row.problemIndex}`;
        },

        getProblemList() {
            try {
                request.get('/ProblemList/getProblemListsByUid',{
                    params:{
                        uid:this.$store.state.uid
                    }
                }).then(res => {
                    this.problemLists = res.problemLists;
                })
            } catch(error) {
                console.log("ERROR:",error);
            }
        },
        

        dataPrepare(row) {
            try {
                request.get('ProblemList/getProblems',{
                    params:{
                        problemListId:row.id
                    }
                }).then(res => {
                    this.problems = res.problems;
                    this.getProblemsWithState(row);//获取各个问题的状态
                })
            } catch(error) {
                console.log("ERROR:",error);
            }

        },

        handleClick(row) {
            this.dataPrepare(row)
            this.dialogVisible = true;
        },

        handleClose(done) {
            this.$confirm('确认关闭？')
            .then(_ => {
                done();
            })
            .catch(_ => {});
        },

        stateClass(state) {
            switch (state) {
            case 1:
                return 'text-white'; // 假设你有一个白色文本的类
            case 2:
                return 'text-red';   // 假设你有一个红色文本的类
            case 3:
                return 'text-green'; // 假设你有一个绿色文本的类
            default:
                return '';
            }
        },

        getProblemsWithState(row) {
            try {
                request.get('/ProblemList/getProblemsState',{
                    params:{
                        problemListId:row.id,
                        uid:this.$store.state.uid
                    }
                }).then(res => {
                    this.problemWithState = res.problemWithState;
                    console.log("problemWithState:",this.problemWithState);
                    for (let i = 0; i < this.problems.length; i++) {
                        const problem = this.problems[i];
                        let state = this.problemWithState[i].state;
                        problem.state = state;
                    }
                    console.log("new problems:",this.problems)
                    this.newProblems = this.problems;

                })
            } catch(error) {
                console.log("error:",error)
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
.text-white {
  color: white;
}

.text-red {
  color: red;
}

.text-green {
  color: green;
}
</style>