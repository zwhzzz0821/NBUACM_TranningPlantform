package com.example.NBUACM.service;

import com.example.NBUACM.POJO.MySQLTable.ProblemListWithProblems;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithUsers;
import com.example.NBUACM.entity.ProblemList;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface ProblemListService {

    List<ProblemList> getAllProblemLists();
    List<ProblemListWithProblems> getProblemsByProblemListId(int id);
    List<ProblemListWithUsers> getUsersByProblemListId(int id);
}
