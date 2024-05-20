package com.example.NBUACM.POJO.ReceiveCFData.problem_info;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Problem_Info_DataInDB {
    @TableId(type = IdType.AUTO)
    private int ProblemId;
    private long contestId;
    private String ProblemIndex;
    private String name;
    private String Type;
    private Double points;
    private int rating;
    private String tags;

    public Problem_Info_DataInDB(Problem_Info_DataBean dataBean) {
        contestId = dataBean.getContestId();
        ProblemIndex = dataBean.getIndex();
        name = dataBean.getName();
        Type = dataBean.getType();
        points = dataBean.getPoints();
        rating = dataBean.getRating();
        tags = "";
        for (int i = 0; i < dataBean.getTags().size(); i++) {
            tags += dataBean.getTags().get(i);
            if (i + 1 != dataBean.getTags().size()) {
                tags += ",";
            }
        }
    }

}