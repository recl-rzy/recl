package com.ren.educenter.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.Result;
import com.ren.educenter.entity.MemberFocus;
import com.ren.educenter.service.MemberFocusService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author rzy
 * @since 2021-10-23
 */

@Api(value = "用户关注管理")
@RestController
@RequestMapping("/educenter/member-focus")
@ResponseBody
public class MemberFocusController {

    @Autowired
    MemberFocusService memberFocusService;

    @ApiOperation(value = "关注用户")
    @PostMapping("focus")
    public Result focus(@RequestBody MemberFocus memberFocus) {

        return memberFocusService.focusMember(memberFocus);
    }

    @ApiOperation(value = "关注用户")
    @GetMapping("getFocusStatus/{userId}/{focusUserId}")
    public Result getFocusStatus(@PathVariable String userId, @PathVariable String focusUserId) {

        QueryWrapper<MemberFocus> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id", userId);
        wrapper.eq("focus_user_id", focusUserId);
        MemberFocus focus = memberFocusService.getOne(wrapper);
        if (focus == null) {
            return Result.ok()
                    .data("focusStatus", false);
        } else {

            return Result.ok()
                    .data("focusStatus", focus.getFocusStatus());
        }
    }
}

