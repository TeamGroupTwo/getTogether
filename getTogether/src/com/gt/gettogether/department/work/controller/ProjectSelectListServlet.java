package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.ProjectService;
import com.gt.gettogether.department.work.model.vo.Project;

@WebServlet("/selectList.pj")
public class ProjectSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProjectSelectListServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Project> pjList = new ProjectService().selectProjectList();
		
		String page = "";
		if(pjList != null) {
			
			page = "views/department/work/workHome.jsp";
			request.setAttribute("pjList", pjList);
			
		} else {
			System.out.println("안되네");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
