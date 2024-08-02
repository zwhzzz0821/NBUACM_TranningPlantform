package com.example.NBUACM.mapper;

import com.example.NBUACM.entity.Notice;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface NoticeMapper {
    @Select("select * from notice")
    List<Notice> getAllNotices();//获取所有的通知

    @Select("select * from notice where id = #{id} LIMIT 1")  //虽然id是主键且递增的，这里还是加一个LIMIT吧
    Notice getNoticeById(Notice notice);

    @Insert("insert into notice(author, date, title, info) " +
            "values(#{author}, #{date}, #{title}, #{info})")
    void addOneNewNotice(Notice data);

    @Delete("delete from notice where id = #{id}")
    void deleteOneNotice(Notice data);

    @Update("update notice " +
            "set author=#{author}, " +
            "date=#{date}, " +
            "title=#{title}, " +
            "info=#{info} " +
            "where id=#{id}")
    void updateOneNotice(Notice data);


}
