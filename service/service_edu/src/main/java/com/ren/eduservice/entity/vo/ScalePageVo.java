package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: ScalePageVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/2/27 22:10
 * @Vertion: 2019.1
 */

@Data
public class ScalePageVo {

    @ApiModelProperty(value = "心理测试量表唯一id")
    private String id;

    @ApiModelProperty(value = "作者id")
    private String userId;

    @ApiModelProperty(value = "咨询师姓名")
    private String name;

    @ApiModelProperty(value = "测试量表标题")
    private String title;

    @ApiModelProperty(value = "分类标题")
    private String classifyTitle;

    @ApiModelProperty(value = "测试量表二级分类的唯一id")
    private String classifyId;

    @ApiModelProperty(value = "量表描述")
    private String description;

    @ApiModelProperty(value = "测试量表封面图片路径")
    private String cover;

    @ApiModelProperty(value = "浏览量")
    private Long viewCount;

    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;
}

