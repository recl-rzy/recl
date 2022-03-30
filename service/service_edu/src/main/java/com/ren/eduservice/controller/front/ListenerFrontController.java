package com.ren.eduservice.controller.front;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduListener;
import com.ren.eduservice.service.EduListenerService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: ListenerFrontController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/14 14:23
 * @Vertion: 2019.1
 */

@Api(tags = "首页倾听接口")
@RestController
@RequestMapping("/eduservice/listener-front")
public class ListenerFrontController {

    @Autowired
    EduListenerService eduListenerService;

    @ApiOperation(value = "倾听师信息分页")
    @PostMapping("/indexPageListenerFactor/{current}/{limit}")
    public Result indexPageListenerFactor(@PathVariable long current, @PathVariable long limit) {

        Page<EduListener> listenerPage = new Page<>(current, limit);
        eduListenerService.page(listenerPage, null);
        long total = listenerPage.getTotal();
        List<EduListener> records = listenerPage.getRecords();
        long pages = listenerPage.getPages();

        return Result.ok()
                .data("total", total)
                .data("listenerList", records)
                .data("pages", pages);
    }
}

