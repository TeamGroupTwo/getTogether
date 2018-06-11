package com.gt.gettogether.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.notice.model.service.NoticeService;
import com.gt.gettogether.notice.model.vo.NoticeNFiles;
import com.gt.gettogether.notice.model.vo.PageInfo;


@WebServlet("/selectList.no")
public class NoticeSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public NoticeSelectListServlet() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		ArrayList<NoticeNFiles> list = new NoticeService().selectList();
		
		System.out.println("서블릿 단 출력값 확인용  : "+list);
		
		String page = "";
		
		if(list != null){
			page = "views/notice/noticeList.jsp";
			request.setAttribute("list", list);
		}
		
		request.getRequestDispatcher(page).forward(request, response);
			

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
