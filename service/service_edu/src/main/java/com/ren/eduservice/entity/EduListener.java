package com.ren.eduservice.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 *
 * </p>
 *
 * @author testjava
 * @since 2021-09-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "EduListener对象", description = "")
public class EduListener implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "唯一id号")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "手机号")
    private String mobile;

    @ApiModelProperty(value = "倾听师姓名")
    private String name;

    @ApiModelProperty(value = "性别 1 男， 2 女")
    private Integer sex;

    @ApiModelProperty(value = "年龄")
    private Integer age;

    @ApiModelProperty(value = "倾听师简介")
    private String intro;

    @ApiModelProperty(value = "倾听师资历")
    private String career;

    @ApiModelProperty(value = "头衔： 1.一级倾听师 2.二级倾听师 3.三级倾听师")
    private Integer level;

    @ApiModelProperty(value = "倾听师签名")
    private String sign;

    @ApiModelProperty(value = "擅长方向1")
    private String oneClassify;

    @ApiModelProperty(value = "擅长方向2")
    private String twoClassify;

    @ApiModelProperty(value = "倾听总时长")
    private Integer totalDuration;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic
    private Boolean isDeleted;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;


}
