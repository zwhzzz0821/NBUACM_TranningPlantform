package com.example.NBUACM.service.impl;

import com.example.NBUACM.POJO.MySQLTable.Submission;
import com.example.NBUACM.POJO.MySQLTable.AllUserSubmissionStatus;
import com.example.NBUACM.POJO.ReceiveCFData.problem_info.Problem_Info_DataInDB;
import com.example.NBUACM.POJO.ReceiveCFData.submission_info.Submission_Info_DataBean;
import com.example.NBUACM.POJO.ReceiveCFData.submission_info.Submission_Info_Response;
import com.example.NBUACM.entity.User;
import com.example.NBUACM.mapper.SubmissionMapper;
import com.example.NBUACM.mapper.AllUserSubmissionStatusMapper;
import com.example.NBUACM.mapper.ProblemMapper;
import com.example.NBUACM.mapper.UserMapper;
import com.example.NBUACM.service.ProblemService;
import com.example.NBUACM.service.SubmissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.TemporalAdjusters;
import java.util.Collections;
import java.util.List;

@Service
public class SubmissionServiceImpl implements SubmissionService {

    @Autowired
    private SubmissionMapper acsubmissionMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ProblemMapper problemMapper;
    @Autowired
    private AllUserSubmissionStatusMapper allUserSubmissionStatusMapper;


    @Autowired
    private ProblemService problemService;


    @Override
    @Scheduled(fixedRate = 60 * 1000, initialDelay = 5000)
    public void updateACandSubmitsASScheduled() {
        List<User> userlist = userMapper.getAllUsers();
        int user_len = userlist.size();

        for(int i=0 ;i < user_len; i++) {
            String handle = userlist.get(i).getCodeforceshandle();
            String uid = userlist.get(i).getUid();

            Submission_Info_Response response = getSubmissionsByHandleFromCF(handle);  //从CF那边拿数据

            updateUserSubmits(response, handle); //拿到的信息在这里分析并更新后端数据库的user表

//            dealWithAllNoExistProblem(response);   //先把problem表中不存在的部分给更新一下
            uodateTableAllAcSubmission(response, handle, uid); //更新acsubmission表

            /*
            * 接下来更新user表中的周AC题目的平均rating，月AC题目的平均rating，以及所有AC题目的平均rating
            * */
            updateWeekANDMonthANDTotalAvgACRatingWithHandle(handle);
        }
        /*
         * 接下来更新allusersubmissionstatus表的各个max和avg
         * */
        updateAllUserSubmissionStatus();

    }


    @Override
    public Submission_Info_Response getSubmissionsByHandleFromCF(String handle) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        String url = "https://codeforces.com/api/user.status?handle=" + handle;
        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<Submission_Info_Response> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    Submission_Info_Response.class  // 指定返回类型为Response
            );
            Submission_Info_Response response = responseEntity.getBody();
//            uodateTableAllAcSubmission(response, handle);   //更新后端mysql数据库        这个姑且不需要了
//            updateUserSubmits(response, handle);
            System.out.println("获取用户提交数据成功");
            return response;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }

    @Override
    public void updateUserSubmits(Submission_Info_Response response, String handle) {
        List<Submission_Info_DataBean> list = response.getResult();

        int length = list.size();

        int monthAC = 0;
        int monthSubmits = 0;
        int weekAC = 0;
        int weekSubmits = 0;
        int totalSubmits = length;
        int totalACSubmits = 0;


        int Difficulty1 = 0;
        int Difficulty2 = 0;
        int Difficulty3 = 0;
        int Difficulty4 = 0;
        int Difficulty5 = 0;
        int Difficulty6 = 0;
        int Difficulty7 = 0;


        for(int i=0; i < length; i++) {
            Submission_Info_DataBean data = list.get(i);
            long actime = data.getCreationTimeSeconds();


            if(data.getVerdict().equals("OK")) {
                totalACSubmits++;
                int rating = list.get(i).getProblem().getRating();

                if(rating < 900) {  //入门
                    Difficulty1++;
                } else if(rating < 1200) { //普及-
                    Difficulty2++;
                } else if(rating < 1600) { //普及/提高-
                    Difficulty3++;
                } else if(rating < 2000) { //普及+/提高
                    Difficulty4++;
                } else if(rating < 2400) { //提高+/省选-
                    Difficulty5++;
                } else if(rating < 3000) { //省选/NOI-
                    Difficulty6++;
                } else { //NOI/NOI+/CTSC
                    Difficulty7++;
                }
            }

            if(isThisWeek(actime)) {
                weekSubmits++;
                if(data.getVerdict().equals("OK")) {
                    weekAC++;
                }
            }

            if(isThisMonth(actime)) {
                monthSubmits++;
                if(data.getVerdict().equals("OK")) {
                    monthAC++;
                }
            }


        }

        userMapper.updateMonthACByHandle(handle, monthAC);
        userMapper.updateWeekACByHandle(handle, weekAC);
        userMapper.updateMonthSubmitsByHandle(handle,monthSubmits);
        userMapper.updateWeekSubmitsByHandle(handle, weekSubmits);
        userMapper.updateTotalSubmitsByHandle(handle, totalSubmits);
        userMapper.updateTotalACSubmitsByHandle(handle, totalACSubmits);

        userMapper.updateDifficulty1(handle, Difficulty1);
        userMapper.updateDifficulty2(handle, Difficulty2);
        userMapper.updateDifficulty3(handle, Difficulty3);
        userMapper.updateDifficulty4(handle, Difficulty4);
        userMapper.updateDifficulty5(handle, Difficulty5);
        userMapper.updateDifficulty6(handle, Difficulty6);
        userMapper.updateDifficulty7(handle, Difficulty7);

    }


    @Override
    public void updateWeekANDMonthANDTotalAvgACRatingWithHandle(String handle) {
        List<Submission> list = acsubmissionMapper.getACSubmissionByhandle(handle, "OK");
        int len = list.size();

        double week_Sum_Rating = 0;
        double month_Sum_Rating = 0;
        double total_Sum_Rating = 0;
        int week_Count = 0;
        int month_Count = 0;
        int total_Count = 0;

        for(int i = 0; i < len; i++) {
            Submission data = list.get(i);


            long actime = data.getActime();

            if(isThisWeek(actime)) {
                week_Sum_Rating+=data.getProblemRating();
                week_Count++;
            }

            if(isThisMonth(actime)) {
                month_Sum_Rating+=data.getProblemRating();
                month_Count++;
            }

            total_Sum_Rating+=data.getProblemRating();
            total_Count++;

        }
        double weekAvgACRating = 0;
        double monthAvgRating = 0;
        double totalAvgRating = 0;

        if(week_Count > 0) {
            weekAvgACRating = week_Sum_Rating / week_Count;
        }

        if(month_Count > 0) {
            monthAvgRating = month_Sum_Rating / month_Count;
        }

        if(total_Count > 0) {
            totalAvgRating = total_Sum_Rating / total_Count;
        }

        userMapper.updateWeekAvgACRating(weekAvgACRating, handle);
        userMapper.updateMonthAvgACRating(monthAvgRating, handle);
        userMapper.updateTotalAvgACRating(totalAvgRating, handle);
    }

    @Override
    public void updateAllUserSubmissionStatus() {
        AllUserSubmissionStatus data = new AllUserSubmissionStatus();
        data.setMaxWeekAC(allUserSubmissionStatusMapper.getMaxWeekAC().getWeekAC());
        data.setMaxMonthAC(allUserSubmissionStatusMapper.getMaxMonthAC().getMonthAC());
        data.setMaxWeekAverageACRating(allUserSubmissionStatusMapper.getMaxWeekAverageACRating().getWeekAverageACRating());
        data.setMaxMonthAverageACRating(allUserSubmissionStatusMapper.getMaxMonthAverageACRating().getMonthAverageACRating());
        data.setMaxTotalAverageACRating(allUserSubmissionStatusMapper.getMaxTotalAverageACRating().getTotalAverageACRating());

        data.setAvgWeekAC(allUserSubmissionStatusMapper.getAvgWeekAC());
        data.setAvgMonthAC(allUserSubmissionStatusMapper.getAvgMonthAC());
        data.setAvgWeekAverageACRating(allUserSubmissionStatusMapper.getAvgWeekAverageACRating());
        data.setAvgMonthAverageACRating(allUserSubmissionStatusMapper.getAvgMonthAverageACRating());
        data.setAvgTotalAverageACRating(allUserSubmissionStatusMapper.getAvgTotalAverageACRating());

        allUserSubmissionStatusMapper.updateAllUserSubmissionStatus(data);

    }


    /*
     * 检查actime是否是本周
     * */
    @Override
    public boolean isThisWeek(long actime) {
        long timestamp = actime * 1000; // 注意，时间戳需要乘以1000，因为Java的时间戳是以毫秒为单位的

        Instant instant = Instant.ofEpochMilli(timestamp);
        LocalDate currentDate = LocalDate.now();    //获取当前日期
        LocalDate dateFromInstant = instant.atZone(ZoneId.systemDefault()).toLocalDate();   //actime对应的时间

        // 获取当前日期所在周的星期一
        LocalDate startOfWeek = currentDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        // 获取时间戳所在周的星期一
        LocalDate startOfInstantWeek = dateFromInstant.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));

        // 检查两个日期是否在同一周的星期一
        boolean isThisWeek = startOfWeek.equals(startOfInstantWeek);
        if(isThisWeek) {
            return true;
        }
        return false;
    }


    /*
     * 检查actime是否是本月
     * */
    @Override
    public boolean isThisMonth(long actime) {
        long timestamp = actime * 1000; // 注意，时间戳需要乘以1000，因为Java的时间戳是以毫秒为单位的

        Instant instant = Instant.ofEpochMilli(timestamp);
        LocalDate currentDate = LocalDate.now();    //获取当前日期
        LocalDate dateFromInstant = instant.atZone(ZoneId.systemDefault()).toLocalDate();   //actime对应的时间
        boolean isThisMonth = dateFromInstant.getMonth() == currentDate.getMonth() &&
                dateFromInstant.getYear() == currentDate.getYear();
        if(isThisMonth) {
            return true;
        }
        return false;
    }

    @Override
    public void insertOneAcSubmission(Submission_Info_DataBean data, String handle, String uid) {   //返回是否插入新AC数据成功

        Submission insertOne = new Submission();
        insertOne.setSubmissionIdFromCF(data.getId());
        insertOne.setContestId(data.getProblem().getContestId());
        insertOne.setProblemIndex(data.getProblem().getIndex());
        insertOne.setActime(data.getCreationTimeSeconds());
        insertOne.setHandle(handle);
        insertOne.setProblemRating(data.getProblem().getRating());
        insertOne.setVerdict(data.getVerdict());
        insertOne.setUid(userMapper.getUserByCodeforcesHandle(handle).getUid());

        List<Problem_Info_DataInDB> problem = problemMapper.getProblemByContestIdAndIndex(insertOne.getContestId(), insertOne.getProblemIndex());

        if(problem.size() == 0) { //在题目列表中没找着这个题目,那就插入新的题目,再取problemId进行赋值
            Problem_Info_DataInDB new_problem = new Problem_Info_DataInDB(data.getProblem());
            problemMapper.insert(new_problem);
            insertOne.setProblemId(new_problem.getProblemId());
        } else {
            insertOne.setProblemId(problem.get(0).getProblemId());
        }

//        if(problem.size() != 0) {
//            insertOne.setProblemId(problem.get(0).getProblemId());
//
//            if(problem.size() > 1) {
//                System.out.println("查到了多个problemId，分别是(这里只显示两个)：" + problem.get(0).getProblemId() + " and " + problem.get(1).getProblemId());
//            }
//        } else {
//            System.out.println("没在problem中找到：contestId and ProblemIndex ==== " + insertOne.getContestId() +" and " + insertOne.getProblemIndex());
//            System.out.println("↑的problem:"+data.getProblem());
////            Problem_Info_DataInDB no_exsit_inDB_problem = problemService.dealWithNoExistProblem(data.getProblem());
////            System.out.println(no_exsit_inDB_problem.getProblemId());
////            insertOne.setProblemId(no_exsit_inDB_problem.getProblemId()); //给它赋值最新的ProblemId
//        }


        acsubmissionMapper.InsertOneACSubmission(insertOne);

    }
    @Override
    public void uodateTableAllAcSubmission(Submission_Info_Response response, String handle, String uid) {

        List<Submission> old_list = acsubmissionMapper.getAllSubmissionByhandle(handle);
        int old_list_length = old_list.size();

        List<Submission_Info_DataBean> new_list = response.getResult();
        int new_list_length = new_list.size();
        System.out.println("old_list_length:" + old_list_length);
        System.out.println("new_list_length:" + new_list_length);

        for(int i = (new_list_length - old_list_length - 1); i >= 0; i--) {
            insertOneAcSubmission(new_list.get(i), handle, uid);//插入新出现的提交记录
        }


    }

    @Override
    public void dealWithAllNoExistProblem(Submission_Info_Response response) {
        List<Submission_Info_DataBean> new_list = response.getResult();
        int new_list_length = new_list.size();

        for(int i = 0; i < new_list_length; i++) {
            Submission_Info_DataBean data = new_list.get(i);

            List<Problem_Info_DataInDB> problem = problemMapper.getProblemByContestIdAndIndex(data.getProblem().getContestId(), data.getProblem().getIndex());

            if(problem.size() == 0) {  //problem表中不存在这个题目，那就插入新的题目
                Problem_Info_DataInDB new_problem = new Problem_Info_DataInDB(data.getProblem());
                problemMapper.insert(new_problem);
            }

        }
    }

    @Override
    public List<Submission> getACSubmissionFromDBByHandle(String handle) {
        try {
            List<Submission> list = acsubmissionMapper.getACSubmissionByhandle(handle, "OK");
            return list;

        } catch (Exception e) {
            System.out.println("Error:"+e.getMessage());
            return null;
        }


    }

    @Override
    public  List<Submission> getACSubmissionFromDBByVerdictAndProblemId(String verdict, long probleId) {
        try {
            List<Submission> list = acsubmissionMapper.getSubmissionByVerdictAndProblemId(verdict, probleId);
            return list;

        } catch (Exception e) {
            System.out.println("Error:"+e.getMessage());
            return null;
        }
    }

}
