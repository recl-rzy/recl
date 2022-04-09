package com.ren.chat.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ren.chat.client.AclUserClient;
import com.ren.chat.entity.ChatMsg;
import com.ren.chat.entity.ChatStatus;
import com.ren.chat.service.MsgService;
import com.ren.chat.util.EmojiFilter;
import com.ren.commonutils.RedisUtils;
import com.ren.servicebase.exceptionhandler.ReclException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Description: TODO
 * @ClassName: WebSocketController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/10/24 20:08
 * @Vertion: 2019.1
 */

@Controller
@ServerEndpoint(value = "/websocket/{sendUserId}/{receiveUserId}")
public class ChatWebSocket {

    // 这里使用静态，让 service 属于类
    private static MsgService msgService;

    @Autowired
    AclUserClient aclUserClient;

    // 注入的时候，给类的 service 注入
    @Autowired
    public void setChatService(MsgService msgService) {
        ChatWebSocket.msgService = msgService;
    }

    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    private static ConcurrentHashMap<String, ChatWebSocket> webSocketSet = new ConcurrentHashMap<String, ChatWebSocket>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session WebSocketSession;
    //当前发消息的人员编号
    private String sendUserId = "";
    //当前接收消息的人员编号
    private String receiveUserId = "";



    /**
     * 连接建立成功调用的方法
     * <p>
     * session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(@PathParam(value = "sendUserId") String param1, @PathParam(value = "receiveUserId") String param2, Session WebSocketSession) {
        sendUserId = param1;//接收到发送消息的人员编号
        receiveUserId = param2;
        this.WebSocketSession = WebSocketSession;

        String sendUserIdentity = aclUserClient.getAclIdentity(sendUserId);
        if(StringUtils.isEmpty(sendUserIdentity)) {

            throw new ReclException(20001, "当前用户不存在");
        } else if(sendUserIdentity.equals("user")) {

            //获取咨询师的聊天状态
            ChatStatus chatStatus = (ChatStatus)RedisUtils.get(receiveUserId);
            if(StringUtils.isEmpty(chatStatus)) {

                throw new ReclException(20001, "咨询师已下线");
            } else if (chatStatus.getStatus().equals(0)) {

                chatStatus.setStatus(1);
                chatStatus.setChatUserId(sendUserId);
                RedisUtils.set(receiveUserId, chatStatus);
                webSocketSet.put(param1, this);//加入map中
                addOnlineCount();     //在线数加1
                System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
            }
        } else {

            ChatStatus chatStatus = new ChatStatus();
            chatStatus.setUserId(sendUserId);
            chatStatus.setStatus(0);
            chatStatus.setIdentity(sendUserIdentity);
            RedisUtils.set(sendUserId, chatStatus);
            webSocketSet.put(param1, this);//加入map中
            addOnlineCount();     //在线数加1
            System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
        }
    }


    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        if (!sendUserId.equals("")) {
            webSocketSet.remove(sendUserId); //从set中删除
            subOnlineCount();     //在线数减1
            RedisUtils.del(sendUserId);
            System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
        }
    }


    /**
     * 收到客户端消息后调用的方法
     *
     * @param chatMsg 客户端发送过来的消息
     * @param session 可选的参数
     */
    @SuppressWarnings("unused")
    @OnMessage
    public void onMessage(String chatMsg, Session session) {
        JSONObject jsonObject = JSONObject.parseObject(chatMsg);
        //给指定的人发消息
        sendToUser(jsonObject.toJavaObject(ChatMsg.class));
        //sendAll(message);
    }


    /**
     * 给指定的人发送消息
     *
     * @param chatMsg 消息对象
     */
    public void sendToUser(ChatMsg chatMsg) {
        System.out.println(chatMsg);
        String receiveUserId = chatMsg.getReceiveUserId();
        String sendMessage = EmojiFilter.filterEmoji(chatMsg.getSendText());//过滤输入法输入的表情
        chatMsg.setSendText(sendMessage);

        msgService.addChatMsg(chatMsg);
        try {
            if (webSocketSet.get(receiveUserId) != null) {
                HashMap<String, Object> map = new HashMap<>();
                map.put("chatMsg", chatMsg);
                map.put("receiveUserStatus", true);
                String jsonString = JSON.toJSONString(map);
                webSocketSet.get(receiveUserId).sendMessage(jsonString);
            } else {

                HashMap<String, Object> map = new HashMap<>();
                map.put("receiveUserStatus", false);
                String jsonString = JSON.toJSONString(map);
                webSocketSet.get(sendUserId).sendMessage(jsonString);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取接收方的个人状态
     *
     * @param sendUserId 发送消息用户id
     */
    public void sendToUser(String sendUserId, Boolean receiveUserStatus) {

        try {

            HashMap<String, Object> map = new HashMap<>();
            map.put("receiveUserStatus", receiveUserStatus);
            String jsonString = JSON.toJSONString(map);
            webSocketSet.get(sendUserId).sendMessage(jsonString);
        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    /**
     * 给所有人发消息
     *
     * @param message
     */
    private void sendAll(String message) {
        String sendMessage = message.split("[|]")[1];
        //遍历HashMap
        for (String key : webSocketSet.keySet()) {
            try {
                //判断接收用户是否是当前发消息的用户
                if (!sendUserId.equals(key)) {
                    webSocketSet.get(key).sendMessage(sendMessage);
                    System.out.println("key = " + key);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * 发生错误时调用
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        error.printStackTrace();
    }


    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     *
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException {
        this.WebSocketSession.getBasicRemote().sendText(message);
        //this.session.getAsyncRemote().sendText(message);
    }


    public static synchronized int getOnlineCount() {
        return onlineCount;
    }


    public static synchronized void addOnlineCount() {
        ChatWebSocket.onlineCount++;
    }


    public static synchronized void subOnlineCount() {
        ChatWebSocket.onlineCount--;
    }
}

