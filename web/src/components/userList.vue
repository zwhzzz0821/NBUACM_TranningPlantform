<template>
<div>
    <template>
    <el-table
        :data="tableData"
        style="width: 100%">
        <el-table-column
            type="index"
            label="序号"
            width="60">
        </el-table-column>
        <el-table-column
        label="学号"
        prop="user.uid">
        </el-table-column>
        <el-table-column
        label="密码"
        prop="user.password">
        </el-table-column>
        <el-table-column
        label="姓名"
        prop="user.username">
        </el-table-column>
        <el-table-column
        label="CodeForces用户名"
        prop="user.codeforceshandle">
        </el-table-column>
        <el-table-column
        label="CodeForces's rating"
        prop="user.codeforcesrating">
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
    </template>



</div>
</template>

<script>
import echarts from 'echarts';
import { ContactList, Toast } from 'vant';
import request from "../util/request";
export default{
    created() {
      this.getUserList();
    },
    data() {
      return {
        tableData: [],
      }
    },
    methods: {
      getUserList(){
        request.get('/CFAPI/get_user_with_ratinglists', {

        }).then(res => {
          this.tableData = res.userwithratinglists;
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

        }
    },
}
</script>
<style>
  .demo-table-expand {
    font-size: 0;
  }
  .demo-table-expand label {
    width: 90px;
    color: #99a9bf;
  }
  .demo-table-expand .el-form-item {
    margin-right: 0;
    margin-bottom: 0;
    width: 50%;
  }
  .chart-wrapper {
    margin-top: 10px;
  }
  .rating-chart {
    height: 300px;
  }
</style>