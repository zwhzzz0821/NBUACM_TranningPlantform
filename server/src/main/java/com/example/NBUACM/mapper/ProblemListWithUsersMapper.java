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

    @Select("select * from problemlistwithusers where uid = #{id}")
    List<ProblemListWithUsers> getProblemListsByUid(String id);

    @Select("select * from problemlistwithusers where uid = #{uid} and problemListId = #{problemListId}")
    List<ProblemListWithUsers> getProblemListsByProbelmListIdAndUid(ProblemListWithUsers data);

    @Insert("insert into problemlistwithusers(problemListId, uid) " +
            "values (#{problemListId},#{uid})")
    void addNewToProblemList(ProblemListWithUsers data);//XX用户参与表单



}
