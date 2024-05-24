package com.example.NBUACM.mapper;

import com.example.NBUACM.POJO.MySQLTable.Submission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SubmissionMapper {

    @Insert("insert into submission(ProblemId,submissionIdFromCF,contestId,ProblemIndex,actime,handle,ProblemRating,verdict,uid) " +
            "values(#{ProblemId},#{submissionIdFromCF},#{contestId},#{ProblemIndex},#{actime},#{handle},#{ProblemRating},#{verdict},#{uid})")
    void InsertOneACSubmission(Submission data);

    @Select("select * from submission where handle = #{handle} and verdict = #{verdict}")
    List<Submission> getACSubmissionByhandle(String handle, String verdict);

    @Select("select * from submission where handle = #{handle}")
    List<Submission> getAllSubmissionByhandle(String handle);





}
