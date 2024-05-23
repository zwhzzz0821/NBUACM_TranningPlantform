package com.example.NBUACM.service;
import org.springframework.context.annotation.Import;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import com.example.NBUACM.entity.Blog;

@Transactional
public interface BlogService {
    public Map<String, Object> GetBlog(String uid, Long problemId);

    public boolean InsertBlog(Blog blog);
}
