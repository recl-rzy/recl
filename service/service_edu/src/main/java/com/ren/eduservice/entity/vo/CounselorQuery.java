package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: CounselorQuery
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/7/12 19:17
 * @Vertion: 2019.1
 */

@Data
public class CounselorQuery {

    @ApiModelProperty(value = "咨询师姓名")
    private String name;

    @ApiModelProperty(value = "头衔： 1.一级咨询师 2.二级咨询师 3.三级咨询师")
    private Integer level;

    @ApiModelProperty(value = "创建时间")
    private String start;

    @ApiModelProperty(value = "更新时间")
    private String end;
}

