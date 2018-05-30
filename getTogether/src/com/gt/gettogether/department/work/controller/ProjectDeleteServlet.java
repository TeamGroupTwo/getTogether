package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.ProjectService;

@WebServlet("/delete.pj")
public class ProjectDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProjectDeleteServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String chkList = request.getParameter("chkList");

		System.out.println(chkList);
		
//		int result = new ProjectService().deleteProject(chkList);
//		
//		if(result < 1) {
//			request.getRequestDispatcher("views/department/error.jsp");
//		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
