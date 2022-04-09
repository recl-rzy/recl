package com.ren.educenter.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.*;
import com.ren.educenter.client.AclUserClient;
import com.ren.educenter.entity.UcenterMember;
import com.ren.educenter.entity.vo.RegisterVo;
import com.ren.educenter.entity.vo.UserInfoVo;
import com.ren.educenter.service.UcenterMemberService;
import com.ren.servicebase.exceptionhandler.ReclException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2021-09-20
 */

@Api(tags = "用户登录")
@RestController
@RequestMapping("/educenter/member")
public class UcenterMemberController {

    @Autowired
    private UcenterMemberService ucenterMemberService;

    @Autowired
    AclUserClient aclUserClient;

    @ApiOperation(value = "登录")
    @PostMapping("/login")
    public Result loginUser(@RequestBody UcenterMember ucenterMember) {

        //调用service实现登录
        //返回token，使用jwt生成
        String token = ucenterMemberService.login(ucenterMember);

        return Result.ok()
                .data("token", token);
    }

    @ApiOperation(value = "注册")
    @PostMapping("/register")
    public Result registerUser(@RequestBody RegisterVo registerVo) {

        ucenterMemberService.register(registerVo);
        return Result.ok();
    }

    @ApiOperation(value = "通过token获取用户信息")
    @GetMapping("/getUserInfo")
    public Result getUserInfo(HttpServletRequest request) {

        String id = JwtUtils.getMemberIdByJwtToken(request);
        UcenterMember ucenterMember = ucenterMemberService.getById(id);
        if(!StringUtils.isEmpty(ucenterMember)) {

            UserInfoVo userInfo = new UserInfoVo();
            userInfo.setUsername(ucenterMember.getMobile());
            BeanUtils.copyProperties(ucenterMember, userInfo);
            // 将用户信息放入redis
            RedisUtils.set(CacheConstant.USER + userInfo.getId(), userInfo);
            return Result.ok()
                    .data("userInfo", userInfo);
        } else {

            UserInfoVo userInfo = aclUserClient.getAclUserById(id);
            if(!StringUtils.isEmpty(userInfo)) {

                // 将用户信息放入redis
                RedisUtils.set(CacheConstant.USER + userInfo.getId(), userInfo);
                return Result.ok()
                        .data("userInfo", userInfo);
            }
        }
        return Result.error()
                .message("用户不存在");
    }

    @ApiOperation(value = "通过id获取接收用户信息")
    @GetMapping("/getReceiveUserInfo/{id}")
    public Result getReceiveUserInfo(@PathVariable String id) {

        UcenterMember receiveUserInfo = ucenterMemberService.getById(id);
        return Result.ok()
                .data("receiveUserInfo", receiveUserInfo);
    }

    @ApiOperation(value = "获取单个用户信息")
    @GetMapping("/getSingleUser/{id}")
    public UcenterMember getSingleUser(@PathVariable String id) {

        return ucenterMemberService.getById(id);
    }

    @ApiOperation(value = "用户信息批量获取")
    @GetMapping("/getUsers")
    public List<UcenterMember> getUsers(@RequestParam List<String> userIds) {

        Collection<UcenterMember> memberCollection = null;
        try {
            memberCollection = ucenterMemberService.listByIds(userIds);
        } catch (Exception e) {
            throw new ReclException(20001, "信息获取失败");
        }
        return new ArrayList<>(memberCollection);
    }

    @ApiOperation(value = "用户信息修改")
    @PostMapping("/updateUserInfo")
    @Transactional(rollbackFor = Exception.class)
    public Result updateUserInfo(@RequestBody UserInfoVo userInfoVo) {

        if(!StringUtils.isEmpty(userInfoVo.getId())) {
            if(userInfoVo.getIsCounselor() || userInfoVo.getIsListener()) {

                aclUserClient.updateAclUser(userInfoVo);
            } else {

                UcenterMember member = new UcenterMember();
                BeanUtils.copyProperties(userInfoVo, member);
                ucenterMemberService.updateById(member);
            }
            return Result.ok();
        }

        return Result.error()
                .message("信息修改失败");
    }

    @ApiOperation(value = "用户密码修改")
    @PostMapping("/updatePw")
    public Result updatePw(@RequestBody(required = true) UserInfoVo userInfoVo) {

        if(!StringUtils.isEmpty(userInfoVo.getId())) {

            if(userInfoVo.getIsCounselor() || userInfoVo.getIsListener()) {

                return aclUserClient.updatePw(userInfoVo);
            } else {

                String password = ucenterMemberService.getOne(new QueryWrapper<UcenterMember>()
                        .eq("id", userInfoVo.getId())
                        .select("password")).getPassword();
                if(!MD5.encrypt(userInfoVo.getPassword()).equals(password)) {

                    return Result.error().message("密码输入错误，修改失败!");
                } else {

                    UcenterMember member = new UcenterMember();
                    member.setId(userInfoVo.getId());
                    member.setPassword(MD5.encrypt(userInfoVo.getNewPw()));
                    ucenterMemberService.updateById(member);
                    return Result.ok().message("密码修改成功");
                }
            }
        }

        return Result.error().message("无法查询当前用户");
    }
}

