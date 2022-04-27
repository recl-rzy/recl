package com.ren.mq.service;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Description: TODO
 * @ClassName: MQUtils
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/4/9 12:06
 * @Vertion: v1.0
 */

@Service
public class MQService {

    @Resource
    private RabbitTemplate rabbitTemplate;

    public boolean sendMessage(String exchange, String routingKey, Object message) {
        System.out.println("-----------:" + "消息发送中");
        rabbitTemplate.convertAndSend(exchange, routingKey, message);
        return true;
    }
}
