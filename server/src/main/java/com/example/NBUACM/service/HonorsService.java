package com.example.NBUACM.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.NBUACM.entity.honors;
import java.util.List;
@Transactional
@Service
public interface HonorsService {
    void Add(honors h);

    List<honors> Get();

    void Delete(int hid);
}
