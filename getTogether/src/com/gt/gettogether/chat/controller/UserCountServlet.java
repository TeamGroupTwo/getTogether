package com.gt.gettogether.chat.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/userCount.do")
public class UserCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserCountServlet() {
        super();}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("name");
		
		ServletContext application = request.getServletContext();
		
		Set<String> userList = (HashSet<String>)application.getAttribute("userList");
		if(userList==null || userList.isEmpty())userList = new HashSet<String>();
		
		userList.add(user);
		int userCount = userList.size();
		
		new Gson().toJson(userCount, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
