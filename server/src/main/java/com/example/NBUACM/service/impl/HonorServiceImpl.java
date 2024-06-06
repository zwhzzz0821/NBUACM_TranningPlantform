package com.example.NBUACM.service.impl;

import com.example.NBUACM.mapper.HonorMapper;
import com.example.NBUACM.service.HonorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.NBUACM.entity.honors;

import java.util.List;

@Service
public class HonorServiceImpl implements HonorsService{
    @Autowired
    HonorMapper honorMapper;

    @Override
    public void Add(honors h) {
        honorMapper.InsertHonors(h);
    }

    @Override
    public List<honors> Get() {
        return honorMapper.getAllHonors();
    }

    @Override
    public void Delete(int hid) {
        honorMapper.DeleteHonors(hid);
    }

}
