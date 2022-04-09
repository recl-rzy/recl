package com.ren.chat.service.impl;

import com.alibaba.fastjson.JSON;
import com.ren.chat.controller.MsgPushSocket;
import com.ren.chat.entity.ChatMsg;
import com.ren.chat.entity.vo.PushMsg;
import com.ren.chat.mapper.MsgMapper;
import com.ren.chat.service.MsgService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author RZY
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

    @Override
    public void pushReservationMsg(String userId) {

        MsgPushSocket socket = MsgPushSocket.getWebSocketSet().get(userId);
        if(socket != null) {
            PushMsg msg = new PushMsg();
            msg.setPushTime(new Date());
            msg.setUserId(userId);
            msg.setTitle("预约提醒");
            msg.setMessage("尊敬的用户：专家稍后将主动联系你,请耐心等待！");
            try {
                socket.sendMessage(JSON.toJSONString(msg));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public boolean applyForChat(String userId, String msg) {

        MsgPushSocket socket = MsgPushSocket.getWebSocketSet().get(userId);
        if(socket != null) {
            try {
                socket.sendMessage(msg);
                return true;
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }
}
