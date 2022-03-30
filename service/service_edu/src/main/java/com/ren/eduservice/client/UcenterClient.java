package com.ren.eduservice.client;


import com.ren.eduservice.client.Impl.UcenterDegradeFeignClient;
import com.ren.eduservice.entity.UcenterMember;
import io.swagger.annotations.ApiOperation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(name = "service-ucenter", fallback = UcenterDegradeFeignClient.class)
@Component
public interface UcenterClient {

    @GetMapping("/educenter/member/getSingleUser/{id}")
    UcenterMember getSingleUser(@PathVariable String id);

    @GetMapping("/educenter/member/getUsers")
    List<UcenterMember> getUsers(@RequestParam List<String> userIds);

    @ApiOperation(value = "用户点赞量拉去")
    @GetMapping("/educenter/member-praise/getPraiseCount/{id}")
    int getPraiseCount(@PathVariable String id);
}
