package com.example.NBUACM.controller;


import com.example.NBUACM.Bean.R;
import com.example.NBUACM.POJO.MySQLTable.Submission;
import com.example.NBUACM.POJO.ReceiveCFData.submission_info.Submission_Info_Response;
import com.example.NBUACM.service.SubmissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RequestMapping("/submission")
@RestController
@EnableAutoConfiguration
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.PUT, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class SubmissionController {

    @Autowired
    private SubmissionService submissionService;


    @GetMapping("/submissiontest")
    public Map<String, Object> submissiontest(String handle) {
        Submission_Info_Response response = submissionService.getSubmissionsByHandleFromCF(handle);
        if(response.equals(null)){
            return new R().bad().builder();
        } else {
            return new R().ok().add("acsubmissionList", response.getResult()).builder();
        }
    }


    @GetMapping("/getACsubmissionlist")
    public Map<String, Object> getACsubmissionlist(String handle) {
        List<Submission> list = submissionService.getACSubmissionFromDBByHandle(handle);
        if(list.equals(null)) {
            return new R().bad().builder();
        } else {
//            System.out.println("acsubmissionList:" + list);
            return new R().ok().add("acsubmissionList", list).builder();
        }
    }


}
