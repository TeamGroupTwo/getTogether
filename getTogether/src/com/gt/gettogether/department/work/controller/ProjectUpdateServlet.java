package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.ProjectService;

@WebServlet("/update.pj")
public class ProjectUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProjectUpdateServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String upTitle = request.getParameter("upTitle");
		
		int result = new ProjectService().updateProject(pNo, upTitle);
		
		if(result < 1) {
			request.getRequestDispatcher("views/department/error.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
