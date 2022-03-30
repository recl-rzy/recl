package com.ren.eduservice.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: ArticleCommentVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/10 20:10
 * @Vertion: 2019.1
 */

@Data
public class ArticleCommentVo {

    @ApiModelProperty(value = "评论内容")
    private String comment;

    @ApiModelProperty(value = "评论id")
    private String id;

    @ApiModelProperty(value = "用户的唯一id")
    private String userId;

    @ApiModelProperty(value = "用户昵称")
    private String nickName;

    @ApiModelProperty(value = "用户头像")
    private String avatar;

    @ApiModelProperty(value = "评论时间")
    private Date gmtCreate;

    @ApiModelProperty(value = "评论数量")
    private Long commentCount;

    @ApiModelProperty(value = "点赞量")
    private int praiseCount;
}

