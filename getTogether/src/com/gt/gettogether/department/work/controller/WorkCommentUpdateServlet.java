package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.WorkCommentService;
import com.gt.gettogether.department.work.model.vo.WorkComment;

@WebServlet("/update.wc")
public class WorkCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkCommentUpdateServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int wcNo = Integer.parseInt(request.getParameter("wcNo"));
		String wcContent = request.getParameter("wcUpContent");
		
		WorkComment wc = new WorkComment();
		
		wc.setWcNo(wcNo);
		wc.setWcContent(wcContent);
		
		int result = new WorkCommentService().updateWorkComment(wc);
		
		if(result > 0) {
			response.getWriter().print(wcContent);
		} else {
			request.setAttribute("msg", "댓글업뎃에러");
			request.getRequestDispatcher("views/department/deptError.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
