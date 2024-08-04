package com.example.NBUACM.controller.test;

import com.example.NBUACM.Bean.R;
import com.example.NBUACM.Exception.SpecificException;
import com.example.NBUACM.POJO.ReceiveCFData.user_info.User_Info_Response;
import com.example.NBUACM.entity.Blog;
import com.example.NBUACM.service.BlogService;
import com.example.NBUACM.service.CodeforcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/Test")
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class TestController {

    @Autowired
    private CodeforcesService codeforcesService;
    @GetMapping("/getCFUserInfo")
    public Map<String, Object> GetProblem(String handle) {
        try {
            User_Info_Response temp = codeforcesService.getUserInfoByHandle(handle);
            return new R().ok().add("User_Info_Response", temp).builder();
        } catch (SpecificException e) {
            return new R().bad().add("err", e.myGetMessage(e)).builder();
        }

    }



}
