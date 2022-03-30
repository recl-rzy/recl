package com.ren.servicebase.interceptor;

import com.ren.commonutils.RedisUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Description: TODO
 * @ClassName: ScaleInterceptor
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/25 22:30
 * @Vertion: 2019.1
 */

@Component
public class ScaleInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        RedisUtils.incr("scaleCount", 1);
        return true;
    }
}

