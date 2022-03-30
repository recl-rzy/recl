package com.ren.educenter.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Description: TODO
 * @ClassName: RegisterVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/9/20 13:28
 * @Vertion: 2019.1
 */

@Data
public class RegisterVo {

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "手机号（账号）")
    private String mobile;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "验证码")
    private String code;
}

