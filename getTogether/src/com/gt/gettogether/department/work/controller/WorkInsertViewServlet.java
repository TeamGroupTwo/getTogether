package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.WorkService;

@WebServlet("/insertView.wo")
public class WorkInsertViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WorkInsertViewServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int loginNo = Integer.parseInt(request.getParameter("loginNo"));
		String loginName = request.getParameter("loginName");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		String pTitle = new WorkService().selectPtitle(pNo);
		
		String page="";
		if(pTitle != null) {
			
			page = "views/department/work/workInsert.jsp";
			request.setAttribute("loginNo", loginNo);
			request.setAttribute("loginName", loginName);
			request.setAttribute("pNo", pNo);
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
