package com.ren.eduservice.controller.front;

import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduReservation;

import com.ren.eduservice.entity.vo.ReservationQuery;
import com.ren.eduservice.service.EduReservationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Description: TODO
 * @ClassName: ReservationFrontController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/31 18:01
 * @Vertion: v1.0
 */

@Api(tags = "前台咨询预约接口")
@RestController
@RequestMapping("/eduservice/reservation-front")
public class ReservationFrontController {

    @Autowired
    EduReservationService eduReservationService;

    @ApiOperation(value = "预约记录拉取")
    @PostMapping("/pageOwnReservation/{id}/{current}/{limit}")
    public Result pageOwnReservation(@PathVariable String id,
                                  @PathVariable long current, @PathVariable long limit,
                                  @RequestBody ReservationQuery reservationQuery) {

        return eduReservationService.pageOwnReservation(id, current, limit, reservationQuery);
    }
}
