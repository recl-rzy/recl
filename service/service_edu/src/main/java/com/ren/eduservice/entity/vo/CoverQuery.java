package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Description: TODO
 * @ClassName: CoverQuery
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/8 12:18
 * @Vertion: 2019.1
 */

@Data
public class CoverQuery {

    @ApiModelProperty(value = "图片名称")
    private String title;

    @ApiModelProperty(value = "创建时间")
    private String gmtCreate;

    @ApiModelProperty(value = "更新时间")
    private String gmtModified;
}

