package com.ren.eduservice.controller.front;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduCounselor;
import com.ren.eduservice.entity.EduReservation;
import com.ren.eduservice.service.EduCounselorService;
import com.ren.eduservice.service.EduReservationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: CounselorFrontController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/1/24 19:01
 * @Vertion: 2019.1
 */

@Api(tags = "前台咨询接口")
@RestController
@RequestMapping("/eduservice/counselor-front")
public class CounselorFrontController {

    @Autowired
    EduCounselorService eduCounselorService;

    @Autowired
    EduReservationService eduReservationService;

    @ApiOperation(value = "查询咨询师信息")
    @GetMapping("/getCounselor/{id}")
    public Result getCounselor(@PathVariable String id) {

        EduCounselor counselor = eduCounselorService.getById(id);
        return Result.ok()
                .data("counselor", counselor);
    }

    @ApiOperation(value = "保存咨询预约记录")
    @PostMapping("/addReserRecord")
    public Result addReserRecord(@RequestBody EduReservation eduReservation) {

        boolean save = eduReservationService.save(eduReservation);
        if(save) {
            return Result.ok();
        } else {
            return Result.error();
        }
    }

    @ApiOperation(value = "咨询师信息分页")
    @PostMapping("/indexPageCounselorFactor/{current}/{limit}")
    public Result indexPageCounselorFactor(@PathVariable long current, @PathVariable long limit) {

        Page<EduCounselor> counselorPage = new Page<>(current, limit);
        eduCounselorService.page(counselorPage, null);
        long total = counselorPage.getTotal();
        List<EduCounselor> records = counselorPage.getRecords();
        long pages = counselorPage.getPages();

        return Result.ok()
                .data("total", total)
                .data("counselorList", records)
                .data("pages", pages);
    }
}

