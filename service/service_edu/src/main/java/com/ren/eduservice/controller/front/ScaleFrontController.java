package com.ren.eduservice.controller.front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.GroupListByCount;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduScale;
import com.ren.eduservice.entity.EduScaleClassify;
import com.ren.eduservice.entity.EduScaleComment;
import com.ren.eduservice.entity.vo.*;
import com.ren.eduservice.service.EduScaleClassifyService;
import com.ren.eduservice.service.EduScaleCommentService;
import com.ren.eduservice.service.EduScaleEvaluateService;
import com.ren.eduservice.service.EduScaleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: ScaleFrontController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/30 11:11
 * @Vertion: 2019.1
 */

@Api(tags = "前台量表接口")
@RestController
@RequestMapping("/eduservice/scale-front")
public class ScaleFrontController {

    @Autowired
    private EduScaleService eduScaleService;

    @Autowired
    EduScaleCommentService eduScaleCommentService;

    @Autowired
    EduScaleClassifyService eduScaleClassifyService;

    @Autowired
    EduScaleEvaluateService eduScaleEvaluateService;

    @ApiOperation(value = "量表信息获取")
    @GetMapping("/getScale/{id}")
    public Result getScale(@PathVariable String id) {

        ScaleFrontVo scale = eduScaleService.getScaleFrontVo(id);
        List<ScaleCommentVo> scaleComment = eduScaleCommentService.getScaleComment(id);
        ScaleEvaluateVo scaleEvaluate = eduScaleEvaluateService.getScaleEvaluate(id);
        return Result.ok()
                .data("scale", scale)
                .data("scaleComment", scaleComment)
                .data("scaleEvaluate", scaleEvaluate);
    }

    @ApiOperation(value = "前台量表分类ID查询")
    @Cacheable(key = "'getAllScaleClassifies'", value = "scaleClassifies")
    @GetMapping("/getAllScaleClassifies")
    public Result getAllScaleClassifies() {

        QueryWrapper<EduScaleClassify> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("gmt_create");
        wrapper.select("id", "title");
        wrapper.eq("parent_id", 0);
        List<EduScaleClassify> classifyList = eduScaleClassifyService.list(wrapper);
        classifyList.add(0, new EduScaleClassify().setTitle("全部").setId("0"));
        return Result.ok()
                .data("classifyList", classifyList);
    }

    @ApiOperation(value = "量表分类筛选")
    @PostMapping("/pageScaleFactor/{current}/{limit}")
    public Result pageScaleFactor(@PathVariable long current, @PathVariable long limit,
                                  @RequestBody(required = false) ScaleQuery scaleQuery) {

        return eduScaleService.getPageScaleFactor(current, limit, scaleQuery);
    }

    @ApiOperation(value = "首页量表分类筛选")
    @PostMapping("/indexPageScaleFactor/{current}/{limit}")
    public Result indexPageScaleFactor(@PathVariable long current, @PathVariable long limit,
                                  @RequestBody(required = false) ScaleQuery scaleQuery) {

        Page<EduScale> scalePage = new Page<>(current, limit);
        QueryWrapper<EduScale> scaleWrapper = new QueryWrapper<>();
        String classifyId = scaleQuery.getClassifyId();
        if(classifyId != null && !classifyId.equals("0")) {

            scaleWrapper.eq("classify_parent_id", classifyId);
        }
        scaleWrapper.orderByDesc("view_count");
        scaleWrapper.eq("status", "Normal");
        eduScaleService.page(scalePage, scaleWrapper);
        List<EduScale> scaleList = scalePage.getRecords();
        long pages = scalePage.getPages();
        long total = scalePage.getTotal();
        return Result.ok()
                .data("scaleList", scaleList)
                .data("total", total)
                .data("pages", pages);
    }
}

