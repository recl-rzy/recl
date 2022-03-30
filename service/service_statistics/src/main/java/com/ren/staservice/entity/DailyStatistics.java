package com.ren.staservice.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author RZY
 * @since 2022-03-26
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="DailyStatistics对象", description="")
public class DailyStatistics implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "日常数据唯一id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "统计日期")
    private String dateCalculated;

    @ApiModelProperty(value = "当天登录用户数量")
    private Integer loginCount=0;

    @ApiModelProperty(value = "当天注册用户数量")
    private Integer registerCount=0;

    @ApiModelProperty(value = "当天量表服务访问量")
    private Integer scaleCount=0;

    @ApiModelProperty(value = "当天音频服务访问量")
    private Integer musicCount=0;

    @ApiModelProperty(value = "当天美文服务访问量")
    private Integer articleCount=0;

    @ApiModelProperty(value = "当天咨询服务访问量")
    private Integer consultCount=0;

    @ApiModelProperty(value = "当天倾听服务访问量")
    private Integer listenCount=0;

    @ApiModelProperty(value = "当天请求次数")
    private Integer requestCount=0;

    @ApiModelProperty(value = "逻辑删除 1（true）已删除， 0（false）未删除")
    @TableLogic
    private Boolean isDeleted;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "修改时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;


}
