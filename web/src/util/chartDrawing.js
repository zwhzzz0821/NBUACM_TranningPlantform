import * as echarts from "echarts";
import moment from "moment";


function showAcSubmissionsTypeChart(status) {
    const chartDom = document.getElementById("acSubmissionsType");
    const myChart = echarts.init(chartDom);
    const option = {
      title: {
        text: `${status.ac_submission_number} AC submissions`,
        left: "center",
      },
      xAxis: {
        type: "category",
        data: ["入门", "普及-", "普及/提高-", "普及+/提高", "提高+/省选-", "省选/NOI-", "NOI/NOI+/CTSC"],
      },
      yAxis: {
        type: "value",
      },
      tooltip: {
        trigger: "axis",
      },
      series: [
        {
          data: [
            {
              value: status["easy_ac_submission_number1"],
              name: "入门",
              itemStyle: {
                color: "#f3a683",
              },
            },
            {
                value: status["easy_ac_submission_number2"],
                name: "普及-",
                itemStyle: {
                    color: "#f3a683",
                },
            },
            {
              value: status["medium_ac_submission_number1"],
              name: "普及/提高-",
              itemStyle: {
                color: "#778beb",
              },
            },
            {
                value: status["medium_ac_submission_number2"],
                name: "普及+/提高",
                itemStyle: {
                  color: "#778beb",
                },
            },
            {
              value: status["hard_ac_submission_number"],
              name: "提高+/省选-",
              itemStyle: {
                color: "#cf6a87",
              },
            },
            {
              value: status["veryhard_ac_submission_number"],
              name: "省选/NOI-",
              itemStyle: {
                color: "#3dc1d3",
              },
            },
            {
              value: status["hardcore_ac_submission_number"],
              name: "NOI/NOI+/CTSC",
              itemStyle: {
                color: "#574b90",
              },
            },
          ],
          type: "bar",
        },
      ],
    };
    myChart.setOption(option);
    window.addEventListener('resize', () => {
        myChart.resize();
    });
}

function showTotalSubmissionsChart(status) {
    const chartDom = document.getElementById("totalSubmissions");
    const myChart = echarts.init(chartDom);
    const option = {
      title: {
        text: `AC rate: ${parseInt(
          (100 * status.ac_submission_number) / status.submission_number
        )}%`,
        left: "center",
      },
      tooltip: {
        trigger: "item",
      },
      series: [
        {
          type: "pie",
          radius: "50%",
          label: {
            show: false,
          },
          data: [
            {
              value: status.ac_submission_number,
              name: "Accepted",
              itemStyle: {
                color: "#67C23A",
              },
            },
            {
              value: status.submission_number - status.ac_submission_number,
              name: "Others",
              itemStyle: {
                color: "#F56C6C",
              },
            },
          ],
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: "rgba(0, 0, 0, 0.5)",
            },
          },
        },
      ],
    };
    myChart.setOption(option);
    window.addEventListener('resize', () => {
        myChart.resize();
    });
}



function showCareerCharts(submissionStatus) {
    showAcSubmissionsTypeChart(submissionStatus);
    showTotalSubmissionsChart(submissionStatus);
}
//-------------------------------------------------------------------------------------------以上Career，以下Activity


function transformCalendarData(calendarSubmissions) {
  const calendarMap = {};
  calendarSubmissions.forEach((calendarSubmissions) => {
    const submitDate = moment.unix(calendarSubmissions.actime).format("YYYY-MM-DD");
    calendarMap[submitDate] = calendarMap[submitDate]
      ? calendarMap[submitDate] + 1
      : 1;
  });
  const calendarArray = [];
  for (const submitDate in calendarMap) {
    calendarArray.push([submitDate, calendarMap[submitDate]]);
  }
  return calendarArray;
}


function showCalendarChart(calendarSubmissions) {
  const data = transformCalendarData(calendarSubmissions);
  // console.log("calendar->data:",data);
  const chartDom = document.getElementById("calendar");
  const myChart = echarts.init(chartDom);
  const option = {
    title: {
      left: "center",
      text: `${calendarSubmissions.length} AC submissions in the past 6 months`,
    },
    tooltip: {
      position: "top",
      formatter: function (p) {
        const format = echarts.time.format(
          p.data[0],
          "{yyyy}-{MM}-{dd}",
          false
        );
        return format + ": " + p.data[1];
      },
    },
    legend: {
      show: false,
    },
    visualMap: {
      pieces: [
        { value: 1, color: "#E8F5E9" },  // 浅绿色
        { value: 2, color: "#C8E6C9" },
        { value: 3, color: "#A5D6A7" },
        { value: 4, color: "#81C784" },
        { value: 5, color: "#66BB6A" },
        { value: 6, color: "#4CAF50" },
        { value: 7, color: "#43A047" },  // 较深的绿色
        { min: 7, color: "#388E3C" }     // 更深的绿色
      ],
      type: "piecewise",
      orient: "horizontal",
      left: "center",
      top: 9999,
    },
    calendar: {
      top: 60,
      left: 50,
      right: 50,
      cellSize: ["auto", 13],
      range: [
        moment().subtract(182, "days").format("YYYY-MM-DD"),
        moment().subtract(1, "days").format("YYYY-MM-DD"),
      ],
      itemStyle: {
        borderWidth: 0.5,
      },
      yearLabel: { show: false },
    },
    series: {
      type: "heatmap",
      coordinateSystem: "calendar",
      data: data,
    },
  };
  myChart.setOption(option);
  window.addEventListener('resize', () => {
    myChart.resize();
  });
}





function showRecentUserStatusChart(submissionStatus, allUserSubmissionStatus) {
  const maxData = [
    parseInt(allUserSubmissionStatus.maxTotalAverageACRating),
    allUserSubmissionStatus.maxWeekAC,
    parseInt(allUserSubmissionStatus.maxWeekAverageACRating),
    allUserSubmissionStatus.maxMonthAC,
    parseInt(allUserSubmissionStatus.maxMonthAverageACRating),
  ];
  const averageData = [
    parseInt(allUserSubmissionStatus.avgTotalAverageACRating),
    allUserSubmissionStatus.avgWeekAC.toFixed(2),
    parseInt(allUserSubmissionStatus.avgWeekAverageACRating),
    allUserSubmissionStatus.avgMonthAC.toFixed(2),
    parseInt(allUserSubmissionStatus.avgMonthAverageACRating),
  ];
  const chartDom = document.getElementById("recentUserStatus");
  const myChart = echarts.init(chartDom);
  const option = {
    legend: {
      data: ["Max", "Average", "User"],
      orient: "vertical",
      left: "left",
    },
    tooltip: {
      trigger: "item",
    },
    radar: {
      shape: "circle",
      indicator: [
        { name: "Total avg rating", max: maxData[0], color: "#464646" },
        { name: "Week AC", max: maxData[1], color: "#464646" },
        { name: "Week avg rating", max: maxData[2], color: "#464646" },
        { name: "Month AC", max: maxData[3], color: "#464646" },
        { name: "Month avg rating", max: maxData[4], color: "#464646" },
      ],
    },
    series: [
      {
        type: "radar",
        data: [
          {
            value: maxData,
            name: "Max",
          },
          {
            value: averageData,
            name: "Average",
          },
          {
            value: [
              parseInt(submissionStatus.average_ac_rating),
              submissionStatus.week_ac_submission_number,
              parseInt(submissionStatus.week_average_ac_rating),
              submissionStatus.month_ac_submission_number,
              parseInt(submissionStatus.month_average_ac_rating),
            ],
            name: "User",
            label: {
              show: true,
              formatter: function (params) {
                return params.value;
              },
            },
          },
        ],
      },
    ],
  };

  myChart.setOption(option);
  window.addEventListener('resize', () => {
    myChart.resize();
  });
}

function showActivityCharts(calendarSubmissions,submissionStatus,allUserSubmissionStatus) {
  showCalendarChart(calendarSubmissions);
  showRecentUserStatusChart(
    submissionStatus,
    allUserSubmissionStatus
  );
}










export { showCareerCharts, showActivityCharts };