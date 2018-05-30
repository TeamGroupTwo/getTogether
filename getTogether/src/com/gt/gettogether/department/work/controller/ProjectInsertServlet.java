package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.ProjectService;
import com.gt.gettogether.department.work.model.vo.Project;

@WebServlet("/insert.pj")
public class ProjectInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProjectInsertServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pTitle = request.getParameter("pTitle");
		String dCode = request.getParameter("dCode");
		
		Project pj = new Project();
		
		pj.setpTitle(pTitle);
		pj.setdCode(dCode);
		
		int result = new ProjectService().insertProject(pj);
		
		if(result < 1) {
			request.getRequestDispatcher("views/department/error.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
