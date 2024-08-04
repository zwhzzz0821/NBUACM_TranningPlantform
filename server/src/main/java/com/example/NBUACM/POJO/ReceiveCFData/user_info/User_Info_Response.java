package com.example.NBUACM.POJO.ReceiveCFData.user_info;

import java.util.List;

import com.example.NBUACM.POJO.ReceiveCFData.SuperClass.RtDataFromCF;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User_Info_Response extends RtDataFromCF {
    private List<User_Info_DataBean> result;
}
