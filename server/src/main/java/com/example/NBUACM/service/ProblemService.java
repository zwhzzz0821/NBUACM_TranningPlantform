package com.example.NBUACM.service;
import com.example.NBUACM.POJO.problem_info.Problem_Info_DataInDB;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.List;
@Transactional
public interface ProblemService {
    @Scheduled(fixedRate = 24 * 60 * 60 * 1000)
    void getAllProblemFromCF();

    public List<Map<String, Object>> getAllProblem();
}
