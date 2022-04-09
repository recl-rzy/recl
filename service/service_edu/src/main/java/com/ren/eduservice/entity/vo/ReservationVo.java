package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: ReservationVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/31 18:09
 * @Vertion: v1.0
 */

@Data
public class ReservationVo {

    @ApiModelProperty(value = "预约记录唯一ID")
    private String id;

    @ApiModelProperty(value = "预约咨询师ID")
    private String counselorId;

    @ApiModelProperty(value = "咨询专家姓名")
    private String counselorName;

    @ApiModelProperty(value = "预约用户ID")
    private String reservationUserId;

    @ApiModelProperty(value = "预约用户姓名")
    private String userName;

    @ApiModelProperty(value = "预约用户手机号")
    private String mobile;

    @ApiModelProperty(value = "咨询方式（0代表电话咨询，1代表线上咨询，2代表线下咨询））")
    private Integer method;

    @ApiModelProperty(value = "咨询方向(0代表人际交往，1代表家庭关系，2代表职场竞争，3代表感情恋爱，4代表情绪管理，5代表心理治疗）")
    private Integer direction;

    @ApiModelProperty(value = "曾经是否接受心理治疗（0代表false，1代表true）")
    private Boolean previous;

    @ApiModelProperty(value = "咨询备注")
    private String remark;

    @ApiModelProperty(value = "处理结果")
    private String dealResult;

    @ApiModelProperty(value = "逻辑删除字段（0代表false，1代表true）")
    @TableLogic
    private Boolean isDeleted;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;
}
