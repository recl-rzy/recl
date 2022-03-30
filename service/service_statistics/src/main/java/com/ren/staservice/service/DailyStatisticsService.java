package com.ren.staservice.service;

import com.ren.commonutils.Result;
import com.ren.staservice.entity.DailyStatistics;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.staservice.entity.vo.SearchQuery;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author RZY
 * @since 2022-03-26
 */
public interface DailyStatisticsService extends IService<DailyStatistics> {

    void saveDailyStatistics();

    Result getEduServiceStatistics(SearchQuery searchQuery);
}
