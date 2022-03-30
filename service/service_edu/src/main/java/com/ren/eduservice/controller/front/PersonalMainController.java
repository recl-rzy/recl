package com.ren.eduservice.controller.front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.Result;
import com.ren.eduservice.client.UcenterClient;
import com.ren.eduservice.entity.EduArticle;
import com.ren.eduservice.entity.vo.ArticleVo;
import com.ren.eduservice.entity.vo.MusicVo;
import com.ren.eduservice.entity.vo.ScaleVo;
import com.ren.eduservice.service.EduArticleService;
import com.ren.eduservice.service.EduMusicService;
import com.ren.eduservice.service.EduScaleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: PersonalMainController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/28 20:42
 * @Vertion: 2019.1
 */

@Api(tags = "前台个人主页接口")
@RestController
@RequestMapping("/eduservice/main-front")
public class PersonalMainController {

    @Autowired
    EduArticleService eduArticleService;

    @Autowired
    EduMusicService eduMusicService;

    @Autowired
    EduScaleService eduScaleService;

    @Autowired
    UcenterClient ucenterClient;

    @ApiOperation(value = "文章收藏拉取")
    @GetMapping("/getCollectArticle/{id}")
    public Result getCollectArticle(@PathVariable String id) {

        List<ArticleVo> list = eduArticleService.getCollectArticle(id);
        return Result.ok()
                .data("list", list);
    }

    @ApiOperation(value = "量表收藏拉取")
    @GetMapping("/getCollectScale/{id}")
    public Result getCollectScale(@PathVariable String id) {

        List<ScaleVo> list = eduScaleService.getCollectScale(id);
        return Result.ok()
                .data("list", list);
    }

    @ApiOperation(value = "FM收藏拉取")
    @GetMapping("/getCollectMusic/{id}")
    public Result getCollectMusic(@PathVariable String id) {

        List<MusicVo> list = eduMusicService.getCollectMusic(id);
        return Result.ok()
                .data("list", list);
    }

    @ApiOperation(value = "个人发布文章拉取")
    @GetMapping("/getOwnArticle/{id}")
    public Result getOwnArticle(@PathVariable String id) {

        List<ArticleVo> list = eduArticleService.getOwnArticle(id);
        return Result.ok()
                .data("list", list);
    }

    @ApiOperation(value = "个人发布文章拉取")
    @GetMapping("/getOwnMusic/{id}")
    public Result getOwnMusic(@PathVariable String id) {

        List<MusicVo> list = eduMusicService.getOwnMusic(id);
        return Result.ok()
                .data("list", list);
    }

    @ApiOperation(value = "个人数据拉取")
    @GetMapping("/getPersonalData/{id}")
    public Result getPersonalData(@PathVariable String id) {

        int articleCount = eduArticleService.count(new QueryWrapper<EduArticle>().eq("user_id", id));
        int praiseCount = ucenterClient.getPraiseCount(id);
        return Result.ok()
                .data("praiseCount", praiseCount)
                .data("articleCount", articleCount);
    }
}

