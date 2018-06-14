package com.gt.gettogether.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static com.gt.gettogether.chat.controller.EnterChatRoomServlet.roomList;

import com.google.gson.Gson;
import com.gt.gettogether.chat.model.vo.ChatRoom;

@WebServlet("/chatRoom.do")
public class ChatRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatRoomServlet() {super();}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 사용자의 이름 받아오기
		String user = request.getParameter("user");
		
		ArrayList<ChatRoom> myRoomList = new ArrayList<ChatRoom>();
		
		// 채팅방 참여자 중 본인이 해당하는 채팅방의 리스트 선별
		for(ChatRoom c : roomList) {
			if(c.getAllUser().contains(user)) myRoomList.add(c);
		}
		
		// 채팅방이 없다면 none을 반환
		if(myRoomList.isEmpty()){
			new Gson().toJson("none", response.getWriter());
		} else {
			new Gson().toJson(myRoomList, response.getWriter());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
