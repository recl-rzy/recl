package com.ren.orderservice.utils;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @Description: TODO
 * @ClassName: OrderUtils
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/21 22:08
 * @Vertion: 2019.1
 */

@Component
public class OrderUtils implements InitializingBean {

    @Value("order.exchange")
    private String orderExchange;

    @Value("msm.routing.key")
    private String msmRoutingKey;

    @Value("order.routing.key")
    private String orderRoutingKey;

    public static String ORDER_EXCHANGE;
    public static String MSM_ROUTING_KEY;
    public static String ORDER_ROUTING_KEY;

    @Override
    public void afterPropertiesSet() throws Exception {
        ORDER_EXCHANGE = orderExchange;
        MSM_ROUTING_KEY = msmRoutingKey;
        ORDER_ROUTING_KEY = orderRoutingKey;
    }
}

