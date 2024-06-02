<template>
    <el-card>
        
        <el-form ref="form" :model="formData" :rules="rules" label-width="100px">
          <el-form-item label="题单名称" prop="name">
              <el-input v-model="formData.name" placeholder="请输入题单名称"></el-input>
          </el-form-item>
            <el-row>
                <el-col :span="12">
                    <el-form-item label="开始时间">
                      <el-date-picker
                        v-model="formData.startTime"
                        type="datetime"
                        placeholder="选择开始时间"
                      ></el-date-picker>
                    </el-form-item>
                </el-col>
                <el-col :span="12">
                    <el-form-item label="结束时间">
                      <el-date-picker
                        v-model="formData.endTime"
                        type="datetime"
                        placeholder="选择结束时间"
                      ></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-row>
            <el-form-item label="题目编号">
      <div v-for="(field, index) in fields" :key="index">
        <el-form-item>
          <el-input v-model="field.problemInfo" placeholder="请输入ContestId+Index的组合(例如233+A)"></el-input>
        </el-form-item>
        <el-row class="action-buttons">
          <el-col :span="6">
            <el-button type="primary" @click="addField">加入</el-button>
          </el-col>
          <el-col :span="6">
            <el-button type="danger" @click="removeField(index)">删除</el-button>
          </el-col>
        </el-row>
      </div>
    </el-form-item>
          
            <el-form-item label="选择人员">
            <el-table
                :data="users"
                style="width: 100%"
                
            >
                <el-table-column prop="username" label="姓名" width="180"></el-table-column>
                <el-table-column label="选择" width="100">
                <template slot-scope="scope">
                    <el-checkbox v-model="selectedUsers" :label="scope.row.uid" @change="checkboxChange(scope.row)">
                    选择
                    </el-checkbox>
                </template>
                </el-table-column>
            </el-table>
            </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm">提交</el-button>
          </el-form-item>
        </el-form>
    </el-card>
</template>

<script>
import request from '../util/request';
import { Toast } from 'vant';
export default {
  data() {
    return {
      formData: {
        name:'',
        startTime:'',
        endTime:'',
        time: '',
        selectedUser: '',
        selectedProblem: '',
        problemListId:0,
      },
      users: [],
      fields: [
        {
          problemInfo: '',
        },
      ],
      selectedUsers: [],
      rules:{
        name:[
          { required: true, message: '题单名称不能为空', trigger: 'blur' },
        ],
      },
    };
  },
  methods: {
    addField() {
      this.fields.push({
        contestId: '',
        index: '',
      });
    },
    removeField(index) {
      this.fields.splice(index, 1);
    },
    submitForm() {

      this.$refs.form.validate((valid) => {
        if(this.formData.startTime === ''||this.formData.endTime === '') {
          Toast.fail('请补充完整题单的开始时间和结束时间');
          return;
        }
        if (valid) {
          console.log('before表单数据:', this.formData);
          console.log('before题目编号:', this.fields);

          let startTimeMs = Date.parse(this.formData.startTime);
          let endTimeMs = Date.parse(this.formData.endTime);

          // 转换为秒，并确保是10位数字
          let startTimeSec = Math.floor(startTimeMs / 1000).toString();
          let endTimeSec = Math.floor(endTimeMs / 1000).toString();

          // 确保时间戳是10位数字，如果不足10位则前面补0
          while (startTimeSec.length < 10) {
            startTimeSec = '0' + startTimeSec;
          }
          while (endTimeSec.length < 10) {
            endTimeSec = '0' + endTimeSec;
          }
          console.log(startTimeSec, endTimeSec);
          
          // let begin = this.$formatTime(startTimeSec);
          // console.log("时间戳转换begin：",begin);
          // let end = this.$formatTime(endTimeSec);
          // console.log("时间戳转换end：",end);

          
          // 先建立题单
          request.post('/ProblemList/createNewProblemList',{
            name:this.formData.name,
            begin:startTimeSec,
            end:endTimeSec
          }).then(res => {
            console.log("res:",res)
            this.formData.problemListId = res.problemListId;
            this.addProblemsToList();  //插入题目
          });


        } else {
          console.warn('表单验证失败');
          return false;
        }
      });
      
    },

    addProblemsToList() {
      //准备数据
      const problems = this.fields.map(field => {
        //遍历problemInfo，"+"之前的转换为数字，之后的依然为字母
        // 找到"+"字符的位置
        const plusIndex = field.problemInfo.indexOf('+');
        if (plusIndex === -1) {
          // 如果没有找到"+"，可能需要处理错误或按照其他逻辑进行
          console.error('格式错误，无法找到"+"字符');
          return;
        }

        // 分割字符串为两部分
        const contestIdStr = field.problemInfo.substring(0, plusIndex);
        const indexStr = field.problemInfo.substring(plusIndex + 1);

        // 将contestId转换为数字
        const contestId = parseInt(contestIdStr, 10);
        const index = indexStr; 
        return {
          problemListId:this.formData.problemListId,
          problemId:0,
          contestId: contestId,
          problemIndex: index,
          name:'',
          acNumber:0,
        };
      });

      console.log("构造出的problems",problems)
      request.post('/ProblemList/insertNewProblemsToList',problems).then(res => {
          console.log("添加完题目后",res);
          this.addPeopleToList();
          // 把人员添加到这个题单内
      })
    },

    addPeopleToList() {
      
      const users = [];

      let len = this.selectedUsers.length;
      
      for(let i=0;i<len;i++) {
        users.push({
          problemListId: this.formData.problemListId,
          uid: this.selectedUsers[i]
        });
      }

      console.log("构建的users:",users);
      request.post('/ProblemList/addUsersToProblemList',users).then(res => {
        console.log("添加完users后",res);
      })
    },


    checkboxChange(user) {
      // 复选框变化时的处理逻辑，这里添加或移除选中的用户id
      const userId = user.id;
      if (this.selectedUsers.includes(userId)) {
        this.selectedUsers = this.selectedUsers.filter(id => id !== userId);
      } else {
        this.selectedUsers.push(userId);
      }
      // 更新选中的用户到formData
      this.formData.selectedUser = this.selectedUsers.map(Number).sort(); // 数组排序并转换为数字
    }, 
    updated() {
        request.get("/user/getallusers").then(res => {
            this.users = res.userlist
        })
    },
  },
  created() {
    this.updated();
  }
};
</script>

<style scoped>
.input-tips {
  margin-top: 5px;
  color: #909399;
}
</style>