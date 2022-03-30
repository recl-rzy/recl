package com.ren.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;

import com.ren.eduservice.entity.EduMusic;
import com.ren.eduservice.entity.EduMusicCollect;
import com.ren.eduservice.entity.vo.MusicQuery;
import com.ren.eduservice.entity.vo.MusicVo;
import com.ren.eduservice.entity.vo.UserInfoVo;
import com.ren.eduservice.mapper.EduMusicMapper;
import com.ren.eduservice.service.AclUserService;
import com.ren.eduservice.service.EduMusicCollectService;
import com.ren.eduservice.service.EduMusicService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ren.servicebase.exceptionhandler.ReclException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author RZY
 * @since 2021-10-02
 */
@Service
public class EduMusicServiceImpl extends ServiceImpl<EduMusicMapper, EduMusic> implements EduMusicService {

    @Autowired
    private AclUserService aclUserService;

    @Autowired
    private EduMusicCollectService eduMusicCollectService;


    @Override
    public MusicVo getMusicVoById(String id) {

        return this.baseMapper.getMusicVoById(id);
    }

    @Override
    public Result getPageMusicFactor(long current, long limit, MusicQuery musicQuery) {

        Page<EduMusic> musicPage = new Page<>(current, limit);
        QueryWrapper<EduMusic> wrapper = new QueryWrapper<>();
        String mood = musicQuery.getMusicMood();
        String status = musicQuery.getStatus();
        String title = musicQuery.getTitle();

        if(!StringUtils.isEmpty(mood)) wrapper.eq("music_mood", mood);

        if(!StringUtils.isEmpty(status)) wrapper.eq("status", status);

        else wrapper.eq("status", "Normal");


        if(!StringUtils.isEmpty(title)) wrapper.eq("title", title);


        wrapper.orderByDesc("gmt_create");

        this.baseMapper.selectPage(musicPage, wrapper);

        List<EduMusic> musics = musicPage.getRecords();
        long musicPages = musicPage.getPages();

        List<String> userIds = musics.stream().map(EduMusic::getUserId).collect(Collectors.toList());
        List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);
        ArrayList<MusicVo> musicList = new ArrayList<>();

        for (EduMusic music : musics) {

            try {
                for (UserInfoVo userInfoVo : userInfoVos) {
                    if(userInfoVo.getId().equals(music.getUserId())) {

                        MusicVo musicVo = new MusicVo();
                        BeanUtils.copyProperties(music, musicVo);
                        BeanUtils.copyProperties(userInfoVo, musicVo);
                        musicVo.setUserId(userInfoVo.getId());
                        musicVo.setId(music.getId());
                        musicVo.setSign(music.getSign());
                        musicList.add(musicVo);
                        break;
                    }
                }
            } catch (NullPointerException e) {

                throw new ReclException(20001, "获取作者失败");
            }
        }

        return Result.ok()
                .data("musicList", musicList)
                .data("musicPages", musicPages);
    }

    @Override
    public List<MusicVo> getRandMusicVoList(String musicId, String userId) {

        EduMusic currentMusic = this.baseMapper.selectById(musicId);
        List<EduMusic> randMusicList = this.baseMapper.getRandMusicList(musicId);
        randMusicList.add(0, currentMusic);
        List<String> userIds = randMusicList.stream().map(EduMusic::getUserId).collect(Collectors.toList());
        List<String> musicIds;
        List<EduMusicCollect> collects = null;
        if(!StringUtils.isEmpty(userId)) {

            musicIds = randMusicList.stream().map(EduMusic::getId).collect(Collectors.toList());
            collects = eduMusicCollectService.list(new QueryWrapper<EduMusicCollect>()
                    .eq("user_id", userId)
                    .in("music_id", musicIds)
                    .select("music_id"));

        }
        List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);

        ArrayList<MusicVo> musicList = new ArrayList<>();

        for (EduMusic music : randMusicList) {

            try {
                for (UserInfoVo userInfoVo : userInfoVos) {
                    if(userInfoVo.getId().equals(music.getUserId())) {

                        MusicVo musicVo = new MusicVo();
                        BeanUtils.copyProperties(music, musicVo);
                        BeanUtils.copyProperties(userInfoVo, musicVo);
                        musicVo.setUserId(userInfoVo.getId());
                        musicVo.setId(music.getId());
                        musicVo.setSign(music.getSign());
                        if(!StringUtils.isEmpty(collects)) {

                            for (EduMusicCollect collect : collects) {

                                if(collect.getMusicId().equals(music.getId())) {

                                    musicVo.setIsCollect(true);
                                    break;
                                }
                            }
                        }
                        musicList.add(musicVo);
                        break;
                    }
                }
            } catch (NullPointerException e) {

                throw new ReclException(20001, "获取失败");
            }
        }

        return musicList;
    }

    @Override
    public List<EduMusic> getMusicDailyCollectCount(String currentDate) {

        return this.baseMapper.getDailyMusicCollectCount(currentDate);
    }

    @Override
    public List<EduMusic> getMusicDailyCommCount(String currentDate) {

        return this.baseMapper.getDailyMusicCommCount(currentDate);
    }

    @Override
    public Result getMusicSift(long limit, MusicQuery musicQuery) {

        QueryWrapper<EduMusic> wrapper = new QueryWrapper<>();
        String musicMood = musicQuery.getMusicMood();
        Boolean latest = musicQuery.getLatest();
        Boolean hot = musicQuery.getHot();

        if(!StringUtils.isEmpty(musicMood)) wrapper.like("music_mood", musicMood);

        if(!StringUtils.isEmpty(latest)) wrapper.orderByDesc("gmt_create");

        if(!StringUtils.isEmpty(hot)) wrapper.orderByDesc("collect_count");

        wrapper.last("limit " + limit);
        wrapper.select("id", "user_id", "collect_count", "gmt_create", "title", "cover");
        List<EduMusic> musics = this.baseMapper.selectList(wrapper);
        List<String> userIds = musics.stream().map(EduMusic::getUserId).collect(Collectors.toList());
        List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);
        ArrayList<MusicVo> musicList = new ArrayList<>();

        for (EduMusic music : musics) {

            try {
                for (UserInfoVo userInfoVo : userInfoVos) {
                    if(userInfoVo.getId().equals(music.getUserId())) {

                        MusicVo musicVo = new MusicVo();
                        BeanUtils.copyProperties(music, musicVo);
                        BeanUtils.copyProperties(userInfoVo, musicVo);
                        musicVo.setUserId(userInfoVo.getId());
                        musicVo.setId(music.getId());
                        musicList.add(musicVo);
                        break;
                    }
                }
            } catch (NullPointerException e) {

                throw new ReclException(20001, "获取失败");
            }
        }
        return Result.ok()
                .data("musicList", musicList);
    }

    @Override
    public List<MusicVo> getMusicVo() {

        return this.baseMapper.getMusicVo();
    }

    @Override
    public List<MusicVo> getNavMusicVoList(String userId) {

        List<EduMusic> navMusicList = this.baseMapper.getNavMusicList();
        List<String> userIds = navMusicList.stream().map(EduMusic::getUserId).collect(Collectors.toList());
        List<String> musicIds;
        List<EduMusicCollect> collects = null;
        if(!StringUtils.isEmpty(userId)) {

            musicIds = navMusicList.stream().map(EduMusic::getId).collect(Collectors.toList());
            collects = eduMusicCollectService.list(new QueryWrapper<EduMusicCollect>()
                    .eq("user_id", userId)
                    .in("music_id", musicIds)
                    .select("music_id"));

        }
        List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);

        ArrayList<MusicVo> musicList = new ArrayList<>();

        for (EduMusic music : navMusicList) {

            try {
                for (UserInfoVo userInfoVo : userInfoVos) {
                    if(userInfoVo.getId().equals(music.getUserId())) {

                        MusicVo musicVo = new MusicVo();
                        BeanUtils.copyProperties(music, musicVo);
                        BeanUtils.copyProperties(userInfoVo, musicVo);
                        musicVo.setUserId(userInfoVo.getId());
                        musicVo.setId(music.getId());
                        musicVo.setSign(music.getSign());
                        if(!StringUtils.isEmpty(collects)) {

                            for (EduMusicCollect collect : collects) {

                                if(collect.getMusicId().equals(music.getId())) {

                                    musicVo.setIsCollect(true);
                                    break;
                                }
                            }
                        }
                        musicList.add(musicVo);
                        break;
                    }
                }
            } catch (NullPointerException e) {

                throw new ReclException(20001, "获取失败");
            }
        }

        return musicList;
    }

    @Override
    public List<MusicVo> getCollectMusic(String userId) {

        List<EduMusicCollect> collects = eduMusicCollectService.list(new QueryWrapper<EduMusicCollect>().eq("user_id", userId)
                .orderByDesc("gmt_create"));

        if(collects.isEmpty()) return new ArrayList<>();

        else {

            List<String> musicIds = collects.stream().map(EduMusicCollect::getMusicId).collect(Collectors.toList());
            List<EduMusic> musics = this.baseMapper.selectList(new QueryWrapper<EduMusic>().in("id", musicIds));

            List<String> userIds = musics.stream().map(EduMusic::getUserId).collect(Collectors.toList());

            List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);

            List<MusicVo> musicList = new ArrayList<>();

            for (EduMusic music : musics) {

                for (UserInfoVo userInfoVo : userInfoVos) {

                    if (music.getUserId().equals(userInfoVo.getId())) {

                        MusicVo musicVo = new MusicVo();
                        BeanUtils.copyProperties(music, musicVo);
                        BeanUtils.copyProperties(userInfoVo, musicVo);
                        musicVo.setUserId(userInfoVo.getId());
                        musicVo.setId(music.getId());
                        musicList.add(musicVo);
                        break;
                    }
                }
            }
            return musicList;

        }
    }

    @Override
    public List<MusicVo> getOwnMusic(String userId) {

        List<EduMusic> musics = this.baseMapper.selectList(new QueryWrapper<EduMusic>().eq("user_id", userId));

        if(musics.isEmpty()) return new ArrayList<>();
        else {

            List<String> userIds = musics.stream().map(EduMusic::getUserId).collect(Collectors.toList());
            List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);
            ArrayList<MusicVo> musicList = new ArrayList<>();
            for (EduMusic music : musics) {

                for (UserInfoVo userInfoVo : userInfoVos) {

                    if(music.getUserId().equals(userInfoVo.getId())) {

                        MusicVo musicVo = new MusicVo();
                        BeanUtils.copyProperties(music, musicVo);
                        musicVo.setUserId(userInfoVo.getId());
                        musicVo.setAvatar(userInfoVo.getAvatar());
                        musicVo.setNickName(userInfoVo.getNickName());
                        musicList.add(musicVo);
                        break;
                    }
                }
            }
            return musicList;
        }
    }
}
