package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @Description: TODO
 * @ClassName: ScaleFrontVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/30 11:17
 * @Vertion: 2019.1
 */

@Data
public class ScaleFrontVo {

    @ApiModelProperty(value = "心理测试量表唯一id")
    private String id;

    @ApiModelProperty(value = "测试量表标题")
    private String title;

    @ApiModelProperty(value = "量表测试所需费用")
    private BigDecimal price;

    @ApiModelProperty(value = "测试量表封面图片路径")
    private String cover;

    @ApiModelProperty(value = "量表评论量")
    private Long commentCount;

    @ApiModelProperty(value = "浏览量")
    private Long viewCount;

    @ApiModelProperty(value = "量表描述")
    private String description;

    @ApiModelProperty(value = "量表一级分类")
    private String oneClassify;

    @ApiModelProperty(value = "量表二级分类")
    private String twoClassify;

    @ApiModelProperty(value = "题目数量")
    private int scaleOptionCount;
}

