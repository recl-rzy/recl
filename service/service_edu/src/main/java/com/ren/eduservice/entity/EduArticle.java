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
 * @since 2021-08-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "EduArticle对象", description = "")
public class EduArticle implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "美文唯一id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "发布用户的唯一id")
    private String userId;

    @ApiModelProperty(value = "美文所属标签1")
    private String oneTag;

    @ApiModelProperty(value = "美文所属标签2")
    private String twoTag;

    @ApiModelProperty(value = "美文所属标签3")
    private String threeTag;

    @ApiModelProperty(value = "美文标题名称")
    private String title;

    @ApiModelProperty(value = "所属分类名称")
    private String articleClassify;

    @ApiModelProperty(value = "美文内容部分")
    private String content;

    @ApiModelProperty(value = "封面图片地址")
    private String cover;

    @ApiModelProperty(value = "访问量")
    private Integer viewCount;

    @ApiModelProperty(value = "收藏量")
    private Integer collectCount;

    @ApiModelProperty(value = "点赞量")
    private Integer praiseCount;

    @ApiModelProperty(value = "审核状态（Draft 表示未审核， Normol表示审核成功）")
    private String status;

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
