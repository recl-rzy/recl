package com.ren.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduArticle;
import com.ren.eduservice.entity.EduMusicCover;
import com.ren.eduservice.entity.vo.CoverQuery;
import com.ren.eduservice.service.EduMusicCoverService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author RZY
 * @since 2022-01-11
 */

@Api(tags = "后台FM背景管理")
@RestController
@RequestMapping("/eduservice/edu-music-cover")
public class EduMusicCoverController {

    @Autowired
    EduMusicCoverService eduMusicCoverService;

    @ApiOperation(value = "查询所有心理Music背景图片")
    @Cacheable(key = "'getAllCover'", value = "allCover")
    @GetMapping("/getAllCover")
    public Result getAllCover() {

        List<EduMusicCover> covers = eduMusicCoverService.list(null);
        return Result.ok()
                .data("covers", covers);
    }

    @ApiOperation(value = "根据id查询指定心理Music背景图片")
    @GetMapping("/getCoverById/{id}")
    public Result getCoverById(@PathVariable String id) {

        EduMusicCover cover = eduMusicCoverService.getById(id);
        return Result.ok()
                .data("covers", cover);
    }

    @ApiOperation(value = "根据id修改心理Music背景图片")
    @PostMapping("/updateCover")
    public Result updateCover(@RequestBody(required = true) EduMusicCover eduMusicCover) {

        Boolean flag = eduMusicCoverService.update(eduMusicCover, null);
        if(flag) {

            return Result.ok();
        } else {

            return Result.error();
        }

    }

    @ApiOperation(value = "添加心理Music背景图片")
    @PostMapping("/addCover")
    public Result addCover(@RequestBody(required = true) EduMusicCover eduMusicCover) {

        Boolean flag = eduMusicCoverService.save(eduMusicCover);
        if(flag) {

            return Result.ok();
        } else {

            return Result.error();
        }

    }

    @ApiOperation(value = "心理Music背景图片筛选")
    @PostMapping("/pageCoverFactor/{current}/{limit}")
    public Result pageCoverFactor(@PathVariable long current, @PathVariable long limit,
            @RequestBody(required = false) CoverQuery coverQuery) {

        Page<EduMusicCover> page = new Page<>(current, limit);
        QueryWrapper<EduMusicCover> wrapper = new QueryWrapper<>();
        String title = coverQuery.getTitle();
        String start = coverQuery.getGmtCreate();
        String end = coverQuery.getGmtModified();

        if (!StringUtils.isEmpty(title)) wrapper.like("title", title);


        if (!StringUtils.isEmpty(start)) wrapper.ge("gmt_create", start);

        if (!StringUtils.isEmpty(end)) wrapper.le("gmt_modified", end);

        eduMusicCoverService.page(page, wrapper);
        List<EduMusicCover> coverList = page.getRecords();
        long total = page.getTotal();
        return Result.ok()
                .data("coverList", coverList)
                .data("total", total);

    }

    @ApiOperation(value = "根据id删除心理Music背景图片")
    @DeleteMapping("/delCoverById/{id}")
    public Result delCover(@PathVariable String id) {

        Boolean flag = eduMusicCoverService.removeById(id);
        if(flag) {

            return Result.ok();
        } else {

            return Result.error();
        }

    }
}

