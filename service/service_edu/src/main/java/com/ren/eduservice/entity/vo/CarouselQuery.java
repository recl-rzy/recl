package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: CarouselQuery
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/27 12:50
 * @Vertion: 2019.1
 */

@Data
public class CarouselQuery {

    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(value = "图片路径")
    private String imgUrl;

    @ApiModelProperty(value = "发布状态")
    private String status;

    @ApiModelProperty(value = "创建时间")
    private String start;

    @ApiModelProperty(value = "更新时间")
    private String end;
}

