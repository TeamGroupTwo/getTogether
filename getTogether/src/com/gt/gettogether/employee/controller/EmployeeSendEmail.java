package com.gt.gettogether.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.gt.gettogether.employee.mail.Mail;

@WebServlet("/sendEmail.emp")
public class EmployeeSendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmployeeSendEmail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email = request.getParameter("email");
		Mail mail = new Mail();

		String verifyCode = mail.sendEmail(email);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(verifyCode, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
