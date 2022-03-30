package com.ren.staservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.DateUtils;
import com.ren.commonutils.RedisUtils;
import com.ren.commonutils.Result;
import com.ren.staservice.entity.CircleChartData;
import com.ren.staservice.entity.DailyStatistics;
import com.ren.staservice.entity.vo.SearchQuery;
import com.ren.staservice.mapper.DailyStatisticsMapper;
import com.ren.staservice.service.DailyStatisticsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author RZY
 * @since 2022-03-26
 */
@Service
public class DailyStatisticsServiceImpl extends ServiceImpl<DailyStatisticsMapper, DailyStatistics> implements DailyStatisticsService {

    @Override
    public void saveDailyStatistics() {

        DailyStatistics statistics = new DailyStatistics();
        Integer loginCount = (Integer)RedisUtils.get("loginCount");
        Integer registerCount = (Integer)RedisUtils.get("registerCount");
        Integer scaleCount = (Integer)RedisUtils.get("scaleCount");
        Integer musicCount = (Integer)RedisUtils.get("musicCount");
        Integer articleCount = (Integer)RedisUtils.get("articleCount");
        Integer consultCount = (Integer)RedisUtils.get("consultCount");
        Integer listenCount = (Integer)RedisUtils.get("listenCount");
        Integer requestCount = (Integer)RedisUtils.get("requestCount");
        statistics.setDateCalculated(DateUtils.formatDate(DateUtils.addDays(new Date(), -1)));

        statistics.setLoginCount(loginCount)
                .setRegisterCount(registerCount)
                .setScaleCount(scaleCount)
                .setMusicCount(musicCount)
                .setArticleCount(articleCount)
                .setConsultCount(consultCount)
                .setListenCount(listenCount)
                .setRequestCount(requestCount);
        int insert = this.baseMapper.insert(statistics);
        RedisUtils.del("loginCount", "registerCount", "scaleCount", "musicCount"
            , "articleCount", "consultCount", "listenCount", "requestCount");
    }

    @Override
    public Result getEduServiceStatistics(SearchQuery searchQuery) {

        String currentDate = searchQuery.getCurrentDate();
        if(StringUtils.isEmpty(currentDate)) {

            currentDate = DateUtils.formatDate(DateUtils.addDays(new Date(), -1));
        }

        DailyStatistics statistics = this.baseMapper.selectOne(new QueryWrapper<DailyStatistics>().eq("date_calculated", currentDate));

        if (statistics == null) {
            statistics = new DailyStatistics();
        }

        Integer type = searchQuery.getType();
        if(StringUtils.isEmpty(type) || type.equals(1)) {

            List<CircleChartData> circleChartData = new ArrayList<>();
            circleChartData.add(new CircleChartData("量表服务访问量", statistics.getScaleCount()));
            circleChartData.add(new CircleChartData("FM服务访问量", statistics.getMusicCount()));
            circleChartData.add(new CircleChartData("咨询服务访问量", statistics.getConsultCount()));
            circleChartData.add(new CircleChartData("美文服务访问量", statistics.getArticleCount()));
            circleChartData.add(new CircleChartData("倾听服务访问量", statistics.getListenCount()));
            circleChartData.add(new CircleChartData("单日登录用户数量", statistics.getLoginCount()));
            circleChartData.add(new CircleChartData("单日注册用户数量", statistics.getRegisterCount()));
            //circleChartData.add(new CircleChartData("单日服务请求总数", statistics.getRequestCount()));
            return Result.ok()
                    .data("circleChartData", circleChartData);
        } else if (type.equals(2)) {

            ArrayList<String> poleTitle = new ArrayList<>();
            poleTitle.add("量表服务访问量");
            poleTitle.add("FM服务访问量");
            poleTitle.add("咨询服务访问量");
            poleTitle.add("美文服务访问量");
            poleTitle.add("倾听服务访问量");
            poleTitle.add("单日登录用户数量");
            poleTitle.add("单日注册用户数量");
            List<Integer> poleChartData = new ArrayList<>();
            poleChartData.add(statistics.getScaleCount());
            poleChartData.add(statistics.getMusicCount());
            poleChartData.add(statistics.getConsultCount());
            poleChartData.add(statistics.getArticleCount());
            poleChartData.add(statistics.getListenCount());
            poleChartData.add(statistics.getLoginCount());
            poleChartData.add(statistics.getRegisterCount());
            return Result.ok()
                    .data("poleChartData", poleChartData)
                    .data("poleTitle", poleTitle);
        }

        return Result.error()
                .message("服务出错了");

    }
}
