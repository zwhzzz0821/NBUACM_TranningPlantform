package com.example.NBUACM.service.impl;

import com.example.NBUACM.POJO.problem_info.Problem_Info_Response;
import com.example.NBUACM.POJO.user_info.User_Info_Response;
import com.example.NBUACM.service.ProblemService;
import org.springframework.http.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;


@Service
public class ProblemServiceimpl implements ProblemService {
    @Override
    @Scheduled(fixedRate = 24 * 60 * 60 * 1000)
    public void getAllProblem() {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        String url = "https://codeforces.com/api/problemset.problems?";
        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<Problem_Info_Response> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    Problem_Info_Response.class  // 指定返回类型为Response
            );

            Problem_Info_Response response = responseEntity.getBody();
            System.out.println(responseEntity);  // 打印Response对象的详细信息
            System.out.println("result:"+response);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }


}
