package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.WorkService;

@WebServlet("/delete.wo")
public class WorkDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkDeleteServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int wNo = Integer.parseInt(request.getParameter("wNo"));
		
		int result = new WorkService().deleteWork(wNo);
		
		if(result < 1) {
			request.setAttribute("msg", "work삭제 에러");
			request.getRequestDispatcher("views/department/deptError.jsp").forward(request, response);
		} else {
			response.getWriter().print(result);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
