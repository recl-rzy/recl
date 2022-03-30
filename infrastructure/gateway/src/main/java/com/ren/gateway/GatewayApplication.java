package com.ren.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @Description: TODO
 * @ClassName: GatewayApplication
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/2/27 11:49
 * @Vertion: 2019.1
 */


@SpringBootApplication
@EnableDiscoveryClient
public class GatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(GatewayApplication.class, args);
    }
}

