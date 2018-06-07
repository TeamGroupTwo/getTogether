package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.department.work.model.service.WorkCommentService;
import com.gt.gettogether.department.work.model.service.WorkService;
import com.gt.gettogether.department.work.model.vo.Work;
import com.gt.gettogether.department.work.model.vo.WorkComment;


@WebServlet("/selectList.wo")
public class WorkSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkSelectListServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pNo;
		if(request.getParameter("pNo") == null) {
			pNo = (int) request.getAttribute("pNo");
		} else {
			pNo = Integer.parseInt(request.getParameter("pNo"));
		}

		String pTitle;
		if(request.getParameter("pTitle") == null) {
			pTitle = (String)request.getAttribute("pTitle");
		} else {
			pTitle = request.getParameter("pTitle");
		}
		
		int eNo;
		if(request.getParameter("eNo") == null) {
			eNo = (int) request.getAttribute("eNo");
		} else {
			eNo = Integer.parseInt(request.getParameter("eNo"));
		}
		
		ArrayList<Work> workList = new WorkService().selectWorkList(pNo);
		
		String page = "";
		if(workList != null) {
			
			HashMap<Integer, ArrayList<WorkComment>> workCommentList = new HashMap<Integer, ArrayList<WorkComment>>();
			ArrayList<WorkComment> wcList = null;
			for(Work w : workList) {

				wcList = new WorkCommentService().selectWorkCommentList(w.getwNo());
				
				workCommentList.put(w.getwNo(), wcList);
				
			}
			
			page = "views/department/work/workList.jsp";
			request.setAttribute("workList", workList);
			request.setAttribute("pNo", pNo);
			request.setAttribute("pTitle", pTitle);
			request.setAttribute("eNo", eNo);
			request.setAttribute("workCommentList", workCommentList);
			
		} else {
			page = "views/department/deptError.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
