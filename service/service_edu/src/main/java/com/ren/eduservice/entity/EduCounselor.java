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
 * @since 2021-07-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "EduCounselor对象", description = "")
public class EduCounselor implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "咨询师ID")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "手机号")
    private String mobile;

    @ApiModelProperty(value = "咨询师姓名")
    private String name;

    @ApiModelProperty(value = "性别 1 男， 2 女")
    private Integer sex;

    @ApiModelProperty(value = "个性签名")
    private String sign;

    @ApiModelProperty(value = "年龄")
    private Integer age;

    @ApiModelProperty(value = "咨询师简介")
    private String intro;

    @ApiModelProperty(value = "咨询师资历")
    private String career;

    @ApiModelProperty(value = "头衔： 1.一级咨询师 2.二级咨询师 3.三级咨询师")
    private Integer level;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    @ApiModelProperty(value = "第一擅长方向")
    private String oneMeth;

    @ApiModelProperty(value = "第二擅长方向")
    private String twoMeth;

    @ApiModelProperty(value = "第三擅长方向")
    private String threeMeth;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic                         //用于逻辑删除处理
    private Boolean isDeleted;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;


}
