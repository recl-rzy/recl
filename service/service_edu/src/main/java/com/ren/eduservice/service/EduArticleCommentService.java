package com.ren.eduservice.service;

import com.ren.eduservice.entity.EduArticleComment;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.eduservice.entity.vo.ArticleCommentVo;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author testjava
 * @since 2021-08-16
 */
public interface EduArticleCommentService extends IService<EduArticleComment> {

    List<ArticleCommentVo> getArticleComment(String articleId);
}
