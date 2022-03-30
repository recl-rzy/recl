package com.ren.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduMusicComment;
import com.ren.eduservice.entity.vo.MusicCommentVo;
import com.ren.eduservice.entity.vo.UserInfoVo;
import com.ren.eduservice.mapper.EduMusicCommentMapper;
import com.ren.eduservice.service.AclUserService;
import com.ren.eduservice.service.EduMusicCommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2021-10-02
 */
@Service
public class EduMusicCommentServiceImpl extends ServiceImpl<EduMusicCommentMapper, EduMusicComment> implements EduMusicCommentService {

    @Autowired
    AclUserService aclUserService;

    @Override
    public Result getMusicCommentById(String id) {

        List<EduMusicComment> comments = this.baseMapper
                .selectList(new QueryWrapper<EduMusicComment>().eq("music_id", id).orderByDesc("gmt_create"));
        List<String> userIds = comments.stream().map(EduMusicComment::getUserId).collect(Collectors.toList());
        List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);

        ArrayList<MusicCommentVo> commentList = new ArrayList<>();
        for (EduMusicComment comment : comments) {

            for (UserInfoVo userInfoVo : userInfoVos) {

                if(comment.getUserId().equals(userInfoVo.getId())) {

                    MusicCommentVo musicCommentVo = new MusicCommentVo();
                    BeanUtils.copyProperties(comment, musicCommentVo);
                    musicCommentVo.setAvatar(userInfoVo.getAvatar());
                    musicCommentVo.setNickName(userInfoVo.getNickName());
                    commentList.add(musicCommentVo);
                }
            }
        }
        return Result.ok()
                .data("commentList", commentList);
    }
}
