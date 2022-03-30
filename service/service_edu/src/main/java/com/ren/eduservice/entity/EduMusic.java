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
 * @since 2021-10-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "EduMusic对象", description = "")
public class EduMusic implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "忆心Music记录唯一id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "上传用户的id")
    private String userId;

    @ApiModelProperty(value = "音频文件对应url")
    private String musicUrl;

    @ApiModelProperty(value = "音频封面")
    private String cover;

    @ApiModelProperty(value = "音频对应心情")
    private String musicMood;

    @ApiModelProperty(value = "音频访问量")
    private Integer viewCount;

    @ApiModelProperty(value = "音频评论量")
    private Integer commCount;

    @ApiModelProperty(value = "音频收藏量")
    private Integer collectCount;

    @ApiModelProperty(value = "音频个性签名")
    private String sign;

    @ApiModelProperty(value = "音频标题")
    private String title;

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
