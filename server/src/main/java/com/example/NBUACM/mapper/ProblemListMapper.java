package com.example.NBUACM.mapper;

import com.example.NBUACM.entity.ProblemList;
import org.apache.ibatis.annotations.*;
import org.springframework.validation.ObjectError;

import java.util.List;
import java.util.Map;
@Mapper
public interface ProblemListMapper {

    @Select("select * from problemlist")
    List<ProblemList> getAllProblemLists();//获取所有的题单

    @Select("select * from problemlist where id = #{id}")
    ProblemList getProblemListById(int id);

    @Insert("insert into problemlist(id, name, begin, end) " +
            "values(#{id},#{name},#{begin},#{end})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertNewProblemList(ProblemList probblemlist);
}
