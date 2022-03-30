package com.ren.chat.mapper;

import com.ren.chat.entity.ChatMsg;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author rzy
 * @since 2021-10-24
 */
public interface MsgMapper extends BaseMapper<ChatMsg> {

    List<ChatMsg> getChatMsg(String sendUserId, String receiveUserId);
}
