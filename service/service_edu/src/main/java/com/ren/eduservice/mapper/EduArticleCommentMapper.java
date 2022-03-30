package com.ren.eduservice.mapper;

import com.ren.eduservice.entity.EduArticleComment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ren.eduservice.entity.vo.ArticleCommentVo;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2021-08-16
 */
public interface EduArticleCommentMapper extends BaseMapper<EduArticleComment> {

    List<ArticleCommentVo> getArticleComment(String scaleId);
}
