package com.gt.gettogether.employee.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.employee.model.service.EmployeeService;
import com.gt.gettogether.employee.model.vo.Employee;


@WebServlet("/elist.do")
public class EmployeeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EmployeeList() {   }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Employee> list = null;
		
		EmployeeService  eService = new EmployeeService();
		
		list = eService.employeeList();
		
		String page = "";
		
		if(list != null) {
			page = "views/admin/adminAuthority.jsp";
			request.setAttribute("list", list);
			
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
