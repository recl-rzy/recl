package com.ren.oss;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description: TODO
 * @ClassName: OssApplication
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/8/6 15:18
 * @Vertion: 2019.1
 */

@EnableDiscoveryClient
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@ComponentScan(basePackages = {"com.ren"})
public class OssApplication {
    public static void main(String[] args) {

        SpringApplication.run(OssApplication.class, args);
    }
}

