package com.gt.gettogether.employee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.gt.gettogether.employee.model.service.EmployeeService;
import com.gt.gettogether.employee.model.vo.Employee;

@WebServlet("/login.emp")
public class EmployeeLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public EmployeeLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String eId = request.getParameter("eId");
		String ePwd = request.getParameter("ePwd");
		
		Employee emp = new Employee();
		emp.seteId(eId);
		emp.setePassword(ePwd);
		
		EmployeeService es = new EmployeeService();
		emp = es.selectEmployee(emp);
	
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(emp, response.getWriter());

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
