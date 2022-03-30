package com.ren.eduservice.controller;


import com.ren.commonutils.Result;
import com.ren.eduservice.entity.vo.DocScaleQuery;
import com.ren.eduservice.service.DocScaleService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author RZY
 * @since 2022-03-13
 */
@Api(tags = "后台档案管理")
@RestController
@RequestMapping("/eduservice/doc-scale")
public class DocScaleController {

    @Autowired
    DocScaleService docScaleService;

    @DeleteMapping("/{id}")
    public Result delDocScale(@PathVariable String id) {

        docScaleService.removeById(id);
        return Result.ok();
    }

    @PostMapping("/pageDocScaleFactor/{current}/{limit}")
    public Result pageDocScaleFactor(@PathVariable long current, @PathVariable long limit,
                             @RequestBody(required = false)DocScaleQuery docScaleQuery) {

        return docScaleService.getPageFactor(current, limit, docScaleQuery);
    }



}

