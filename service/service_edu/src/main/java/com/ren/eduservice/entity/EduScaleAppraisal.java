package com.ren.eduservice.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.math.BigDecimal;
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
@ApiModel(value = "EduScaleAppraisal对象", description = "")
public class EduScaleAppraisal implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "量表评估原则")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "所属量表id")
    private String scaleId;

    @ApiModelProperty(value = "评估维度")
    private String dimension;

    @ApiModelProperty(value = "评分上限")
    private BigDecimal upperLimit;

    @ApiModelProperty(value = "评分下限(下限不得低于0， 即不能为负数)")
    private BigDecimal lowerLimit;

    @ApiModelProperty(value = "测评结果")
    private String appraisalResult;

    @ApiModelProperty(value = "总初分转标准分所需系数(默认为1)")
    private BigDecimal coefficient;

    @ApiModelProperty(value = "必要判定因子的判断项（1（true）是必要判定因子，2（false）非必要判定因子，默认为false）")
    private Boolean essentialFactorAppraisal;

    @ApiModelProperty(value = "模糊判定因子的判断项（1（true）是模糊判定因子项，2（false）非模糊判定因子项，默认为false）")
    private Boolean vagueFactorAppraisal;

    @ApiModelProperty(value = "辅助因子的判断项（1（true）是辅助因子项，2（false）非辅助因子项，默认为false）")
    private Boolean auxiliaryFactorAppraisal;

    @ApiModelProperty(value = "测伪尺度，与粗分或标准分结合判定测试的真伪性（1（true）为测伪尺度,2（false）非测伪尺度）")
    private Boolean pseudoScaleAppraisal;

    @ApiModelProperty(value = "评估优先级别，值越小优先级别越高，最高为1级，量表评估过程按优先级进行依次评估")
    private Integer appraisalPriority;

    @ApiModelProperty(value = "(0表示正常， 1表示一级预警（测评者有轻微的心理问题），2表示二级预警（测评者有较为严重的心理问题，需要进行心理疏导），3表示三级预警，测评者患有严重心理问题，需要立刻就医治疗)")
    private Integer warningLevel;

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
