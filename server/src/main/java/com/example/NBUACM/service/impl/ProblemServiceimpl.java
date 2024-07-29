package com.example.NBUACM.service.impl;

import com.example.NBUACM.POJO.ReceiveCFData.problem_info.*;
import com.example.NBUACM.mapper.ProblemMapper;
import com.example.NBUACM.service.ProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;
import java.util.Map;


@Service
public class ProblemServiceimpl implements ProblemService {
    @Autowired
    private ProblemMapper problemMapper;

    @Override
    @Scheduled(fixedRate = 60 * 1000, initialDelay = 1000)
    public void getAllProblemFromCF() {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        String url = "https://codeforces.com/api/problemset.problems?";
        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        HttpEntity<String> entity = new HttpEntity<>(headers);
        List<Problem_Info_DataInDB> db_list = new ArrayList<>();
        try {
            ResponseEntity<Problem_Info_Response> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    Problem_Info_Response.class  // 指定返回类型为Response
            );
            Problem_Info_Response response = responseEntity.getBody();
            for (int i = 0; i < response.getResult().getProblems().size(); i++) {
                Problem_Info_DataInDB dataInDB = new Problem_Info_DataInDB(response.getResult().getProblems().get(i));
                db_list.add(dataInDB);
            }
            List<Map<String, Object>> oldDataInDB = problemMapper.selectAllProblem();

            int newlist_length = db_list.size();
            int oldlist_length = oldDataInDB.size();

            for (int i = (newlist_length - oldlist_length - 1); i >=0 ; i--) {
                problemMapper.insert(db_list.get(i));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public List<Map<String, Object>> getAllProblem() {
        return problemMapper.selectAllProblem();
    }

    public Map<String, Object> getOneProblem(long problemId) { return problemMapper.selectByProblemId(problemId);}
}
