package com.ren.chat.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 *
 * </p>
 *
 * @author rzy
 * @since 2021-10-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("chat_msg")
@ApiModel(value = "Msg对象", description = "")
public class ChatMsg implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "聊天记录唯一id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "发送方用户id")
    private String sendUserId;

    @ApiModelProperty(value = "接收方用户id")
    private String receiveUserId;

    @ApiModelProperty(value = "发送内容")
    private String sendText;

    @ApiModelProperty(value = "发送状态（0代表单聊，1表示群聊）")
    private String sendType;

    @ApiModelProperty(value = "逻辑删除 1（true）已删除， 0（false）未删除")
    @TableLogic
    private Boolean isDeleted;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtModified;

}
