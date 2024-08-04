package com.example.NBUACM.service;
import com.example.NBUACM.entity.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public interface UserService {
    void register(User user);
    User getByUid(User user);
    void deleteByUid(User user);
    List<User> getAllUsers();

    List<User> getAllUsersSorted(); //按照rating值降序排序返回用户列表
    void changeUserInfo(User user);

    boolean checkManager(String uid);

    void registerManager(User user);
}
