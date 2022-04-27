package com.ren.servicebase.constant;

/**
 * @Description: TODO
 * @ClassName: CacheConstant
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/4/9 13:15
 * @Vertion: v1.0
 */

public class RedisKeyPrefixConstant {

    //缓存穿透的空key标识
    public static final String EMPTY_CACHE = "\"{}\"";

    //前台文章热点缓存重建
    public static final String LOCK_ARTICLE_FRONT_HOT_CACHE_CREATE_PREFIX = "lock:articleFront:hot_cache_create:";

    //前台文章分布式读写锁
    public static final String LOCK_ARTICLE_FRONT_UPDATE_CACHE_PREFIX = "lock:articleFront:update_cache:";

    public static final String Order = "order:";

    public static final String ARTICLE_FRONT_CACHE = "articleFront:";

    public static final String ARTICLE_FRONT_PAGE_CACHE = "articleFrontPage:";

    public static final String ARTICLE_FRONT_PAGE_TOTAL_CACHE = "articleFrontPageTotal:";

    public static final String ARTICLE_BACK_CACHE = "articleBack:";

    public static final String ARTICLE_BACK_PAGE_CACHE = "articleBackPage:";

    public static final String ARTICLE_BACK_PAGE_TOTAL_CACHE = "articleBackPageTotal:";

    public static final String ACL_USER_CACHE = "aclUser:";

    public static final String ACL_USERS_CACHE = "aclUsers:";

    public static final String RAND_MUSIC_FRONT_CACHE = "randMusicFront:";
}
