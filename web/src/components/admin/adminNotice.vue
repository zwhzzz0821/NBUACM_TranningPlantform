<template>
<div>
    <el-button type="primary" @click="JumpToCreateNotice">创建新通知</el-button>

    <el-header style="height: 20%; padding: 10;">
        <el-form style="padding: 1em" :inline="true" class="demo-form-inline">
        <el-form-item label="发布人" style="margin-left: 60px">
            <el-input v-model="searchName" placeholder="发布人"></el-input>
        </el-form-item>
        <el-form-item label="主题" style="margin-left: 20px">
            <el-input v-model="searchTheme" placeholder="主题"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="find" class="niceButton5" style="margin-left: 50px"><span>查找</span></el-button>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="update" class="niceButton5" style="margin-left: 15px"><span>刷新</span></el-button>
        </el-form-item>
        </el-form>
    </el-header>

    <el-table :data="pagedRows" style="width: 100%">
        <el-table-column type="expand">
            <template slot-scope="props">
                <el-form label-position="left" inline class="demo-table-expand">
                        <el-container style="width: 100%; margin: 15px;">
                            <el-card style="width: 200%; margin: 0px">
                                <v-md-editor :value="props.row.info" mode="preview"></v-md-editor>
                            </el-card>
                        </el-container>
                </el-form>
            </template>
        </el-table-column>
        <el-table-column
        label="ID"
        prop="id">
        </el-table-column>
        <el-table-column
        label="发布人"
        prop="author">
        </el-table-column>
        <el-table-column label="更新时间" prop="date">
            <template slot-scope="props">
                <span>{{ $formatTime(props.row.date) }}</span>
            </template>
        </el-table-column>
        <el-table-column
        label="主题"
        prop="title">
        </el-table-column>
        <el-table-column label="操作">
            <template slot-scope="props">
                <div>
                    <el-button type="primary" @click="deleteNotice(props.row)" class="niceButton5">删除</el-button>
                    <el-button type="primary" @click="JumpToUpdateNotice(props.row)" class="niceButton5">编辑</el-button>
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
    

</div>
</template>

<script>
import request from "../../util/request";
import { Toast } from 'vant';
export default {
    data() {
        return {
            notices:[],
            totalRows: 0,
            currentPage: 1,
            pageSize: 10,
            pagedRows: [],  //分页
            searchName: null,
            searchTheme: null

        }
    },
    methods:{
        
        getAllNotices() {
            request.get('/Notice/getAll').then(res => {
                if(res.code === 200) {
                    this.notices = res.notices.sort((a, b) => {
                        return b.date - a.date; // 降序排序
                    });
                    console.log("notices:",this.notices);
                } else {
                    Toast.fail('获取数据失败')
                }
                
            });
        },

        deleteNotice(row) {
            console.log("row",row)
            request.post('/Notice/deleteOne', {
                id:row.id
            }).then(res => {
                if(res.code === 200) {
                    Toast.success("删除用户成功");
                    this.getAllNotices();  //更新当前通知界面
                } else {
                    Toast.fail("删除用户失败");
                }
            })
        },

        JumpToUpdateNotice(row) {
            this.$router.push({ path: '/admin/notice/update/' + row.id });
        },

        JumpToCreateNotice() {
            this.$router.push({ path: '/admin/notice/create' });
        },

        onPageChange(page) {
            this.currentPage = page;
            this.pagedRows = this.currentPagedData;
        },

        find() {
            const targetSearchName = this.searchName;
            const targetSearchTheme = this.searchTheme;
            console.log(targetSearchName)
            
            // 使用 filter() 方法筛选满足条件的数据，并赋值给 this.notices
            this.notices = this.notices.filter(item => {

                // 检查作者名是否包含搜索的名称
                const isAuthorMatch = targetSearchName ? item.author.includes(targetSearchName) : true;
                // 检查标题是否包含搜索的主题
                const isTitleMatch = targetSearchTheme ? item.title.includes(targetSearchTheme) : true;

                // 如果作者或标题匹配，则保留该项
                return isAuthorMatch && isTitleMatch;
                
                // return item.author == targetSearchName || item.title == targetSearchTheme;  //用这玩意只能查完整的数据
            });
        },

        update() {
            this.getAllNotices();
        }
        

    },
    created() {
        this.getAllNotices();
    },
    mounted() {
        
    },
    watch: {
      // 监听原始数据变化，重新计算分页数据
      notices(newRows) {
        this.totalRows = newRows.length;
        this.pagedRows = this.currentPagedData;
      },
    },
    computed: {
      /**
       * 根据当前页码和每页大小计算分页数据
       */
      currentPagedData() {
        const start = (this.currentPage - 1) * this.pageSize;
        const end = start + this.pageSize;

        return this.notices.slice(start, end);
      },
    },
}

</script>

<style scoped>
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
</style>