package com.example.NBUACM.mapper;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithProblems;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.validation.ObjectError;

import java.util.List;
import java.util.Map;
@Mapper
public interface ProblemListWithProblemsMapper {
    @Select("select * from problemlistwithproblems " +
            "where problemListId = #{id}")
    List<ProblemListWithProblems> getProblemsByProblemListId(int id); //通过题单的id，获取所有的题目id。即这个题单有什么题目

}
