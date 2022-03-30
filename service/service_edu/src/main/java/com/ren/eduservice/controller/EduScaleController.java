package com.ren.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.*;
import com.ren.eduservice.entity.vo.ScaleInfoVo;
import com.ren.eduservice.entity.vo.ScaleQuery;
import com.ren.eduservice.service.*;
import com.ren.servicebase.exceptionhandler.ReclException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author RZY
 * @since 2021-08-08
 */

@Api(tags = "后台量表管理")
@RestController
@RequestMapping("/eduservice/edu-scale")
public class EduScaleController {

    @Autowired
    EduScaleService eduScaleService;

    @Autowired
    EduScaleSubjectService eduScaleSubjectService;

    @Autowired
    EduScaleCommentService eduScaleCommentService;

    @Autowired
    EduScaleEvaluateService eduScaleEvaluateService;

    @Autowired
    EduScaleAppraisalService eduScaleAppraisalService;


    @ApiOperation(value = "量表基础信息添加")
    @PostMapping("addScaleInfo")
    public Result addScaleInfo(@RequestBody EduScale eduScale) {

        boolean flag = eduScaleService.save(eduScale);
        if (flag) {
            return Result.ok()
                    .data("scaleId", eduScale.getId());
        } else {
            return Result.error()
                    .message("保存失败");
        }

    }

    @ApiOperation(value = "量表基础信息修改")
    @PostMapping("updateScaleInfo")
    public Result updateScaleInfo(@RequestBody EduScale eduScale) {

        boolean flag = eduScaleService.updateById(eduScale);
        if (flag) {

            return Result.ok();
        } else {

            return Result.error();
        }
    }

    @ApiOperation(value = "量表基础信息获取")
    @GetMapping("getScaleInfo/{scaleId}")
    public Result getScaleInfo(@PathVariable String scaleId) {

        EduScale eduScale = eduScaleService.getById(scaleId);
        return Result.ok()
                .data("eduScale", eduScale);
    }

    @ApiOperation(value = "量表相关信息封装")
    @GetMapping("getScaleInfoVo/{scaleId}")
    public Result getScaleInfoVo(@PathVariable String scaleId) {

        ScaleInfoVo scaleInfoVo = eduScaleService.getScaleInfoVo(scaleId);

        return Result.ok()
                .data("scaleInfoVo", scaleInfoVo);
    }

    @ApiOperation(value = "量表发布")
    @PutMapping("/publishScale/{scaleId}")
    public Result publishScale(@PathVariable String scaleId) {

        EduScale eduScale = new EduScale();
        eduScale.setId(scaleId);
        eduScale.setStatus("Normal");
        boolean flag = eduScaleService.updateById(eduScale);
        if (flag) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "量表删除")
    @DeleteMapping("/{scaleId}")
    public Result delScale(@PathVariable String scaleId) {

        QueryWrapper<EduScaleComment> commentWrapper = new QueryWrapper<>();
        QueryWrapper<EduScaleEvaluate> evaluateWrapper = new QueryWrapper<>();
        QueryWrapper<EduScaleSubject> subjectWrapper = new QueryWrapper<>();
        commentWrapper.eq("scale_id", scaleId);
        evaluateWrapper.eq("scale_id", scaleId);
        subjectWrapper.eq("scale_id", scaleId);
        try {
            eduScaleService.removeById(scaleId);
            eduScaleSubjectService.remove(subjectWrapper);
            eduScaleCommentService.remove(commentWrapper);
            eduScaleEvaluateService.remove(evaluateWrapper);
        } catch (Exception e) {

            throw new ReclException(20001, "删除失败");
        }
        return Result.ok();
    }

    @ApiOperation(value = "量表发布")
    @PostMapping("/confirmScaleInfo/{id}")
    public Result confirmScaleInfo(@PathVariable String id) {

        EduScale eduScale = new EduScale();
        eduScale.setId(id);
        eduScale.setStatus("Verify");
        boolean flag = eduScaleService.updateById(eduScale);
        if (flag) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "量表题目上传添加")
    @PostMapping("/addScaleSubject/{scaleId}")
    public Result addScaleSubject(MultipartFile file, @PathVariable String scaleId) {

        eduScaleService.saveScaleSubject(file, scaleId);
        return Result.ok();
    }

    @ApiOperation(value = "量表评估规则上传添加")
    @PostMapping("/addScaleAppraisal/{scaleId}")
    public Result addScaleAppraisal(MultipartFile file, @PathVariable String scaleId) {

        eduScaleService.saveScaleAppraisal(file, scaleId);
        return Result.ok();
    }

    @ApiOperation(value = "量表题目回显")
    @GetMapping("/getScaleSubject/{id}")
    public Result getScaleSubject(@PathVariable String id) {

        QueryWrapper<EduScaleSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("scale_id", id);
        List<EduScaleSubject> scaleSubjects = eduScaleSubjectService.list(wrapper);
        return Result.ok()
                .data("scaleSubjects", scaleSubjects);
    }

    @ApiOperation(value = "删除上传的量表题目")
    @DeleteMapping("delScaleSubject/{id}")
    public Result delScaleSubject(@PathVariable String id) {

        QueryWrapper<EduScaleSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("scale_id", id);
        boolean flag = eduScaleSubjectService.remove(wrapper);

        if (flag) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "量表评估规则回显")
    @GetMapping("/getScaleAppraisal/{id}")
    public Result getScaleAppraisal(@PathVariable String id) {

        QueryWrapper<EduScaleAppraisal> wrapper = new QueryWrapper<>();
        wrapper.eq("scale_id", id);
        List<EduScaleAppraisal> scaleAppraisals = eduScaleAppraisalService.list(wrapper);
        return Result.ok()
                .data("scaleAppraisals", scaleAppraisals);
    }

    @ApiOperation(value = "删除上传的量表评估规则")
    @DeleteMapping("delScaleAppraisal/{id}")
    public Result delScaleAppraisal(@PathVariable String id) {

        QueryWrapper<EduScaleAppraisal> wrapper = new QueryWrapper<>();
        wrapper.eq("scale_id", id);
        boolean flag = eduScaleAppraisalService.remove(wrapper);

        if (flag) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "量表筛选")
    @PostMapping("/pageScaleFactor/{current}/{limit}")
    public Result pageScaleFactor(@PathVariable long current, @PathVariable long limit,
                                       @RequestBody(required = false) ScaleQuery scaleQuery) {

        return eduScaleService.pageScaleFactor(current, limit, scaleQuery);
    }

}

