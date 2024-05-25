package com.example.NBUACM.controller;
import com.example.NBUACM.Bean.R;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithProblems;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithUsers;
import com.example.NBUACM.POJO.ReturnAppFrontData.ProblemListWithProblemsState;
import com.example.NBUACM.entity.Blog;
import com.example.NBUACM.entity.ProblemList;
import com.example.NBUACM.service.BlogService;
import com.example.NBUACM.service.ProblemListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.parsing.Problem;
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
    * 给前端送去题单列表(管理员用)
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

    /*
    * 通过uid来给题单列表（个人用户用）
    * */
    @GetMapping("/getProblemListsByUid")
    public Map<String, Object> getProblemListsByUid(String uid) {
        try {
            System.out.println("收到的uid：" + uid);
            List<ProblemList> list = problemListService.getProblemListsByUid(uid);
            return new R().ok().add("problemLists", list).builder();
        } catch (Exception e) {
            System.out.println("Error:"+e.getMessage());
            return new R().bad().builder();
        }
    }


    /*
    * 通过题单Id获取里面的题目
    * */
    @GetMapping("/getProblems")
    public Map<String, Object> getProblems(int problemListId) {
        try {
            List<ProblemListWithProblems> problems = problemListService.getProblemsByProblemListId(problemListId);
            return new R().ok().add("problems",problems).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    /*
    * 通过题单Id获取参与题单的用户
    * */
    @GetMapping("/getUsers")
    public Map<String, Object> getUsers(int problemListId) {
        try {
            List<ProblemListWithUsers> users = problemListService.getUsersByProblemListId(problemListId);
            return new R().ok().add("users",users).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    @GetMapping("/getProblemsState")
    public Map<String, Object> getProblemsState(String uid, int problemListId) {
        try {
            System.out.println("接收到的信息：uid:" + uid + " problemListId:" +problemListId);
            List<ProblemListWithProblemsState> list = problemListService.getProblemStatesByProblemIdAndUid(uid, problemListId);
            System.out.println("problemWithState:" + list);
            return new R().ok().add("problemWithState", list).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

}
