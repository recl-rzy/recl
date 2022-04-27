package com.ren.eduservice.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.RedisUtils;
import com.ren.commonutils.Result;

import com.ren.eduservice.client.UcenterClient;
import com.ren.eduservice.entity.AclUser;
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
import com.ren.servicebase.constant.RedisKeyPrefixConstant;
import com.ren.servicebase.exceptionhandler.ReclException;
import org.apache.commons.lang3.math.NumberUtils;
import org.redisson.Redisson;
import org.redisson.RedissonLock;
import org.redisson.api.RLock;
import org.redisson.api.RReadWriteLock;
import org.redisson.api.RedissonClient;
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
    Redisson redisson;

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

        EduArticle article = null;
        //生成Redis中的key
        String articleFrontKey = RedisKeyPrefixConstant.ARTICLE_FRONT_CACHE + id;
        //从缓存获取文章信息
        String articleStr = RedisUtils.getStr(articleFrontKey);
        //分布式锁redisson,防止缓存击穿
        RLock lock = redisson.getLock(RedisKeyPrefixConstant.LOCK_ARTICLE_FRONT_HOT_CACHE_CREATE_PREFIX + id);
        //加锁操作
        lock.lock();
        try {
            RReadWriteLock readWriteLock = redisson.getReadWriteLock(RedisKeyPrefixConstant.LOCK_ARTICLE_FRONT_UPDATE_CACHE_PREFIX + id);
            RLock rLock = readWriteLock.readLock();
            rLock.lock();            //对该操作加读锁
            try {
                //缓存中不存在查询数据库并放入缓存
                if(articleStr == null) {
                    //查询数据库
                    article = this.baseMapper.selectById(id);
                    //判断数据库中是否存在，存在则放入缓存，不存在缓存空key
                    if(article == null) {
                        //缓存中记录不存在的Key，直接返回error
                        RedisUtils.set(articleFrontKey, RedisKeyPrefixConstant.EMPTY_CACHE, RedisUtils.setCacheTimeout(7200));
                        return Result.error()
                                .message("该文章不存在")
                                .data("article", new ArticleVo())
                                .data("articleUser", new AclUser())
                                .data("articleComment", new ArrayList<ArticleCommentVo>());
                    }
                    RedisUtils.set(articleFrontKey, article, RedisUtils.setCacheTimeout(7200));
                } else {
                    //解决缓存穿透,若为空value,直接返回error
                    if(RedisKeyPrefixConstant.EMPTY_CACHE.equals(articleStr)) {
                        return Result.error()
                                .message("该文章不存在")
                                .data("article", new ArticleVo())
                                .data("articleUser", new AclUser())
                                .data("articleComment", new ArrayList<ArticleCommentVo>());
                    }
                    article = JSON.parseObject(articleStr, EduArticle.class);
                    //热点缓存续期
                    RedisUtils.expire(articleFrontKey, RedisUtils.setCacheTimeout(7200));
                }
            } finally {
                rLock.unlock();   //释放读锁
            }
        } finally {
            //保证锁释放
            lock.unlock();
        }

        QueryWrapper<EduArticleComment> wrapper = new QueryWrapper<>();
        wrapper.eq("article_id", id);
        int commentCount = eduArticleCommentService.count(wrapper);

        ArticleVo articleFrontVo = new ArticleVo();
        assert article != null;
        BeanUtils.copyProperties(article, articleFrontVo);
        articleFrontVo.setCommentCount((long) commentCount);

        List<ArticleCommentVo> articleComment = eduArticleCommentService.getArticleComment(id);

        UserInfoVo articleUser = aclUserService.getAclUserById(article.getUserId());
        return Result.ok()
                .data("article", articleFrontVo)
                .data("articleUser", articleUser)
                .data("articleComment", articleComment);
    }

    @Override
    public Result getPageArticleFactor(long current, long limit, ArticleQuery articleQuery) {

        String classify = articleQuery.getArticleClassify();
        //分页封装数据
        List<ArticlePageVo> articlePageVoList;
        //分页总数
        long total;
        //获取分页数据缓存key
        String articlePageKey = RedisKeyPrefixConstant.ARTICLE_FRONT_PAGE_CACHE + current + ":" + limit + ":" + classify;
        //获取分页总数key
        String articlePageTotalKey = RedisKeyPrefixConstant.ARTICLE_FRONT_PAGE_TOTAL_CACHE + +current + ":" + limit + ":" + classify;
        //Redis中获取分页数据
        String articlePageStr = RedisUtils.getStr(articlePageKey);

        if(articlePageStr == null) {
            Page<EduArticle> articlePage = new Page<>(current, limit);
            QueryWrapper<EduArticle> wrapper = new QueryWrapper<>();


            if(classify == null || classify.equals("全部"))  wrapper.orderByDesc("gmt_create");
            else if (classify.equals("最新热文")) {

                wrapper.orderByDesc("gmt_create");
                wrapper.orderByDesc("view_count");
            }
            else wrapper.eq("article_classify", classify);

            wrapper.eq("status", "Normal");

            this.baseMapper.selectPage(articlePage, wrapper);

            List<EduArticle> articleList = articlePage.getRecords();
            List<String> userIds = articleList.stream().map(EduArticle::getUserId).collect(Collectors.toList());


            List<UserInfoVo> articleUsers = aclUserService.getAclUsers(userIds);

            articlePageVoList = new ArrayList<>();
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

            total = articlePage.getTotal();
            //放入Redis
            if(!articlePageVoList.isEmpty()) {
                RedisUtils.set(articlePageKey, articlePageVoList, RedisUtils.setCacheTimeout(3600));
                RedisUtils.set(articlePageTotalKey, total, RedisUtils.setCacheTimeout(3600));
            }
        } else {
            articlePageVoList = JSON.parseArray(articlePageStr, ArticlePageVo.class);
            //Redis中获取总页数
            total = NumberUtils.toLong(RedisUtils.getStr(articlePageTotalKey), 1);
        }

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
