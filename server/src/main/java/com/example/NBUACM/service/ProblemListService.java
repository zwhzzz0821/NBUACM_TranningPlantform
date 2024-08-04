package com.example.NBUACM.service;

import com.example.NBUACM.POJO.MySQLTable.ProblemListWithProblems;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithUsers;
import com.example.NBUACM.POJO.ReturnAppFrontData.ProblemListWithProblemsState;
import com.example.NBUACM.POJO.ReturnAppFrontData.UserWithACNumber_In_ProblemList;
import com.example.NBUACM.entity.ProblemList;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface ProblemListService {
    /*
     * 定时更新所有题单的所有题目的AC情况
     * */
    @Scheduled(fixedRate = 60 * 60 * 1000, initialDelay = 5000)
    void updateAllProblemListACNumber();

    /*
    * 获取所有题单
    * */
    List<ProblemList> getAllProblemLists();

    /*
     * 通过uid来给出这个人的题单列表。（目前没啥用，默认所有人都参与题单）
     * */
    List<ProblemList> getProblemListsByUid(String uid);

    /*
    * 根据题单id给出题目列表
    * */
    List<ProblemListWithProblems> getProblemsByProblemListId(int id);

    /*
    * 根据题单id，给出参与该题单的所有用户。（这个目前也没啥用）
    * */
    List<ProblemListWithUsers> getUsersByProblemListId(int id);

    /*
    * 根据用户id和题单id，给出该用户对该题单的完成情况
    * */
    List<ProblemListWithProblemsState> getProblemStatesByProblemIdAndUid(String uid, int problemListId);

    /*
    * 根据题目id和用户id，获取该用户对该题的完成情况。
    * 该函数返回三个数字1,2,3，分别代表的含义：（1.没提交；2.WA；3.AC）
    * */
    int judgeUserACthisProblem(int problemId, String uid);

    /*
    * 根据题单id，更新该题单每道题的ac数
    * */
    void updateProblemListACNumber(int problemListId);

    /*
    * 创建新的题单
    * */
    int CreateNewProblemList(ProblemList problemlist);

    /*
    * 给该题单增加题目
    * */
    void insertNewProblemsToList(List<ProblemListWithProblems> list);

    /*
    * 处理该题目不在题目列表内的情况
    * */
    void DealWithNoExistProblem(List<ProblemListWithProblems> list);

    /*
    * 给题单添加一个人
    * */
    void addOneToList(ProblemListWithUsers data);

    /*
     * 查询该用户是否已经加入了该题单
     * true:已加入
     * false:没加入
     * */
    boolean HaveAddedToList(ProblemListWithUsers data);

    /*
    * 给题单添加一些人
    * */
    void addSeveralToList(List<ProblemListWithUsers> list);

    /*
    * 根据题单id，获取所有人对该题单内题目的AC数
    * */
    List<UserWithACNumber_In_ProblemList> checkAcNumbers(int problemListId);
}
