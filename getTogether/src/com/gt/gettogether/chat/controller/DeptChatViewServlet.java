package com.gt.gettogether.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.gt.gettogether.chat.model.vo.ChatRoom;
import static com.gt.gettogether.chat.controller.EnterChatRoomServlet.roomList;

@WebServlet("/deptroomView.do")
public class DeptChatViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeptChatViewServlet() {super();}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자 부서 받아옴
		String dept = request.getParameter("dept");
		ChatRoom room = null;
		
		if(roomList == null || roomList.isEmpty()){
			roomList = new ArrayList<ChatRoom>();
			
			room = new ChatRoom(dept, new ArrayList<String>(), new ArrayList<String>());
			roomList.add(room);
			
			new Gson().toJson(room, response.getWriter());
			
		} else {
			boolean chk = true;
			for(ChatRoom c : roomList) {
				if(c.getRoomName().equals(dept)) {
					room = c;
					chk = false;
					break;
				}
			}
			if(chk) {		// 부서 채팅방이 없으면 다시 추가하는 코드
				room = new ChatRoom(dept, new ArrayList<String>(), new ArrayList<String>());
				roomList.add(room);
			}
			
			new Gson().toJson(room, response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}