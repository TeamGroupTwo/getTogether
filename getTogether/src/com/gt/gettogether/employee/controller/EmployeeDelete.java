package com.gt.gettogether.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.employee.model.service.EmployeeService;


@WebServlet("/elistdel.do")
public class EmployeeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmployeeDelete() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String chklist = request.getParameter("chklist");
		
		String dellist = chklist.substring(2, chklist.length()-2);
		
		String[] dellist2 = dellist.split("\",\"");
		
		System.out.println("dellist2 : "+dellist2);
		
		int result = new EmployeeService().deleteEmployee(dellist2);
		
		response.getWriter().print(result);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
