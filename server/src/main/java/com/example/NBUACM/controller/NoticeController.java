package com.example.NBUACM.controller;

import com.example.NBUACM.Bean.R;
import com.example.NBUACM.entity.Notice;
import com.example.NBUACM.entity.ProblemList;
import com.example.NBUACM.service.NoticeService;
import javafx.beans.binding.ObjectExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/Notice")
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/getAll")
    public Map<String, Object> getAllNotices() {
        try {
            List<Notice> list = noticeService.getAllNotices();
            return new R().ok().add("notices",list).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    @GetMapping("/getOne")
    public Map<String, Object> getOneNotice(Notice notice) {
        try {
            Notice one = noticeService.getOneNoticeById(notice);
            return new R().ok().add("notice",one).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }


    @PostMapping("/addNew")
    public Map<String, Object> addNewNotice(@RequestBody Notice notice) {
        try {
            noticeService.addOneNewNotice(notice);
            return new R().ok().builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    @PostMapping("/updateOne")
    public Map<String, Object> updateOneNotice(@RequestBody Notice notice) {
        try {
            noticeService.updateOneNotice(notice);
            return new R().ok().builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    @PostMapping("/deleteOne")
    public Map<String, Object> deleteOneNotice(@RequestBody Notice notice) {
        try {
//            System.out.println("Notice:" + notice);
            noticeService.deleteOneNotice(notice);
            return new R().ok().builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }




}
