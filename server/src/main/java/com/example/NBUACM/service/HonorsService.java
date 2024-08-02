package com.example.NBUACM.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.NBUACM.entity.honors;
import java.util.List;
@Transactional
@Service
public interface HonorsService {
    /*
    * 添加荣誉
    * */
    void Add(honors h);

    /*
    * 获取荣誉列表
    * */
    List<honors> Get();

    /*
    * 删除荣誉
    * */
    void Delete(int hid);
}
