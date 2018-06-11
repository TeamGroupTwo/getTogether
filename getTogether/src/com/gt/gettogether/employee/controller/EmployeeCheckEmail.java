package com.gt.gettogether.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.gt.gettogether.employee.model.service.EmployeeService;

@WebServlet("/checkEmail.emp")
public class EmployeeCheckEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public EmployeeCheckEmail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		int eCnt = new EmployeeService().checkEmail(email);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(eCnt, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
