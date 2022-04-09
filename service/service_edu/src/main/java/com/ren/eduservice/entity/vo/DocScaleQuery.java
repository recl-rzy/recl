package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: DocScaleQuery
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/14 08:32
 * @Vertion: 2019.1
 */

@Data
public class DocScaleQuery {

    @ApiModelProperty(value = "(0表示正常， 1表示一级预警（测评者有轻微的心理问题），2表示二级预警（测评者有较为严重的心理问题，需要进行心理疏导），3表示三级预警，测评者患有严重心理问题，需要立刻就医治疗)")
    private Integer warningLevel;

    @ApiModelProperty(value = "创建时间")
    private String start;

    @ApiModelProperty(value = "创建时间")
    private String end;

}

