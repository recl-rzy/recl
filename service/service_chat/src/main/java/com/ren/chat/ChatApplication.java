package com.ren.chat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description: TODO
 * @ClassName: ChatApplication
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/24 20:01
 * @Vertion: 2019.1
 */

@SpringBootApplication
@ComponentScan(basePackages = {"com.ren"})
@EnableDiscoveryClient
@EnableFeignClients
public class ChatApplication {
    public static void main(String[] args) {

        SpringApplication.run(ChatApplication.class, args);
    }
}

