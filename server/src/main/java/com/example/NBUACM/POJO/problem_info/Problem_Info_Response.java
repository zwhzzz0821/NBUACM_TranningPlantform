package com.example.NBUACM.POJO.problem_info;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Problem_Info_Response {
    private String status;
    private Problem_Info_Problemlist result;
}
