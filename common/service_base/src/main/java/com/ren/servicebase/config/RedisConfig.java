package com.ren.servicebase.config;


import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.lettuce.core.ReadFrom;
import org.redisson.Redisson;
import org.redisson.config.Config;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisSentinelConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.time.Duration;
import java.util.HashSet;

/**
 * @Description: Redis配置类
 * @ClassName: RedisConfig
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/20 09:34
 * @Vertion: 2019.1
 */

@EnableCaching
@Configuration
public class RedisConfig {

    @Bean
    public Redisson redisson() {
        Config config = new Config();
        config.useSingleServer().setAddress("redis://127.0.0.1:6379");
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

