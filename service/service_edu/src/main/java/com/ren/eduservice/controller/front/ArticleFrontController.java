package com.ren.eduservice.controller.front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.ArticleCommentPraise;
import com.ren.eduservice.entity.EduArticle;
import com.ren.eduservice.entity.EduArticleComment;
import com.ren.eduservice.entity.vo.ArticleCommentVo;
import com.ren.eduservice.entity.vo.ArticleQuery;
import com.ren.eduservice.entity.vo.ScaleQuery;
import com.ren.eduservice.service.ArticleCommentPraiseService;
import com.ren.eduservice.service.EduArticleCommentService;
import com.ren.eduservice.service.EduArticleService;
import com.ren.servicebase.exceptionhandler.ReclException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;


/**
 * @Description: TODO
 * @ClassName: ArticleFrontController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/19 13:46
 * @Vertion: 2019.1
 */

@Api(tags = "前台美文接口")
@RestController
@RequestMapping("/eduservice/article-front")
public class ArticleFrontController {

    @Autowired
    private EduArticleService eduArticleService;

    @Autowired
    EduArticleCommentService eduArticleCommentService;

    @Autowired
    ArticleCommentPraiseService articleCommentPraiseService;

    @ApiOperation(value = "前台美文内容查询")
    @GetMapping("/getArticleInfo/{id}")
    public Result getArticleInfo(@PathVariable String id) {

        Result result = eduArticleService.getFrontArticleInfo(id);

        return result;
    }

    @ApiOperation(value = "前台美文评论拉取")
    @Cacheable(key = "'getArticleComment'", value = "articleComment")
    @GetMapping("/getArticleComment/{id}")
    public Result getArticleComment(@PathVariable String id) {

        List<ArticleCommentVo> articleComment = eduArticleCommentService.getArticleComment(id);
        return Result.ok()
                .data("articleComment", articleComment);
    }

    @ApiOperation(value = "前台美文评论添加")
    @PostMapping("/addArticleComment")
    public Result addArticleComment(@RequestBody EduArticleComment eduArticleComment) {

        boolean flag = false;
        try {
            flag = eduArticleCommentService.save(eduArticleComment);
        } catch (Exception e) {
            throw new ReclException(20001, "请输入评论内容");
        }
        if (flag) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "前台美文评论点赞")
    @PostMapping("/addOrCancelCommentPraise")
    public Result addCommentPraise(@RequestBody ArticleCommentPraise articleCommentPraise) {

        if (articleCommentPraiseService.isPraiseStatus(articleCommentPraise)) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "前台美文列表分页查询")
    @PostMapping("/pageArticleFactor/{current}/{limit}")
    public Result pageArticleFactor(@PathVariable long current, @PathVariable long limit,
                              @RequestBody(required = false) ArticleQuery articleQuery) {

        return eduArticleService.getPageArticleFactor(current, limit, articleQuery);
    }

    @ApiOperation(value = "首页美文列表分页查询")
    @PostMapping("/indexPageArticleFactor/{current}/{limit}")
    public Result indexPageArticleFactor(@PathVariable long current, @PathVariable long limit,
                                    @RequestBody(required = false) ArticleQuery articleQuery) {

        Page<EduArticle> page = new Page<>(current, limit);
        QueryWrapper<EduArticle> wrapper = new QueryWrapper<>();
        String classify = articleQuery.getArticleClassify();
        if(classify == null) {

            wrapper.orderByDesc("view_count");

        } else if (classify.equals("最新热文")) {

            wrapper.orderByDesc("gmt_create");
            wrapper.orderByDesc("view_count");
        } else {

            wrapper.eq("article_classify", classify);
        }
        eduArticleService.page(page, wrapper);
        List<EduArticle> articleList = page.getRecords();
        long total = page.getTotal();
        return Result.ok()
                .data("total", total)
                .data("articleList", articleList);
    }

}

