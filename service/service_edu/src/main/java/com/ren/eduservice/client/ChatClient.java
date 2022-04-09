package com.ren.eduservice.client;

import io.swagger.annotations.ApiOperation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Component
@FeignClient(name = "service-chat")
public interface ChatClient {

    @ApiOperation(value = "服务推送接收咨询消息")
    @GetMapping("/chat/user/applyForChat/{userId}")
    boolean applyForChat(@PathVariable String userId, @RequestParam String msg);
}
