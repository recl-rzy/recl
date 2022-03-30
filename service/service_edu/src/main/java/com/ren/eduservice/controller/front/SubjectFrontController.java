package com.ren.eduservice.controller.front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduScale;
import com.ren.eduservice.entity.EduScaleComment;
import com.ren.eduservice.entity.EduScaleEvaluate;
import com.ren.eduservice.entity.EduScaleSubject;
import com.ren.eduservice.entity.vo.ScaleCommentVo;
import com.ren.eduservice.service.EduScaleCommentService;
import com.ren.eduservice.service.EduScaleEvaluateService;
import com.ren.eduservice.service.EduScaleService;
import com.ren.eduservice.service.EduScaleSubjectService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: SubjectController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/5 12:44
 * @Vertion: 2019.1
 */

@Api(tags = "前台量表测评接口")
@RestController
@RequestMapping("/eduservice/subject-front")
public class SubjectFrontController {

    @Autowired
    EduScaleService eduScaleService;

    @Autowired
    EduScaleSubjectService eduScaleSubjectService;

    @Autowired
    EduScaleCommentService eduScaleCommentService;

    @Autowired
    EduScaleEvaluateService eduScaleEvaluateService;

    @ApiOperation(value = "量表测试数据获取")
    @GetMapping("/getScaleSubject/{id}")
    public Result getScaleSubject(@PathVariable String id) {

        QueryWrapper<EduScale> scaleWrapper = new QueryWrapper<>();
        scaleWrapper.select("id", "title");
        scaleWrapper.eq("id", id);
        EduScale scaleInfo = eduScaleService.getOne(scaleWrapper);

        QueryWrapper<EduScaleSubject> scaleSubjectWrapper = new QueryWrapper<>();
        scaleWrapper.select("dimension", "option_one", "option_two", "option_three", "option_four",
                "option_one_score", "option_two_score", "option_three_score", "option_four_score", "option_title");
        scaleSubjectWrapper.orderByAsc("subject_sort");
        scaleSubjectWrapper.eq("scale_id", id);
        List<EduScaleSubject> scaleSubjects = eduScaleSubjectService.list(scaleSubjectWrapper);
        return Result.ok()
                .data("scaleSubject", scaleSubjects)
                .data("scaleInfo", scaleInfo);
    }

    @ApiOperation(value = "量表测试结果评估")
    @PostMapping("/getScaleAppraisal/{scaleId}/{userId}")
    public Result getScaleAppraisal(@PathVariable String scaleId, @PathVariable String userId, @RequestBody List<String> scaleResult) {

        List<String> appraisalResult = eduScaleService.getScaleAppraisalResult(scaleId, userId, scaleResult);
        return Result.ok()
                .data("appraisalResult", appraisalResult);
    }

    @ApiOperation(value = "量表评论拉取")
    @GetMapping("/getScaleComment/{id}")
    public Result getScaleComment(@PathVariable String id) {

        List<ScaleCommentVo> scaleComment = eduScaleCommentService.getScaleComment(id);
        return Result.ok()
                .data("scaleComment", scaleComment);
    }

    @ApiOperation(value = "量表评论提交")
    @PostMapping("/addScaleComment")
    public Result addScaleComment(@RequestBody EduScaleComment eduScaleComment) {

        eduScaleCommentService.save(eduScaleComment);
        return Result.ok();
    }

    @ApiOperation(value = "量表评分上传")
    @PostMapping("/addScaleRadio")
    public Result addScaleRadio(@RequestBody EduScaleEvaluate scaleEvaluate) {

        boolean flag = eduScaleEvaluateService.save(scaleEvaluate);
        if (flag) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

}

