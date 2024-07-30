package com.example.NBUACM.controller;

import com.example.NBUACM.Bean.R;
import com.example.NBUACM.POJO.MySQLTable.AllUserSubmissionStatus;
import com.example.NBUACM.entity.User;
import com.example.NBUACM.service.AllUserSubmissionStatusService;
import com.example.NBUACM.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



@RequestMapping("/user")
@RestController
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private AllUserSubmissionStatusService allUserSubmissionStatusService;


    /*
    * 登录时，查看收到的user表单，根据uid和password，
    * 是否和数据库中的相匹配，
    * 返回是否允许登录
    * */
    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody User user) {
        try {
            System.out.println("/user/login 登录的用户为：" + user);
            User e = userService.getByUid(user);
            if(e.equals(null)) {
                return new R().bad().builder();
            }
            if(e.getPassword().equals(user.getPassword())){
                System.out.println(e);
                if (userService.checkManager(e.getUid())) {  //先检测是不是管理员，是的话就把管理员的信息返给前端
                    return new R().ok().add("manager", e).builder();
                }
                return new R().ok().add("user", e).builder();  //其余人就是普通用户
            } else {
                return new R().bad().builder();
            }
        } catch (Exception e) {
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
        try {
            System.out.println("/user/register 注册的用户为：" + user);
            User selected = userService.getByUid(user);
            if (selected == null) {  //当前表内没有这个用户,可以创建新用户
                userService.register(user);
                return new R().ok().builder();
            } else {
                return new R().bad().builder();
            }
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    @PostMapping("/register/manager")
    public Map<String, Object> registerManager(@RequestBody User user) {
        try {
            System.out.println("/user/register/manager 注册的user(管理员)为：" + user);
            User selected = userService.getByUid(user);
            if (selected == null) {  //当前表内没有这个用户,可以创建新用户
                userService.register(user);
                userService.registerManager(user);
                return new R().ok().builder();
            } else {
                return new R().bad().builder();
            }
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }
    /*
    * 删除用户，
    * 按照传过来的uid来删除
    * */
    @PostMapping("/deleteuser")
    public Map<String, Object> deleteuser(@RequestBody User user) {
        try {
            System.out.println("user:"+user);
            userService.deleteByUid(user);
            return new R().ok().builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    /*
    * 获取所有用户的列表
    * */
    @GetMapping("/getallusers")
    public Map<String, Object> getallusers() {
        try {
            List<User> userlist = userService.getAllUsers();
            return new R().ok().add("userlist", userlist).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    /*
    * 获取排序过的所有用户的列表
    * */
    @GetMapping("/getallusersSorted")
    public Map<String, Object> GetAllUsersSorted() {
        try {
            List<User> userlist = userService.getAllUsersSorted();
            return new R().ok().add("userlist", userlist).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    /*
    * 修改用户信息
    * */
    @PostMapping("/changeuserinfo")
    public Map<String, Object> changeuserinfo(@RequestBody User user) {
        try {
            System.out.println("user:"+user);
            userService.changeUserInfo(user);
            return new R().ok().builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    /*
    * 根据uid获取单个用户信息
    * */
    @GetMapping("/getuser")
    public Map<String, Object> getuser(String uid) {
        try {
            User temp = new User();
            temp.setUid(uid);
            User user = userService.getByUid(temp);
            List<User> list = userService.getAllUsers();

            System.out.println("uid:" + uid);
            System.out.println("user:"+user);
            return new R().ok().add("user",user).add("userlistsize",list.size()).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }

    /*
    * 获取所有用户的在Codeforces上的提交记录
    * */
    @GetMapping("/getAllUserSubmissionStatus")
    public Map<String, Object> getAllUserSubmissionStatus() {
        try {
            AllUserSubmissionStatus data = allUserSubmissionStatusService.getAllUserSubmissionStatus();
            return new R().ok().add("allUserSubmissionStatus",data).builder();
        } catch (Exception e) {
            return new R().bad().builder();
        }
    }



}
