package com.ren.servicebase.config;

import com.ren.servicebase.interceptor.*;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/**
 * @Description: TODO
 * @ClassName: MyInterceptorConfig
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/25 22:52
 * @Vertion: 2019.1
 */

@Configuration
public class MyInterceptorConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(new MusicInterceptor())
                .addPathPatterns("/eduservice/music-front/**");

        registry.addInterceptor(new ConsultInterceptor())
                .addPathPatterns("/eduservice/counselor-front/**");

        registry.addInterceptor(new ListenInterceptor())
                .addPathPatterns("/eduservice/listener-front/**");

        registry.addInterceptor(new ScaleInterceptor())
                .addPathPatterns("/eduservice/scale-front/**")
                .addPathPatterns("/eduservice/subject-front/**");

        registry.addInterceptor(new ArticleInterceptor())
                .addPathPatterns("/eduservice/article-front/**");

        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/educenter/member/login");

        registry.addInterceptor(new RegisterInterceptor())
                .addPathPatterns("/educenter/member/register");

        registry.addInterceptor(new RequestInterceptor())
                .addPathPatterns("/**");
    }
}

