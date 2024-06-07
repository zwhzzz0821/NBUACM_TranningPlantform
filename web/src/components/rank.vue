<template>
  <div>
    <el-container style="height: 100%; width: 100%">
      <el-header style="height: 100%; padding: 0;">
        <el-form style="padding: 1em" :inline="true">
          <el-form-item label="学号" style="margin-left: 60px">
            <el-input v-model="number" placeholder="学号"></el-input>
          </el-form-item>
          <el-form-item label="名称" style="margin-left: 20px">
              <el-input v-model="username" placeholder="名称"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="find" class="niceButton5" style="margin-left: 50px"><span>查找</span></el-button>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="update" class="niceButton5" style="margin-left: 15px"><span>刷新</span></el-button>
          </el-form-item>
        </el-form>
      </el-header>
      <el-divider></el-divider>
      <div class="avatar-container">
        <el-avatar :src="rows[1].imageURL" class="avatar first"
        :style="{
          backgroundColor: 'rgba(192, 192, 192, 0.3)', // 透明度调整的银色背景
          boxShadow: '0 0 5px rgba(192, 192, 192, 0.5)', // 添加银色阴影
          padding: '2px', 
          border: '2px solid silver'
        }"></el-avatar>
        <el-avatar :src="rows[0].imageURL" class="avatar middle"
        :style="{
          backgroundColor: 'rgba(255, 215, 0, 0.3)', // 透明度调整的金色背景
          boxShadow: '0 0 5px rgba(255, 215, 0, 0.5)', // 添加金色阴影
          padding: '2px', 
          border: '2px solid gold' 
        }"></el-avatar>
        <el-avatar :src="rows[2].imageURL" class="avatar last"
        :style="{
          backgroundColor: 'rgba(178, 124, 56, 0.3)', // 透明度调整的古铜色背景，接近青铜
          boxShadow: '0 0 5px rgba(178, 124, 56, 0.5)', // 添加青铜色阴影
          padding: '2px', 
          border: '2px solid #CD7F32'
        }"></el-avatar>
      </div>
      <el-table
        :data="pagedRows"
        :row-style="{ height: '40px' }"
        style="width: 100%; margin-left: 0 auto">
        <el-table-column
          label="排名"
          width="120">
          <template slot-scope="scope">
            <div>
              <template v-if="scope.$index < 3 && currentPage == 1">
                <div v-if="scope.$index == 0">
                  <img :src="goldimg" alt="">
                </div>
                <div v-if="scope.$index == 1">
                  <img :src="silverimg" alt="">
                </div>
                <div v-if="scope.$index == 2">
                  <img :src="bronzeimg" alt="">
                </div>
                
              </template>
              <template v-else>
                <span>{{ scope.$index + (currentPage - 1) * pageSize + 1 }}</span>
              </template>
            </div>
          </template>
        </el-table-column>

          <!-- 添加的新列，用于显示图片 -->
          <el-table-column
            label="图片"
            width="120">
            <template slot-scope="scope">
              <div>
                <!-- 使用v-if来判断图片URL是否存在 -->
                <img v-if="scope.row.imageURL" :src="scope.row.imageURL" alt="图片" style="width: 80%; height: 80%">
                <!-- 如果没有图片URL，则显示默认图片或提示 -->
                <img v-else src="defaultImageURL" alt="默认图片" style="width: 80%; height: 80%;">
              </div>
            </template>
          </el-table-column>

          <el-table-column
          label="学号"
          >
          <template slot-scope="scope">
            <div>
              {{ scope.row.uid }}
            </div>
          </template>
          </el-table-column>
          <el-table-column
          label="姓名"
          >
          <template slot-scope="scope">
            <div>
            {{ scope.row.username }}
            </div>
          </template>
          </el-table-column>
          <el-table-column
          label="CodeForces用户名"
          >
          <template slot-scope="scope">
            <div>
            <span :style="`color: ${getRatingColor(scope.row.codeforcesrating)}`">
            <span :class="scope.row.codeforcesrating >= 3000 ? `first-letter-black` : ``">
              {{ scope.row.codeforceshandle ? scope.row.codeforceshandle : "No rating" }}
            </span>
          </span>
            </div>
          </template>
          </el-table-column>
          <el-table-column
          label="CodeForces's rating"
          >
          <template slot-scope="scope">
            <div>
            <span :style="`color: ${getRatingColor(scope.row.codeforcesrating)}`">
            <span :class="scope.row.codeforcesrating >= 3000 ? `first-letter-black` : ``">
              {{ scope.row.codeforcesrating ? scope.row.codeforcesrating : "No rating" }}
            </span>
          </span>
            </div>
          </template>
          </el-table-column>
      </el-table>
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
    </el-container>

  </div>

</template>

<script>
import goldimg from "../assets/gold.png"
import silverimg from "../assets/silver.png"
import bronzeimg from "../assets/bronze.png"
import echarts from 'echarts';	
import request from "../util/request";
import { getRatingColor, timeStamp} from "../util/CFshow";
export default {
  name: "Member",
  data() {
    return {
      goldimg: goldimg,
      silverimg: silverimg,
      bronzeimg: bronzeimg,
      rows: null,
      currentPage: 1,
      pageSize: 4,
      totalRows: 0,
      number: null,
      username: "",
      pagedRows: [],
      sortBykey: "rating",
    }
  },
  computed: {
    /**
     * 根据当前页码和每页大小计算分页数据
     */
    currentPagedData() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;

      return this.rows.slice(start, end);
    },
  },
  watch: {
    // 监听原始数据变化，重新计算分页数据
    rows(newRows) {
      this.totalRows = newRows.length;
      this.pagedRows = this.currentPagedData;
    },
  },
  methods: {
    getRatingColor,
    timeStamp,
    find() {
      const targetNumber = this.number;
      const targetName = this.username;
      console.log(targetNumber)
      // 如果 this.rows 为 null，则先获取数据
      if (!this.rows) {
          this.update();
          return; // 直到数据获取完毕再执行筛选
      }
      
      // 使用 filter() 方法筛选满足条件的数据，并赋值给 this.rows
      this.rows = this.rows.filter(item => {
          return item.uid == targetNumber || item.username == targetName;
      });
    },
    onPageChange(page) {
      this.currentPage = page;
      this.pagedRows = this.currentPagedData;
    },
    update() {
      request.get('/user/getallusersSorted', {

      }).then(res => {
      this.rows = res.userlist;
      }).catch(()=>{})
    },
  },
  created() {
    this.update()
  }
}
</script>

<style scoped>
.avatar-container {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: flex-end;
  height: 150px; /* 调整此值以适应你的设计 */
}

.avatar {
  position: absolute;
  width: 100px;
  height: 100px;
  border-radius: 50%;
  overflow: hidden;
  z-index: 1;
}

.first {
  left: calc(-50px + 40%);
}

.middle {
  left: 0;
  transform: translateY(-50px) translateX(800%);
  z-index: 2;
}

.last {
  right: calc(-50px + 40%);
}
.chart-wrapper {
  margin-top: 10px;
}
.rating-chart {
  height: 300px;
}
div {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}

input {
  border-top: none;
  border-left: none;
  border-right: none;
  border-bottom: #102438 solid 1px;
  width: 10em;
}

.el-dialog__footer {
  display: flex;
  justify-content: center;
  align-items: center; /* 居中显示 footer 内容 */
}
.el-dropdown-link {
  cursor: pointer;
  color: #409EFF;
}
.el-icon-arrow-down {
  font-size: 12px;
}
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
.pagination-container {
  justify-content: center;
  align-items: center;
  bottom: 75px; /* 或者你希望的任何位置 */
  left: 280px;
  z-index: 1000; /* 确保它在页面最上层 */
}
.input-change{
  width: 100px;
  height: 22px;
  border-top: 1px solid ;
  border-bottom: 1px solid ;
  border-left: 1px solid ;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 0px;
  border-bottom-right-radius: 0px;
}
.button-change{
  width: 50px;
  height: 26px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
.custom-dialog .el-dialog__wrapper {
  overflow-y: auto;
  max-height: none;
}

.form-with-vertical-items {
display: flex;
flex-direction: column; /* 这里改为column使得子元素垂直排列 */
}

/* 如果需要每个表单项之间有间隔，可以添加 */
.form-with-vertical-items .el-form-item {
margin-bottom: 1rem; /* 或者你喜欢的任何间距 */
}
</style>
