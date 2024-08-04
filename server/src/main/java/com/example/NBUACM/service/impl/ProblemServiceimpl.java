package com.example.NBUACM.service.impl;

import com.example.NBUACM.POJO.ReceiveCFData.problem_info.*;
import com.example.NBUACM.mapper.ProblemMapper;
import com.example.NBUACM.service.ApiClient.CodeforcesApiClient;
import com.example.NBUACM.service.ProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.*;


@Service
public class ProblemServiceimpl implements ProblemService {
    @Autowired
    private ProblemMapper problemMapper;
    @Autowired
    private CodeforcesApiClient codeforcesApiClient;

    @Override
    @Scheduled(fixedRate = 60 * 60 * 1000, initialDelay = 1000)
    public void getAllProblemFromCF() {
        List<Problem_Info_DataInDB> db_list = new ArrayList<>();
        /*
         * 准备参数
         * */
        Map<String, String> uriVariables = new HashMap<>();  //这里不需要参数那就不加
        String url = "https://codeforces.com/api/problemset.problems?";
        try {
            Problem_Info_Response response = codeforcesApiClient.exchangeForResponse(
                    url,
                    uriVariables,
                    Problem_Info_Response.class
            );

            for (int i = 0; i < response.getResult().getProblems().size(); i++) {
                Problem_Info_DataInDB dataInDB = new Problem_Info_DataInDB(response.getResult().getProblems().get(i));
                db_list.add(dataInDB);
            }
            List<Map<String, Object>> oldDataInDB = problemMapper.selectAllProblem();

            int newlist_length = db_list.size();
            int oldlist_length = oldDataInDB.size();

            //进行增量更新
            for (int i = (newlist_length - oldlist_length - 1); i >=0 ; i--) {
                problemMapper.insert(db_list.get(i));
            }
        } catch (Exception e) {
            System.out.println("getAllProblemFromCF Error: " + e.getMessage());
        }
    }

    public List<Map<String, Object>> getAllProblem() {
        return problemMapper.selectAllProblem();
    }

    public Map<String, Object> getOneProblem(long problemId) { return problemMapper.selectByProblemId(problemId);}
}
