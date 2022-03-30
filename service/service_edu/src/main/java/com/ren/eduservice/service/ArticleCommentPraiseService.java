package com.ren.eduservice.service;

import com.ren.eduservice.entity.ArticleCommentPraise;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author rzy
 * @since 2021-10-23
 */
public interface ArticleCommentPraiseService extends IService<ArticleCommentPraise> {

    boolean isPraiseStatus(ArticleCommentPraise articleCommentPraise);
}
