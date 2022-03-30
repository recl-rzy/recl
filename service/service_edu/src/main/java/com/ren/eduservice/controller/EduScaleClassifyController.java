package com.ren.eduservice.controller;


import com.ren.commonutils.Result;
import com.ren.eduservice.entity.TestClassify.OneClassify;
import com.ren.eduservice.service.EduScaleClassifyService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author RZY
 * @since 2021-08-07
 */
@Api(tags = "后台量表分类")
@RestController
@RequestMapping("/eduservice/test-classify")
public class EduScaleClassifyController {

    @Autowired
    private EduScaleClassifyService eduScaleClassifyService;

    @ApiOperation(value = "添加测试分类")
    @PostMapping("addTestClassify")
    public Result addTestClassify(MultipartFile file) {

        eduScaleClassifyService.saveTestClassify(file, eduScaleClassifyService);
        return Result.ok();
    }

    @ApiOperation(value = "获取测试分类")
    @Cacheable(key = "'getTestClassify'", value = "testClassify")
    @GetMapping("getTestClassify")
    public Result getTestClassify() {

        List<OneClassify> classify = eduScaleClassifyService.getAllClassify();
        return Result.ok()
                .data("classify", classify);
    }

}

