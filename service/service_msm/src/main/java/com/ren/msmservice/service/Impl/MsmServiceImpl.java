package com.ren.msmservice.service.Impl;

import com.ren.msmservice.entity.ScaleOrder;
import com.ren.msmservice.service.MsmService;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

/**
 * @Description: TODO
 * @ClassName: MsmServiceImpl
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/19 22:10
 * @Vertion: 2019.1
 */

@Service
@RabbitListener(queues = "queue.sms")
public class MsmServiceImpl implements MsmService {

    @RabbitHandler
    @Override
    public void sendScaleOrderMsm(Message message, ScaleOrder scaleOrder) {
        System.out.println("......" + scaleOrder);
    }
}

