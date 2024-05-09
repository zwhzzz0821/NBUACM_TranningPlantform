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
}
