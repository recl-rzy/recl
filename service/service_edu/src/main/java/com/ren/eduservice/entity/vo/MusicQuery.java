package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: MusicQuery
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/2 13:16
 * @Vertion: 2019.1
 */

@Data
public class MusicQuery {

    @ApiModelProperty(value = "音频对应心情")
    private String musicMood;

    @ApiModelProperty(value = "音频标题")
    private String title;

    @ApiModelProperty(value = "发布状态")
    private String status;

    @ApiModelProperty(value = "最新")
    private Boolean latest;

    @ApiModelProperty(value = "本月最热")
    private Boolean hot;

    @ApiModelProperty(value = "创建时间")
    private String gmtCreate;

    @ApiModelProperty(value = "更新时间")
    private String gmtModified;
}

