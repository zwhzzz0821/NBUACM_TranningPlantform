package com.example.NBUACM.service.impl;

import com.example.NBUACM.POJO.MySQLTable.ProblemListWithProblems;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithUsers;
import com.example.NBUACM.entity.ProblemList;
import com.example.NBUACM.mapper.ProblemListMapper;
import com.example.NBUACM.mapper.ProblemListWithProblemsMapper;
import com.example.NBUACM.mapper.ProblemListWithUsersMapper;
import com.example.NBUACM.service.ProblemListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProblemListServiceImpl implements ProblemListService {
    @Autowired
    private ProblemListMapper problemListMapper;
    @Autowired
    private ProblemListWithProblemsMapper problemListWithProblemsMapper;
    @Autowired
    private ProblemListWithUsersMapper problemListWithUsersMapper;

    @Override
    public List<ProblemList> getAllProblemLists() {
        return problemListMapper.getAllProblemLists();
    }

    @Override
    public List<ProblemListWithProblems> getProblemsByProblemListId(int id) {
        return problemListWithProblemsMapper.getProblemsByProblemListId(id);
    }

    @Override
    public List<ProblemListWithUsers> getUsersByProblemListId(int id) {
        return problemListWithUsersMapper.getUsersByProblemListId(id);
    }







}
