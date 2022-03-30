package com.ren.eduservice.mapper;

import com.ren.eduservice.entity.EduMusic;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ren.eduservice.entity.vo.MusicVo;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2021-10-02
 */
public interface EduMusicMapper extends BaseMapper<EduMusic> {

    List<MusicVo> getMusicVo();

    MusicVo getMusicVoById(String id);

    List<EduMusic> getRandMusicList(String id);

    List<EduMusic> getNavMusicList();

    List<EduMusic> getDailyMusicCollectCount(String currentDate);

    List<EduMusic> getDailyMusicCommCount(String currentDate);
}
