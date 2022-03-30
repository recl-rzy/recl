package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: DocScaleVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/14 08:54
 * @Vertion: 2019.1
 */

@Data
public class DocScaleVo {

    @ApiModelProperty(value = "记录唯一id")
    private String id;

    @ApiModelProperty(value = "量表id")
    private String scaleId;

    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "测评结果")
    private String appraisalResult;

    @ApiModelProperty(value = "(0表示正常， 1表示一级预警（测评者有轻微的心理问题），2表示二级预警（测评者有较为严重的心理问题，需要进行心理疏导），3表示三级预警，测评者患有严重心理问题，需要立刻就医治疗)")
    private Integer warningLevel;

    @ApiModelProperty(value = "测试量表标题")
    private String title;

    @ApiModelProperty(value = "手机号（账号）")
    private String mobile;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "性别 1 男， 2 女")
    private Integer sex;

    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    private Date gmtModified;
}

