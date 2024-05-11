package com.example.NBUACM.POJO.problem_info;

import com.example.NBUACM.POJO.user_info.User_Info_DataBean;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Problem_Info_Response {
    private String status;
    private List<Problem_Info_DataBean> result;
}
