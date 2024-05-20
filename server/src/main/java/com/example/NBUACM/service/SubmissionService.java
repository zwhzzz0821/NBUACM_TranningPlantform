package com.example.NBUACM.service;
import com.example.NBUACM.POJO.MySQLTable.ACSubmission;
import com.example.NBUACM.POJO.ReceiveCFData.submission_info.Submission_Info_DataBean;
import com.example.NBUACM.POJO.ReceiveCFData.submission_info.Submission_Info_Response;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.List;
@Transactional
public interface SubmissionService {

    @Scheduled(fixedRate = 24 * 60 * 60 * 1000, initialDelay = 5000)
    void updateACandSubmitsASScheduled();


    Submission_Info_Response getSubmissionsByHandleFromCF(String handle);

    void insertOneAcSubmission(Submission_Info_DataBean data, String handle);

    void uodateTableAllAcSubmission(Submission_Info_Response response, String handle);

    List<ACSubmission> getACSubmissionFromDBByHandle(String handle);

    void updateUserSubmits(Submission_Info_Response response, String handle);

    void updateWeekANDMonthANDTotalAvgACRatingWithHandle(String handle);

    void updateAllUserSubmissionStatus();

    boolean isThisWeek(long actime);

    boolean isThisMonth(long actime);

    void dealWithAllNoExistProblem(Submission_Info_Response response);
}
