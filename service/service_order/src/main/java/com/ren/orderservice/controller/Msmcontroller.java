package com.ren.orderservice.controller;

import com.ren.commonutils.Result;
import com.ren.orderservice.utils.RandomUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.TimeUnit;

/**
 * @Description: TODO
 * @ClassName: Msmcontroller
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/19 22:08
 * @Vertion: 2019.1
 */

@RestController
@RequestMapping("/order/msm")
public class Msmcontroller {


    @Autowired
    RedisTemplate<String, Object> redisTemplate;

    @GetMapping("/send/{phone}")
    public Result sendMsm(@PathVariable String phone) {

        //从redis中获取验证码，取到直接返回
        String code = (String) redisTemplate.opsForValue().get(phone);
        if (code != null) {
            System.out.println("redis中获取的验证码为:" + code);
            return Result.ok();
        }

        //如果取不到验证码，在线生成验证码
        code = RandomUtil.getSixBitRandom();
        System.out.println("生成的验证码为:" + code);
        redisTemplate.opsForValue().set(phone, code, 1, TimeUnit.MINUTES);
        return Result.ok();
    }
}

