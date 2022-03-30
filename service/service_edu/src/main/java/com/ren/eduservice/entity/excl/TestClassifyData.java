package com.ren.eduservice.entity.excl;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

/**
 * @Description: TODO
 * @ClassName: TestClassifyData
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/8/7 15:33
 * @Vertion: 2019.1
 */

@Data
public class TestClassifyData {

    @ExcelProperty(index = 0)
    private String oneClassify;

    @ExcelProperty(index = 2)
    private String twoClassify;
}

