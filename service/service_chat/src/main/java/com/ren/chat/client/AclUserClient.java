package com.ren.chat.client;

import com.ren.chat.entity.vo.UserInfoVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "service-edu")
@Component
public interface AclUserClient {

    @GetMapping("/eduservice/acl-user/getAclIdentity/{id}")
    String getAclIdentity(@PathVariable String id);

    @GetMapping("/eduservice/acl-user/getAclUserById/{id}")
    UserInfoVo getAclUserById(@PathVariable String id);
}
