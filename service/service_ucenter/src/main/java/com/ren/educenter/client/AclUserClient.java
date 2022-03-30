package com.ren.educenter.client;

import com.ren.commonutils.Result;
import com.ren.educenter.entity.AclUser;
import com.ren.educenter.entity.vo.UserInfoVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

@FeignClient(name = "service-edu")
@Component
public interface AclUserClient {

    @PostMapping("/eduservice/acl-user/getAclUserByUsername")
    AclUser getAclUserByUsername(@RequestParam String username);

    @GetMapping("/eduservice/acl-user/getAclUserById/{id}")
    UserInfoVo getAclUserById(@PathVariable String id);

    @PostMapping("/eduservice/acl-user/updateAclUser")
    void updateAclUser(@RequestBody UserInfoVo userInfoVo);

    @PostMapping("/eduservice/acl-user/updatePw")
    Result updatePw(@RequestBody(required = true) UserInfoVo userInfoVo);

}
