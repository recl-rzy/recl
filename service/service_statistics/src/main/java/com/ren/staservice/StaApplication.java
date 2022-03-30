package com.ren.staservice;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @Description: TODO
 * @ClassName: StaApplication
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/26 11:18
 * @Vertion: 2019.1
 */

@SpringBootApplication
@ComponentScan(basePackages = {"com.ren"})
@EnableDiscoveryClient
@EnableFeignClients
@MapperScan("com.ren.staservice.mapper")
@EnableScheduling
public class StaApplication {
    public static void main(String[] args) {
        SpringApplication.run(StaApplication.class, args);
    }
}

