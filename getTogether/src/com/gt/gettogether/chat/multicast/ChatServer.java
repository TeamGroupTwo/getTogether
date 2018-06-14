package com.gt.gettogether.chat.multicast;

import java.io.IOException;
import java.util.*;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.gt.gettogether.chat.model.vo.ChatRoom;

import static com.gt.gettogether.chat.controller.EnterChatRoomServlet.roomList;

@ServerEndpoint(value="/chatServer/{chatRoom}", configurator=GetHttpSessionConfigurator.class)
public class ChatServer {
	
   private static Map<String, Set<Session>> chatRooms
     = (Map<String,Set<Session>>)Collections.synchronizedMap(new HashMap<String, Set<Session>>());
   
   public static Set<Session> getUserList(String room){
	   Set<Session> userList = chatRooms.get(room);
       
       if(userList == null) {
          userList = Collections.synchronizedSet(new HashSet<Session>());
          chatRooms.put(room, userList);
       }
       return userList; 
    }

    @OnOpen
    public void onOpen(EndpointConfig config, Session session, @PathParam("chatRoom") String room) throws IOException {
    	
       session.getUserProperties().put("room", room);
      
       Set<Session> userList = getUserList(room);
       
       userList.add(session);
       
       ChatRoom roomInfo = null;
       for(ChatRoom r : roomList) {
     	  if(r.getRoomName().equals(room)) {
     		  roomInfo = r;
     		  String content = roomInfo.getChatContent();
     		  if (content != null)
     			 session.getBasicRemote().sendText(content);
     	  }
       }
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
    	
      String room = (String) session.getUserProperties().get("room");
      Set<Session> userList = getUserList(room);
      
      ChatRoom roomInfo = null;
      for(ChatRoom r : roomList) {
    	  if(r.getRoomName().equals(room)) {
    		  roomInfo = r;
    		  roomList.remove(r);
    		  String content = roomInfo.getChatContent();
    		  content = (content == null) ? message : content+"\\n"+message;
    		  roomInfo.setChatContent(content);
    		  roomList.add(roomInfo);
    	  }
      }
		
      userList.stream().forEach( x -> {
    	  try {
        	if(!x.equals(session))
               x.getBasicRemote().sendText(message);
         } catch (IOException e) {
            e.printStackTrace();
         }
      });
    }
    
    @OnClose
    public void onClose(Session session) {
       String room = (String)session.getUserProperties().get("room");
       Set<Session> userList = getUserList(room);
       userList.remove(session);
      
    }
    
    @OnError
    public void onError(Throwable e) {
       //e.printStackTrace();
    }
}