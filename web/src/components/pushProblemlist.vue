<template>
    <el-card>
        
        <el-form ref="form" :model="formData" label-width="100px">
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
          <el-input v-model="field.problemInfo" placeholder="请输入ContestId + Index的组合"></el-input>
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
                @row-click="handleRowClick"
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

export default {
  data() {
    return {
      formData: {
        time: '',
        selectedUser: '',
        selectedProblem: '',
      },
      users: [],
      fields: [
        {
          problemInfo: '',
        },
      ],
      selectedUsers: [],
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
      if (this.$refs.form.validate()) {
        console.log('表单数据:', this.formData);
        console.log('题目编号:', this.fields);
        // 在此处处理表单提交逻辑，例如发送数据到服务器
    } else {
        console.warn('表单验证失败');
      }
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