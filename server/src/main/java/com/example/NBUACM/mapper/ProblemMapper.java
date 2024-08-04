package com.example.NBUACM.mapper;

import com.example.NBUACM.POJO.ReceiveCFData.problem_info.Problem_Info_DataInDB;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import java.util.Map;
import java.util.List;

@Mapper
public interface ProblemMapper {
    @Insert("INSERT INTO problem(ProblemId,contestId,ProblemIndex,name,Type,points,rating,tags) " +
            "VALUES (#{ProblemId},#{contestId},#{ProblemIndex},#{name},#{Type},#{points},#{rating},#{tags})")
    @Options(useGeneratedKeys = true, keyProperty = "ProblemId")
    void insert(Problem_Info_DataInDB problemInfo);

    @Select("SELECT * FROM problem WHERE contest_id = #{contestId}")
    List<Problem_Info_DataInDB> selectByContestId(long contestId);

    @Select("SELECT * FROM problem")
    List<Map<String, Object>> selectAllProblem();

    @Select("select * from problem " +
            "where contestId=#{contestId} and ProblemIndex=#{ProblemIndex}")
    List<Problem_Info_DataInDB> getProblemByContestIdAndIndex(long contestId, String ProblemIndex);

    @Select("SELECT * FROM problem WHERE ProblemId = #{problemId} LIMIT 1")
    Map<String, Object> selectByProblemId(long problemId);

}
