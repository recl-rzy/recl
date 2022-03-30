package com.ren.staservice.controller;


import com.ren.commonutils.DateUtils;
import com.ren.commonutils.Result;
import com.ren.servicebase.exceptionhandler.ReclException;
import com.ren.staservice.entity.CircleChartData;
import com.ren.staservice.entity.DailyStatistics;
import com.ren.staservice.entity.vo.SearchQuery;
import com.ren.staservice.service.DailyStatisticsService;
import com.sun.org.glassfish.external.statistics.Statistic;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author RZY
 * @since 2022-03-26
 */

@Api(tags = "后台数据管理")
@RestController
@RequestMapping("/edusta/daily-statistics")
public class DailyStatisticsController {

    @Autowired
    DailyStatisticsService dailyStatisticsService;

    @ApiOperation("各项服务数据拉取")
    @PostMapping("/getEduStatistics")
    public Result getEduStatistics(@RequestBody(required = false) SearchQuery searchQuery) {



        return dailyStatisticsService.getEduServiceStatistics(searchQuery);
    }

}

