package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description: TODO
 * @ClassName: ScaleEvaluateVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/30 19:20
 * @Vertion: 2019.1
 */

@Data
public class ScaleEvaluateVo {

    @ApiModelProperty(value = "量表易懂性评分")
    private BigDecimal understandAbility;

    @ApiModelProperty(value = "量表建议实用性评分")
    private BigDecimal practiceAbility;

    @ApiModelProperty(value = "量表易懂性评分")
    private BigDecimal accuracyAbility;
}

