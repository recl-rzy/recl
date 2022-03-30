package com.ren.eduservice.service;

import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduArticle;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.eduservice.entity.vo.ArticleCommentVo;
import com.ren.eduservice.entity.vo.ArticleQuery;
import com.ren.eduservice.entity.vo.ArticleVo;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author testjava
 * @since 2021-08-16
 */
public interface EduArticleService extends IService<EduArticle> {

    Result getFrontArticleInfo(String id);

    Result getPageArticleFactor(long current, long limit, ArticleQuery articleQuery);

    List<ArticleVo> getCollectArticle(String userId);

    List<ArticleVo> getOwnArticle(String userId);
}
