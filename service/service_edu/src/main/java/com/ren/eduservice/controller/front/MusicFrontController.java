package com.ren.eduservice.controller.front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.DateUtils;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduMusic;
import com.ren.eduservice.entity.EduMusicCollect;
import com.ren.eduservice.entity.EduMusicComment;
import com.ren.eduservice.entity.EduMusicCover;
import com.ren.eduservice.entity.vo.MusicQuery;
import com.ren.eduservice.entity.vo.MusicVo;
import com.ren.eduservice.service.EduMusicCollectService;
import com.ren.eduservice.service.EduMusicCommentService;
import com.ren.eduservice.service.EduMusicCoverService;
import com.ren.eduservice.service.EduMusicService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Description: TODO
 * @ClassName: MusicFrontController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/3 17:55
 * @Vertion: 2019.1
 */

@Api(tags = "前台FM接口")
@RestController
@RequestMapping("/eduservice/music-front")
public class MusicFrontController {

    @Autowired
    EduMusicService eduMusicService;

    @Autowired
    EduMusicCoverService eduMusicCoverService;

    @Autowired
    EduMusicCollectService eduMusicCollectService;

    @Autowired
    EduMusicCommentService eduMusicCommentService;

    @ApiOperation(value = "单音频拉取")
    @GetMapping("/music/{musicId}/{userId}")
    public Result music(@PathVariable String musicId,
                        @PathVariable(required = false) String userId) {

        int count = eduMusicCoverService.count(null);
        int randomCount = (int)(Math.random() * count);
        QueryWrapper<EduMusicCover> wrapper = new QueryWrapper<>();
        wrapper.last("limit " + String.valueOf(randomCount) + ", 1");
        EduMusicCover cover = eduMusicCoverService.getOne(wrapper);


        List<MusicVo> musicList = eduMusicService.getRandMusicVoList(musicId, userId);
        return Result.ok()
                .data("musicList", musicList)
                .data("cover", cover);
    }

    @ApiOperation(value = "随机音频拉取")
    @GetMapping("/navMusic/{userId}")
    public Result navMusic (@PathVariable(required = false) String userId) {

        int count = eduMusicCoverService.count(null);
        int randomCount = (int)(Math.random() * count);
        QueryWrapper<EduMusicCover> wrapper = new QueryWrapper<>();
        wrapper.last("limit " + String.valueOf(randomCount) + ", 1");
        EduMusicCover cover = eduMusicCoverService.getOne(wrapper);


        List<MusicVo> musicList = eduMusicService.getNavMusicVoList(userId);
        return Result.ok()
                .data("musicList", musicList)
                .data("cover", cover);
    }

    @ApiOperation(value = "音频前台分页查询")
    @PostMapping("/pageMusicFactor/{current}/{limit}")
    public Result pageMusicFactor(@PathVariable long current, @PathVariable long limit,
                                  @RequestBody(required = false) MusicQuery musicQuery) {

        return eduMusicService.getPageMusicFactor(current, limit, musicQuery);
    }

    @ApiOperation(value = "音频筛选查询")
    @PostMapping("/musicSift/{limit}")
    public Result musicSift(@PathVariable long limit,
                            @RequestBody(required = false) MusicQuery musicQuery) {

        return eduMusicService.getMusicSift(limit, musicQuery);
    }

    @ApiOperation(value = "音频收藏")
    @PostMapping("/addMusicCollect/{musicId}/{userId}")
    public Result addMusicCollect(@PathVariable String musicId, @PathVariable String userId) {

        EduMusicCollect musicCollect = new EduMusicCollect();
        musicCollect.setMusicId(musicId);
        musicCollect.setUserId(userId);
        boolean save = eduMusicCollectService.save(musicCollect);
        if(save) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "音频收藏")
    @DeleteMapping("/{musicId}/{userId}")
    public Result delMusicCollect(@PathVariable String musicId, @PathVariable String userId) {

        boolean remove = eduMusicCollectService.remove(new QueryWrapper<EduMusicCollect>().eq("user_id", userId)
                .eq("music_id", musicId));
        if(remove) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "音频评论")
    @PostMapping("/addMusicComment")
    public Result addMusicComment(@RequestBody EduMusicComment eduMusicComment) {

        boolean save = eduMusicCommentService.save(eduMusicComment);
        if(save) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "音频评论拉取")
    @GetMapping("/getMusicComment/{id}")
    public Result getMusicComment(@PathVariable String id) {

        return eduMusicCommentService.getMusicCommentById(id);
    }

    @ApiOperation(value = "每日音频收藏量更新")
    @PostMapping("/saveDailyMusicCollectCount")
    public boolean saveDailyMusicCollectCount() {

        // 获取前一天日期
        String currentDate = DateUtils.formatDate(DateUtils.addDays(new Date(), -1));

        List<EduMusic> musicList = eduMusicService.getMusicDailyCollectCount(currentDate);
        return eduMusicService.updateBatchById(musicList);
    }

    @ApiOperation(value = "每日音频评论量更新")
    @PostMapping("/saveDailyMusicCommCount")
    public boolean saveDailyMusicCommCount() {

        // 获取前一天日期
        String currentDate = DateUtils.formatDate(DateUtils.addDays(new Date(), -1));

        List<EduMusic> musicList = eduMusicService.getMusicDailyCommCount(currentDate);
        return eduMusicService.updateBatchById(musicList);
    }
}

