package com.gt.gettogether.employee.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.employee.model.service.EmployeeService;
import com.gt.gettogether.employee.model.vo.*;


@WebServlet("/esearch.do")
public class EmployeeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public EmployeeSearch() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String condition = request.getParameter("con");
		String keyword = request.getParameter("keyword");
		
		System.out.println("받아온 상태 값 : " + condition);
		System.out.println("받아온 키워드 값 : " + keyword);
		
		
		EmployeeService eService = new EmployeeService();
		
		ArrayList<Employee> list = new EmployeeService().searchEmployee(condition, keyword);
		
		String page = "";
		if(list != null){
			page="views/admin/adminAuthority.jsp";
			request.setAttribute("list", list);
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
