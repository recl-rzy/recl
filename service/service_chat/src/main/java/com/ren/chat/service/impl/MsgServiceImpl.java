package com.ren.chat.service.impl;

import com.ren.chat.entity.ChatMsg;
import com.ren.chat.mapper.MsgMapper;
import com.ren.chat.service.MsgService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author rzy
 * @since 2021-10-24
 */
@Service
public class MsgServiceImpl extends ServiceImpl<MsgMapper, ChatMsg> implements MsgService {


    @Override
    public void addChatMsg(ChatMsg chatMsg) {

        this.baseMapper.insert(chatMsg);
    }

    @Override
    public List<ChatMsg> getChatMsg(String sendUserId, String receiveUserId) {

        return this.baseMapper.getChatMsg(sendUserId, receiveUserId);
    }
}
