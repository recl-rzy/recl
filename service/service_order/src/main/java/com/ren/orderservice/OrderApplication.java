package com.ren.orderservice;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;


/**
 * @Description: TODO
 * @ClassName: OrderApplication
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/21 19:42
 * @Vertion: 2019.1
 */

@EnableFeignClients
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.ren"})
@SpringBootApplication
@MapperScan("com.ren.orderservice.mapper")
@EnableTransactionManagement
public class OrderApplication {
    public static void main(String[] args) {
        SpringApplication.run(OrderApplication.class, args);
    }
}

