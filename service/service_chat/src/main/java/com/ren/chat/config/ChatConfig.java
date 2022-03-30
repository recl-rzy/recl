package com.ren.chat.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * @Description: TODO
 * @ClassName: ChatConfig
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/24 20:25
 * @Vertion: 2019.1
 */

@MapperScan("com.ren.chat.mapper")
@Configuration
public class ChatConfig {
}

