package com.example.NBUACM.controller;

import com.example.NBUACM.Bean.R;
import com.example.NBUACM.entity.User;
import com.example.NBUACM.service.ProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@RestController
@RequestMapping("/Problem")
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class ProblemController {
    @Autowired
    ProblemService problemService;

    /*
    * 获取mysql里存着的所有的题目
    * */
    @GetMapping("/show")
    public Map<String, Object> show() {
        try {
            return new R().ok().add("problemList", problemService.getAllProblem()).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    /*
    * 根据problemId获取单个题目
    * */
    @GetMapping("/GetProblem/{problemId}")
    public Map<String, Object> GetProblem(@PathVariable Long problemId) {
        try {
            Map<String, Object> ret = problemService.getOneProblem(problemId);
            return new R().ok().add("ProblemRet", ret).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }

    }

}
