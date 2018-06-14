package com.gt.gettogether.chat.multicast;

import java.io.IOException;
import java.util.*;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/chatControllServer", configurator=GetHttpSessionConfigurator.class)
public class ChatControllServer {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	   
    @OnOpen
    public void onOpen(Session session) {
        System.out.println(session);
        clients.add(session);
    }
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
    	System.out.println(message);
        synchronized(clients) {
            for(Session client : clients) {
                if(!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }
    
    @OnError
    public void onError(Throwable e) {
    	System.out.println("사용자가 채팅을 종료합니다.");
    	//e.printStackTrace();
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
    }
}
