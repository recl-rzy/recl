package com.ren.orderservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.Result;
import com.ren.orderservice.entity.OrderPayLog;
import com.ren.orderservice.service.OrderPayLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author RZY
 * @since 2022-03-21
 */
@RestController
@RequestMapping("/order/order-pay-log")
public class OrderPayLogController {

    @Autowired
    OrderPayLogService orderPayLogService;

    @GetMapping("/queryPayOrder")
    public Result queryPayOrder(@RequestParam String orderNo) {

        OrderPayLog orderPayLog = orderPayLogService.getOne(new QueryWrapper<OrderPayLog>().eq("order_no", orderNo));
        if(!StringUtils.isEmpty(orderPayLog)) {

            return Result.ok()
                    .message("订单支付成功");
        } else {

            return Result.error()
                    .message("订单未支付");
        }
    }
}

