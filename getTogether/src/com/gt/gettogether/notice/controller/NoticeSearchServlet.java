package com.gt.gettogether.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.notice.model.vo.NoticeNFiles;
import com.gt.gettogether.notice.model.service.NoticeService;
import com.gt.gettogether.notice.model.vo.*;


@WebServlet("/searchNotice.no")
public class NoticeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public NoticeSearchServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String condition = request.getParameter("con");
		String keyword = request.getParameter("keyword");
		
		System.out.println("받아온 상태 값 : " + condition);
		System.out.println("받아온 키워드 값 : " + keyword);
		
		
		ArrayList<NoticeNFiles> list = new NoticeService().searchNotice(condition, keyword);
		
		String page = "";
		if(list != null){
			page="views/notice/noticeList.jsp";
			request.setAttribute("list", list);
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
		
		
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
