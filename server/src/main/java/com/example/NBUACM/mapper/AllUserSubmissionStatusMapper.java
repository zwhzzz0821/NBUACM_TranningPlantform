package com.example.NBUACM.mapper;

import com.example.NBUACM.POJO.MySQLTable.AllUserSubmissionStatus;
import com.example.NBUACM.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface AllUserSubmissionStatusMapper {
    @Select("SELECT * FROM user ORDER BY weekAC DESC LIMIT 1")
    User getMaxWeekAC();
    @Select("SELECT * FROM user ORDER BY monthAC DESC LIMIT 1")
    User getMaxMonthAC();
    @Select("SELECT * FROM user ORDER BY weekAverageACRating DESC LIMIT 1")
    User getMaxWeekAverageACRating();
    @Select("SELECT * FROM user ORDER BY monthAverageACRating DESC LIMIT 1")
    User getMaxMonthAverageACRating();
    @Select("SELECT * FROM user ORDER BY totalAverageACRating DESC LIMIT 1")
    User getMaxTotalAverageACRating();


    @Select("SELECT AVG(weekAC) FROM user")
    double getAvgWeekAC();
    @Select("SELECT AVG(monthAC) FROM user")
    double getAvgMonthAC();
    @Select("SELECT AVG(weekAverageACRating) FROM user")
    double getAvgWeekAverageACRating();
    @Select("SELECT AVG(monthAverageACRating) FROM user")
    double getAvgMonthAverageACRating();
    @Select("SELECT AVG(totalAverageACRating) FROM user")
    double getAvgTotalAverageACRating();


    @Update("UPDATE allusersubmissionstatus " +
            "SET maxWeekAC=#{maxWeekAC}, " +
            "maxMonthAC=#{maxMonthAC}, " +
            "maxWeekAverageACRating=#{maxWeekAverageACRating}, " +
            "maxMonthAverageACRating=#{maxMonthAverageACRating}, " +
            "maxTotalAverageACRating=#{maxTotalAverageACRating}, " +
            "avgWeekAC=#{avgWeekAC}, " +
            "avgMonthAC=#{avgMonthAC}, " +
            "avgWeekAverageACRating=#{avgWeekAverageACRating}, " +
            "avgMonthAverageACRating=#{avgMonthAverageACRating}, " +
            "avgTotalAverageACRating=#{avgTotalAverageACRating} ")
    void updateAllUserSubmissionStatus(AllUserSubmissionStatus data);



    @Select("select * from allusersubmissionstatus")
    AllUserSubmissionStatus getAllUserSubmissionStatus();


}
