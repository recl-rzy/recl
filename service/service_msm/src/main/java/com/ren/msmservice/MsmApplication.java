package com.ren.msmservice;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;


/**
 * @Description: TODO
 * @ClassName: MsmApplication
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/19 22:05
 * @Vertion: 2019.1
 */

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@ComponentScan(basePackages = {"com.ren"})
@EnableDiscoveryClient
@MapperScan("com.ren.msmservice.mapper")
@EnableFeignClients
public class MsmApplication {

    public static void main(String[] args) {

        SpringApplication.run(MsmApplication.class, args);
    }
}

