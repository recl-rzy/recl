package com.ren.educenter.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.educenter.entity.MemberPraise;
import com.ren.educenter.service.MemberPraiseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.ReactiveZSetCommands;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author RZY
 * @since 2022-03-30
 */
@Api(tags = "用户获赞接口")
@RestController
@RequestMapping("/educenter/member-praise")
public class MemberPraiseController {

    @Autowired
    MemberPraiseService memberPraiseService;

    @ApiOperation(value = "用户点赞量拉去")
    @GetMapping("/getPraiseCount/{id}")
    public int getPraiseCount(@PathVariable String id) {
        return memberPraiseService.count(new QueryWrapper<MemberPraise>().eq("user_id", id));
    }
}

