package com.example.NBUACM.service;
import org.springframework.context.annotation.Import;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import com.example.NBUACM.entity.Blog;
import java.util.List;
@Transactional
public interface BlogService {
    public Map<String, Object> GetBlog(String uid, Long problemId);

    public boolean InsertBlog(Blog blog);

    public boolean IfBlogExist(Blog blog);

    public boolean updateBlog(Blog blog);

    public List<Map<String, Object>> GetBlogList(long problemId);
}
