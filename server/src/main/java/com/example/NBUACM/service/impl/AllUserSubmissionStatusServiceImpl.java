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

    @Override
    public AllUserSubmissionStatus getAllUserSubmissionStatus() {
        return allUserSubmissionStatusMapper.getAllUserSubmissionStatus();
    }


}
