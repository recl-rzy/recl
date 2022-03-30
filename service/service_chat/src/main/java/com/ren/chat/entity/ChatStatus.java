package com.ren.chat.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Description: TODO
 * @ClassName: ChatStatus
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/16 09:48
 * @Vertion: 2019.1
 */
@Data
public class ChatStatus {

    @ApiModelProperty(value = "当前用户id")
    private String userId;

    @ApiModelProperty(value = "聊天对方用户id")
    private String chatUserId;

    @ApiModelProperty(value = "当前状态(0表示空闲, 1表示正处于聊天状态, 2表示休息状态)")
    private Integer status;

    @ApiModelProperty(value = "接收方用户id用户身份")
    private String identity;
}

