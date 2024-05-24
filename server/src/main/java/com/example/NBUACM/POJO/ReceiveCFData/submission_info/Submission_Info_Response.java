package com.example.NBUACM.POJO.ReceiveCFData.submission_info;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Submission_Info_Response {
    private String status;
    private List<Submission_Info_DataBean> result;
}
