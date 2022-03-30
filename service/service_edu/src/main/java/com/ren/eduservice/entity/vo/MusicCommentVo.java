package com.ren.eduservice.entity.vo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Description: TODO
 * @ClassName: MusicCommentVo
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/25 17:29
 * @Vertion: 2019.1
 */
@Data
public class MusicCommentVo {

    @ApiModelProperty(value = "忆心音乐评论id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "音频文件所属id")
    private String musicId;

    @ApiModelProperty(value = "评论用户的id")
    private String userId;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "评论内容")
    private String comment;

    @ApiModelProperty(value = "逻辑删除 1（true）已删除， 0（false）未删除")
    @TableLogic
    private Boolean isDeleted;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;
}

