package com.example.NBUACM.mapper;

import com.example.NBUACM.entity.Blog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.validation.ObjectError;
import java.util.Map;
@Mapper
public interface BlogMapper {
    @Select("SELECT * FROM blog "
            + "where uid = #{uid} and ProblemId = #{ProblemId}")
    Map<String, Object> getBlogByUidAndProblemId(String uid, Long ProblemId);

    @Insert("INSERT INTO blogs (uid, username, blog_content, problem_id) "
            + "VALUES (#{uid}, #{username}, #{BlogContent}, #{ProblemId})")
    boolean insertBlog(Blog blog);
}
