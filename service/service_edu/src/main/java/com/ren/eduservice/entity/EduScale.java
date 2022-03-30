package com.ren.eduservice.entity;

import java.math.BigDecimal;

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
 * @since 2021-08-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "EduScale对象", description = "")
public class EduScale implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "心理测试量表唯一id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "发布相关测试的用户唯一id")
    private String userId;

    @ApiModelProperty(value = "测试量表二级分类的唯一id")
    private String classifyId;

    @ApiModelProperty(value = "测试量表一级分类的唯一id")
    private String classifyParentId;

    @ApiModelProperty(value = "测试量表标题")
    private String title;

    @ApiModelProperty(value = "量表测试所需费用")
    private BigDecimal price;

    @ApiModelProperty
    private Integer scaleCategory;

    @ApiModelProperty(value = "测试量表封面图片路径")
    private String cover;

    @ApiModelProperty(value = "量表购买数量")
    private Integer buyCount;

    @ApiModelProperty(value = "浏览量")
    private Integer viewCount;

    @ApiModelProperty(value = "收藏量")
    private Integer collectCount;

    @ApiModelProperty(value = "量表描述")
    private String description;

    @ApiModelProperty(value = "量表发布情况（Draft代表未发布，Normal代表已发布）")
    @TableField(fill = FieldFill.INSERT)
    private String status;

    @ApiModelProperty(value = "乐观锁")
    @Version
    private Long version;

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
