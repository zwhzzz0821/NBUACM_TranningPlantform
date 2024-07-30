package com.example.NBUACM.controller;

import com.example.NBUACM.Bean.R;
import com.example.NBUACM.service.HonorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;
import com.example.NBUACM.service.HonorsService;
import com.example.NBUACM.entity.honors;
import java.util.Map;
import java.util.List;
@RequestMapping("/honors")
@RestController
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class HonorsController {

    @Autowired
    HonorsService honorsService;

    /*
    * 获取荣誉列表，也就是所有的荣誉
    * */
    @GetMapping("/Get")
    public Map<String, Object> GetHonors() {
        try {
            List<honors> honorsList = honorsService.Get();
            return new R().ok().add("honors", honorsList).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }

    }

    /*
    * 添加一个新的荣誉
    * */
    @PostMapping("/Add")
    public Map<String, Object> PostHonors(@RequestBody honors h) {
        try {
            System.out.println(h.toString());
            honorsService.Add(h);
            return new R().ok().builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }

    }

    /*
    * 删除一个荣誉
    * */
    @PostMapping("/Delete")
    public Map<String, Object> DeleteHonors(@RequestBody int hid) {
        try {
            honorsService.Delete(hid);
            return new R().ok().builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }

    }

}
