package com.ren.servicebase.interceptor;

import com.ren.commonutils.RedisUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Description: TODO
 * @ClassName: LoginInterceptor
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/25 22:31
 * @Vertion: 2019.1
 */

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        RedisUtils.incr("loginCount", 1);
        return true;
    }
}

