package com.example.NBUACM.service.impl;

import com.example.NBUACM.POJO.MySQLTable.AllUserSubmissionStatus;
import com.example.NBUACM.mapper.AllUserSubmissionStatusMapper;
import com.example.NBUACM.service.AllUserSubmissionStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AllUserSubmissionStatusServiceImpl implements AllUserSubmissionStatusService {
    @Autowired
    private AllUserSubmissionStatusMapper allUserSubmissionStatusMapper;

    /*
    * 如果当前数据库表里没有数据，那就新建一条记录，而且只能拿一条记录，反正update我们mysql表的时候会更新所有表，选哪个不重要
    * */
    @Override
    public AllUserSubmissionStatus getAllUserSubmissionStatus() {
        try {
            AllUserSubmissionStatus allUserSubmissionStatus = allUserSubmissionStatusMapper.getAllUserSubmissionStatus();
            if(allUserSubmissionStatus == null) {
                AllUserSubmissionStatus temp = new AllUserSubmissionStatus();
                allUserSubmissionStatusMapper.insertAllUsrSbmssnStts(temp);
            }
            return allUserSubmissionStatusMapper.getAllUserSubmissionStatus();
        } catch (Exception e) {
            System.out.println("AllUserSubmissionStatusServiceImpl err :" + e.getMessage());  //如果出故障了，那我也照样新增一行，把数据给到前端。
            AllUserSubmissionStatus temp = new AllUserSubmissionStatus();
            allUserSubmissionStatusMapper.insertAllUsrSbmssnStts(temp);
            return allUserSubmissionStatusMapper.getAllUserSubmissionStatus();
        }

    }


}
