package com.example.NBUACM.mapper;

import com.example.NBUACM.entity.Blog;
import com.example.NBUACM.entity.ProblemList;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.example.NBUACM.entity.honors;
import java.util.List;

@Mapper
public interface HonorMapper {
    @Select("select * from honors")
    List<honors> getAllHonors();//获取所有的题单

    @Insert("INSERT INTO honors (award, acquiredTime, player1, player2, player3, coach) "
            + "VALUES (#{award}, #{acquiredTime}, #{player1}, #{player2}, #{player3}, #{coach})")
    boolean InsertHonors(honors h);

    @Delete("DELETE from honors where hid = #{hid}")
    void DeleteHonors(int hid);
}
