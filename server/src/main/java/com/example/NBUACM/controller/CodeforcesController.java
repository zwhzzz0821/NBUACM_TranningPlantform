package com.example.NBUACM.controller;

import com.example.NBUACM.Bean.R;
import com.example.NBUACM.POJO.ReceiveCFData.user_info.*;
import com.example.NBUACM.POJO.ReceiveCFData.user_rating.*;

import com.example.NBUACM.POJO.ReturnAppFrontData.GroupedRatingList;
import com.example.NBUACM.mapper.UserRatingMapper;
import com.example.NBUACM.service.CodeforcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@RequestMapping("/CFAPI")
@RestController
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class CodeforcesController {
    /*
    * 注入服务
    * */
    @Autowired
    private CodeforcesService codeforcesService;

    /*
    * 注入Mapper
    * */
    @Autowired
    private UserRatingMapper userRatingMapper;


    /*
    * 用户初步测试后端接口是否可用
    * */
    @GetMapping("/hello")
    public String hello(){
        return "hello world";
    }

    /*
    * 用于获取指定用户的Codeforces的基本信息,
    * 并更新个人用户的rating
    * */
    @GetMapping("/user_info")
    public Map<String, Object> user_info(String handle) {
        try {
            User_Info_Response response = codeforcesService.getUserInfoByHandle(handle);
            if(response.equals(null)) {
                return new R().bad().builder();
            } else {
                codeforcesService.updateUserCodeforcesRatingAndImageURL(response.getResult().get(0).getRating(),handle, "没啥用这个函数,删了吧");
                return new R().ok().add("user", response.getResult()).builder();
            }
        } catch (Exception e) {
            System.out.println("ERROR:"+e.getMessage());
            return new R().bad().builder();
        }

    }

    /*
    * 用于获取指定用户的Codeforces的历史rating列表，
    * 并更新数据库
    * */
    @GetMapping("/user_rating")
    public Map<String, Object> user_rating(String handle) {
        User_Rating_Response response = codeforcesService.getRatingListByHandle(handle);
        if(response.equals(null)) {
            return new R().bad().builder();
        } else {
            codeforcesService.updateTableAllRatingList(response);
            return new R().ok().add("ratingList", response.getResult()).builder();
        }
    }

    /*
    *返回所有用户的ratinglist，类似
    * {
    * "code":200
    * "result":{
    *   ["user":{……}, "ratinglist":[]],
    *   [],
    *   [],
    *   [],
    * ………………
    * }
    *
    * }
    * */
    @GetMapping("/get_user_with_ratinglists")
    public Map<String, Object> get_user_with_ratinglists() {
        List<GroupedRatingList> list = codeforcesService.getUserWithRatinglists();
        if(list.equals(null)) {
            return new R().bad().builder();
        } else {
            return new R().ok().add("userwithratinglists",list).builder();
        }
    }
}
