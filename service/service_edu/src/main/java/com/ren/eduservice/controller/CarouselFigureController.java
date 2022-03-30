package com.ren.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.CarouselFigure;
import com.ren.eduservice.entity.vo.CarouselQuery;
import com.ren.eduservice.service.CarouselFigureService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author RZY
 * @since 2022-03-27
 */

@Api(tags = "后台轮播管理")
@RestController
@RequestMapping("/eduservice/carousel-figure")
public class CarouselFigureController {

    @Autowired
    CarouselFigureService carouselFigureService;

    @ApiOperation(value = "轮播分页")
    @PostMapping("/pageCarousel/{current}/{limit}")
    public Result pageCarousel(@PathVariable long current, @PathVariable long limit,
                               @RequestBody CarouselQuery carouselQuery) {

        Page<CarouselFigure> page = new Page<>(current, limit);
        QueryWrapper<CarouselFigure> wrapper = new QueryWrapper<>();
        String title = carouselQuery.getTitle();
        String status = carouselQuery.getStatus();
        String start = carouselQuery.getStart();
        String end = carouselQuery.getEnd();

        if(!StringUtils.isEmpty(title)) wrapper.like("title", title);
        if(!StringUtils.isEmpty(status)) wrapper.eq("status", status);
        if(!StringUtils.isEmpty(start)) wrapper.ge("start", start);
        if(!StringUtils.isEmpty(end)) wrapper.le("end", end);

        wrapper.orderByDesc("gmt_create");

        carouselFigureService.page(page, wrapper);
        List<CarouselFigure> records = page.getRecords();
        long total = page.getTotal();
        return Result.ok()
                .data("rows", records)
                .data("total", total);
    }

    @ApiOperation(value = "轮播删除")
    @DeleteMapping("/{id}")
    public Result delCarousel(@PathVariable String id) {

        boolean remove = carouselFigureService.removeById(id);
        return Result.ok();
    }

    @ApiOperation(value = "轮播修改")
    @PostMapping("/updateCarousel")
    public Result updateCarousel(@RequestBody(required = false) CarouselFigure carouselFigure) {

        boolean update = carouselFigureService.updateById(carouselFigure);
        return Result.ok();
    }

    @ApiOperation(value = "轮播添加")
    @PostMapping("/addCarousel")
    public Result addCarousel(@RequestBody CarouselFigure carouselFigure) {

        boolean save = carouselFigureService.save(carouselFigure);
        return Result.ok();
    }

    @ApiOperation(value = "轮播id查询")
    @GetMapping("/getCarousel/{id}")
    public Result getCarousel(@PathVariable String id) {

        CarouselFigure carousel = carouselFigureService.getById(id);
        return Result.ok()
                .data("carousel", carousel);
    }

    @ApiOperation(value = "轮播发布")
    @PutMapping("/publishCarousel/{id}")
    public Result publishCarousel(@PathVariable String id) {

        CarouselFigure carousel = new CarouselFigure();
        carousel.setId(id);
        carousel.setStatus("Normal");
        boolean update = carouselFigureService.updateById(carousel);
        return Result.ok();
    }

    @ApiOperation(value = "轮播下架")
    @PutMapping("/pullCarousel/{id}")
    public Result pullCarousel(@PathVariable String id) {

        CarouselFigure carousel = new CarouselFigure();
        carousel.setId(id);
        carousel.setStatus("Draft");
        boolean update = carouselFigureService.updateById(carousel);
        return Result.ok();
    }
}

