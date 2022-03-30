package com.ren.staservice.schedule;

import com.ren.staservice.client.EduClient;
import com.ren.staservice.service.DailyStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @Description: TODO
 * @ClassName: ScheduleTask
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/26 12:52
 * @Vertion: 2019.1
 */

@Component
public class ScheduleTask {

    @Autowired
    EduClient eduClient;

    @Autowired
    DailyStatisticsService dailyStatisticsService;

    // 每天凌晨1点，保存前一天服务访问数据
    @Scheduled(cron = "0 0 1 * * ?")
    public void saveDailyStatistics () {
        dailyStatisticsService.saveDailyStatistics();
    }

    // 每天凌晨1点，更新前一天音频收藏量
    @Scheduled(cron = "0 0 1 * * ?")
    public void saveMusicCollect () {
        eduClient.saveDailyMusicCollectCount();
    }

    // 每天凌晨1点，更新前一天音频收藏量
    @Scheduled(cron = "0 0 1 * * ?")
    public void saveMusicComm () {
        eduClient.saveDailyMusicCommCount();
    }
}

