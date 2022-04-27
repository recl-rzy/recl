package com.ren.mq.config;

import com.ren.mq.constant.MQConst;
import org.springframework.amqp.core.*;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Description: TODO
 * @ClassName: MqConifg
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/4/9 11:53
 * @Vertion: v1.0
 */

@Configuration
public class RabbitConfig {

    @Bean
    public MessageConverter messageConverter() {
        return new Jackson2JsonMessageConverter();
    }

    @Bean
    public Queue smsQueue() {
        return new Queue(MQConst.QUEUE_SMS);
    }

    @Bean
    public DirectExchange smsDirectExchange() {
        return new DirectExchange(MQConst.EXCHANGE_DIRECT_SMS);
    }

    @Bean
    public Binding smsBinding() {
        return BindingBuilder.bind(smsQueue()).to(smsDirectExchange()).with(MQConst.ROUTING_SMS);
    }

    @Bean
    public Queue orderQueue() {
        return new Queue(MQConst.QUEUE_ORDER);
    }

    @Bean
    public DirectExchange orderDirectExchange() {
        return new DirectExchange(MQConst.EXCHANGE_DIRECT_ORDER);
    }

    @Bean
    public Binding orderBinding() {
        return BindingBuilder.bind(orderQueue()).to(orderDirectExchange()).with(MQConst.ROUTING_ORDER);
    }


}
