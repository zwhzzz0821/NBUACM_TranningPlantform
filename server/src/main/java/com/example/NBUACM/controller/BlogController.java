package com.example.NBUACM.controller;

import com.example.NBUACM.Bean.R;
import com.example.NBUACM.entity.Blog;
import com.example.NBUACM.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/Blog")
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class BlogController {

    @Autowired
    BlogService blogService;

    /*
    * 根据题目id和用户id来获取该用户对该题的博客信息
    * */
    @GetMapping("/GetBlog/{problemId}/{uid}")
    public Map<String, Object> GetProblem(@PathVariable Long problemId, @PathVariable String uid) {
        try {
            Map<String, Object> ret = blogService.GetBlog(uid, problemId);
            return new R().ok().add("BlogContent", ret).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }

    }

    /*
    * 根据题目id和用户id创建新的博客，如果博客已存在，那就采用更新的方式
    * */
    @PostMapping("/Insert/{problemId}/{uid}")
    public Map<String, Object> InsertBlog(@RequestBody Blog blog) {
        try {
            if (!blogService.IfBlogExist(blog)) {
                return new R().ok().add("check", blogService.InsertBlog(blog)).builder();
            } else {
                return new R().ok().add("check", blogService.updateBlog(blog)).builder();
            }
        } catch (Exception e) {
            return new R().bad().builder();
        }

    }

    /*
    * 根据题目id来获取该题目的博客列表
    * */
    @GetMapping("/GetBlogList/{problemId}")
    public Map<String, Object> GetBlogList(@PathVariable Long problemId) {
        try {
            List<Map<String, Object>> ret = blogService.GetBlogList(problemId);
            return new R().ok().add("BlogList", ret).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }



}
