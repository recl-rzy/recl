package com.ren.eduservice.service;

import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduReservation;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.eduservice.entity.vo.ReservationQuery;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author rzy
 * @since 2022-02-27
 */
public interface EduReservationService extends IService<EduReservation> {

    Result pageOwnReservation(String id, long current, long limit, ReservationQuery reservationQuery);
}
