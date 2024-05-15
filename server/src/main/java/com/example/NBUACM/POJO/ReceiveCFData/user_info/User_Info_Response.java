package com.example.NBUACM.POJO.ReceiveCFData.user_info;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User_Info_Response {
    private String status;
    private List<User_Info_DataBean> result;
}
