package com.example.NBUACM.service.impl;

import com.example.NBUACM.entity.Blog;
import com.example.NBUACM.mapper.BlogMapper;
import com.example.NBUACM.service.BlogService;
import com.example.NBUACM.service.ProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    BlogMapper blogMapper;
    public Map<String, Object> GetBlog(String uid, Long problemId) {
        return blogMapper.getBlogByUidAndProblemId(uid, problemId);
    }


    public boolean InsertBlog(Blog blog) {
        return blogMapper.insertBlog(blog);
    }


    public boolean IfBlogExist(Blog blog){
        Map<String, Object> mp = blogMapper.getBlogByUidAndProblemId(blog.getUid(), blog.getProblemId());
        if (mp == null || mp.size() == 0) {
            return false;
        }
        return true;
    }

    public boolean updateBlog(Blog blog) {
        return blogMapper.updateBlog(blog);
    }

    public List<Map<String, Object>> GetBlogList(long problemId) {
        return blogMapper.GetBlogListByProblemId(problemId);
    }
}
