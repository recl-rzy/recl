package com.ren.chat.controller;

import com.alibaba.fastjson.JSON;
import com.ren.chat.client.AclUserClient;
import com.ren.chat.entity.vo.PushMsg;
import com.ren.chat.entity.vo.UserInfoVo;
import com.ren.chat.service.MsgService;
import com.ren.commonutils.DateUtils;
import com.ren.commonutils.Result;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: ChatUserController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/30 20:26
 * @Vertion: v1.0
 */

@RestController
@RequestMapping("/chat/user")
public class ChatUserController {

    @Autowired
    AclUserClient aclUserClient;

    @Autowired
    MsgService msgService;

    @ApiOperation(value = "咨询用户信息拉取")
    @GetMapping("/getChatUser/{id}")
    public Result getChatUser(@PathVariable String id) {
        UserInfoVo user = aclUserClient.getAclUserById(id);
        return Result.ok()
                .data("chatUser", user);
    }

    @ApiOperation(value = "服务推送接收咨询消息")
    @GetMapping("/applyForChat/{userId}")
    public boolean applyForChat(@PathVariable String userId, @RequestParam String msg) {
        return msgService.applyForChat(userId, msg);
    }
}
