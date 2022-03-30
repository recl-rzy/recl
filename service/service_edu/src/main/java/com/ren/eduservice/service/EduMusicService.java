package com.ren.eduservice.service;

import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduMusic;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.eduservice.entity.vo.MusicQuery;
import com.ren.eduservice.entity.vo.MusicVo;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author testjava
 * @since 2021-10-02
 */
public interface EduMusicService extends IService<EduMusic> {

    List<MusicVo> getMusicVo();

    List<MusicVo> getNavMusicVoList(String userId);

    MusicVo getMusicVoById(String id);

    Result getPageMusicFactor(long current, long limit, MusicQuery musicQuery);

    Result getMusicSift(long limit, MusicQuery musicQuery);

    List<MusicVo> getRandMusicVoList(String musicId, String userId);

    List<EduMusic> getMusicDailyCollectCount(String currentDate);

    List<EduMusic> getMusicDailyCommCount(String currentDate);

    List<MusicVo> getCollectMusic(String userId);

    List<MusicVo> getOwnMusic(String userId);
}
