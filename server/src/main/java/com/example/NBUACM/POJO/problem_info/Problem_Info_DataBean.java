package com.example.NBUACM.POJO.problem_info;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Problem_Info_DataBean {
    private long contestId;
    private String index;
    private String name;
    private String type;
    private Double points;
    private int rating;
    private List<String> tags;
}