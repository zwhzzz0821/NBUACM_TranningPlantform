package com.example.NBUACM;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@MapperScan("com.example.NBUACM.mapper")
public class NBUACM_Application {


    public static void main(String[] args) {

        SpringApplication.run(NBUACM_Application.class, args);
    }

}
