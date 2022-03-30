package com.ren.orderservice.service;

import com.ren.commonutils.Result;
import com.ren.orderservice.entity.OrderPayLog;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author RZY
 * @since 2022-03-21
 */
public interface OrderPayLogService extends IService<OrderPayLog> {

    Result saveScaleOrder(String scaleOrder);
}
