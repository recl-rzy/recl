package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: ArticleQuery
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/8/16 10:29
 * @Vertion: 2019.1
 */

@Data
public class ArticleQuery {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "美文标题名称")
    private String title;

    @ApiModelProperty(value = "所属分类名称")
    private String articleClassify;

    @ApiModelProperty(value = "审核状态（Draft 表示未审核， Normol表示审核成功）")
    private String status;

    @ApiModelProperty(value = "创建时间")
    private String gmtCreate;

    @ApiModelProperty(value = "更新时间")
    private String gmtModified;
}

