package com.gt.gettogether.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static com.gt.gettogether.chat.controller.EnterChatRoomServlet.roomList;

import com.google.gson.Gson;
import com.gt.gettogether.chat.model.vo.ChatRoom;

/**
 * Servlet implementation class UserListServlet
 */
@WebServlet("/getUserList.do")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("name");
		String roomName = request.getParameter("roomName");
		String userCode = request.getParameter("userCode");
		
		ChatRoom room = null;
		for(ChatRoom r : roomList) {
			System.out.println("Room all for userList : "+ r);
			if(r.getRoomName().equals(roomName)) {
				room = r;
				System.out.println("Room for userList : "+ room);
				break;
			}
		}
		
		ServletContext application = request.getServletContext();
		
		Set<String> userList = (HashSet<String>)application.getAttribute("userList");
		if(userList==null || userList.isEmpty())userList = new HashSet<String>();
		
		userList.add(user+":"+userCode);
		
		Set<String> outputUserList = new HashSet<String>();
		
		for(String u1 : room.getCurrUser()) {
			for(String u2 : userList) {
				if(u1.equals(u2.split(":")[1]))
					outputUserList.add(u2.split(":")[0]);
			}
		}
		
		application.setAttribute("userList", userList);
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(outputUserList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
