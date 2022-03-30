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
 * @since 2021-09-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "EduScaleEvaluate对象", description = "")
public class EduScaleEvaluate implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "量表评分表唯一id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    private String userId;

    @ApiModelProperty(value = "所属量表唯一id")
    private String scaleId;

    @ApiModelProperty(value = "量表易懂性评分")
    private int understandAbility;

    @ApiModelProperty(value = "量表建议实用性评分")
    private int practiceAbility;

    @ApiModelProperty(value = "量表易懂性评分")
    private int accuracyAbility;

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
