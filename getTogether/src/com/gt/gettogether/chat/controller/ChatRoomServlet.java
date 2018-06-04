package com.gt.gettogether.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		// 참여할 방 이름
		String room = request.getParameter("chatRoom");
		
		// 사용자의 채팅id 받아오기
		HttpSession session = request.getSession();
		session.setAttribute("chat_id", request.getParameter("name"));
		
		// 기존에 있던 채팅방 리스트 가져오기
		ServletContext application = request.getServletContext();
		ArrayList<String> roomList = (ArrayList<String>)application.getAttribute("roomList");
		
		// 정상적으로 등록하여 방 리스트가 갱신되었다면 채팅방으로 jsp 전달하기
		if(!roomList.isEmpty()){
			request.setAttribute("room", room);
			request.getRequestDispatcher("views/common/header.jsp").forward(request, response);
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
