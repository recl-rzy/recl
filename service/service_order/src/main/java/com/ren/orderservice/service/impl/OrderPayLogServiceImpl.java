package com.ren.orderservice.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.Result;
import com.ren.mq.constant.MQConst;
import com.ren.orderservice.entity.OrderPayLog;
import com.ren.orderservice.entity.ScaleOrder;
import com.ren.orderservice.mapper.OrderPayLogMapper;
import com.ren.orderservice.service.OrderPayLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ren.orderservice.service.ScaleOrderService;
import com.ren.orderservice.utils.OrderUtils;
import com.ren.servicebase.exceptionhandler.ReclException;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author RZY
 * @since 2022-03-21
 */
@Service
//@RabbitListener(queues = "queue.order")
public class OrderPayLogServiceImpl extends ServiceImpl<OrderPayLogMapper, OrderPayLog> implements OrderPayLogService {

    @Autowired
    ScaleOrderService scaleOrderService;

    @Resource
    RabbitTemplate rabbitTemplate;

    @Override
//    @RabbitHandler
    @Transactional(rollbackFor = Exception.class)
    public Result saveScaleOrder(Message message, ScaleOrder scaleOrder) {


//        OrderPayLog orderPayLog = new OrderPayLog();
//        BeanUtils.copyProperties(scaleOrder, orderPayLog);
//        try {
//            scaleOrderService.save(scaleOrder);
//            this.baseMapper.insert(orderPayLog);
//            rabbitTemplate.convertAndSend(MQConst.EXCHANGE_DIRECT_ORDER, MQConst.EXCHANGE_DIRECT_SMS, order.getMobile());
//        } catch (Exception e) {
//            throw new ReclException(20001, "订单保存失败");
//        }
        return Result.ok();
    }
}
