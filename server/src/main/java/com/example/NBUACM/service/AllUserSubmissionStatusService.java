package com.example.NBUACM.service;

import com.example.NBUACM.POJO.MySQLTable.AllUserSubmissionStatus;
import com.example.NBUACM.service.impl.AllUserSubmissionStatusServiceImpl;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface AllUserSubmissionStatusService {

    /*
    * 按照所有人的提交数据，获取它们的总体评价用的数据参考，比如这周平均AC题目数，最大的周AC数……
    * 有这些数据后可以用于对比自身的相关数据。
    * 有这些数据可以画出雷达图之类的。
    * */
    AllUserSubmissionStatus getAllUserSubmissionStatus();
}
