package com.ren.chat.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * @Description: TODO
 * @ClassName: WebSocketConfig
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/24 20:03
 * @Vertion: 2019.1
 */


@Configuration
@EnableWebSocket
public class WebSocketConfig {

    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
}

