package com.example.NBUACM.POJO.ReceiveCFData.problem_info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Problem_Info_Response {
    private String status;
    private Problem_Info_Problemlist result;
}
