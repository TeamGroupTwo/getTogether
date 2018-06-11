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

@WebServlet("/findId.emp")
public class EmployeeFindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmployeeFindId() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int empNo = Integer.parseInt(request.getParameter("empNo"));
		String empName = request.getParameter("empName");
		String email = request.getParameter("email");
		
		Employee emp = new Employee();
		emp.seteNo(empNo);
		emp.seteName(empName);
		emp.setEmail(email);
		
		emp = new EmployeeService().findId(emp);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(emp, response.getWriter());
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
