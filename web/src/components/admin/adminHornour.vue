<template>
  <el-container style="height: 100%">
    <el-header style="height: 12%; line-height: 50px;">
      <h3 style="text-align: center;">荣誉墙管理</h3>
      <el-button type="primary" @click="exportExcel">导出Excel</el-button>
    </el-header>
    <el-divider></el-divider>
    <el-main>
      <el-table
        :data="pagedRows"
        id="honorsTable"
        style="width: 100%"
        stripe
        border
        row-key="id"
      >
        <el-table-column label="奖项">
            <template slot-scope="scope">
                <div>
                    {{ scope.row.award }}
											<img v-if="scope.row.award == '金奖'" :src="goldimg" alt="">
											<img v-if="scope.row.award == '银奖'" :src="silverimg" alt="">
											<img v-if="scope.row.award == '铜奖'" :src="bronzeimg" alt="">
                </div>
            </template>
        </el-table-column>
        <el-table-column label="获得时间" :formatter="timeStamp" prop="acquiredTime" align="center"></el-table-column>
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
      <el-pagination
          background
          layout="prev, pager, next"
          class="pagination-container"
          :total="totalRows"
          :current-page.sync="currentPage"
          :page-size="pageSize"
          @current-change="onPageChange"
          style="margin: 0 auto; display: block;">
      </el-pagination>
    </el-main>
    <el-dialog
      title="编辑荣誉"
      :visible.sync="dialogVisible"
      width="40%"
    >
      <el-form :model="editForm" label-width="100px">
        <el-form-item label="奖项">
          <el-select v-model="editForm.award" placeholder="请选择奖项">
            <el-option label="金奖" value="金奖"></el-option>
            <el-option label="银奖" value="银奖"></el-option>
            <el-option label="铜奖" value="铜奖"></el-option>
          </el-select>
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
import goldimg from "../../assets/gold.png"
import silverimg from "../../assets/silver.png"
import bronzeimg from "../../assets/bronze.png"
import FileSaver from 'file-saver'
import * as XLSX from 'xlsx'
import request from "../../util/request";
import { Toast } from "vant"
export default {
  data() {
    return {
      goldimg: goldimg,
			silverimg: silverimg,
			bronzeimg: bronzeimg,
      currentPage: 1,
      pagedRows: [],
      pageSize: 10,
      totalRows: 0,
      dialogVisible: false,
      uploadedFiles: [],
      editForm: {
        id: null,
        award: '',
        acquiredTime: 0,
        player1: '',
        player2: '',
        player3: '',
        coach: ''
      },
      honors: []
    };
  },
  computed: {
      /**
       * 根据当前页码和每页大小计算分页数据
       */
      currentPagedData() {
        const start = (this.currentPage - 1) * this.pageSize;
        const end = start + this.pageSize;
        return this.honors.slice(start, end);
      },
  },
  watch: {
    // 监听原始数据变化，重新计算分页数据
    honors(newRows) {
      this.totalRows = newRows.length;
      this.pagedRows = this.currentPagedData;
    },
  },
  methods: {
    fetchHonors(pageNumber, pageSize) {
      request.get("/honors/Get", {
        params: {
          pageNumber,
          pageSize,
        }
      }).then(res => {
        if(res.code === 200) {
          this.honors = res.honors; // 假设后端返回的是荣誉列表数据
          this.totalRows = res.length; // 假设后端返回总记录数
        } else {
          Toast.fail("获取荣誉列表失败")
        }
        
      });
    },
    onPageChange(page) {
        this.currentPage = page;
        this.pagedRows = this.currentPagedData;
      },
    updated() {
      this.fetchHonors(this.currentPage, this.pageSize);
    },
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
			
			request.post("/honors/Delete", this.honors[index].hid).then(res => {
        if(res.code === 200) {
          console.log('删除荣誉:', this.honors[index]);
          this.$message.success('删除成功');
          this.updated();
        } else {
          this.$message.error("删除失败");
        }
      });
      
    },
    saveEdit() {
			// 在这里实现保存编辑后的荣誉到服务器
			var date = new Date(this.editForm.acquiredTime)
			this.editForm.acquiredTime = date.getTime()
      console.log('保存荣誉:', this.editForm);
			request.post('/honors/Add', this.editForm).then(res => {
        if(res.code === 200) {
          this.$message.success('添加成功')
          this.dialogVisible = false;
          this.updated();
        } else {
          this.$message.fail('添加失败');
        }
      })
			
    },
    uploadPhoto(index) {
        // 这里可以打开一个文件选择对话框，然后使用FileReader API读取文件并存储
        // 注意：实际应用中，通常需要将文件上传到服务器
        console.log(`上传照片，索引: ${index}`);
    },
    exportExcel() {
      // 1.生成Excel工作簿对象
      var wb = XLSX.utils.table_to_book(document.querySelector('#honorsTable'));
      // 2.手机号，身份证号等会默认使用科学计数法表示，则需要这样设置
      var wb = XLSX.utils.table_to_book(
        document.querySelector("#honorsTable"),
        { raw: true }
      );
      // 获取二进制字符串作为输出
      var wbout = XLSX.write(wb, {
        bookType: 'xlsx',
        book: true,
        type: 'array',
      })
      try {
        FileSaver.saveAs(
        // Blob: 对象表示一个不可变 原始数据的类文件对象,不一定是JS原生格式的数据。
        // File: 基于Blob，继承了blob的功能并将其扩展使其支持用户系统上的文件。  
          new Blob([wbout], { type: 'appliction/octet-stream' }),
          // 设置导出的文件名称可随意
          'result.xlsx'
        )
      } catch (e) {
        if (typeof console != 'undefined') console.log(e, wbout);
      }
      // 返回一个新创建的Blob对象，其内容由参数中给定的数组串联组成。
      return wbout
    },
		// updated() {
		// 	request.get("/honors/Get").then(res =>{
		// 		this.honors = res.honors
		// 		console.log(res.honors)
		// 	})
		// },
    timeStamp(value) {

      let date = new Date(value.acquiredTime); //时间戳为10位需*1000，时间戳为13位的话不需乘1000
      let year = date.getFullYear();
      let month = ("0" + (date.getMonth() + 1)).slice(-2);
      let sdate = ("0" + date.getDate()).slice(-2);
      let hour = ("0" + date.getHours()).slice(-2);
      let minute = ("0" + date.getMinutes()).slice(-2);
      let second = ("0" + date.getSeconds()).slice(-2);
      let result = year + "." + month + "." + sdate;
      // 返回
      return result;
    }
  },
	created() {
		this.updated()
	}
};
</script>