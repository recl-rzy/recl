package com.ren.eduservice.listener.SubjectExcelListener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.ren.eduservice.entity.EduScaleSubject;
import com.ren.eduservice.entity.excl.ScaleSubjectData;
import com.ren.servicebase.exceptionhandler.ReclException;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: ScaleSubjectExcelListener
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/4 19:39
 * @Vertion: 2019.1
 */

public class RoughCovertSubjectExcelListener extends AnalysisEventListener<ScaleSubjectData> {

    //所属量表id
    public String scaleId;

    //量表题目集合
    public List<EduScaleSubject> subjectList;

    public RoughCovertSubjectExcelListener(String scaleId, List<EduScaleSubject> subjectList) {

        this.subjectList = subjectList;
        this.scaleId = scaleId;
    }

    // TODO 一行一行读取测试题目信息，并保存读取的信息

    @Override
    public void invoke(ScaleSubjectData scaleSubjectData, AnalysisContext analysisContext) {

        if (scaleSubjectData == null) {

            throw new ReclException(20001, "量表存在空数据");
        }

        if (scaleSubjectData.getDimension() == null) {

            throw new ReclException(20001, "量表存在未设定维度的题目");
        }

        if (scaleSubjectData.getOptionTitle() == null) {

            throw new ReclException(20001, "量表存在未设定标题的题目");
        }

        if (scaleSubjectData.getOptionFour() == null && scaleSubjectData.getOptionThree() == null &&
                scaleSubjectData.getOptionTwo() == null && scaleSubjectData.getOptionOne() == null) {

            throw new ReclException(20001, "量表存在未设定选项的题目");
        }

        if (scaleSubjectData.getOptionOneScore() != null && scaleSubjectData.getOptionOneScore() == null) {

            throw new ReclException(20001, "量表存在未设定分值的题目");
        }

        if (scaleSubjectData.getOptionTwoScore() != null && scaleSubjectData.getOptionTwoScore() == null) {

            throw new ReclException(20001, "量表存在未设定分值的题目");
        }

        if (scaleSubjectData.getOptionThreeScore() != null && scaleSubjectData.getOptionThreeScore() == null) {

            throw new ReclException(20001, "量表存在未设定分值的题目");
        }

        if (scaleSubjectData.getOptionFourScore() != null && scaleSubjectData.getOptionFourScore() == null) {

            throw new ReclException(20001, "量表存在未设定分值的题目");
        }

        EduScaleSubject scaleSubject = new EduScaleSubject();
        scaleSubject.setScaleId(scaleId);
        BeanUtils.copyProperties(scaleSubjectData, scaleSubject);
        subjectList.add(scaleSubject);
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}

