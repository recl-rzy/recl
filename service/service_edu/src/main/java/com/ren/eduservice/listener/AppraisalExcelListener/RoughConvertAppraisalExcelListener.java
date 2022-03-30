package com.ren.eduservice.listener.AppraisalExcelListener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.ren.eduservice.entity.EduScaleAppraisal;
import com.ren.eduservice.entity.excl.appraisalData.RoughConvertData;
import com.ren.servicebase.exceptionhandler.ReclException;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: RoughConvertAppraisalExcelListener
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/4 22:17
 * @Vertion: 2019.1
 */

public class RoughConvertAppraisalExcelListener extends AnalysisEventListener<RoughConvertData> {

    public String scaleId;

    //存放量表评估规则的集合
    public List<EduScaleAppraisal> scaleAppraisals;

    public RoughConvertAppraisalExcelListener(String scaleId, List<EduScaleAppraisal> scaleAppraisals) {

        this.scaleId = scaleId;
        this.scaleAppraisals = scaleAppraisals;
    }

    @Override
    public void invoke(RoughConvertData roughConvertData, AnalysisContext analysisContext) {

        if (roughConvertData == null) {

            throw new ReclException(20001, "表中存在空数据");
        }

        if (roughConvertData.getLowerLimit() == null) {

            throw new ReclException(20001, "表中存在未设定评估下限的记录");
        }

        if (roughConvertData.getUpperLimit() == null) {

            throw new ReclException(20001, "表中存在未设定评估上限的记录");
        }

        if (roughConvertData.getAppraisalResult() == null) {

            throw new ReclException(20001, "表中存在未设定评估结果的记录");
        }

        if (roughConvertData.getDimension() == null) {

            throw new ReclException(20001, "表中存在未设定所属维度的记录");
        }

        EduScaleAppraisal eduScaleAppraisal = new EduScaleAppraisal();
        eduScaleAppraisal.setScaleId(scaleId);
        BeanUtils.copyProperties(roughConvertData, eduScaleAppraisal);
        scaleAppraisals.add(eduScaleAppraisal);
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}

