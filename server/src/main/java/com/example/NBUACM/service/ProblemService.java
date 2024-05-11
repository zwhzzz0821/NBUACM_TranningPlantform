package com.example.NBUACM.service;
import com.example.NBUACM.entity.User;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface ProblemService {


    void getAllProblem();
}
