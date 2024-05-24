package com.example.NBUACM.controller;
import com.example.NBUACM.Bean.R;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithProblems;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithUsers;
import com.example.NBUACM.entity.Blog;
import com.example.NBUACM.entity.ProblemList;
import com.example.NBUACM.service.BlogService;
import com.example.NBUACM.service.ProblemListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/ProblemList")
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class ProblemListController {

    @Autowired
    private ProblemListService problemListService;

    /*
    * 给前端送去题单列表
    * */
    @GetMapping("/getProblemLists")
    public Map<String, Object> getProblemLists() {
        try {
            List<ProblemList> list = problemListService.getAllProblemLists();
            return new R().ok().add("problemLists",list).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    @GetMapping("/getProblems")
    public Map<String, Object> getProblems(int problemListId) {
        try {
            List<ProblemListWithProblems> problems = problemListService.getProblemsByProblemListId(problemListId);
            return new R().ok().add("problems",problems).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    @GetMapping("/getUsers")
    public Map<String, Object> getUsers(int problemListId) {
        try {
            List<ProblemListWithUsers> users = problemListService.getUsersByProblemListId(problemListId);
            return new R().ok().add("users",users).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

}
