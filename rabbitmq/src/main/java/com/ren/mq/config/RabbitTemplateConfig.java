package com.ren.mq.config;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

/**
 * @Description: TODO
 * @ClassName: RabbitTemplateConfig
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/4/26 16:55
 * @Vertion: v1.0
 */

@Configuration
public class RabbitTemplateConfig {

    @Resource
    RabbitTemplate rabbitTemplate;

    @PostConstruct
    public void initRabbitTemplate() {
        //设置消息确认回调
        rabbitTemplate.setConfirmCallback(new RabbitTemplate.ConfirmCallback() {
            /**
             *
             * @param correlationData  唯一关联数据（消息的唯一id）
             * @param ack 消息是否成功收到
             * @param cause 失败原因
             */
            @Override
            public void confirm(CorrelationData correlationData, boolean ack, String cause) {
                System.out.println("confirm...[" + correlationData + "] ----> ack:" + ack + "....cause:" + cause);
            }
        });

        //消息抵达队列回调
        rabbitTemplate.setReturnCallback(new RabbitTemplate.ReturnCallback() {
            /**
             *
             * @param message  消息内容
             * @param replayCode 响应码
             * @param replayText 响应内容
             * @param exchange  交换机
             * @param routingKey 路由key
             */
            @Override
            public void returnedMessage(Message message, int replayCode, String replayText, String exchange, String routingKey) {
                System.out.println("return...[" + message + "] ----> replayCode:" + replayCode + "....replayText:" + replayCode);
            }
        });
    }
}
