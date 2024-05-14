package com.example.NBUACM.POJO.problem_info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.example.NBUACM.POJO.problem_info.Problem_Info_DataBean;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Problem_Info_DataInDB {
    private long contestId;
    private String Index;
    private String name;
    private String Type;
    private Double points;
    private int rating;
    private String tags;

    public Problem_Info_DataInDB(Problem_Info_DataBean dataBean) {
        contestId = dataBean.getContestId();
        Index = dataBean.getIndex();
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