package com.example.NBUACM.service.impl;

import com.example.NBUACM.POJO.MySQLTable.ProblemListWithProblems;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithUsers;
import com.example.NBUACM.POJO.MySQLTable.Submission;
import com.example.NBUACM.POJO.ReturnAppFrontData.ProblemListWithProblemsState;
import com.example.NBUACM.entity.ProblemList;
import com.example.NBUACM.mapper.ProblemListMapper;
import com.example.NBUACM.mapper.ProblemListWithProblemsMapper;
import com.example.NBUACM.mapper.ProblemListWithUsersMapper;
import com.example.NBUACM.mapper.SubmissionMapper;
import com.example.NBUACM.service.ProblemListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.parsing.Problem;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.StreamSupport;

@Service
public class ProblemListServiceImpl implements ProblemListService {
    @Autowired
    private ProblemListMapper problemListMapper;
    @Autowired
    private ProblemListWithProblemsMapper problemListWithProblemsMapper;
    @Autowired
    private ProblemListWithUsersMapper problemListWithUsersMapper;
    @Autowired
    private SubmissionMapper submissionMapper;

    /*
    * 更新所有表单的所有题目的AC情况
    * */
    @Override
    @Scheduled(fixedRate = 60 * 1000, initialDelay = 5000)
    public void updateAllProblemListACNumber() {
        List<ProblemList> problemLists = problemListMapper.getAllProblemLists();
        int problemLists_len = problemLists.size();
        for(int i=0;i<problemLists_len;i++) {
            int problemListId = problemLists.get(i).getId();
            updateProblemListACNumber(problemListId);
        }


    }


    @Override
    public List<ProblemList> getAllProblemLists() {
        return problemListMapper.getAllProblemLists();
    }

    @Override
    public List<ProblemList> getProblemListsByUid(String uid) {
        System.out.println("传进函数的的uid："+uid);
        List<ProblemListWithUsers> problemLists = problemListWithUsersMapper.getProblemListsByUid(uid);
        System.out.println("problemLists:"+problemLists);
        List<ProblemList> res = new ArrayList<>();
        for(int i=0 ;i < problemLists.size(); i++) {
            int problemListId = problemLists.get(i).getProblemListId();
            ProblemList one = problemListMapper.getProblemListById(problemListId);
            res.add(one);
        }
        System.out.println("res:"+res);
        return res;
    }

    @Override
    public List<ProblemListWithProblems> getProblemsByProblemListId(int id) {
        return problemListWithProblemsMapper.getProblemsByProblemListId(id);
    }

    @Override
    public List<ProblemListWithUsers> getUsersByProblemListId(int id) {
        return problemListWithUsersMapper.getUsersByProblemListId(id);
    }

    @Override
    public List<ProblemListWithProblemsState> getProblemStatesByProblemIdAndUid(String uid, int problemListId) {
        List<ProblemListWithProblems> problems = problemListWithProblemsMapper.getProblemsByProblemListId(problemListId);
        int problems_len = problems.size();

        List<ProblemListWithProblemsState> res = new ArrayList<>();
        for(int i=0 ;i < problems_len; i++) {
            int problemId = problems.get(i).getProblemId();
            //接下来通过这个problemId和uid，去submission中去看，找到这个用户对这个题的提交记录
            int state = judgeUserACthisProblem(problemId, uid);

            ProblemListWithProblemsState one = new ProblemListWithProblemsState();

            one.setProblemId(problemId);
            one.setState(state);
            res.add(one);  //构造返回的答案数据
        }
        return res;


    }

    @Override
    public int judgeUserACthisProblem(int problemId, String uid) {   //通过返回的数字，可以判断这个用户对于这道题的状态（1.没提交；2.WA；3.AC）
        int state = 2; //WA
        List<Submission> submissions = submissionMapper.getSubmissionByUidAndProblemId(uid, problemId);
        if(submissions.size() == 0) {
            state = 1; //表示这个人还为提交过这个题
        } else {
            boolean accept = false;
            for(int j=0;j<submissions.size();j++) {
                if(submissions.get(j).getVerdict().equals("OK")) {  //ACCEPT
                    accept = true;
                    break;
                }
            }
            if(accept) state = 3;
        }
        return state;

    }

    @Override
    public void updateProblemListACNumber(int problemListId) {
        List<ProblemListWithUsers> users = problemListWithUsersMapper.getUsersByProblemListId(problemListId);  //拿到参与这个题单的用户
        List<ProblemListWithProblems> problems = problemListWithProblemsMapper.getProblemsByProblemListId(problemListId); //拿到这个题单的所有题目

        for(int i=0;i<problems.size();i++) {
            int problemId = problems.get(i).getProblemId();
            int sum = 0;
            for(int j=0;j<users.size();j++) {
                String uid = users.get(j).getUid();
                int state = judgeUserACthisProblem(problemId, uid);
                if(state == 3) sum++;
            }

            ProblemListWithProblems data = new ProblemListWithProblems();
            data.setAcNumber(sum);
            data.setProblemListId(problemListId);
            data.setProblemId(problemId);
            problemListWithProblemsMapper.updateACNumber(data);
        }

    }


}
