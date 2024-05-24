package com.example.NBUACM.mapper;

import com.example.NBUACM.entity.User;
import org.apache.ibatis.annotations.*;


import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {

    @Select("select * from user where uid = #{uid}")    //靠uid登录
    User getByUid(User user);
    @Insert("insert into user(uid,username,password)" +
            "values(#{uid},#{username},#{password})")
    void register(User user);
    @Delete("delete from user where uid = #{uid}")
    void deleteByUid(User user);
    @Select("select * from user")
    List<User> getAllUsers();
    @Select("select * from user where codeforceshandle = #{codeforceshandle}")
    User getUserByCodeforcesHandle(String codeforceshandle);



    @Update("update user " +
            "set weekAverageACRating = #{rating} " +
            "where codeforceshandle = #{handle}")
    void updateWeekAvgACRating(double rating, String handle);

    @Update("update user " +
            "set monthAverageACRating = #{rating} " +
            "where codeforceshandle = #{handle}")
    void updateMonthAvgACRating(double rating, String handle);

    @Update("update user " +
            "set totalAverageACRating = #{rating} " +
            "where codeforceshandle = #{handle}")
    void updateTotalAvgACRating(double rating, String handle);



    @Update("update user " +
            "set ratingRank = #{rank} " +
            "where codeforceshandle = #{handle}")
    void updateRatingRankByHandle(String handle, int rank);

    @Update("update user " +
            "set monthACRank = #{rank} " +
            "where codeforceshandle = #{handle}")
    void updateMonthACRankByHandle(String handle, int rank);

    @Update("update user " +
            "set username=#{username}, " +
            "password=#{password}, " +
            "codeforceshandle=#{codeforceshandle} " +
            "where uid=#{uid}")
    void updateUserInfoByUid(User user);

    @Update("update user " +
            "set codeforcesrating=#{rating} " +
            "where codeforceshandle=#{handle}")
    void updateUserCodeforcesRating(int rating, String handle);

    @Update("update user " +
            "set monthAC = #{submits} " +
            "where codeforceshandle = #{handle}")
    void updateMonthACByHandle(String handle, int submits);

    @Update("update user " +
            "set weekAC = #{submits} " +
            "where codeforceshandle = #{handle}")
    void updateWeekACByHandle(String handle, int submits);

    @Update("update user " +
            "set monthSubmits = #{submits} " +
            "where codeforceshandle = #{handle}")
    void updateMonthSubmitsByHandle(String handle, int submits);

    @Update("update user " +
            "set weekSubmits = #{submits} " +
            "where codeforceshandle = #{handle}")
    void updateWeekSubmitsByHandle(String handle, int submits);

    @Update("update user " +
            "set totalSubmits = #{submits} " +
            "where codeforceshandle = #{handle}")
    void updateTotalSubmitsByHandle(String handle, int submits);

    @Update("update user " +
            "set totalACSubmits = #{submits} " +
            "where codeforceshandle = #{handle}")
    void updateTotalACSubmitsByHandle(String handle, int submits);

    @Update("update user " +
            "set Difficulty1=#{submits} " +
            "where codeforceshandle = #{handle}")
    void updateDifficulty1(String handle, int submits);

    @Update("update user " +
            "set Difficulty2=#{submits} " +
            "where codeforceshandle = #{handle}")
    void updateDifficulty2(String handle, int submits);

    @Update("update user " +
            "set Difficulty3=#{submits} " +
            "where codeforceshandle = #{handle}")
    void updateDifficulty3(String handle, int submits);

    @Update("update user " +
            "set Difficulty4=#{submits} " +
            "where codeforceshandle = #{handle}")
    void updateDifficulty4(String handle, int submits);

    @Update("update user " +
            "set Difficulty5=#{submits} " +
            "where codeforceshandle = #{handle}")
    void updateDifficulty5(String handle, int submits);

    @Update("update user " +
            "set Difficulty6=#{submits} " +
            "where codeforceshandle = #{handle}")
    void updateDifficulty6(String handle, int submits);

    @Update("update user " +
            "set Difficulty7=#{submits} " +
            "where codeforceshandle = #{handle}")
    void updateDifficulty7(String handle, int submits);



    @Update("update user " +
            "set monthAC = monthAC + 1 " +
            "where codeforceshandle = #{handle}")
    void addMonthACByHandle(String handle);

    @Update("update user " +
            "set weekAC = weekAC + 1 " +
            "where codeforceshandle = #{handle}")
    void addWeekACByHandle(String handle);

}
