package com.example.NBUACM.POJO.ReceiveCFData.submission_info;
import com.example.NBUACM.POJO.ReceiveCFData.Party;
import com.example.NBUACM.POJO.ReceiveCFData.problem_info.Problem_Info_DataBean;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Submission_Info_DataBean {

    private long id;
    private long contestId; // 可以为 null 或者不设置，表示可缺席
    private long creationTimeSeconds; // 使用 Unix 时间格式
    private long relativeTimeSeconds; // 相对于比赛开始的时间

    private Problem_Info_DataBean problem; // Problem 对象
    private Party author; // Party 对象
    private String programmingLanguage; // 编程语言
    private String verdict; // 判决结果，可以为 null 或者不设置
    private String testset; // 测试集类型
    private long passedTestCount; // 通过的测试用例数量
    private long timeConsumedMillis; // 单个测试用例最大耗时，单位为毫秒
    private long memoryConsumedBytes; // 单个测试用例最大内存消耗，单位为字

}
