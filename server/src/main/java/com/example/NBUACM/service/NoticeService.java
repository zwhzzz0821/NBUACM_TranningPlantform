package com.example.NBUACM.service;

import com.example.NBUACM.entity.Notice;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
@Transactional
@Service
public interface NoticeService {

    /*
    * 添加一个新的通知
    * */
    void addOneNewNotice(Notice data);

    /*
    *根据通知id， 删除一个通知
    * */
    void deleteOneNotice(Notice data);

    /*
    * 根据通知id，更新一个通知
    * */
    void updateOneNotice(Notice data);

    /*
    * 获取所有通知
    * */
    List<Notice> getAllNotices();

    /*
    * 根据通知的ID获取通知
    * */
    Notice getOneNoticeById(Notice notice);

}
