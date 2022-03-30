package com.ren.msmservice.service.Impl;

import com.alibaba.fastjson.JSON;
import com.ren.msmservice.service.MsmService;
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
@RabbitListener(queues = "msm.direct.queue")
public class MsmServiceImpl implements MsmService {


    @Override
    @RabbitHandler
    public void sendScaleOrderMsm(String mobile) {


    }
}

