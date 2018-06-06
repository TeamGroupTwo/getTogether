package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insert.wc")
public class WorkCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkCommentInsertServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String wcWriter = request.getParameter("wcWriter");
		String wcContent = request.getParameter("wcContent");
		int wNo = Integer.parseInt(request.getParameter("wNo"));
		int eNo = Integer.parseInt(request.getParameter("eNo"));
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
