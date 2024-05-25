package com.example.NBUACM.service;

import com.example.NBUACM.POJO.MySQLTable.ProblemListWithProblems;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithUsers;
import com.example.NBUACM.POJO.ReturnAppFrontData.ProblemListWithProblemsState;
import com.example.NBUACM.entity.ProblemList;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface ProblemListService {

    List<ProblemList> getAllProblemLists();
    List<ProblemList> getProblemListsByUid(String uid);
    List<ProblemListWithProblems> getProblemsByProblemListId(int id);
    List<ProblemListWithUsers> getUsersByProblemListId(int id);
    List<ProblemListWithProblemsState> getProblemStatesByProblemIdAndUid(String uid, int problemListId);
}
