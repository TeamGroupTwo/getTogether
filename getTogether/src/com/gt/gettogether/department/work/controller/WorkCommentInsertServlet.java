package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.WorkCommentService;
import com.gt.gettogether.department.work.model.service.WorkService;
import com.gt.gettogether.department.work.model.vo.WorkComment;

@WebServlet("/insert.wc")
public class WorkCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkCommentInsertServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String wcWriter = request.getParameter("wcWriter");
		String wcContent = request.getParameter("wcContent");
		int wNo = Integer.parseInt(request.getParameter("wNo"));
		int eNo = Integer.parseInt(request.getParameter("eNo"));
		
		WorkComment wc = new WorkComment();
		
		wc.setWcWriter(wcWriter);
		wc.setWcContent(wcContent);
		wc.setwNo(wNo);
		wc.seteNo(eNo);
		
		WorkCommentService wcService = new WorkCommentService();
		
		int result = wcService.insertWorkComment(wc);
		
		String page = "";
		if(result > 0) {
			
			int wcNo = wcService.selectInsertOne(eNo);
			
			if(wcNo > 0) {
				response.getWriter().print(wcNo);
			} else {
				page = "views/department/deptError.jsp";
				request.setAttribute("msg", "코멘트 넘버를 가져오지 못함");
			}
			
		} else {
			page = "views/department/deptError.jsp";
			request.setAttribute("msg", "코멘트 인서트가 안됨");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}








