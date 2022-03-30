package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: ScaleCommentVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/8 21:37
 * @Vertion: 2019.1
 */

@Data
public class ScaleCommentVo {

    @ApiModelProperty(value = "评价用户头像路径")
    private String avatar;

    @ApiModelProperty(value = "量表评论内容")
    private String comment;

    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "用户id")
    private String userId;
}

