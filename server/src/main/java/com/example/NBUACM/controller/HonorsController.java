package com.example.NBUACM.controller;

import com.example.NBUACM.Bean.R;
import com.example.NBUACM.service.HonorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;
import com.example.NBUACM.service.HonorsService;
import com.example.NBUACM.entity.honors;
import java.util.Map;
import java.util.List;
@RequestMapping("/honors")
@RestController
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class HonorsController {

    @Autowired
    HonorsService honorsService;

    @GetMapping("/Get")
    public Map<String, Object> GetHonors() {
        List<honors> honorsList = honorsService.Get();
        return new R().ok().add("honors", honorsList).builder();
    }


    @PostMapping("/Add")
    public void PostHonors(@RequestBody honors h) {
        System.out.println(h.toString());
        honorsService.Add(h);
    }

    @PostMapping("/Delete")
    public void DeleteHonors(@RequestBody int hid) {
        honorsService.Delete(hid);
    }

}
