package com.ren.eduservice.controller.front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.CarouselFigure;
import com.ren.eduservice.service.CarouselFigureService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: CarouselFrontController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/27 12:40
 * @Vertion: 2019.1
 */

@Api(tags = "首页轮播接口")
@RequestMapping("/eduservice/carousel-front")
@RestController
public class CarouselFrontController {

    @Autowired
    CarouselFigureService carouselFigureService;

    @ApiOperation(value = "轮播图拉取")
    @Cacheable(key = "'carousel'", value = "'getCarousel'")
    @GetMapping("/getCarousel")
    public Result getCarousel() {

        List<CarouselFigure> list = carouselFigureService.list(new QueryWrapper<CarouselFigure>().
                eq("status", "Normal"));
        return Result.ok()
                .data("list", list);
    }

}

