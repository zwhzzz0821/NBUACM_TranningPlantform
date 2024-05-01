package com.example.NBUACM.service;
import com.example.NBUACM.entity.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public interface UserService {
    void register(User user);
    User getByUid(User user);
}
