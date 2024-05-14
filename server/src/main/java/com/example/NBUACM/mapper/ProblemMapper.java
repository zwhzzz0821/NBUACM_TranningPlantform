package com.example.NBUACM.mapper;

import com.example.NBUACM.POJO.problem_info.Problem_Info_DataInDB;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProblemMapper {
    @Insert("INSERT INTO problem (contestId, Index, name, Type, points, rating, tags) " +
            "VALUES (${contestId}, ${Index}, ${name}, ${Type}, ${points}, ${rating}, ${tags})")
    void insert(Problem_Info_DataInDB problemInfo);

    @Select("SELECT * FROM problem WHERE contest_id = #{contestId}")
    List<Problem_Info_DataInDB> selectByContestId(long contestId);

    @Select("SELECT * FROM problem")
    List<Problem_Info_DataInDB> selectAllProblem();
}
