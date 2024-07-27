<template>
    <div class="container">
        <!-- 第一个卡片 -->
        <el-card class="box-card" shadow="hover">
            <div slot="header" class="clearfix">
            <span>Current or upcoming contests</span>
            </div>
    
            <div>
                <!-- 在这里放入第一个卡片的内容，例如表单 -->
                <el-table :data="upcomingList" style="width: 100%" stripe>
                    <el-table-column prop="id" label="题单id" width="180">
                    </el-table-column>
    
                    <el-table-column prop="name" label="题单名称" width="180">
                    </el-table-column>
                    
                    <el-table-column prop="begin" label="开始时间" width="180">
                        <template slot-scope="scope">
                            {{ $formatTime(scope.row.begin) }}
                        </template>
                    </el-table-column>
    
                    <el-table-column prop="end" label="结束时间" width="180">
                        <template slot-scope="scope">
                            {{ $formatTime(scope.row.end) }}
                        </template>
                    </el-table-column>
    
                    <el-table-column
                        fixed="right"
                        label="操作"
                        width="100">
                        <template slot-scope="scope">
                        <el-button @click="handleClick(scope.row)" type="text" size="small">查看题目</el-button>
                        </template>
                    </el-table-column>
    
                </el-table>
            </div>
    
        </el-card>
    
        <!-- 第二个卡片 -->
        <el-card class="box-card" shadow="hover" style="margin-top: 20px;">
            <div slot="header" class="clearfix">
            <span>Past contests</span>
            </div>
    
            <div>
                <!-- 在这里放入第二个卡片的内容，例如表单 -->
                <el-table :data="pastList" style="width: 100%" stripe>
                    <el-table-column prop="id" label="题单id" width="180">
                    </el-table-column>
    
                    <el-table-column prop="name" label="题单名称" width="180">
                    </el-table-column>
    
                    <el-table-column prop="begin" label="开始时间" width="180">
                        <template slot-scope="scope">
                            {{ $formatTime(scope.row.begin) }}
                        </template>
                    </el-table-column>
    
                    <el-table-column prop="end" label="结束时间" width="180">
                        <template slot-scope="scope">
                            {{ $formatTime(scope.row.end) }}
                        </template>
                    </el-table-column>
    
                    <el-table-column
                        fixed="right"
                        label="操作"
                        width="100">
                        <template slot-scope="scope">
                        <el-button @click="handleClick(scope.row)" type="text" size="small">查看题目</el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </div>
    
        </el-card>
    
    
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
                width="30">
                <template slot-scope="scope">
                    <div :class="getCellStyle(scope.row.state)">
                        <div v-if="scope.row.state === 1">#</div> <!-- 什么也不展示 -->
                        <div v-else-if="scope.row.state === 2">#</div>
                        <div v-else-if="scope.row.state === 3">#</div>
                    </div>
                </template>
                </el-table-column>
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
                label="AC人数"
                width="100">
                <template slot-scope="scope">
                    <div>{{ scope.row.acNumber }}</div>
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
    import request from "../util/request";
    import { Toast } from 'vant';
    import CFLogo from "../assets/CF.png";
    export default {
        data() {
            return {
                CFLogo: CFLogo,
                problemLists:[],
                upcomingList:[],
                pastList:[],
                dialogVisible:false,
                problems:[],
                newProblems:[],
                problemWithState:[],
                
            }
        },
        methods:{
            
            getAllProblemLists() {
                request.get('/ProblemList/getProblemLists',{
    
                }).then(res => {{
                    this.problemLists = res.problemLists;
                    console.log(res);
                    this.divideProblemLLists();
                }});
            },
            divideProblemLLists() {
                // 获取当前时间的时间戳（以毫秒为单位）
                const now = Math.floor(Date.now() / 1000);
    
                // 初始化列表
                this.pastList = []; 
                this.upcomingList = []; 
    
                // 遍历 problemLists
                this.problemLists.forEach(problemList => {
                // 假设 problem.end 是一个时间戳
                const endTime = new Date(problemList.end).getTime();
    
                // 比较当前时间与结束时间
                if (now > endTime) {
                    // 如果当前时间大于结束时间，添加到 pastList
                    this.pastList.push(problemList);
                } else {
                    // 否则，添加到 upcomingList
                    this.upcomingList.push(problemList);
                }
                });
    
                // 根据结束时间对 upcomingList 进行升序排序, 对lastList按照end进行降序排序
                this.upcomingList.sort((a, b) => a.end - b.end);
                this.pastList.sort((a, b) => b.end - a.end);
            },
            generateLink(row) {
                return `https://codeforces.com/problemset/problem/${row.contestId}/${row.problemIndex}`;
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
    
            // handleClose(done) {   //关闭弹窗时的提示
            //     this.$confirm('确认关闭？')
            //     .then(_ => {
            //         done();
            //     })
            //     .catch(_ => {});
            // },
    
            stateClass(state) {
                switch (state) {
                case 1:
                    return 'text-white'; 
                case 2:
                    return 'text-red';   
                case 3:
                    return 'text-green'; 
                default:
                    return '';
                }
            },
            
            getCellStyle(state) {
                console.log("state:",state);
                switch (state) {
                case 1:
                    return "white-background";
                case 2:
                    return "red-background";
                case 3:
                    return "green-background";
                default:
                    return { backgroundColor: 'white' }; // 默认背景颜色
                }
            },
            
            getProblemsWithState(row) {
                try {
                    request.get('/ProblemList/getProblemsState',{
                        params:{
                            problemListId:row.id,
                            uid:this.$store.state.userInfo.uid
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
        mounted() {
            this.getAllProblemLists();
        },
        watch:{
            
        }
    }
    </script>
    <style scoped>
    .container {
      display: flex;
      flex-direction: column;
      /* 确保容器有足够的高度或允许其子元素扩展 */
      min-height: 100vh;
    }
    
    .box-card {
      margin-bottom: 20px; /* 为卡片底部添加外边距 */
    }
    .text-white {
      color: white;
    }
    
    .text-red {
      color: red;
    }
    
    .text-green {
      color: green;
    }
    .green-background {
      background-color: rgb(52, 167, 52);
    }
    .white-background {
      background-color: white;
    }
    .red-background {
      background-color: rgb(194, 50, 14);
    }
    </style>