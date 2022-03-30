package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: ArticleVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/10 16:38
 * @Vertion: 2019.1
 */

@Data
public class ArticleVo {

    @ApiModelProperty(value = "美文唯一id")
    private String id;

    @ApiModelProperty(value = "发布用户的唯一id")
    private String userId;

    @ApiModelProperty(value = "用户头像")
    private String avatar;

    @ApiModelProperty(value = "用户昵称")
    private String nickName;

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
    private Long viewCount;

    @ApiModelProperty(value = "点赞量")
    private Long praiseCount;

    @ApiModelProperty(value = "收藏量")
    private Long collectCount;

    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;

    @ApiModelProperty(value = "评论数量")
    private Long commentCount;

}

