package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: ArticlePageVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/11/7 16:00
 * @Vertion: 2019.1
 */

@Data
public class ArticlePageVo {

    @ApiModelProperty(value = "美文唯一id")
    private String id;

    @ApiModelProperty(value = "作者id")
    private String userId;

    @ApiModelProperty(value = "作者昵称")
    private String nickName;

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

    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;
}

