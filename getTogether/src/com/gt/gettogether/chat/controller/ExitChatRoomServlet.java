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
/**
 * Servlet implementation class ExitChatRoomServlet
 */
@WebServlet("/exitChatRoom.do")
public class ExitChatRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExitChatRoomServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roomName = request.getParameter("roomName");
		String user = request.getParameter("user");
		String dept = request.getParameter("dept");
		ChatRoom chatRoom = null;
		
		ArrayList<ChatRoom> roomList_clone = (ArrayList<ChatRoom>)roomList.clone(); 
		
		//ConcurrentModificationException 해결
		for(ChatRoom c : roomList) {
			if(c.getRoomName().equals(roomName)) {
				if(c.size() == 1 && !c.getRoomName().equals(dept)) {
					roomList_clone.remove(c);
				}
				else {
					c.getCurrUser().remove(user);
					c.getAllUser().remove(user); 
				}
				
				chatRoom = c;
			}
		}
		
		roomList = roomList_clone;
		
		new Gson().toJson(chatRoom, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
