package com.ren.mq.utils;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

/**
 * @Description: TODO
 * @ClassName: MQUtils
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/4/9 12:06
 * @Vertion: v1.0
 */

@Component
public class MQUtils {

    @Resource
    private AmqpTemplate amqpTemplate;

    public boolean sendMessage(String exchange, String routingKey, Object message) {
        System.out.println("-----------:" + "消息发送中");
        amqpTemplate.convertAndSend(exchange, routingKey, message);
        return true;
    }
}
