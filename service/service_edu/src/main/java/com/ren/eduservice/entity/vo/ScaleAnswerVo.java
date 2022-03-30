package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: ScaleAnswerVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/5 10:14
 * @Vertion: 2019.1
 */

@Data
public class ScaleAnswerVo {

    @ApiModelProperty(value = "所属量表id")
    private String scaleId;


}

