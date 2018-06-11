package com.gt.gettogether.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.notice.model.service.NoticeService;
import com.gt.gettogether.notice.model.vo.NoticeNFiles;


@WebServlet("/selectOne.no")
public class NoticeSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NoticeSelectOneServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String num = request.getParameter("num");
		
		System.out.println("내가 클릭한 num의 값 : " + num);
		
		
		NoticeNFiles n = new NoticeService().selectOne(num);
		
		String page = "";
		
		if(n != null){
			page ="views/notice/noticeDetail.jsp";
			request.setAttribute("n", n);
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
