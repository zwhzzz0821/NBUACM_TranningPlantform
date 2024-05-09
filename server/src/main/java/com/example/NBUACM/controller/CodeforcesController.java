package com.example.NBUACM.controller;
import com.example.NBUACM.Bean.R;
import com.example.NBUACM.POJO.*;
import com.example.NBUACM.entity.User;
import com.example.NBUACM.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.rmi.CORBA.ValueHandler;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import com.fasterxml.jackson.databind.ObjectMapper;


@RequestMapping("/CFAPI")
@RestController
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class CodeforcesController {


    @GetMapping("/hello")
    public String hello(){
        return "hello world";
    }

    @GetMapping("/rating")
    public int restTemplateGetTest(String handle) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        String url = "https://codeforces.com/api/user.info?handles=" + handle;
        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<Response> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    Response.class  // 指定返回类型为Response
            );

            Response response = responseEntity.getBody();
            System.out.println(responseEntity);  // 打印Response对象的详细信息
            System.out.println("result:"+response);
            return response.getResult().get(0).getRating();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return -1;
        }
    }
}
