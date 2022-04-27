package com.ren.eduservice.controller;


import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.RedisUtils;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduArticle;
import com.ren.eduservice.entity.EduArticleClassify;
import com.ren.eduservice.entity.vo.ArticleQuery;
import com.ren.eduservice.service.EduArticleClassifyService;
import com.ren.eduservice.service.EduArticleCommentService;
import com.ren.eduservice.service.EduArticleService;
import com.ren.servicebase.constant.RedisKeyPrefixConstant;
import com.ren.servicebase.exceptionhandler.ReclException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.formula.functions.T;
import org.redisson.Redisson;
import org.redisson.api.RLock;
import org.redisson.api.RReadWriteLock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.util.StringUtils;
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
    Redisson redisson;

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

        //缓存key
        String articleBackKey = RedisKeyPrefixConstant.ARTICLE_BACK_CACHE + id;
        EduArticle article;
        //查询Redis缓存
        String articleStr = RedisUtils.getStr(articleBackKey);
        //判断是否在Redis中
        if(articleStr == null) {
            //Redis中不存在，查询数据库
            article = eduArticleService.getById(id);
            if(article == null) {
                //数据库中不存在，作标识，防止缓存击穿
                RedisUtils.set(articleBackKey, RedisKeyPrefixConstant.EMPTY_CACHE);
            }
            //存在则放入Redis
            RedisUtils.set(articleBackKey, article, RedisUtils.setCacheTimeout(3600));
        } else {
            //判断是否为Empty缓存
            if(RedisKeyPrefixConstant.EMPTY_CACHE.equals(articleStr)) return Result.error().message("该文章不存在").data("article", new EduArticle());
            article = JSON.parseObject(articleStr, EduArticle.class);
            //缓存续约
            RedisUtils.expire(articleBackKey, RedisUtils.setCacheTimeout(3600));
        }
        return Result.ok()
                .data("article", article);
    }

    @ApiOperation(value = "心理美文条件查询")
    @PostMapping("/pageArticleFactor/{current}/{limit}")
    public Result pageArticleFactor(@PathVariable long current, @PathVariable long limit,
                                    @RequestBody(required = false) ArticleQuery articleQuery) {

        Page<EduArticle> page = new Page<>(current, limit);
        //查询wrapper构建
        QueryWrapper<EduArticle> wrapper = new QueryWrapper<>();
        String title = articleQuery.getTitle();
        String classify = articleQuery.getArticleClassify();
        String status = articleQuery.getStatus();
        String gmtCreate = articleQuery.getGmtCreate();
        String gmtModified = articleQuery.getGmtModified();

        if (!StringUtils.isEmpty(title)) wrapper.like("title", title);

        if (!StringUtils.isEmpty(classify)) wrapper.like("article_classify", classify);

        if (!StringUtils.isEmpty(status)) wrapper.eq("status", status);

        if (!StringUtils.isEmpty(gmtCreate)) wrapper.ge("gmt_create", gmtCreate);

        if (!StringUtils.isEmpty(gmtModified)) wrapper.le("gmt_modified", gmtModified);

        eduArticleService.page(page, wrapper);
        long total = page.getTotal();
        List<EduArticle> records = page.getRecords();
        return Result.ok()
                .data("rows", records)
                .data("total", total);
    }

    @ApiOperation(value = "心理美文信息修改")
    @PostMapping("/updateArticle")
    public Result updateArticle(@RequestBody(required = true) EduArticle eduArticle) throws InterruptedException {
        //获取读写锁
        RReadWriteLock readWriteLock = redisson.getReadWriteLock(RedisKeyPrefixConstant.LOCK_ARTICLE_FRONT_UPDATE_CACHE_PREFIX + eduArticle.getId());
        RLock rLock = readWriteLock.writeLock();
        rLock.lock();   //加写锁
        boolean flag;
        try {
            UpdateWrapper<EduArticle> wrapper = new UpdateWrapper<>();
            wrapper.set("one_tag", eduArticle.getOneTag());
            wrapper.set("two_tag", eduArticle.getTwoTag());
            wrapper.set("three_tag", eduArticle.getThreeTag());
            flag = eduArticleService.updateById(eduArticle);
            //删除缓存，等待预热
            if(flag) RedisUtils.del(RedisKeyPrefixConstant.ARTICLE_FRONT_CACHE + eduArticle.getId());
            else return Result.error();
        } finally {
            rLock.unlock();  //释放锁
        }
        return Result.ok();
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

        QueryWrapper<EduArticle> wrapper = new QueryWrapper<>();
        String title = articleQuery.getTitle();
        String classify = articleQuery.getArticleClassify();
        String gmtCreate = articleQuery.getGmtCreate();
        String gmtModified = articleQuery.getGmtModified();

        wrapper.eq("status", "Draft");

        if (!StringUtils.isEmpty(title)) wrapper.like("title", title);

        if (!StringUtils.isEmpty(classify)) wrapper.like("article_classify", classify);

        if (!StringUtils.isEmpty(gmtCreate)) wrapper.ge("gmt_create", gmtCreate);

        if (!StringUtils.isEmpty(gmtModified)) wrapper.le("gmt_modified", gmtModified);

        eduArticleService.page(page, wrapper);
        long total = page.getTotal();
        List<EduArticle> records = page.getRecords();
        return Result.ok()
                .data("rows", records)
                .data("total", total);
    }

}

