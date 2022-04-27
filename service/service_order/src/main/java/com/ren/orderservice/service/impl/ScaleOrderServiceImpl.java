package com.ren.orderservice.service.impl;

import com.ren.commonutils.JwtUtils;
import com.ren.commonutils.Result;
import com.ren.mq.constant.MQConst;
import com.ren.mq.service.MQService;
import com.ren.orderservice.entity.ScaleOrder;
import com.ren.orderservice.mapper.ScaleOrderMapper;
import com.ren.orderservice.service.ScaleOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.amqp.AmqpException;
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
    MQService mqService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result createScaleOrder(HttpServletRequest req, ScaleOrder scaleOrder) {

        //通过JWT获取用户ID
        String userId = JwtUtils.getMemberIdByJwtToken(req);
        //随机生成32位订单号
        String orderNo = UUID.randomUUID().toString();

        scaleOrder.setUserId(userId);
        try {
            boolean res = mqService.sendMessage(MQConst.EXCHANGE_DIRECT_SMS, MQConst.ROUTING_SMS, scaleOrder);
//            RedisUtils.set(CacheConstant.Order + scaleOrder.getId())
        } catch (AmqpException e) {
            return Result.error().message("订单生成失败");
        }
        mqService.sendMessage(MQConst.EXCHANGE_DIRECT_ORDER, MQConst.ROUTING_ORDER, scaleOrder);
        return Result.ok()
                .data("orderNo", orderNo);
    }
}
