

### 1. 项目背景：

recl为基于循环神经网络（LSTM）的心理健康平台，后端采用微服务进行开发，循环神经网络模型利用深度学习框架Pytorch训练，目前训练了15万组对话，
可模拟简单的咨询对话;recl仅为后端部分，循环神经网络模型为recl-seq2seq，recl-vue为前端部分



### 2.涉及技术：
SpringBoot + SpringCloud + MybatisPlus + JWT + RabbitMq + Redis + SpringSecurity + Redisson分布式锁
整个新项目采用微服务架构，包含了SpringCloud的多数组件，包括：Nacos、Sentinel、GateWay、openFeign等


项目结构图：


![输入图片说明](https://recl-edu.oss-cn-beijing.aliyuncs.com/recl/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202022-05-14%20112518.png)


###  common为通用模块：


 **common_utils包含通用的工具类:** 


1.MD5(MD5加密工具类)

2.JWTUtils（JWT工具类）

3.RedisUtils（Redis工具类）

4.Result（结果集封装）

将Result构造方法私有化，支持链式编程

```
@Data
public class Result {

    @ApiModelProperty(value = "结果成功状态")
    private Boolean success;

    @ApiModelProperty(value = "返回状态码")
    private Integer code;

    @ApiModelProperty(value = "返回信息")
    private String message;

    @ApiModelProperty(value = "返回数据")
    private Map<String, Object> data = new HashMap<String, Object>();

    //构造方法私有化
    private Result() {
    }

    public static Result ok() {

        Result result = new Result();
        result.setSuccess(true);
        result.setCode(ResultCode.SUCCESS);
        result.setMessage("成功");
        return result;
    }

    public static Result error() {

        Result result = new Result();
        result.setSuccess(false);
        result.setCode(ResultCode.ERROR);
        result.setMessage("失败");
        return result;
    }

    public Result success(Boolean success) {

        this.setSuccess(success);
        return this;
    }

    public Result message(String message) {

        this.setMessage(message);
        return this;
    }

    public Result code(Integer code) {

        this.setCode(code);
        return this;
    }

    public Result data(String key, Object value) {

        this.data.put(key, value);
        return this;
    }

    public Result data(Map<String, Object> map) {

        this.setData(map);
        return this;
    }
}
```

5.ResponseUtils(请求响应工具类)

6.ResultCode（响应码）



 **service_base包含全局微服务模块的通用配置:** 

1.RedisConfig(redis的所有配置:包括redisTemplate、读写分离、redisson分布式锁的配置)


```
@EnableCaching
@Configuration
public class RedisConfig {

    @Bean
    public Redisson redisson() {
        Config config = new Config();
        config.useSentinelServers().addSentinelAddress("redis://127.0.0.1:26379")
                .setPassword("root")
                .setSentinelUsername("master");
        return (Redisson) Redisson.create(config);
    }
    
    @Bean
    @SuppressWarnings("all")
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {

        RedisTemplate<String, Object> template = new RedisTemplate<>();

        RedisSerializer<String> redisSerializer = new StringRedisSerializer();

        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);

        ObjectMapper om = new ObjectMapper();

        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);

        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);

        jackson2JsonRedisSerializer.setObjectMapper(om);

        template.setConnectionFactory(factory);

        //key序列化方式

        template.setKeySerializer(redisSerializer);

        //value序列化

        template.setValueSerializer(jackson2JsonRedisSerializer);

        //value hashmap序列化

        template.setHashValueSerializer(jackson2JsonRedisSerializer);

        return template;

    }

    //Redis读写分离配置
    @Bean
    public RedisConnectionFactory lettuceConnectionFactory(RedisProperties redisProperties) {
        RedisSentinelConfiguration redisSentinelConfiguration = new RedisSentinelConfiguration(redisProperties.getSentinel().getMaster(),
                new HashSet<>(redisProperties.getSentinel().getNodes()));
        LettuceClientConfiguration lettuceClientConfiguration = LettuceClientConfiguration.builder()
                .readFrom(ReadFrom.REPLICA_PREFERRED)
                .build();
        return new LettuceConnectionFactory(redisSentinelConfiguration, lettuceClientConfiguration);
    }


    @Bean
    @SuppressWarnings("all")
    public CacheManager cacheManager(RedisConnectionFactory factory) {

        RedisSerializer<String> redisSerializer = new StringRedisSerializer();

        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);

        //解决查询缓存转换异常的问题

        ObjectMapper om = new ObjectMapper();

        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);

        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);

        jackson2JsonRedisSerializer.setObjectMapper(om);

        // 配置序列化（解决乱码的问题）,过期时间600秒

        RedisCacheConfiguration config = RedisCacheConfiguration.defaultCacheConfig()

                .entryTtl(Duration.ofSeconds(600))

                .serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(redisSerializer))

                .serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(jackson2JsonRedisSerializer))

                .disableCachingNullValues();

        RedisCacheManager cacheManager = RedisCacheManager.builder(factory)

                .cacheDefaults(config)

                .build();

        return cacheManager;

    }
}

```

2.SwaggerConfg(swagger-ui配置)

3.InterceptorConfig(全局拦截器配置)

4.MyMetaObjectHandler(MybatisPlus配置)

。。。。还有很多不一一介绍


 **spring_security用于实现后台权限认证，用SpringSecurity实现** 


### infrastructure包含GateWay网关配置:


1.跨域统一配置(前后端分离必涉及跨域):
后端一般可采用两种方式：①CrosConfiguartion ②每个controller添加注解@CorsOrigin

package com.ren.gateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;
import org.springframework.web.util.pattern.PathPatternParser;


/**
 * <p>
 * 处理跨域
 * </p>
 *
 * @author rzy
 * @since 2020-11-21
 */


/**
 * description:
 *
 * @author rzy
 * @date 2021/01/02
 */
@Configuration
public class CorsConfig {

    @Bean
    public CorsWebFilter corsFilter() {

        CorsConfiguration config = new CorsConfiguration();
        config.addAllowedMethod("*");
        config.addAllowedOrigin("*");
        config.addAllowedHeader("*");

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource(new PathPatternParser());
        source.registerCorsConfiguration("/**", config);

        return new CorsWebFilter(source);
    }
}


2.filter请求过滤(保证核心服务必须要经过Token检验才放行)


```
package com.ren.gateway.filter;

import com.google.gson.JsonObject;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * <p>
 * 全局Filter，统一处理会员登录与外部不允许访问的服务
 * </p>
 *
 * @author RZY
 * @since 2020-11-21
 */
@Component
public class AuthGlobalFilter implements GlobalFilter, Ordered {

    private AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        String path = request.getURI().getPath();
        //recl的api接口，校验用户必须登录
        if(antPathMatcher.match("/api/**/auth/**", path)) {
            List<String> tokenList = request.getHeaders().get("token");
            if(null == tokenList) {
                ServerHttpResponse response = exchange.getResponse();
                return out(response);
            } else {
//                Boolean isCheck = JwtUtils.checkToken(tokenList.get(0));
//                if(!isCheck) {
                    ServerHttpResponse response = exchange.getResponse();
                    return out(response);
//                }
            }
        }
        //内部服务接口，不允许外部访问
        if(antPathMatcher.match("/**/inner/**", path)) {
            ServerHttpResponse response = exchange.getResponse();
            return out(response);
        }
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 0;
    }

    private Mono<Void> out(ServerHttpResponse response) {
        JsonObject message = new JsonObject();
        message.addProperty("success", false);
        message.addProperty("code", 28004);
        message.addProperty("data", "鉴权失败");
        byte[] bits = message.toString().getBytes(StandardCharsets.UTF_8);
        DataBuffer buffer = response.bufferFactory().wrap(bits);
        //response.setStatusCode(HttpStatus.UNAUTHORIZED);
        //指定编码，否则在浏览器中会中文乱码
        response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
        return response.writeWith(Mono.just(buffer));
    }
}
```


3.application配置(后面引入了NacosConfig，现在已经失效了,由注册中心维护全局配置):


```
# 服务端口
server.port=8222
# 服务名
spring.application.name=service-gateway
#Nacos注册中心配置
spring.cloud.nacos.discovery.server-addr=127.0.0.1:8848

#Gateway配置(服务发现路由)
spring.cloud.gateway.discovery.locator.enabled=true


#配置service-edu服务

spring.cloud.gateway.routes[0].id=service-edu

spring.cloud.gateway.routes[0].uri=lb://service-edu

spring.cloud.gateway.routes[0].predicates= Path=/eduservice/**


#配置service-oss服务

spring.cloud.gateway.routes[1].id=service-oss

spring.cloud.gateway.routes[1].uri=lb://service-oss

spring.cloud.gateway.routes[1].predicates= Path=/eduoss/**

#配置service-msm服务

spring.cloud.gateway.routes[2].id=service-msm

spring.cloud.gateway.routes[2].uri=lb://service-msm

spring.cloud.gateway.routes[2].predicates= Path=/edumsm/**

#配置service-ucenter服务

spring.cloud.gateway.routes[3].id=service-ucenter

spring.cloud.gateway.routes[3].uri=lb://service-ucenter

spring.cloud.gateway.routes[3].predicates= Path=/educenter/**
#配置service-chat服务

spring.cloud.gateway.routes[4].id=service-chat

spring.cloud.gateway.routes[4].uri=lb://service-chat

spring.cloud.gateway.routes[4].predicates= Path=/chat/**


spring.cloud.gateway.routes[5].id=service-acl

spring.cloud.gateway.routes[5].uri=lb://service-acl

spring.cloud.gateway.routes[5].predicates= Path=/*/acl/**


spring.cloud.gateway.routes[6].id=service-oss

spring.cloud.gateway.routes[6].uri=lb://service-oss

spring.cloud.gateway.routes[6].predicates= Path=/eduoss/**


spring.cloud.gateway.routes[7].id=service-order

spring.cloud.gateway.routes[7].uri=lb://service-order

spring.cloud.gateway.routes[7].predicates= Path=/order/**

spring.cloud.gateway.routes[8].id=service-statistics

spring.cloud.gateway.routes[8].uri=lb://service-statistics

spring.cloud.gateway.routes[8].predicates= Path=/edusta/**
```


### RabbitMq模块包含rabbitTemplate模板配置、消息确认配置、队列、交换机、routingkey的绑定(不细节展示)


### service中包含所有的微服务模块


- sevice_acl(权限模块)
- service_chat（咨询模块：基于WebSockect实现的一对一咨询）
- service_edu(服务模块：整合了量表、美文、FM、咨询、倾听)
- service_msm（消息模块：验证码、下单通知）
- service_order（订单模块：量表订单）
- service_oss（OSS上传模块）
- service_statistics(数据统计模块:统计访问量、请求数等数据，并定义SpringBoot定时任务进行异步写入)
- service_ucenter(用户模块)



4.Redisson:运用Redisson分布式锁解决mysql和redis的双写不一致性

举例子：修改时尝试加redis写锁，如果此时没有用户查这个缓存key，则加锁成功，修改并删除缓存，等下个用户查询mysql再重建key，注意一定要释放锁如果有用户查询该记录，会先查redis，如果有这个cache，直接返回，否则加锁，并且加双重锁，第一层保证只有一个用户可以重建该key，加第二层写锁保证该记录无法被修改，保证一致性，加锁后后再查缓存，因为并发情况下其他用户可能已经重建了key，不存在则查mysql，再重建key，重建成功释放锁，返回结果


```
@ApiOperation(value = "心理美文信息修改")
@PostMapping("/updateArticle")
public Result updateArticle(@RequestBody(required = true) EduArticle eduArticle) throws InterruptedException {
    //获取读写锁
    RReadWriteLock readWriteLock = redisson.getReadWriteLock(RedisKeyPrefixConstant.LOCK_ARTICLE_FRONT_UPDATE_CACHE_PREFIX + eduArticle.getId());
    RLock rLock = readWriteLock.writeLock();
    rLock.lock();   //加写锁
    boolean flag;
    try {
        UpdateWrapper<EduArticle> wrapper = new UpdateWrapper<>();
        wrapper.set("one_tag", eduArticle.getOneTag());
        wrapper.set("two_tag", eduArticle.getTwoTag());
        wrapper.set("three_tag", eduArticle.getThreeTag());
        flag = eduArticleService.updateById(eduArticle);
        //删除缓存，等待预热
        if(flag) RedisUtils.del(RedisKeyPrefixConstant.ARTICLE_FRONT_CACHE + eduArticle.getId());
        else return Result.error();
    } finally {
        rLock.unlock();  //释放锁
    }
    return Result.ok();
}



@Override
    public Result getFrontArticleInfo(String id) {

    EduArticle article = null;
    //生成Redis中的key
    String articleFrontKey = RedisKeyPrefixConstant.ARTICLE_FRONT_CACHE + id;
    //从缓存获取文章信息
    String articleStr = RedisUtils.getStr(articleFrontKey);
    //缓存穿透判断
    if(！RedisKeyPrefixConstant.EMPTY_CACHE.equals(articleStr)) return Result.ok()
            .data("article", JSON.parseObject(articleStr, EduArticle.class))；
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
                            .data("article", new EduArticle())；
                }
                RedisUtils.set(articleFrontKey, article, RedisUtils.setCacheTimeout(7200));
            } else {
                //解决缓存穿透,若为空value,直接返回error
                if(RedisKeyPrefixConstant.EMPTY_CACHE.equals(articleStr)) {
                    return Result.error()
                            .message("该文章不存在")
                            .data("article", new EduArticle())；
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

    return Result.ok()
            .data("article", article)；
}

```



### 5. 运行图


![输入图片说明](https://recl-edu.oss-cn-beijing.aliyuncs.com/recl/%E5%9B%BE%E7%89%878.jpg)


![输入图片说明](https://recl-edu.oss-cn-beijing.aliyuncs.com/recl/%E5%9B%BE%E7%89%877.jpg)


![输入图片说明](https://recl-edu.oss-cn-beijing.aliyuncs.com/recl/%E5%9B%BE%E7%89%876.jpg)


![输入图片说明](https://recl-edu.oss-cn-beijing.aliyuncs.com/recl/%E5%9B%BE%E7%89%875.jpg)


![输入图片说明](https://recl-edu.oss-cn-beijing.aliyuncs.com/recl/%E5%9B%BE%E7%89%874.png)


![输入图片说明](https://recl-edu.oss-cn-beijing.aliyuncs.com/recl/%E5%9B%BE%E7%89%873.png)


![输入图片说明](https://recl-edu.oss-cn-beijing.aliyuncs.com/recl/%E5%9B%BE%E7%89%871.png)
