package com.ren.eduservice.entity.excl.appraisalData;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description: TODO
 * @ClassName: RoughConvertData
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/4 21:37
 * @Vertion: 2019.1
 */

@Data
public class RoughConvertData {

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

}

