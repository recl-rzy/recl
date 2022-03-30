package com.ren.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduArticle;
import com.ren.eduservice.entity.EduArticleClassify;
import com.ren.eduservice.entity.vo.ArticleQuery;
import com.ren.eduservice.service.EduArticleClassifyService;
import com.ren.eduservice.service.EduArticleCommentService;
import com.ren.eduservice.service.EduArticleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author RZY
 * @since 2021-08-16
 */

@Api(tags = "后台美文管理")
@RestController
@RequestMapping("/eduservice/edu-article")
public class EduArticleController {

    @Autowired
    EduArticleService eduArticleService;

    @Autowired
    EduArticleClassifyService eduArticleClassifyService;

    @Autowired
    EduArticleCommentService eduArticleCommentService;

    @ApiOperation(value = "心理美文删除")
    @DeleteMapping("/delArticle/{id}")
    public Result delArticle(@PathVariable String id) {

        boolean flag = eduArticleService.removeById(id);
        if (flag) {

            return Result.ok();
        } else {

            return Result.error();
        }
    }

    @ApiOperation(value = "心理美文整体查询")
    @Cacheable(key = "'getAllArticle'", value = "allArticle")
    @GetMapping("/getAllArticle")
    public Result getAllArticle() {

        List<EduArticle> articles = eduArticleService.list(null);
        return Result.ok()
                .data("articles", articles);
    }

    @ApiOperation(value = "心理美文查询")
    @GetMapping("/getArticle/{id}")
    public Result getArticle(@PathVariable String id) {

        EduArticle article = eduArticleService.getById(id);
        return Result.ok()
                .data("article", article);
    }

    @ApiOperation(value = "心理美文条件查询")
    @PostMapping("/pageArticleFactor/{current}/{limit}")
    public Result pageArticleFactor(@PathVariable long current, @PathVariable long limit,
                                    @RequestBody(required = false) ArticleQuery articleQuery) {

        Page<EduArticle> page = new Page<>(current, limit);
        //查询wapper构建
        QueryWrapper<EduArticle> wapper = new QueryWrapper<>();
        String title = articleQuery.getTitle();
        String classify = articleQuery.getArticleClassify();
        String status = articleQuery.getStatus();
        String gmtCreate = articleQuery.getGmtCreate();
        String gmtModified = articleQuery.getGmtModified();

        if (title != null) {

            wapper.like("title", title);
        }
        if (classify != null) {

            wapper.like("article_classify", classify);
        }
        if (status != null) {

            wapper.eq("status", status);
        }
        if (gmtCreate != null) {

            wapper.ge("gmt_create", gmtCreate);
        }
        if (gmtModified != null) {

            wapper.le("gmt_modified", gmtModified);
        }
        eduArticleService.page(page, wapper);
        long total = page.getTotal();
        List<EduArticle> records = page.getRecords();
        return Result.ok()
                .data("rows", records)
                .data("total", total);
    }

    @ApiOperation(value = "心理美文信息修改")
    @PostMapping("/updateArticle")
    public Result updateArticle(@RequestBody(required = true) EduArticle eduArticle) {

        UpdateWrapper<EduArticle> wrapper = new UpdateWrapper<>();
        wrapper.set("one_tag", eduArticle.getOneTag());
        wrapper.set("two_tag", eduArticle.getTwoTag());
        wrapper.set("three_tag", eduArticle.getThreeTag());
        boolean flag = eduArticleService.updateById(eduArticle);
        if (flag) {

            return Result.ok();
        } else {

            return Result.error();
        }
    }

    @ApiOperation(value = "心理美文添加")
    @PostMapping("/addArticle")
    public Result addArticle(@RequestBody(required = true) EduArticle eduArticle) {

        boolean flag = eduArticleService.save(eduArticle);
        if (flag) {

            return Result.ok();
        } else {

            return Result.error();
        }
    }

    @ApiOperation(value = "心理美文分类获取")
    @Cacheable(key = "'getAllArticleClassify'", value = "allArticleClassify")
    @GetMapping("/getAllArticleClassify")
    public Result getAllArticleClassify() {

        QueryWrapper<EduArticle> wrapper = new QueryWrapper<>();
        wrapper.select("DISTINCT article_classify");
        List<EduArticle> list = eduArticleService.list(wrapper);
        List<String> classifies = list.stream().map(EduArticle::getArticleClassify).collect(Collectors.toList());

        return Result.ok()
                .data("classifies", classifies);
    }

    @ApiOperation(value = "心理美文分类删除")
    @GetMapping("/delArticleClassify/{id}")
    public Result delArticleClassify(@PathVariable String id) {

        boolean flag = eduArticleClassifyService.removeById(id);
        if (flag) {

            return Result.ok();
        } else {

            return Result.error();
        }
    }

    @ApiOperation(value = "心理美文发布")
    @GetMapping("/publishArticle/{id}")
    public Result publishArticle(@PathVariable String id) {

        EduArticle eduArticle = new EduArticle();
        eduArticle.setId(id);
        eduArticle.setStatus("Normal");
        boolean flag = eduArticleService.updateById(eduArticle);
        if (flag) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "未发布心理美文条件查询")
    @PostMapping("/pageCheckArticleFactor/{current}/{limit}")
    public Result pageCheckArticleFactor(@PathVariable long current, @PathVariable long limit,
                                         @RequestBody(required = false) ArticleQuery articleQuery) {

        Page<EduArticle> page = new Page<>(current, limit);

        QueryWrapper<EduArticle> wapper = new QueryWrapper<>();
        String title = articleQuery.getTitle();
        String classify = articleQuery.getArticleClassify();
        String gmtCreate = articleQuery.getGmtCreate();
        String gmtModified = articleQuery.getGmtModified();

        wapper.eq("status", "Draft");

        if (title != null) {

            wapper.like("title", title);
        }
        if (classify != null) {

            wapper.like("article_classify", classify);
        }

        if (gmtCreate != null) {

            wapper.ge("gmt_create", gmtCreate);
        }
        if (gmtModified != null) {

            wapper.le("gmt_modified", gmtModified);
        }
        eduArticleService.page(page, wapper);
        long total = page.getTotal();
        List<EduArticle> records = page.getRecords();
        return Result.ok()
                .data("rows", records)
                .data("total", total);
    }

}

