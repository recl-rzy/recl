package com.ren.eduservice;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.eduservice.entity.EduScaleSubject;
import com.ren.eduservice.service.EduScaleService;
import com.ren.eduservice.service.EduScaleSubjectService;
import com.ren.eduservice.service.impl.EduScaleServiceImpl;
import com.ren.eduservice.service.impl.EduScaleSubjectServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description: TODO
 * @ClassName: ScaleApp
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/5 10:52
 * @Vertion: 2019.1
 */

public class ScaleApp {

    EduScaleSubjectService eduScaleSubjectService = new EduScaleSubjectServiceImpl();

    EduScaleService eduScaleService = new EduScaleServiceImpl();

    @Test
    public void get() {

        List<String> app = new ArrayList<>();
        app.add("E-17-0");
        app.add("N-11-0");
        app.add("L-20-0");
        app.add("P-8-0");
//        eduScaleService.getScaleAppraisalResult("1424953365894311938", app);
    }

}

