package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.WorkCommentService;

@WebServlet("/delete.wc")
public class WorkCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkCommentDeleteServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int wcNo = Integer.parseInt(request.getParameter("wcNo"));
		
		int result = new WorkCommentService().deleteWorkComment(wcNo);
		
		if(result > 0) {
			response.getWriter().print(result);
		} else {
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
