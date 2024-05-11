package com.example.NBUACM.service;
import com.example.NBUACM.entity.User;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface ProblemService {

    @Scheduled(fixedRate = 24 * 60 * 60 * 1000)
    void getAllProblem();
}
