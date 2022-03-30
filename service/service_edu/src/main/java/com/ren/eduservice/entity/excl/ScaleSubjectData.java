package com.ren.eduservice.entity.excl;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

/**
 * @Description: TODO
 * @ClassName: ScaleSubjectData
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/4 19:39
 * @Vertion: 2019.1
 */

@Data
public class ScaleSubjectData {

    @ExcelProperty(index = 0)
    private String optionTitle;

    @ExcelProperty(index = 2)
    private String optionOne;

    @ExcelProperty(index = 4)
    private Integer optionOneScore;

    @ExcelProperty(index = 6)
    private String optionTwo;

    @ExcelProperty(index = 8)
    private Integer optionTwoScore;

    @ExcelProperty(index = 10)
    private String optionThree;

    @ExcelProperty(index = 12)
    private Integer optionThreeScore;

    @ExcelProperty(index = 14)
    private String optionFour;

    @ExcelProperty(index = 16)
    private Integer optionFourScore;

    @ExcelProperty(index = 18)
    private String dimension;

    @ExcelProperty(index = 20)
    private Boolean essentialFactor;

    @ExcelProperty(index = 22)
    private Boolean auxiliaryFactor;

    @ExcelProperty(index = 24)
    private Boolean vagueFactor;

    @ExcelProperty(index = 26)
    private Boolean pseudoScaleMeasure;
}

