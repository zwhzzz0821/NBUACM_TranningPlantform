package com.example.NBUACM.service;
import com.example.NBUACM.POJO.ReceiveCFData.submission_info.Submission_Info_Response;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.List;
@Transactional
public interface SubmissionService {
    Submission_Info_Response getSubmissionsByHandleFromCF(String handle);
}
