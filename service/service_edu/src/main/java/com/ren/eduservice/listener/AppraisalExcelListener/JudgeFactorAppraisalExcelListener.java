package com.ren.eduservice.listener.AppraisalExcelListener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.ren.eduservice.entity.EduScaleAppraisal;
import com.ren.eduservice.entity.excl.appraisalData.JudgeFactorData;
import com.ren.servicebase.exceptionhandler.ReclException;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: JudgeFactorAppraisalExcelListener
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/8 10:08
 * @Vertion: 2019.1
 */

public class JudgeFactorAppraisalExcelListener extends AnalysisEventListener<JudgeFactorData> {

    public String scaleId;

    //存放量表评估规则的集合
    public List<EduScaleAppraisal> scaleAppraisals;

    public JudgeFactorAppraisalExcelListener(String scaleId, List<EduScaleAppraisal> scaleAppraisals) {

        this.scaleId = scaleId;
        this.scaleAppraisals = scaleAppraisals;
    }

    @Override
    public void invoke(JudgeFactorData judgeFactorData, AnalysisContext analysisContext) {

        if (judgeFactorData == null) {

            throw new ReclException(20001, "表中存在空数据");
        }

        if (judgeFactorData.getLowerLimit() == null) {

            throw new ReclException(20001, "表中存在未设定评估下限的记录");
        }

        if (judgeFactorData.getUpperLimit() == null) {

            throw new ReclException(20001, "表中存在未设定评估上限的记录");
        }

        if (judgeFactorData.getAppraisalResult() == null) {

            throw new ReclException(20001, "表中存在未设定评估结果的记录");
        }


        EduScaleAppraisal eduScaleAppraisal = new EduScaleAppraisal();
        eduScaleAppraisal.setScaleId(scaleId);
        BeanUtils.copyProperties(judgeFactorData, eduScaleAppraisal);
        scaleAppraisals.add(eduScaleAppraisal);
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}

