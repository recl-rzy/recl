package com.ren.staservice.client;

import io.swagger.annotations.ApiOperation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;

@Component
@FeignClient(name = "service-edu")
public interface EduClient {

    @ApiOperation(value = "每日音频收藏量更新")
    @PostMapping("/eduservice/music-front/saveDailyMusicCollectCount")
    boolean saveDailyMusicCollectCount();

    @ApiOperation(value = "每日音频评论量更新")
    @PostMapping("/eduservice/music-front/saveDailyMusicCommCount")
    boolean saveDailyMusicCommCount();
}
