package com.ren.eduservice.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduReservation;
import com.ren.eduservice.service.EduReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author RZY
 * @since 2022-02-27
 */
@RestController
@RequestMapping("/eduservice/edu-reservation")
public class EduReservationController {

    @Autowired
    EduReservationService eduReservationService;

    @GetMapping("/pageReservation/{current}/{limit}")
    public Result pageReservation(@PathVariable long current, @PathVariable long limit) {
        Page<EduReservation> page = new Page<EduReservation>(current, limit);
        eduReservationService.page(page, null);
        long total = page.getTotal();
        List<EduReservation> list = page.getRecords();
        return Result.ok()
                .data("total", total)
                .data("list", list);
    }

    @GetMapping("/{id}")
    public Result getReservation(@PathVariable String id) {
        EduReservation reservation = eduReservationService.getById(id);
        return Result.ok()
                .data("info", reservation);
    }

    @PutMapping("")
    public Result updateReservation(@RequestBody EduReservation eduReservation) {
        boolean update = eduReservationService.updateById(eduReservation);
        return Result.ok();
    }

    @DeleteMapping("/{id}")
    public Result delReservation(@PathVariable String id) {
        boolean remove = eduReservationService.removeById(id);
        return Result.ok();
    }
}

