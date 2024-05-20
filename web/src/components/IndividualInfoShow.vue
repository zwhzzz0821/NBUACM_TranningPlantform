<template>

    <el-container>

        <el-container v-if="$store.state.uid === '-1'" style="padding: 20px">
        To view page of your user, please sign in first.
        </el-container>
        <el-container v-else>
            <el-header>
            <el-page-header>
            <template #content>
                <span class="text-large font-600 mr-3">
                {{ userInfo.username }} 's information
                </span>
            </template>
            </el-page-header>
            </el-header>
        
            <el-card
            header="Career"
            style="margin: 10px; text-align: center; height: 460px"
            >
            <el-container>
                <el-aside width="66%"
                ><div id="acSubmissionsType" style="height: 400px"></div>
                </el-aside>
                <el-container>
                    <el-header height="200px">
                        <div id="totalSubmissions" style="height: 200px"></div>
                    </el-header>
                    <div>Rank: {{this.submissionStatus.career_ranking}}</div>
                    <el-main>
                        <el-tooltip
                            effect="light"
                            :content="`Top ${100 - careerPercentage}%`"
                            placement="top"
                        >
                            <el-progress
                                style="height: 200px"
                                type="dashboard"
                                :percentage="careerPercentage"
                            >
                            
                                <span
                                    style="display: block; margin-top: -48px; font-size: 18px; font-weight: 700; color: #464646;"
                                >
                                    Rank: {{ this.submissionStatus.career_ranking }}
                                </span>
                        
                            </el-progress>
                        </el-tooltip>
                    </el-main>
                </el-container>
            </el-container>
            </el-card>
            <el-card
                header="Activeness"
                style="margin: 10px; text-align: center; height: 540px"
                >
                <el-container style="height: 280px">
                    <el-aside width="66%" style="overflow: visible">
                    <div id="recentUserStatus" style="height: 280px"></div>
                    </el-aside>
                    <el-container>
                    <el-header height="140px" style="padding: 0">
                        <el-table :data="weekMonthData" style="width: 100%">
                        <el-table-column prop="type" label="Type" align="center" />
                        <el-table-column prop="ac" label="AC" align="center" />
                        <el-table-column prop="all" label="All" align="center" />
                        </el-table>
                    </el-header>
                    <el-main style="overflow: hidden">
                        <el-tooltip
                        effect="light"
                        :content="`Top ${100 - activePercentage}%`"
                        placement="top"
                        >
                        <el-progress
                            style="height: 200px"
                            type="dashboard"
                            :percentage="activePercentage"
                        >
                            <span
                            style="
                                display: block;
                                margin-top: -48px;
                                font-size: 18px;
                                font-weight: 700;
                                color: #464646;
                            "
                            >Rank:
                            {{
                                this.submissionStatus.active_ranking
                            }}</span
                            >
                        </el-progress>
                        </el-tooltip>
                    </el-main>
                    </el-container>
                </el-container>
                <div id="calendar" style="height: 180px"></div>
            </el-card>






        </el-container>
    </el-container>



</template>
<script>
import request from "../util/request";
import { showCareerCharts, showActivityCharts } from "../util/chartDrawing";

export default {
    data() {
        return {
            userlistsize:0,
            userInfo:{},
            ACSubmissionlist:[],
            submissionStatus:{},
            allUserSubmissionStatus:{}, //里面存的都是对user表进行分析后的属性描述
            weekMonthData: [
                {
                type: "Week",
                ac: 0,
                all: 0,
                },
                {
                type: "Month",
                ac: 0,
                all: 0,
                },
            ],
            careerPercentage:0,
            activePercentage:0,


        }
    },
    methods:{
        getAllUserSubmissionStatus() {
            request.get('/user/getAllUserSubmissionStatus', {

            }).then(res => {
                this.allUserSubmissionStatus = res.allUserSubmissionStatus;
                this.getUserInfo();
            })
        },
        
        getUserInfo(){
            request.get('/user/getuser', {
                params: {
                    uid: this.$store.state.uid
                }
            }).then(res => {
                
                this.userInfo = res.user;
                this.userlistsize = res.userlistsize;
                console.log("userInfo:",this.userInfo);
                console.log("userlistsize:",this.userlistsize);
                this.getACSubmissionByhandle();
            });
        },

        getACSubmissionByhandle(){
            request.get('/submission/getACsubmissionlist', {
                params: {
                    handle:this.userInfo.codeforceshandle
                }
            }).then(res => {
                this.ACSubmissionlist = res.acsubmissionList;
                console.log("ACSubmissionlist:",this.ACSubmissionlist);
                this.initSubmissionStatus();  //初始化submissionStatus，准备后面给chart生成图片了
                
                this.submissionStatus.submission_number = this.userInfo.totalSubmits;   //总提交数
                this.submissionStatus.ac_submission_number = this.userInfo.totalACSubmits    //总AC数

                this.submissionStatus.easy_ac_submission_number1 = this.userInfo.difficulty1;   //入门
                this.submissionStatus.easy_ac_submission_number2 = this.userInfo.difficulty2;   //普及-
                this.submissionStatus.medium_ac_submission_number1 = this.userInfo.difficulty3; //普及/提高-
                this.submissionStatus.medium_ac_submission_number2 = this.userInfo.difficulty4; //普及+/提高
                this.submissionStatus.hard_ac_submission_number = this.userInfo.difficulty5;    //提高+/省选-
                this.submissionStatus.veryhard_ac_submission_number = this.userInfo.difficulty6;    //省选/NOI-
                this.submissionStatus.hardcore_ac_submission_number = this.userInfo.difficulty7;    //NOI/NOI+/CTSC
                
                this.submissionStatus.month_submission_number = this.userInfo.monthSubmits;
                this.submissionStatus.month_ac_submission_number = this.userInfo.monthAC;
                this.submissionStatus.week_submission_number = this.userInfo.weekSubmits;
                this.submissionStatus.week_ac_submission_number = this.userInfo.weekAC;

                this.submissionStatus.average_ac_rating = this.userInfo.totalAverageACRating;
                this.submissionStatus.month_average_ac_rating = this.userInfo.monthAverageACRating;
                this.submissionStatus.week_average_ac_rating = this.userInfo.weekAverageACRating;

                console.log("average_ac_rating:",this.submissionStatus.average_ac_rating);
                console.log("month_average_ac_rating:",this.submissionStatus.month_average_ac_rating);
                console.log("week_average_ac_rating:",this.submissionStatus.week_average_ac_rating);
                this.submissionStatus.career_ranking = this.userInfo.ratingRank;
                this.submissionStatus.active_ranking = this.userInfo.monthACRank;

                console.log("career_ranking:",this.submissionStatus.career_ranking);
                console.log("active_ranking:",this.submissionStatus.active_ranking);
                
                this.getPercentage();
                this.getWeekMonthData();
                showCareerCharts(this.submissionStatus);
                showActivityCharts(this.ACSubmissionlist, this.submissionStatus, this.allUserSubmissionStatus);

               
            });


        },


        initSubmissionStatus(){
            this.submissionStatus = {
                submission_number: 0,   //总提交数
                ac_submission_number: 0,    //总AC数

                easy_ac_submission_number1: 0,  //入门
                easy_ac_submission_number2: 0,   //普及-
                medium_ac_submission_number1: 0,    //普及/提高-
                medium_ac_submission_number2: 0,    //普及+/提高
                hard_ac_submission_number: 0,   //提高+/省选-
                veryhard_ac_submission_number: 0,   //省选/NOI-
                hardcore_ac_submission_number: 0,   //NOI/NOI+/CTSC

                month_submission_number: 0,
                month_ac_submission_number: 0,
                
                week_submission_number: 0,
                week_ac_submission_number: 0,
                
                

                //这部分要自己算了
                average_ac_rating: 0,
                month_average_ac_rating: 0,
                week_average_ac_rating: 0,
                active_score: 0,
                career_ranking: 0,
                active_ranking: 0,
            };
        },

        getPercentage() {
            this.careerPercentage = Number(
                (
                100 -
                (this.submissionStatus.career_ranking /
                    this.userlistsize) *
                    100
                ).toFixed(2)
            );
            this.activePercentage = Number(
                (
                100 -
                (this.submissionStatus.active_ranking /
                    this.userlistsize) *
                    100
                ).toFixed(2)
            );
        },

        getWeekMonthData() {
            this.weekMonthData = [
                {
                type: "Week",
                ac: this.submissionStatus.week_ac_submission_number,
                all: this.submissionStatus.week_submission_number,
                },
                {
                type: "Month",
                ac: this.submissionStatus.month_ac_submission_number,
                all: this.submissionStatus.month_submission_number,
                },
            ];
        }

    },
    mounted() {
        if (this.$store.state.uid !== "-1") {
            this.getAllUserSubmissionStatus();
        }

    },
    watch: {
        
    }
}



</script>

<style>
</style>