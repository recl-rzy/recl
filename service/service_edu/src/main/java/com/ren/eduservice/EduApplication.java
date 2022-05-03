package com.ren.eduservice;

import org.junit.Test;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.*;

/**
 * @Description: TODO
 * @ClassName: com.ren.eduservice.EduApplication
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/7/10 22:08
 * @Vertion: 2019.1
 */

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@EnableTransactionManagement
@ComponentScan(basePackages = {"com.ren"})
public class  EduApplication {
    public static void main(String[] args) {
        SpringApplication.run(EduApplication.class, args);
    }
}

