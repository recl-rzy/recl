package com.ren.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.eduservice.entity.EduScaleComment;
import com.ren.eduservice.entity.vo.ScaleCommentVo;
import com.ren.eduservice.entity.vo.UserInfoVo;
import com.ren.eduservice.mapper.EduScaleCommentMapper;
import com.ren.eduservice.service.AclUserService;
import com.ren.eduservice.service.EduScaleCommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
 * @since 2021-09-30
 */
@Service
public class EduScaleCommentServiceImpl extends ServiceImpl<EduScaleCommentMapper, EduScaleComment> implements EduScaleCommentService {

    @Autowired
    AclUserService aclUserService;


    @Override
    public List<ScaleCommentVo> getScaleComment(String id) {

        List<EduScaleComment> commentList = this.baseMapper.selectList(new QueryWrapper<EduScaleComment>().eq("scale_id", id).orderByDesc("gmt_create"));

        List<String> userIds = commentList.stream().map(EduScaleComment::getUserId).collect(Collectors.toList());
        List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);

        ArrayList<ScaleCommentVo> commentVos = new ArrayList<>();

        for (EduScaleComment comment : commentList) {

            for (UserInfoVo userInfoVo : userInfoVos) {

                if(comment.getUserId().equals(userInfoVo.getId())) {

                    ScaleCommentVo scaleCommentVo = new ScaleCommentVo();
                    BeanUtils.copyProperties(comment, scaleCommentVo);
                    scaleCommentVo.setAvatar(userInfoVo.getAvatar());
                    scaleCommentVo.setNickName(userInfoVo.getNickName());
                    scaleCommentVo.setUserId(userInfoVo.getId());
                    commentVos.add(scaleCommentVo);
                }
            }
        }

        return commentVos;
    }
}
