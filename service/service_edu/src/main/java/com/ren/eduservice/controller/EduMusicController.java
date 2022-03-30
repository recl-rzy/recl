package com.ren.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduArticle;
import com.ren.eduservice.entity.EduMusic;
import com.ren.eduservice.entity.vo.ArticleQuery;
import com.ren.eduservice.entity.vo.MusicQuery;
import com.ren.eduservice.service.EduMusicService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author RZY
 * @since 2021-10-02
 */

@Api(tags = "后台FM管理")
@RestController
@RequestMapping("/eduservice/edu-music")
public class EduMusicController {

    @Autowired
    EduMusicService eduMusicService;

    @ApiOperation(value = "忆心Music所有信息查询")
    @Cacheable(key = "'getAllMusic'", value = "allMusic")
    @GetMapping("getAllMusic")
    public Result getAllMusic() {

        List<EduMusic> eduMusics = eduMusicService.list(null);
        return Result.ok()
                .data("musics", eduMusics);
    }

    @ApiOperation(value = "忆心Music信息查询(id查询)")
    @GetMapping("getMusic/{id}")
    public Result getMusic(@PathVariable String id) {

        EduMusic eduMusic = eduMusicService.getById(id);
        return Result.ok()
                .data("music", eduMusic);
    }

    @ApiOperation(value = "忆心Music信息修改")
    @PostMapping("updateMusic")
    public Result updateMusic(@RequestBody EduMusic eduMusic) {

        boolean flag = eduMusicService.update(eduMusic, null);
        if (flag) {

            return Result.ok();
        } else {

            return Result.error();
        }
    }

    @ApiOperation(value = "忆心Music信息添加")
    @PostMapping("addMusic")
    public Result addMusic(@RequestBody EduMusic eduMusic) {

        eduMusic.setStatus("Draft");
        boolean flag = eduMusicService.save(eduMusic);
        if (flag) {

            return Result.ok();
        } else {

            return Result.error();
        }
    }

    @ApiOperation(value = "忆心Music记录删除")
    @DeleteMapping("{id}")
    public Result delMusicById(@PathVariable String id) {

        boolean flag = eduMusicService.removeById(id);
        if (flag) {

            return Result.ok();
        } else {

            return Result.error();
        }
    }

    @ApiOperation(value = "未发布忆心Music条件查询")
    @PostMapping("/pageCheckMusicFactor/{current}/{limit}")
    public Result pageCheckMusicFactor(@PathVariable long current, @PathVariable long limit,
                                       @RequestBody(required = false) MusicQuery musicQuery) {

        Page<EduMusic> page = new Page<>(current, limit);

        QueryWrapper<EduMusic> wrapper = new QueryWrapper<>();
        String title = musicQuery.getTitle();
        String mood = musicQuery.getMusicMood();
        String status = musicQuery.getStatus();
        String start = musicQuery.getGmtCreate();
        String end = musicQuery.getGmtModified();

        wrapper.eq("status", "Draft");

        if (!StringUtils.isEmpty(title)) wrapper.like("title", title);

        if (!StringUtils.isEmpty(status)) wrapper.eq("status", status);

        if (!StringUtils.isEmpty(mood)) wrapper.like("music_mood", mood);

        if (!StringUtils.isEmpty(start)) wrapper.ge("gmt_create", start);

        if (!StringUtils.isEmpty(end)) wrapper.le("gmt_modified", end);

        eduMusicService.page(page, wrapper);
        long total = page.getTotal();
        List<EduMusic> records = page.getRecords();
        return Result.ok()
                .data("rows", records)
                .data("total", total);
    }

    @ApiOperation(value = "忆心Music条件查询")
    @PostMapping("/pageMusicFactor/{current}/{limit}")
    public Result pageMusicFactor(@PathVariable long current, @PathVariable long limit,
                                  @RequestBody(required = false) MusicQuery musicQuery) {

        Page<EduMusic> page = new Page<>(current, limit);

        QueryWrapper<EduMusic> wrapper = new QueryWrapper<>();
        String title = musicQuery.getTitle();
        String mood = musicQuery.getMusicMood();
        String status = musicQuery.getStatus();
        String start = musicQuery.getGmtCreate();
        String end = musicQuery.getGmtModified();

        if (!StringUtils.isEmpty(title)) wrapper.like("title", title);

        if (!StringUtils.isEmpty(status)) wrapper.eq("status", status);

        if (!StringUtils.isEmpty(mood)) wrapper.like("music_mood", mood);

        if (!StringUtils.isEmpty(start)) wrapper.ge("gmt_create", start);

        if (!StringUtils.isEmpty(end)) wrapper.le("gmt_modified", end);
        eduMusicService.page(page, wrapper);
        long total = page.getTotal();
        List<EduMusic> records = page.getRecords();
        return Result.ok()
                .data("rows", records)
                .data("total", total);
    }

    @ApiOperation(value = "忆心Music发布")
    @PutMapping("/publishMusic/{id}")
    public Result publishMusic(@PathVariable String id) {

        EduMusic eduMusic = new EduMusic();
        eduMusic.setStatus("Normal");
        eduMusic.setId(id);
        boolean flag = eduMusicService.updateById(eduMusic);
        if (flag) {

            return Result.ok();
        } else {

            return Result.error();
        }
    }
}

