package com.ren.orderservice.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.Result;
import com.ren.orderservice.entity.OrderPayLog;
import com.ren.orderservice.entity.ScaleOrder;
import com.ren.orderservice.mapper.OrderPayLogMapper;
import com.ren.orderservice.service.OrderPayLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ren.orderservice.service.ScaleOrderService;
import com.ren.orderservice.utils.OrderUtils;
import com.ren.servicebase.exceptionhandler.ReclException;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author RZY
 * @since 2022-03-21
 */
@Service
@RabbitListener(queues = "order.direct.queue")
public class OrderPayLogServiceImpl extends ServiceImpl<OrderPayLogMapper, OrderPayLog> implements OrderPayLogService {

    @Autowired
    ScaleOrderService scaleOrderService;

    @Autowired
    RabbitTemplate rabbitTemplate;

    @Override
    @RabbitHandler
    @Transactional(rollbackFor = Exception.class)
    public Result saveScaleOrder(String scaleOrder) {

        ScaleOrder order = JSON.parseObject(scaleOrder, ScaleOrder.class);

        OrderPayLog orderPayLog = new OrderPayLog();
        BeanUtils.copyProperties(scaleOrder, orderPayLog);
        try {
            scaleOrderService.save(order);
            this.baseMapper.insert(orderPayLog);
            rabbitTemplate.convertAndSend(OrderUtils.ORDER_EXCHANGE, OrderUtils.MSM_ROUTING_KEY, order.getMobile());
        } catch (Exception e) {
            throw new ReclException(20001, "订单保存失败");
        }
        return Result.ok();
    }
}
