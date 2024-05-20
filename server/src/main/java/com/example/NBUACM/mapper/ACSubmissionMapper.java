package com.example.NBUACM.mapper;

import com.example.NBUACM.POJO.MySQLTable.ACSubmission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ACSubmissionMapper {

    @Insert("insert into acsubmission(ProblemId,submissionIdFromCF,contestId,ProblemIndex,actime,handle,ProblemRating) " +
            "values(#{ProblemId},#{submissionIdFromCF},#{contestId},#{ProblemIndex},#{actime},#{handle},#{ProblemRating})")
    void InsertOneACSubmission(ACSubmission data);

    @Select("select * from acsubmission where handle = #{handle}")
    List<ACSubmission> getACSubmissionByhandle(String handle);







}
