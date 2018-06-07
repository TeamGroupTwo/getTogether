package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.WorkService;
import com.gt.gettogether.department.work.model.vo.Work;

@WebServlet("/updateView.wo")
public class WorkUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkUpdateViewServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int wNo = Integer.parseInt(request.getParameter("wNo"));
		WorkService wService = new WorkService(); 
		
		Work result = wService.selectOneWork(wNo);
		
		String page = "";
		if(result != null) {
			
			String pTitle = wService.selectPtitle(result.getpNo());
			
			page = "views/department/work/workUpdate.jsp";
			request.setAttribute("work", result);
			request.setAttribute("pTitle", pTitle);
			
		} else {
			page = "views/department/deptError.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
