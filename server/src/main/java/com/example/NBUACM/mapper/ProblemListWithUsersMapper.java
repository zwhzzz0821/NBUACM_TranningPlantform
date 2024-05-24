package com.example.NBUACM.mapper;
import com.example.NBUACM.POJO.MySQLTable.ProblemListWithUsers;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.validation.ObjectError;

import java.util.List;
import java.util.Map;
@Mapper
public interface ProblemListWithUsersMapper {
    @Select("select * from problemlistwithusers " +
            "where problemListId = #{id}")
    List<ProblemListWithUsers> getUsersByProblemListId(int id);//通过题单的id来获取用户的id。即参加这个题单的用户列表
}
