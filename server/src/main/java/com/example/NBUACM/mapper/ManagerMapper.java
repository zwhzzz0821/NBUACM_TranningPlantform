package com.example.NBUACM.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ManagerMapper {
    @Select("Select count(*) from manager where uid = #{uid}")
    int GetManagerCount(String uid);
}
