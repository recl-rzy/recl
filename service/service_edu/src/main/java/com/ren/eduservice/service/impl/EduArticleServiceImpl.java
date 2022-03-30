package com.ren.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;

import com.ren.eduservice.client.UcenterClient;
import com.ren.eduservice.entity.EduArticle;
import com.ren.eduservice.entity.EduArticleCollect;
import com.ren.eduservice.entity.EduArticleComment;
import com.ren.eduservice.entity.vo.*;
import com.ren.eduservice.mapper.EduArticleMapper;
import com.ren.eduservice.service.AclUserService;
import com.ren.eduservice.service.EduArticleCollectService;
import com.ren.eduservice.service.EduArticleCommentService;
import com.ren.eduservice.service.EduArticleService;
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
 * @author testjava
 * @since 2021-08-16
 */
@Service
public class EduArticleServiceImpl extends ServiceImpl<EduArticleMapper, EduArticle> implements EduArticleService {

    @Autowired
    UcenterClient ucenterClient;

    @Autowired
    AclUserService aclUserService;

    @Autowired
    EduArticleCommentService eduArticleCommentService;

    @Autowired
    EduArticleCollectService eduArticleCollectService;

    @Override
    public Result getFrontArticleInfo(String id) {

        EduArticle eduArticle = this.baseMapper.selectById(id);

        QueryWrapper<EduArticleComment> wrapper = new QueryWrapper<>();
        wrapper.eq("article_id", id);
        int commentCount = eduArticleCommentService.count(wrapper);

        ArticleVo articleFrontVo = new ArticleVo();
        BeanUtils.copyProperties(eduArticle, articleFrontVo);
        articleFrontVo.setCommentCount((long) commentCount);

        List<ArticleCommentVo> articleComment = eduArticleCommentService.getArticleComment(id);

        UserInfoVo articleUser = aclUserService.getAclUserById(eduArticle.getUserId());
        return Result.ok()
                .data("article", articleFrontVo)
                .data("articleUser", articleUser)
                .data("articleComment", articleComment);
    }

    @Override
    public Result getPageArticleFactor(long current, long limit, ArticleQuery articleQuery) {

        Page<EduArticle> articlePage = new Page<>(current, limit);
        QueryWrapper<EduArticle> wrapper = new QueryWrapper<>();
        String classify = articleQuery.getArticleClassify();

        if(classify == null || classify.equals("全部")) {

            wrapper.orderByDesc("gmt_create");
        } else if (classify.equals("最新热文")) {

            wrapper.orderByDesc("gmt_create");
            wrapper.orderByDesc("view_count");
        } else {

            wrapper.eq("article_classify", classify);
        }


        this.baseMapper.selectPage(articlePage, wrapper);

        List<EduArticle> articleList = articlePage.getRecords();
        List<String> userIds = articleList.stream().map(EduArticle::getUserId).collect(Collectors.toList());


        List<UserInfoVo> articleUsers = aclUserService.getAclUsers(userIds);

        List<ArticlePageVo> articlePageVoList = new ArrayList<>();
        for (EduArticle article : articleList) {

            try {
                for (UserInfoVo userInfoVo : articleUsers) {

                    if(userInfoVo.getId().equals(article.getUserId())) {

                        ArticlePageVo articlePageVo = new ArticlePageVo();
                        BeanUtils.copyProperties(article, articlePageVo);
                        articlePageVo.setUserId(userInfoVo.getId());
                        articlePageVo.setNickName(userInfoVo.getNickName());
                        articlePageVoList.add(articlePageVo);
                        break;
                    }
                }
            } catch (NullPointerException e) {
                throw new ReclException(20001, "文章获取失败");
            }
        }

        long total = articlePage.getTotal();
        return Result.ok()
                .data("articleList", articlePageVoList)
                .data("total",total);
    }

    @Override
    public List<ArticleVo> getCollectArticle(String userId) {

        List<EduArticleCollect> collects = eduArticleCollectService.list(new QueryWrapper<EduArticleCollect>().eq("user_id", userId)
                .orderByDesc("gmt_create"));
        if(collects.isEmpty()) return new ArrayList<>();
        else {

            List<String> articleIds = collects.stream().map(EduArticleCollect::getArticleId).collect(Collectors.toList());
            List<EduArticle> articles = this.baseMapper.selectList(new QueryWrapper<EduArticle>().in("id", articleIds));
            List<String> userIds = articles.stream().map(EduArticle::getUserId).collect(Collectors.toList());
            List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);
            ArrayList<ArticleVo> articleList = new ArrayList<>();
            for (EduArticle article : articles) {

                for (UserInfoVo userInfoVo : userInfoVos) {

                    if(article.getUserId().equals(userInfoVo.getId())) {

                        ArticleVo articleVo = new ArticleVo();
                        BeanUtils.copyProperties(article, articleVo);
                        articleVo.setUserId(userInfoVo.getId());
                        articleVo.setAvatar(userInfoVo.getAvatar());
                        articleVo.setNickName(userInfoVo.getNickName());
                        articleList.add(articleVo);
                        break;
                    }
                }
            }

            return articleList;
        }
    }

    @Override
    public List<ArticleVo> getOwnArticle(String userId) {

        List<EduArticle> articles = this.baseMapper.selectList(new QueryWrapper<EduArticle>().eq("user_id", userId));

        if(articles.isEmpty()) return new ArrayList<>();
        else {

            List<String> userIds = articles.stream().map(EduArticle::getUserId).collect(Collectors.toList());
            List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);
            ArrayList<ArticleVo> articleList = new ArrayList<>();
            for (EduArticle article : articles) {

                for (UserInfoVo userInfoVo : userInfoVos) {

                    if(article.getUserId().equals(userInfoVo.getId())) {

                        ArticleVo articleVo = new ArticleVo();
                        BeanUtils.copyProperties(article, articleVo);
                        articleVo.setUserId(userInfoVo.getId());
                        articleVo.setAvatar(userInfoVo.getAvatar());
                        articleVo.setNickName(userInfoVo.getNickName());
                        articleList.add(articleVo);
                        break;
                    }
                }
            }
            return articleList;
        }
    }
}
