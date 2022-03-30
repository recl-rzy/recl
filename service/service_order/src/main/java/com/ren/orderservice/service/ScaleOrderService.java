package com.ren.orderservice.service;

import com.ren.commonutils.Result;
import com.ren.orderservice.entity.ScaleOrder;
import com.baomidou.mybatisplus.extension.service.IService;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author RZY
 * @since 2022-03-21
 */
public interface ScaleOrderService extends IService<ScaleOrder> {

    Result createScaleOrder(HttpServletRequest req, ScaleOrder scaleOrder);
}
