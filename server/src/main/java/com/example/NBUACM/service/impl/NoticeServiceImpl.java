package com.example.NBUACM.service.impl;

import com.example.NBUACM.entity.Notice;
import com.example.NBUACM.mapper.NoticeMapper;
import com.example.NBUACM.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;


    @Override
    public void addOneNewNotice(Notice data) {
        noticeMapper.addOneNewNotice(data);
    }
    @Override
    public void deleteOneNotice(Notice data) {
        noticeMapper.deleteOneNotice(data);
    }
    @Override
    public void updateOneNotice(Notice data) {
        noticeMapper.updateOneNotice(data);
    }
    @Override
    public List<Notice> getAllNotices() {
        return noticeMapper.getAllNotices();
    }

    @Override
    public Notice getOneNoticeById(Notice notice) {
        return noticeMapper.getNoticeById(notice);
    }
}
