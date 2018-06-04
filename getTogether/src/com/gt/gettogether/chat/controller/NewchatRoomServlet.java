package com.gt.gettogether.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewchatRoomServlet
 */
@WebServlet("/addRoom.do")
public class NewchatRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static ArrayList<String> roomList;
	
    public NewchatRoomServlet() {
        super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String room = request.getParameter("chatRoom");
		
		ServletContext application = request.getServletContext();
		roomList = (ArrayList<String>)application.getAttribute("roomList");
		
		if(room.equals("newRoom")){
			roomList = new ArrayList<String>();
			
			roomList.add(request.getParameter("createRoom"));
			application.setAttribute("roomList", roomList);
			}
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