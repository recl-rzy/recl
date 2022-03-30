package com.ren.orderservice.controller;


import com.ren.commonutils.Result;
import com.ren.orderservice.entity.ScaleOrder;
import com.ren.orderservice.service.ScaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author RZY
 * @since 2022-03-21
 */
@RestController
@RequestMapping("/order/scale-order")
public class ScaleOrderController {

    @Autowired
    ScaleOrderService scaleOrderService;

    @PostMapping("/createOrder")
    public Result createOrder(HttpServletRequest req,
                              @RequestBody(required = false) ScaleOrder scaleOrder) {

        return scaleOrderService.createScaleOrder(req, scaleOrder);
    }
}

