package com.ren.msmservice.service;

import com.ren.msmservice.entity.ScaleOrder;
import org.springframework.amqp.core.Message;

public interface MsmService {

    void sendScaleOrderMsm(Message message, ScaleOrder scaleOrder);
}
