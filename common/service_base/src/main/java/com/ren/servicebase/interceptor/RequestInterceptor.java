package com.ren.servicebase.interceptor;

import com.ren.commonutils.RedisUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Description: TODO
 * @ClassName: RequestInterceptor
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/26 13:04
 * @Vertion: 2019.1
 */

@Component
public class RequestInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        RedisUtils.incr("requestCount", 1);
        return true;
    }
}

