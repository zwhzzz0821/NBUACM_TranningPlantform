package com.example.NBUACM.service;

import com.example.NBUACM.POJO.MySQLTable.ProblemListWithProblems;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithUsers;
import com.example.NBUACM.POJO.ReturnAppFrontData.ProblemListWithProblemsState;
import com.example.NBUACM.entity.ProblemList;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface ProblemListService {
    @Scheduled(fixedRate = 60 * 1000, initialDelay = 5000)//一分钟更新一次
    void updateAllProblemListACNumber();



    List<ProblemList> getAllProblemLists();
    List<ProblemList> getProblemListsByUid(String uid);
    List<ProblemListWithProblems> getProblemsByProblemListId(int id);
    List<ProblemListWithUsers> getUsersByProblemListId(int id);
    List<ProblemListWithProblemsState> getProblemStatesByProblemIdAndUid(String uid, int problemListId);

    int judgeUserACthisProblem(int problemId, String uid);
    void updateProblemListACNumber(int problemListId);
    int CreateNewProblemList(ProblemList problemlist);
    void insertNewProblemsToList(List<ProblemListWithProblems> list);
    void DealWithNoExistProblem(List<ProblemListWithProblems> list);
    void addOneToList(ProblemListWithUsers data);
    boolean HaveAddedToList(ProblemListWithUsers data);
    void addSeveralToList(List<ProblemListWithUsers> list);
}
