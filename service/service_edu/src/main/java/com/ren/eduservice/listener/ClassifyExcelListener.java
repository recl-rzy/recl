package com.ren.eduservice.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.eduservice.entity.EduScaleClassify;
import com.ren.eduservice.entity.excl.TestClassifyData;
import com.ren.eduservice.service.EduScaleClassifyService;
import com.ren.servicebase.exceptionhandler.ReclException;


/**
 * @Description: TODO
 * @ClassName: ClassifyExcelLisenter
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/8/7 15:38
 * @Vertion: 2019.1
 */

public class ClassifyExcelListener extends AnalysisEventListener<TestClassifyData> {

    public EduScaleClassifyService eduScaleClassifyService;

    public ClassifyExcelListener(EduScaleClassifyService eduScaleClassifyService) {

        this.eduScaleClassifyService = eduScaleClassifyService;
    }

    // TODO 一行一行读取分类信息，并保存读取的信息
    @Override
    public void invoke(TestClassifyData testClassifyData, AnalysisContext analysisContext) {

        if (testClassifyData == null) {

            throw new ReclException(20001, "上传文件没有相关信息");
        }

        //一级分类添加判断重复
        EduScaleClassify oneTestClassify = this.existOneClassify(testClassifyData.getOneClassify());
        if (oneTestClassify == null) {

            oneTestClassify = new EduScaleClassify();
            oneTestClassify.setParentId("0");
            oneTestClassify.setTitle(testClassifyData.getOneClassify());
            eduScaleClassifyService.save(oneTestClassify);
        }

        //二级分类添加判断重复
        String parentId = oneTestClassify.getId();
        EduScaleClassify twoTestClassify = this.existTwoClassify(testClassifyData.getTwoClassify(), parentId);
        if (twoTestClassify == null) {

            twoTestClassify = new EduScaleClassify();
            twoTestClassify.setParentId(parentId);
            twoTestClassify.setTitle(testClassifyData.getTwoClassify());
            eduScaleClassifyService.save(twoTestClassify);
        }

    }

    //一级分类添加判断重复
    private EduScaleClassify existOneClassify(String classifyName) {


        QueryWrapper<EduScaleClassify> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("title", classifyName);
        queryWrapper.eq("parent_id", "0");
        EduScaleClassify testClassify = eduScaleClassifyService.getOne(queryWrapper);
        return testClassify;
    }

    //二级分类添加判断重复
    private EduScaleClassify existTwoClassify(String classifyName, String parentId) {

        QueryWrapper<EduScaleClassify> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("title", classifyName);
        queryWrapper.eq("parent_id", parentId);
        EduScaleClassify testClassify = eduScaleClassifyService.getOne(queryWrapper);
        return testClassify;
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}

