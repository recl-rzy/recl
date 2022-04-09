package com.ren.chat.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: UserInfoVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/15 11:22
 * @Vertion: 2019.1
 */

@Data
public class UserInfoVo {

    @ApiModelProperty(value = "用户ID")
    private String id;

    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "新密码")
    private String newPw;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "性别 1 男， 2 女")
    private Integer sex;

    @ApiModelProperty(value = "年龄")
    private Integer age;

    @ApiModelProperty(value = "个性签名")
    private String sign;

    @ApiModelProperty(value = "用户签名")
    private String token;

    @ApiModelProperty(value = "用户签名")
    private Boolean isCounselor = false;

    @ApiModelProperty(value = "用户签名")
    private Boolean isListener = false;

    @ApiModelProperty(value = "逻辑删除 1（true）已删除， 0（false）未删除")
    private Boolean isDeleted;

    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    private Date gmtModified;
//
//    @ApiModelProperty(value = "聊天状态(true表示正在聊天， false表示处于非聊天状态)")
//    private Boolean chatStatus;
}

