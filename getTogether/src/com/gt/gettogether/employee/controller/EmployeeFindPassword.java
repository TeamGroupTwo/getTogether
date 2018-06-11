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

@WebServlet("/findPwd.emp")
public class EmployeeFindPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmployeeFindPassword() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int empNo = Integer.parseInt(request.getParameter("empNo"));
		String empName = request.getParameter("empName");
		String email = request.getParameter("email");
		String empId = request.getParameter("empId");
		
		Employee emp = new Employee();
		emp.seteNo(empNo);
		emp.seteName(empName);
		emp.setEmail(email);
		emp.seteId(empId);
		
		int findPwd = new EmployeeService().findPassword(emp);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(findPwd, response.getWriter());
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
