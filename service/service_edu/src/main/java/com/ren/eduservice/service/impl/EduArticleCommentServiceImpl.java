package com.ren.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.eduservice.entity.EduArticleComment;
import com.ren.eduservice.entity.vo.ArticleCommentVo;
import com.ren.eduservice.entity.vo.UserInfoVo;
import com.ren.eduservice.mapper.EduArticleCommentMapper;
import com.ren.eduservice.service.AclUserService;
import com.ren.eduservice.service.EduArticleCommentService;
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
 * @author rzy
 * @since 2021-08-16
 */
@Service
public class EduArticleCommentServiceImpl extends ServiceImpl<EduArticleCommentMapper, EduArticleComment> implements EduArticleCommentService {


    @Autowired
    AclUserService aclUserService;

    @Override
    public List<ArticleCommentVo> getArticleComment(String articleId) {

        List<EduArticleComment> commentList = this.baseMapper.selectList(new QueryWrapper<EduArticleComment>().eq("article_id", articleId).orderByDesc("gmt_create"));
        List<String> userIds = commentList.stream().map(EduArticleComment::getUserId).collect(Collectors.toList());
        List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);
        ArrayList<ArticleCommentVo> commentVos = new ArrayList<>();
        for (EduArticleComment comment : commentList) {

            for (UserInfoVo userInfoVo : userInfoVos) {

                if(comment.getUserId().equals(userInfoVo.getId())) {

                    ArticleCommentVo commentVo = new ArticleCommentVo();
                    BeanUtils.copyProperties(comment, commentVo);
                    commentVo.setAvatar(userInfoVo.getAvatar());
                    commentVo.setNickName(userInfoVo.getNickName());
                    commentVo.setUserId(userInfoVo.getId());
                    commentVos.add(commentVo);
                }
            }
        }

        return commentVos;
    }
}
