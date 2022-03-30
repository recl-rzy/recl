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
 * @since 2021-10-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "EduScaleSubject对象", description = "")
public class EduScaleSubject implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "量表题目唯一id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "所属量表id")
    private String scaleId;

    @ApiModelProperty(value = "量表测试项排序")
    private Integer subjectSort;

    @ApiModelProperty(value = "评估维度")
    private String dimension;

    @ApiModelProperty(value = "测试项1")
    private String optionOne;

    @ApiModelProperty(value = "测试项1对应分值")
    private Integer optionOneScore;

    @ApiModelProperty(value = "测试项2")
    private String optionTwo;

    @ApiModelProperty(value = "测试项2对应分值")
    private Integer optionTwoScore;

    @ApiModelProperty(value = "测试项3")
    private String optionThree;

    @ApiModelProperty(value = "测试项3对应分值")
    private Integer optionThreeScore;

    @ApiModelProperty(value = "测试项4")
    private String optionFour;

    @ApiModelProperty(value = "测试项4对应分值")
    private Integer optionFourScore;

    @ApiModelProperty(value = "必要因子，评估标准的优先项，满足这一标准即可得出结果，作为特殊筛选的标准(1(true)是判定因子，0（false）非判定因子，默认为false")
    private Boolean essentialFactor;

    @ApiModelProperty(value = "模糊因子，该因子满足一定范围值即可得出结果(1(true)是判定因子，0（false）非判定因子，默认为false）")
    private Boolean vagueFactor;

    @ApiModelProperty(value = "辅助因子，辅助因子和模糊因子类似，但优先级更高，辅助因子会结合心理治疗情况")
    private Boolean auxiliaryFactor;

    @ApiModelProperty(value = "测伪尺度，与粗分或标准分结合判定测试的真伪性（1（true）为测伪尺度,2（false）非测伪尺度）")
    private Boolean pseudoScaleMeasure;

    @ApiModelProperty(value = "测试题目标题")
    private String optionTitle;

    @ApiModelProperty(value = "逻辑删除 1（true）已删除， 0（false）未删除")
    @TableLogic
    private Boolean isDeleted;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;


}
