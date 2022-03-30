package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Description: TODO
 * @ClassName: MusicVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/2 19:38
 * @Vertion: 2019.1
 */

@Data
public class MusicVo {

    @ApiModelProperty(value = "忆心Music记录唯一id")
    private String id;

    @ApiModelProperty(value = "上传用户的id")
    private String userId;

    @ApiModelProperty(value = "音频个性签名")
    private String sign;

    @ApiModelProperty(value = "音频封面")
    private String cover;

    @ApiModelProperty(value = "用户头像")
    private String avatar;

    @ApiModelProperty(value = "音频收藏量")
    private Integer collectCount;

    @ApiModelProperty(value = "音频评论量")
    private Integer commCount;

    @ApiModelProperty(value = "是否收藏")
    private Boolean isCollect = false;

    @ApiModelProperty(value = "音频访问量")
    private Integer viewCount;

    @ApiModelProperty(value = "用户昵称")
    private String nickName;

    @ApiModelProperty(value = "音频文件url")
    private String musicUrl;

    @ApiModelProperty(value = "音频标题")
    private String title;
}

