package com.ren.chat.controller;


import com.ren.chat.entity.ChatMsg;
import com.ren.chat.entity.ChatStatus;
import com.ren.chat.service.MsgService;
import com.ren.commonutils.RedisUtils;
import com.ren.commonutils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author rzy
 * @since 2021-10-24
 */
@RestController
@RequestMapping("/chat/msg")
public class MsgController {

    @Autowired
    MsgService msgService;

    @GetMapping("/getChatMsg/{sendUserId}/{receiveUserId}")
    public Result getChatMsg(@PathVariable String sendUserId, @PathVariable String receiveUserId) {

        List<ChatMsg> chatMsgs = msgService.getChatMsg(sendUserId, receiveUserId);
        return Result.ok()
                .data("chatMsgs", chatMsgs);
    }

    @PostMapping("/updateStatus/{id}/{status}")
    public Result updateStatus(@PathVariable String id, @PathVariable Integer status) {

        ChatStatus chatStatus = (ChatStatus)RedisUtils.get(id);
        chatStatus.setStatus(status);
        return Result.ok();
    }

}

