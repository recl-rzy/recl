package com.ren.chat.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ren.chat.client.AclUserClient;
import com.ren.chat.entity.vo.PushMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Description: TODO
 * @ClassName: MsgPushSocket
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/31 13:41
 * @Vertion: v1.0
 */

@Controller
@ServerEndpoint(value = "/msgPush/{userId}")
public class MsgPushSocket {

    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    private static ConcurrentHashMap<String, MsgPushSocket> webSocketSet = new ConcurrentHashMap<>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session WebSocketSession;
    //当前加入连接的人员编号
    private String userId = "";

    @Autowired
    AclUserClient aclUserClient;

    /**
     * 连接建立成功调用的方法
     * <p>
     * session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(@PathParam(value = "userId") String param1, Session WebSocketSession) {

        userId = param1;//接收到发送消息的人员编号
        this.WebSocketSession = WebSocketSession;
        webSocketSet.put(param1, this);//加入map中
        addOnlineCount();     //在线数加1
        System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
    }


    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {

        if (!StringUtils.isEmpty(userId)) {

            webSocketSet.remove(userId); //从set中删除
            subOnlineCount();     //在线数减1
            System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
        }
    }


    /**
     * 收到客户端消息后调用的方法
     *
     * @param pushMsg 客户端发送过来的消息
     * @param session 可选的参数
     */
    @SuppressWarnings("unused")
    @OnMessage
    public void onMessage(String pushMsg, Session session) {
        JSONObject jsonObject = JSONObject.parseObject(pushMsg);
        //给指定的人发消息
        sendToUser(jsonObject.toJavaObject(PushMsg.class));
        //sendAll(message);
    }


    /**
     * 给指定的人发送消息
     *
     * @param pushMsg 消息对象
     */
    public void sendToUser(PushMsg pushMsg) {

        String toJSONString = JSON.toJSONString(pushMsg);
        try {
            webSocketSet.get(userId).sendMessage(toJSONString);
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
                if (!userId.equals(key)) {
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
        MsgPushSocket.onlineCount++;
    }

    public static ConcurrentHashMap<String, MsgPushSocket> getWebSocketSet() {
        return webSocketSet;
    }

    public static synchronized void subOnlineCount() {
        MsgPushSocket.onlineCount--;
    }
}
