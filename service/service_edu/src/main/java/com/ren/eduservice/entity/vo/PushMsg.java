package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: PushMsg
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/31 14:00
 * @Vertion: v1.0
 */

@Data
public class PushMsg {

    @ApiModelProperty(value = "用户ID")
    String userId;

    @ApiModelProperty(value = "是否可忽略(0代表false， 1代表true)")
    Boolean ignore;

    @ApiModelProperty(value = "标题")
    String title;

    @ApiModelProperty(value = "推送内容")
    String message;

    @ApiModelProperty(value = "推送时间")
    Date pushTime;
}
