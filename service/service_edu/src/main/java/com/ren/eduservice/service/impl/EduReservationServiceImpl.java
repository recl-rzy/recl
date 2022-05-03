package com.ren.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduReservation;
import com.ren.eduservice.entity.vo.ReservationQuery;
import com.ren.eduservice.mapper.EduReservationMapper;
import com.ren.eduservice.service.EduReservationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author rzy
 * @since 2022-02-27
 */
@Service
public class EduReservationServiceImpl extends ServiceImpl<EduReservationMapper, EduReservation> implements EduReservationService {

    @Override
    public Result pageOwnReservation(String id, long current, long limit, ReservationQuery reservationQuery) {

        String userName = reservationQuery.getUserName();
        String mobile = reservationQuery.getMobile();
        Integer method = reservationQuery.getMethod();
        Integer direction = reservationQuery.getDirection();
        Boolean previous = reservationQuery.getPrevious();
        String dealResult = reservationQuery.getDealResult();
        String start = reservationQuery.getStart();
        String end = reservationQuery.getEnd();

        QueryWrapper<EduReservation> wrapper = new QueryWrapper<>();
        wrapper.eq("back_id", id);
        Page<EduReservation> page = new Page<>(current, limit);
        if(!StringUtils.isEmpty(userName)) wrapper.like("user_name", userName);
        if(!StringUtils.isEmpty(mobile)) wrapper.like("mobile", mobile);
        if(!StringUtils.isEmpty(method)) wrapper.eq("method", method);
        if(!StringUtils.isEmpty(direction)) wrapper.eq("direction", direction);
        if(!StringUtils.isEmpty(previous)) wrapper.eq("previous", previous);
        if(!StringUtils.isEmpty(dealResult)) wrapper.eq("deal_result", dealResult);
        if(!StringUtils.isEmpty(start)) wrapper.ge("gmt_create", start);
        if(!StringUtils.isEmpty(end)) wrapper.le("gmt_modified", end);

        this.baseMapper.selectPage(page, wrapper);
        long total = page.getTotal();
        List<EduReservation> list = page.getRecords();

        return Result.ok()
                .data("total", total)
                .data("list", list);
    }
}
