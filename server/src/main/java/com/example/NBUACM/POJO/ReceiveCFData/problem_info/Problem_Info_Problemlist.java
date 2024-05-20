package com.example.NBUACM.POJO.ReceiveCFData.problem_info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Problem_Info_Problemlist {
    public List<Problem_Info_DataBean> problems;
}
