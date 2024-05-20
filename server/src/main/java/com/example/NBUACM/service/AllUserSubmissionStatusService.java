package com.example.NBUACM.service;

import com.example.NBUACM.POJO.MySQLTable.AllUserSubmissionStatus;
import com.example.NBUACM.service.impl.AllUserSubmissionStatusServiceImpl;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface AllUserSubmissionStatusService {

    AllUserSubmissionStatus getAllUserSubmissionStatus();
}
