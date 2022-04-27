package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: scaleCommentQuery
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/4/10 20:01
 * @Vertion: v1.0
 */

@Data
public class ScaleCommentQuery {

    @ApiModelProperty(value = "测试量表标题")
    private String title;

    @ApiModelProperty(value = "量表评论内容")
    private String comment;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private String start;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String end;
}
