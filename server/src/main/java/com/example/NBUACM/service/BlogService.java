package com.example.NBUACM.service;
import org.springframework.context.annotation.Import;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import com.example.NBUACM.entity.Blog;
import java.util.List;
@Transactional
public interface BlogService {

    /*
     * 根据题目id和用户id来获取该用户对该题的博客信息
     * */
    public Map<String, Object> GetBlog(String uid, Long problemId);

    /*
     * 根据题目id和用户id创建新的博客
     * */
    public boolean InsertBlog(Blog blog);

    /*
    * 根据uid和problemId，来判断这个用户的博客存不存在
    * */
    public boolean IfBlogExist(Blog blog);

    /*
    * 根据uid和problemId，更新博客
    * */
    public boolean updateBlog(Blog blog);

    /*
    * 根据problemId，获取这个题目的博客列表
    * */
    public List<Map<String, Object>> GetBlogList(long problemId);
}
