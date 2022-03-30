package com.ren.eduservice.entity.excl.appraisalData;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description: TODO
 * @ClassName: JudgeFactorData
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/6 21:15
 * @Vertion: 2019.1
 */

@Data
public class JudgeFactorData {

    @ExcelProperty(index = 0)
    private BigDecimal upperLimit;

    @ExcelProperty(index = 2)
    private BigDecimal lowerLimit;

    @ExcelProperty(index = 4)
    private String appraisalResult;

    @ExcelProperty(index = 6)
    private String dimension;

    @ExcelProperty(index = 8)
    private BigDecimal coefficient;

    @ExcelProperty(index = 10)
    private Boolean essentialFactorAppraisal;

    @ExcelProperty(index = 12)
    private Boolean auxiliaryFactorAppraisal;

    @ExcelProperty(index = 14)
    private Boolean vagueFactorAppraisal;

    @ExcelProperty(index = 16)
    private Boolean pseudoScaleAppraisal;

    @ExcelProperty(index = 18)
    private Integer appraisalPriority;
}

