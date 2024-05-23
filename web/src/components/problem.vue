<template>
    <div>
      <el-container style="height: 100%; width: 100%">
        <el-header style="height: 100%; padding: 0;">
          <el-form style="padding: 1em" :inline="true" class="demo-form-inline">
            <el-form-item label="问题号" style="margin-left: 60px">
              <el-input v-model="number" placeholder="问题号"></el-input>
            </el-form-item>
            <el-form-item label="比赛场次" style="margin-left: 20px">
              <el-input v-model="contestNumber" placeholder="比赛场次"></el-input>
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
        <el-table
          :data="pagedRows"
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
              <div>{{ scope.row.ProblemId }}</div>
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
              label="标签"
              >
            <template slot-scope="scope">
              <el-row class="tags-container">
                <el-tag style="margin: 5px;"
                  v-for="(tag, index) in scope.row.tags.split(',')"
                  :key="index"
                  :type="primary">
                  {{ tag }}
                </el-tag>
              </el-row>
            </template>
          </el-table-column>
          <el-table-column
              label="难度分"
              >
            <template slot-scope="scope">
              <div>
                <span :style="`color: ${getRatingColor(scope.row.rating)}`">
                  <div :class="scope.row.rating >= 3000 ? `first-letter-black` : ``">
                    {{ scope.row.rating ? scope.row.rating : "No rating" }}
                  </div>
                </span>
              </div>
  
            </template>
          </el-table-column>
          <el-table-column
              label="题解"
              >
            <template slot-scope="scope">
              <div>
                <el-button size="mini" type="primary" class="niceButton5" @click="handleViewOtherSolutions(scope.$index, scope.row)">查看</el-button>
                <el-button size="mini" type="primary" class="niceButton5" @click="postBlog(scope.row)">发布</el-button>
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
  import request from "@/util/request";
  import CFLogo from "../assets/CF.png";
  import { getRatingColor } from "@/util/CFshow";
  export default {
    name: "BlacklistManagement",
    data() {
      return {
        CFLogo: CFLogo,
        rows: null,
        currentPage: 1,
        pageSize: 10,
        totalRows: 0,
        number: null,
        contestNumber: null,
        pagedRows: []
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
      generateLink(row) {
        return `https://codeforces.com/problemset/problem/${row.contestId}/${row.ProblemIndex}`;
      },
      find() {
        const targetNumber = this.number;
        const targetUsername = this.username;
        
        // 如果 this.rows 为 null，则先获取数据
        if (!this.rows) {
            this.update();
            return; // 直到数据获取完毕再执行筛选
        }
        
        // 使用 filter() 方法筛选满足条件的数据，并赋值给 this.rows
        this.rows = this.rows.filter(item => {
            return item.number == targetNumber || item.username === targetUsername;
        });
      },
      onPageChange(page) {
        this.currentPage = page;
        this.pagedRows = this.currentPagedData;
      },
      update() {
        request.get('/Problem/show').then(res => {
          this.rows = res.problemList;
        })
      },
      handleViewOtherSolutions(index, row) {
        console.log('当前行的索引:', index);
        console.log('当前行的数据:', row);
         // TODO
        // 在这里添加实际的功能逻辑，比如跳转或数据处理
      },
      postBlog(row) {
        this.$router.replace('post/' + row.ProblemId)
      },
    },
    created() {
      this.update()
    }
  }
</script>
  
<style scoped>
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
</style>
  