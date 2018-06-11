package com.gt.gettogether.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.notice.model.service.NoticeService;
import com.gt.gettogether.notice.model.vo.NoticeNFiles;;


@WebServlet("/update.no")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public NoticeUpdateServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		System.out.println("nno 값을 알고싶습니다. :" +nno);
		
		NoticeNFiles n = new NoticeNFiles();
		n.setnTitle(title);
		n.setnContent(content);
		n.setnNo(nno);
		
		int result = new NoticeService().updateNotice(n);
		
		String page="";
		if(result > 0){
			page = "views/notice/noticeDetail.jsp";
			request.setAttribute("n", new NoticeService().selectOne(String.valueOf(nno)));
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
		
		
		
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
