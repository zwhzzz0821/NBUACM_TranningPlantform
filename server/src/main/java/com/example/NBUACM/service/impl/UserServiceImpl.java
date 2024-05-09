package com.example.NBUACM.service.impl;
import com.example.NBUACM.entity.*;
import com.example.NBUACM.mapper.UserMapper;
import com.example.NBUACM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;


    @Override
    public void register(User user) {
        userMapper.register(user);
    }
    @Override
    public User getByUid(User user) {
        return userMapper.getByUid(user);
    }
    @Override
    public void deleteByUid(User user) {
        userMapper.deleteByUid(user);
    }

}
