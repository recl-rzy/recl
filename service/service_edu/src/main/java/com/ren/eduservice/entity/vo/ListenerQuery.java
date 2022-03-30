package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Description: TODO
 * @ClassName: ListenerQuery
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/25 16:56
 * @Vertion: 2019.1
 */

@Data
public class ListenerQuery {

    @ApiModelProperty(value = "咨询师姓名")
    private String name;

    @ApiModelProperty(value = "头衔： 1.一级咨询师 2.二级咨询师 3.三级咨询师")
    private Integer level;

    @ApiModelProperty(value = "擅长方向1")
    private String oneClassify;

    @ApiModelProperty(value = "擅长方向2")
    private String twoClassify;

    @ApiModelProperty(value = "倾听总时长")
    private Integer totalDuration;

    @ApiModelProperty(value = "创建时间")
    private String start;

    @ApiModelProperty(value = "更新时间")
    private String end;
}

