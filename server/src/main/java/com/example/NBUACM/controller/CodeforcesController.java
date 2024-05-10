package com.example.NBUACM.controller;

import com.example.NBUACM.POJO.user_info.*;
import com.example.NBUACM.POJO.user_rating.*;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;

import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;


@RequestMapping("/CFAPI")
@RestController
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class CodeforcesController {
    @GetMapping("/hello")
    public String hello(){
        return "hello world";
    }

    @GetMapping("/user_info")
    public User_Info_Response getRatingByHandle(String handle) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        String url = "https://codeforces.com/api/user.info?handles=" + handle;
        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<User_Info_Response> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    User_Info_Response.class  // 指定返回类型为Response
            );

            User_Info_Response response = responseEntity.getBody();
            System.out.println(responseEntity);  // 打印Response对象的详细信息
            System.out.println("result:"+response);
            return response;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }


    @GetMapping("/user_rating")
    public User_Rating_Response getRatingListByHandle(String handle) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        String url = "https://codeforces.com/api/user.rating?handle=" + handle;
        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3");
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<User_Rating_Response> responseEntity = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    User_Rating_Response.class  // 指定返回类型为Response
            );

            User_Rating_Response response = responseEntity.getBody();
            System.out.println(responseEntity);  // 打印Response对象的详细信息
            System.out.println("result:"+response);
//            return response.getResult().get(0).getRating();
            return response;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
//            return -1;
            return null;
        }
    }
}
