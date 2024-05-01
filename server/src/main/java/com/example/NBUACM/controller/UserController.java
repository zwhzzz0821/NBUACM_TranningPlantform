package com.example.NBUACM.controller;

import com.example.NBUACM.Bean.R;
import com.example.NBUACM.entity.User;
import com.example.NBUACM.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



@RequestMapping("/before")
@RestController
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class UserController {

    @Autowired
    private UserService userService;



    /*
    * 登录时，查看收到的user表单，根据uid和password，
    * 是否和数据库中的相匹配，
    * 返回是否允许登录
    * */
    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody User user) {
        System.out.println();
        User e = userService.getByUid(user);
        System.out.println(e);
        if(e.getPassword().equals(user.getPassword())){
            return new R().ok().add("user", e).builder();
        } else {
            return new R().bad().builder();
        }
    }

    /*
    * 注册时，到数据库中查看uid是否存在，
    * 不存在时，才能进行注册，即往数据库中存这条信息
    *
    * */
    @PostMapping("/register")
    public Map<String, Object> register(@RequestBody User user) {
        User selected = userService.getByUid(user);
        if (selected == null) {  //当前表内没有这个用户,可以创建新用户
            userService.register(user);
            return new R().ok().builder();
        } else {
            return new R().bad().builder();
        }
    }


}
