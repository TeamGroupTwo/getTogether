package com.gt.gettogether.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.employee.model.service.EmployeeService;
import com.gt.gettogether.employee.model.vo.Employee;


@WebServlet("/roomView.do")
public class MulticastViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 현재 열려있는 채팅방의 명칭()
	public static ArrayList<String> roomList;

    public MulticastViewServlet() {super();}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dept = request.getParameter("dept");
		
		//방의 리스트를 서버 내의 모두가 공유하기 위해서 
		ServletContext application = request.getServletContext();
		
		// 기존에 있던 방의 리스트를 받아옴
		roomList = (ArrayList<String>)application.getAttribute("roomList");
		
//		System.out.println(roomList);
		if(roomList==null || roomList.isEmpty()){
			roomList = new ArrayList<String>();
			
			if(dept=="회계부")roomList.add("회계부");
			else if(dept=="인사부")roomList.add("인사부");
			else if(dept=="전략기획부")roomList.add("전략기획부");
			else if(dept=="영업부")roomList.add("영업부");
			else if(dept=="인사부")roomList.add("인사부");
			else if(dept=="개발부")roomList.add("개발부");
			else roomList.add("법무부");
			
			application.setAttribute("roomList", roomList);
//			System.out.println(roomList);
		}
		if(!roomList.isEmpty()) request.getRequestDispatcher("common/header.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}