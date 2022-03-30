package com.ren.chat.service;

import com.ren.chat.entity.ChatMsg;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author rzy
 * @since 2021-10-24
 */
public interface MsgService extends IService<ChatMsg> {

    void addChatMsg(ChatMsg chatMsg);

    List<ChatMsg> getChatMsg(String sendUserId, String receiveUserId);
}
