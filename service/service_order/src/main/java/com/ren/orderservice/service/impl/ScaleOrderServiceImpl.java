package com.ren.orderservice.service.impl;

import com.alibaba.fastjson.JSON;
import com.ren.commonutils.JwtUtils;
import com.ren.commonutils.Result;
import com.ren.orderservice.entity.ScaleOrder;
import com.ren.orderservice.mapper.ScaleOrderMapper;
import com.ren.orderservice.service.ScaleOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ren.orderservice.utils.OrderUtils;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author RZY
 * @since 2022-03-21
 */
@Service
public class ScaleOrderServiceImpl extends ServiceImpl<ScaleOrderMapper, ScaleOrder> implements ScaleOrderService {

    @Autowired
    RabbitTemplate rabbitTemplate;

    @Override
    @Transactional(rollbackFor = AmqpException.class)
    public Result createScaleOrder(HttpServletRequest req, ScaleOrder scaleOrder) {

        //通过JWT获取用户ID
        String userId = JwtUtils.getMemberIdByJwtToken(req);
        //随机生成32位订单号
        String orderNo = UUID.randomUUID().toString();

        scaleOrder.setUserId(userId);
        scaleOrder.setOrderNo(orderNo);
        try {
            rabbitTemplate.convertAndSend(OrderUtils.ORDER_EXCHANGE, OrderUtils.ORDER_ROUTING_KEY, JSON.toJSONString(scaleOrder));
        } catch (AmqpException e) {
            return Result.error().message("订单生成失败");
        }
        return Result.ok()
                .data("orderNo", orderNo);
    }
}
