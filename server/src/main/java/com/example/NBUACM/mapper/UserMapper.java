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
            "set username=#{username}, " +
            "password=#{password}, " +
            "codeforceshandle=#{codeforceshandle} " +
            "where uid=#{uid}")
    void updateUserInfoByUid(User user);

    @Update("update user " +
            "set codeforcesrating=#{rating} " +
            "where codeforceshandle=#{handle}")
    void updateUserCodeforcesRating(int rating, String handle);
}
