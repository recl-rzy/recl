package com.ren.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.eduservice.entity.ArticleCommentPraise;
import com.ren.eduservice.mapper.ArticleCommentPraiseMapper;
import com.ren.eduservice.service.ArticleCommentPraiseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author rzy
 * @since 2021-10-23
 */
@Service
public class ArticleCommentPraiseServiceImpl extends ServiceImpl<ArticleCommentPraiseMapper, ArticleCommentPraise> implements ArticleCommentPraiseService {

    @Override
    public boolean isPraiseStatus(ArticleCommentPraise articleCommentPraise) {

        QueryWrapper<ArticleCommentPraise> wrapper = new QueryWrapper<>();
        wrapper.eq("praise_user_id", articleCommentPraise.getPraiseUserId());
        wrapper.eq("comment_id", articleCommentPraise.getCommentId());
        ArticleCommentPraise commentPraise = this.baseMapper.selectOne(wrapper);
        if (commentPraise == null) {

            int insert = this.baseMapper.insert(articleCommentPraise);
            if (insert > 0) {
                return true;
            } else {
                return false;
            }
        } else {

            articleCommentPraise.setCommentStatus(!commentPraise.getCommentStatus());
            int update = this.baseMapper.update(articleCommentPraise, wrapper);
            System.out.println(update);
            if (update > 0) {
                return true;
            } else {
                return false;
            }
        }
    }
}
