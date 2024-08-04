package com.example.NBUACM.mapper;

import com.example.NBUACM.POJO.MySQLTable.UserAndRatingList;
import org.apache.ibatis.annotations.*;


import java.util.List;

@Mapper
public interface UserRatingMapper {

    @Insert("insert into userandratinglist(handle,contestid,contestname,oldrating,newrating,ratingupdatetimeseconds)" +
            "values(#{handle},#{contestid},#{contestname},#{oldrating},#{newrating},#{ratingupdatetimeseconds})")
    void insertOneRating(UserAndRatingList data);   //插入一条数据

    @Select("select * from userandratinglist where handle=#{handle}")
    List<UserAndRatingList> selectRatingsByHandle(String handle);  //获取同一个handle的rating

    @Select("select count(*) from userandratinglist where handle=#{handle}")    //获取同一个handle的条数
    int selectCountByHandle(String handle);

    @Select("SELECT DISTINCT codeforceshandle FROM user")
    List<String> selectDistinctHandles();  //本应该从ratinglist表中获得的，但是前端要求显示全部的用户，所以这里从user表中拿了

}
