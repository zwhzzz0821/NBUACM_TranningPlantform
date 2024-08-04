package com.example.NBUACM.service;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.List;
@Transactional
public interface ProblemService {
    /*
    * 定时更新题目表（problem）
    * */
    @Scheduled(fixedRate = 60 * 60 * 1000, initialDelay = 1000)
    void getAllProblemFromCF();

    /*
    * 获取所有题目
    * */
    List<Map<String, Object>> getAllProblem();

    /*
    * 根据题目id来获取题目
    * */
    Map<String, Object> getOneProblem(long problemId);
}
