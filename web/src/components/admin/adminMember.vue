<template>
    <div>
      <el-container style="height: 100%; width: 100%">
        <el-header style="height: 10%; padding: 0;">
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
            <el-form-item>
              <el-button type="primary" @click="openAddMemberDialog" class="niceButton5" style="margin-left: 15px; width: auto;"><span>增添新成员</span></el-button>
            </el-form-item>
						<el-dialog
							:visible.sync="dialogVisible"
							title="添加新成员"
							width="25%"
							:before-close="CloseDialog">
							<el-form :model="newMemberForm" ref="newMemberForm" label-width="15%" class="form-with-vertical-items" style="width: 100%;">
								<el-form-item label="姓名">
									<el-input v-model="newMemberForm.username" style="width: 150%;"></el-input>
								</el-form-item>
								<el-form-item label="学号">
									<el-input v-model="newMemberForm.uid"  style="width: 150%;"></el-input>
								</el-form-item>
								<el-form-item label="密码">
									<el-input v-model="newMemberForm.password"  style="width: 150%;"></el-input>
								</el-form-item>
								<el-form-item label="角色">
									<el-select v-model="roleSelected" style="width: 140%;">
										<el-option
											v-for="(role, index) in roles"
											:key="index"
											:label="role.label"
											:value="role.value">
										</el-option>
									</el-select>
								</el-form-item>
								<el-form-item label="CF ID">
									<el-input v-model="newMemberForm.codeforceshandle" style="width: 150%;"></el-input>
								</el-form-item>
								<el-form-item>
									<span>
										<el-button type="primary" @click="addNewMember" style="margin-left: 200%;">确定</el-button>
									</span>
								</el-form-item>	
							</el-form>
						</el-dialog>
          </el-form>
        </el-header>
        <el-divider></el-divider>
        <el-table
          :data="pagedRows"
          :row-style="{ height: '40px' }"
          style="width: 100%; margin-left: 0 auto">
            <el-table-column
                type="index"
                label="序号"
                >
            </el-table-column>
            <el-table-column
            label="学号"
            >
						<template slot-scope="scope">
							<div>
								{{ scope.row.user.uid }}
							</div>
						</template>
            </el-table-column>
            <el-table-column
            label="密码"
            prop="user.password">
            </el-table-column>
            <el-table-column
            label="姓名"
            >
						<template slot-scope="scope">
							<div>
							{{ scope.row.user.username }}
							</div>
						</template>
            </el-table-column>
            <el-table-column
            label="CodeForces用户名"
            >
						<template slot-scope="scope">
							<div>
							<span :style="`color: ${getRatingColor(scope.row.user.codeforcesrating)}`">
              <span :class="scope.row.user.codeforcesrating >= 3000 ? `first-letter-black` : ``">
                {{ scope.row.user.codeforceshandle ? scope.row.user.codeforceshandle : "No rating" }}
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
							<span :style="`color: ${getRatingColor(scope.row.user.codeforcesrating)}`">
              <span :class="scope.row.user.codeforcesrating >= 3000 ? `first-letter-black` : ``">
                {{ scope.row.user.codeforcesrating ? scope.row.user.codeforcesrating : "No rating" }}
              </span>
            </span>
							</div>
						</template>
            </el-table-column>
						<el-table-column
						label="操作"
						>
							<template slot-scope="scope">
								<div>
									<el-button type="primary" @click="deleteMember(scope.row)" class="niceButton5">删除</el-button>
								</div>
							</template>
						</el-table-column>

            <el-table-column
            type="expand">
            <template slot-scope="props">
                <el-button type="text" @click="showChart(props.row)">查看rating折线图</el-button>
                <!-- 为每个图表创建一个独立的容器 -->
                <div :ref="'ratingChart-' + props.row.user.uid" class="rating-chart"></div>
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
import echarts from 'echarts';	
import request from "../../util/request";
import { getRatingColor, timeStamp} from "../../util/CFshow";
import { Toast } from 'vant';
  export default {
    name: "Member",
    data() {
      return {
        rows: null,
        currentPage: 1,
        pageSize: 10,
        totalRows: 0,
        number: null,
        username: "",
        pagedRows: [],
        dialogVisible: false,
				newMemberForm: {
					username: '',
					uid: '',
					password: '',
					codeforceshandle: '',
				},
				roles: [
					{ value: 'admin', label: '管理员' },
					{ value: 'member', label: '普通成员' },
				],
				roleSelected: '',
        selectedCommand: '',
        dialogData: [],
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
			openAddMemberDialog() {
				this.dialogVisible = true;
			},
			closeDialog() {
				this.dialogVisible = false;
				// 清空表单
				this.newMemberForm = {
					username: '',
					uid: '',
					password: '',
					codeforceshandle: ''
				};
        this.roleSelected = ''
			},

      checkFieldsNotEmpty() {
        let errors = [];

        if (!this.newMemberForm.username) {
          errors.push('用户名不能为空。');
        }
        if (!this.newMemberForm.uid) {
          errors.push('用户ID不能为空。');
        }
        if (!this.newMemberForm.password) {
          errors.push('密码不能为空。');
        }
        if (!this.newMemberForm.codeforceshandle) {
          errors.push('codeforces的用户名不能为空。')
        }

        if (errors.length > 0) {
          // 使用 this.$message 显示错误信息
          this.$message.error(errors.join(' '));
          return false;
        }
        return true;
      },
			addNewMember() {
				// 验证表单数据
				const isFormValid = this.checkFieldsNotEmpty();

				if (isFormValid) {
					console.log('添加新成员:', this.newMemberForm);
					if (this.roleSelected == 'admin') {
						request.post('/user/register/manager', this.newMemberForm).then(response => {
							if (response.code === 200) {
                this.$message.success('管理员添加成功！')
                this.update()
								this.closeDialog();
							} else {
								this.$message.error('添加失败，请重试');
							}
						});
					} else if(this.roleSelected == 'member') {
						request.post('/user/register', this.newMemberForm).then(response => {
							if (response.code === 200) {
								this.$message.success('成员添加成功！');
								this.closeDialog();
                this.update()
							} else {
								this.$message.error('添加失败，请重试。');
							}
						})
					} else {
            this.$message.warning('请检查并完善表单信息。');
          }
				} else {
					// this.$message.warning('请检查并完善表单信息。');
          Toast.fail('请检查并完善表单信息。')
				}
			},
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
        request.get('/CFAPI/get_user_with_ratinglists', {

        }).then(res => {
          if(res.code === 200) {
            this.rows = res.userwithratinglists;
            console.log("userwithratinglists:",this.rows);
          } else {
            this.$message.error('获取数据失败');
          }
          
          
        }).catch(()=>{})
      },
      showChart(row) {
        const ratingData = row.ratinglist.map(item => item.newrating);
        const valueList = row.ratinglist.map(item => item.newrating);
        const dateList = row.ratinglist.map(item => this.$formatTime(item.ratingupdatetimeseconds));

        console.log("valueList", valueList)
        console.log("dateList", dateList)

        const chartRef = 'ratingChart-' + row.user.uid; // 创建一个唯一的引用
        // 初始化图表实例
        const chartInstance = echarts.init(this.$refs[chartRef]);
        // 设置图表数据
        chartInstance.setOption({
          "visualMap": [
            {
              "show": false,
              "type": "continuous",
              "min": 0,
              "max": 3000,
              "inRange": {
                "color": [
                  '#cccccc', // 新手 灰色
                  '#00cc00', // 入门 绿色
                  '#00cccc', // 专家 青色
                  '#0000ff', // 行家 蓝色
                  '#800080', // 能手 紫色
                  '#ffa500', // 主宰 橙色
                  '#ff6a00', // 国际主宰 深橙色
                  '#ff0000', // 特级大师 红色
                  '#990000'  // 国际特级大师 黑红色
                ]
              },
              "pieces": [
                {
                  "min": 0,
                  "max": 1200,
                  "label": '新手',
                  "color": '#cccccc' 
                },
                {
                  "min": 1200,
                  "max": 1400,
                  "label": '入门',
                  "color": '#00cc00' 
                },
                {
                  "min": 1400,
                  "max": 1600,
                  "label": '专家',
                  "color": '#00cccc' 
                },
                {
                  "min": 1600,
                  "max": 1900,
                  "label": '行家',
                  "color": '#0000ff' 
                },
                {
                  "min": 1900,
                  "max": 2100,
                  "label": '能手',
                  "color": '#800080' 
                },
                {
                  "min": 2100,
                  "max": 2300,
                  "label": '主宰',
                  "color": '#ffa500' // 橙色
                },
                {
                  "min": 2300,
                  "max": 2400,
                  "label": '国际主宰',
                  "color": '#ff6a00' // 深橙色
                },
                {
                  "min": 2400,
                  "max": 2600,
                  "label": '特级大师',
                  "color": '#ff0000' // 红色
                },
                {
                  "min": 2600,
                  "max": 3000,
                  "label": '国际特级大师',
                  "color": '#ff0000' // 红色
                },
                {
                  "min": 3000,
                  "label": '彩胳传奇特级大师',
                  "color": '#990000' // 黑红色
                }
              ],
              "orient": 'vertical', // 布局方式，默认为水平布局 'horizontal'
              "left": 'right', // 组件离容器左侧的距离
              "top": 'bottom' // 组件离容器上侧的距离
            }
          ],
          
          "title": [
            {
              "left": "center",
              "text": ""
            }
          ],
          "tooltip": {
            "trigger": "axis"
          },
          "xAxis": [
            {
              "data": dateList
            }
          ],
          "yAxis": [
            {
              
            }
          ],
          "grid": [
            {
              "bottom": "10%"
            }
          ],
          "series": [
            {
              "type": "line",
              "showSymbol": false,
              "data": valueList
            }

          ]
        });

      },

      deleteMember(row) {
        request.post('/user/deleteuser', {
          uid:row.user.uid
        }).then(res => {
          if(res.code === 200) {
            Toast.success("删除成功")
            this.update()   //更新数据
          } else {
            Toast.fail("删除失败")
          }
        })
      },
      //继续添加函数
    },
    created() {
      this.update()
    },
    mounted() {
      this.update()
    }
  }
</script>
  
<style scoped>
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
  