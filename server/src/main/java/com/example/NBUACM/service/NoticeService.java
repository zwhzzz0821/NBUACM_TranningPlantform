package com.example.NBUACM.service;

import com.example.NBUACM.entity.Notice;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
@Transactional
@Service
public interface NoticeService {

    void addOneNewNotice(Notice data);
    void deleteOneNotice(Notice data);
    void updateOneNotice(Notice data);
    List<Notice> getAllNotices();//获取所有的通知
    Notice getOneNoticeById(Notice notice);

}
