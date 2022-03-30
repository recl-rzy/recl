package com.ren.aclservice;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description: TODO
 * @ClassName: AclApplication
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/10 15:02
 * @Vertion: 2019.1
 */

@ComponentScan("com.ren")
@EnableDiscoveryClient
@MapperScan("com.ren.aclservice.mapper")
@SpringBootApplication
public class AclApplication {
    public static void main(String[] args) {
        SpringApplication.run(AclApplication.class, args);
    }
}

