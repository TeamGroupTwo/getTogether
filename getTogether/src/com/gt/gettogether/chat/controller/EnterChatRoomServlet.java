package com.gt.gettogether.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.gt.gettogether.chat.model.vo.ChatRoom;

/**
 * Servlet implementation class NewchatRoomServlet
 */
@WebServlet("/enterRoom.do")
public class EnterChatRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static ArrayList<ChatRoom> roomList;
	private boolean chatOn;
	
    public EnterChatRoomServlet() {
        super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String room = request.getParameter("chatRoom");
		String user = request.getParameter("name");
		
		if(roomList == null) roomList = new ArrayList<ChatRoom>();
		
		if(room.equals("newRoom")){
			String roomName = request.getParameter("newRoom");
			String chatMember = request.getParameter("chatMember");
			user = chatMember.split(" ")[0];
			
			// 이미 존재하는 방 제목인지 확인
			if(roomNameCheck(roomList, roomName)) {
				System.out.println("이미 존재하는 방입니다.");
				new Gson().toJson("error", response.getWriter());
				return;
			}
			ChatRoom chatRoom = new ChatRoom(roomName, new ArrayList<String>(Arrays.asList(chatMember.split(" "))), new ArrayList<String>());
			roomList.add(chatRoom);
			
			room = roomName;
		}
		
		ChatRoom chatRoom = null;
		
		// 채팅방이 null이면 채팅방 삭제
		for(ChatRoom c : roomList) {
			if(c.getRoomName().equals(room)) {
				// c.getCurrUser().removeAll(Collections.singleton(null));
				chatRoom = c;
				roomList.remove(c);
				break;
			}
		}
		
		// 사용자를 포함하고 있지 않으면 채팅방에 그 사용자를 추가함
		if(!(chatRoom.getCurrUser().contains(user))) chatRoom.getCurrUser().add(user);
		
		roomList.add(chatRoom);
			
		new Gson().toJson(chatRoom, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public boolean roomNameCheck(ArrayList<ChatRoom> roomList, String roomName) {
		boolean result = false;
		
		for(ChatRoom c : roomList) {
			if(c.getRoomName().equals(roomName)) {
				result = true;
				break;
			}
		}
		return result;
	}
}