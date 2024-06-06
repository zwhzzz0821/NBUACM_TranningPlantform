<template>
  <el-container style="height: 100%">
    <el-header style="height: 20%; line-height: 50px;">
      <h3 style="text-align: center;">荣誉墙管理</h3>
      <el-button type="primary" @click="exportExcel">导出Excel</el-button>
    </el-header>
    <el-divider></el-divider>
    <el-main>
      <el-table
        :data="honors"
        style="width: 100%"
        stripe
        border
        row-key="id"
      >
        <el-table-column label="奖项">
            <template slot-scope="scope">
                <div>
                    {{ scope.row.award }}
											<img v-if="scope.row.award == '一等奖'" :src="goldimg" alt="">
											<img v-if="scope.row.award == '二等奖'" :src="silverimg" alt="">
											<img v-if="scope.row.award == '三等奖'" :src="bronzeimg" alt="">
                </div>
            </template>
        </el-table-column>
        <el-table-column label="获得时间" prop="acquiredTime" align="center"></el-table-column>
        <el-table-column label="参赛队员1" prop="player1"></el-table-column>
        <el-table-column label="参赛队员2" prop="player2"></el-table-column>
        <el-table-column label="参赛队员3" prop="player3"></el-table-column>
        <el-table-column label="教练" prop="coach"></el-table-column>
        <el-table-column label="操作" width="180">
          <template slot-scope="scope">
            <el-button size="mini" @click="editItem(scope.$index)">编辑</el-button>
            <el-button size="mini" type="danger" @click="deleteItem(scope.$index)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-button @click="addItem">新增荣誉</el-button>
    </el-main>
    <el-dialog
      title="编辑荣誉"
      :visible.sync="dialogVisible"
      width="40%"
    >
      <el-form :model="editForm" label-width="100px">
        <el-form-item label="奖项">
            <el-input v-model="editForm.award"></el-input>
        </el-form-item>
        <el-form-item label="获得时间">
          <el-date-picker
            v-model="editForm.acquiredTime"
            type="date"
            placeholder="选择日期"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="参赛队员1">
          <el-input v-model="editForm.player1"></el-input>
        </el-form-item>
        <el-form-item label="参赛队员2">
          <el-input v-model="editForm.player2"></el-input>
        </el-form-item>
        <el-form-item label="参赛队员3">
          <el-input v-model="editForm.player3"></el-input>
        </el-form-item>
        <el-form-item label="教练">
          <el-input v-model="editForm.coach"></el-input>
        </el-form-item>
        <el-table-column label="上传照片">
            <template slot-scope="scope">
                <el-button size="mini" @click="uploadPhoto(scope.$index)">上传</el-button>
            </template>
        </el-table-column>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveEdit">确 定</el-button>
      </div>
    </el-dialog>
  </el-container>
</template>

<script>
import goldimg from "@/assets/gold.png"
import silverimg from "@/assets/silver.png"
import bronzeimg from "@/assets/bronze.png"
import XLSX from 'xlsx-style';
import saveAs from 'file-saver';
import request from "../../util/request";
export default {
  data() {
    return {
      goldimg: goldimg,
			silverimg: silverimg,
			bronzeimg: bronzeimg,
      dialogVisible: false,
      uploadedFiles: [],
      editForm: {
        id: null,
        award: '',
        acquiredTime: '',
        player1: '',
        player2: '',
        player3: '',
        coach: ''
      },
      honors: []
    };
  },
  methods: {
    addItem() {
      this.dialogVisible = true;
      this.editForm.id = null;
    },
    editItem(index) {
      this.dialogVisible = true;
      Object.assign(this.editForm, this.honors[index]);
    },
    deleteItem(index) {
      // 在这里实现删除逻辑
			
			request.post("/honors/Delete", this.honors[index].hid).then(res => {})
      console.log('删除荣誉:', this.honors[index]);
			this.updated();
			this.$message.success('删除成功')
    },
    saveEdit() {
			// 在这里实现保存编辑后的荣誉到服务器
			var date = new Date(this.editForm.acquiredTime)
			this.editForm.acquiredTime = date.getTime()
      console.log('保存荣誉:', this.editForm);
			request.post('/honors/Add', this.editForm).then(res => {})
			this.updated();
			this.$message.success('添加成功')
      this.dialogVisible = false;
    },
    uploadPhoto(index) {
        // 这里可以打开一个文件选择对话框，然后使用FileReader API读取文件并存储
        // 注意：实际应用中，通常需要将文件上传到服务器
        console.log(`上传照片，索引: ${index}`);
    },
    exportExcel() {
        // 将表格数据转换为Excel格式
        const table = document.querySelector('.el-table__body');
        const wb = XLSX.utils.table_to_book(table);
        const wbOut = XLSX.write(wb, { bookType: 'xlsx', type: 'binary' });
        saveAs(new Blob([s2ab(wbOut)], { type: "application/octet-stream" }), 'output.xlsx');
    },
		updated() {
			request.get("/honors/Get").then(res =>{
				this.honors = res.honors
				console.log(res.honors)
			})
		},
  },
	created() {
		this.updated()
	}
};
</script>