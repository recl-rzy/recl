package com.ren.eduservice.controller.front;

import com.alibaba.fastjson.JSON;
import com.ren.commonutils.Result;
import com.ren.eduservice.client.ChatClient;
import com.ren.eduservice.entity.vo.PushMsg;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Description: TODO
 * @ClassName: ConsultFrontController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/31 16:56
 * @Vertion: v1.0
 */

@Api(tags = "前台咨询接口")
@RestController
@RequestMapping("/eduservice/consult-front")
public class ConsultFrontController {

    @Autowired
    ChatClient chatClient;

    @PostMapping("/initiateConsult/{userId}")
    public Result initiateConsult(@PathVariable String userId, @RequestBody PushMsg msg) {

        boolean chat = chatClient.applyForChat(userId, JSON.toJSONString(msg));
        if(chat) {
            return Result.ok()
                    .message("通知成功!");
        } else {
            return Result.error()
                    .message("通知失败!");
        }
    }
}
