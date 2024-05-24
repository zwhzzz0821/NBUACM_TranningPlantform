package com.example.NBUACM.service.impl;

import com.example.NBUACM.POJO.ReceiveCFData.problem_info.Problem_Info_DataInDB;
import com.example.NBUACM.POJO.ReceiveCFData.problem_info.Problem_Info_Response;
import com.example.NBUACM.POJO.ReceiveCFData.submission_info.Submission_Info_Response;
import com.example.NBUACM.service.SubmissionService;
import org.springframework.http.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Service
public class SubmissionServiceImpl implements SubmissionService {

    @Override
    public Submission_Info_Response getSubmissionsByHandleFromCF(String handle) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        String url = "https://codeforces.com/api/user.status?handle=" + handle;
        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        HttpEntity<String> entity = new HttpEntity<>(headers);
        List<Problem_Info_DataInDB> db_list = new ArrayList<>();

        try {
            ResponseEntity<Submission_Info_Response> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    Submission_Info_Response.class  // 指定返回类型为Response
            );
            Submission_Info_Response response = responseEntity.getBody();
            return response;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }


}
