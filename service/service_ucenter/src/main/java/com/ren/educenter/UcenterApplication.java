package com.ren.educenter;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @Description: TODO
 * @ClassName: UcenterApplication
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/20 13:17
 * @Vertion: 2019.1
 */


@SpringBootApplication
@MapperScan("com.ren.educenter.mapper")
@ComponentScan({"com.ren"})
@EnableDiscoveryClient
@EnableFeignClients
@EnableTransactionManagement
public class UcenterApplication {
    public static void main(String[] args) {
        SpringApplication.run(UcenterApplication.class, args);
    }
}

