package com.example.NBUACM.service.ApiClient;

import com.example.NBUACM.Exception.SpecificException;
import com.example.NBUACM.POJO.ReceiveCFData.user_info.User_Info_Response;
import com.example.NBUACM.POJO.ReceiveCFData.user_rating.User_Rating_DataBean;
import com.example.NBUACM.POJO.ReceiveCFData.user_rating.User_Rating_Response;
import com.example.NBUACM.POJO.ReturnAppFrontData.GroupedRatingList;
import com.example.NBUACM.entity.User;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public interface CodeforcesApiClient {
    /*
     * 第一个参数：访问的目标地址，例如"https://codeforces.com/api/user.info?handles={handle}"
     * 第二个参数：url中带的参数，后续会处理url中的花括号的部分
     * 第三个参数：返回的数据类型
     * */
    public <T> T exchangeForResponse(String urlTemplate, Map<String, String> uriVariables, Class<T> responseType) throws SpecificException;
}
