package com.ren.servicebase.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Description: TODO
 * @ClassName: RabbitMqConfig
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/21 21:07
 * @Vertion: 2019.1
 */

@Configuration
public class RabbitMqConfig {

    @Bean
    public DirectExchange directExchange() {
        return new DirectExchange("order-exchange", true, false);
    }

    @Bean
    public Queue directMsmQueue() {
        return new Queue("msm.direct.queue", true);
    }

    @Bean
    public Queue directOrderQueue() {
        return new Queue("order.direct.queue", true);
    }

    @Bean
    public Binding directSmsBinding() {
        return BindingBuilder.bind(directMsmQueue()).to(directExchange()).with("msm");
    }

    @Bean
    public Binding directOrderBinding() {
        return BindingBuilder.bind(directOrderQueue()).to(directExchange()).with("order");
    }
}

