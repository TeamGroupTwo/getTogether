package com.gt.gettogether.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.notice.model.service.NoticeService;
import com.gt.gettogether.notice.model.vo.*;



@WebServlet("/selectList.no")
public class NoticeSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public NoticeSelectListServlet() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		ArrayList<NoticeNFiles> list = null;
		NoticeService nService = new NoticeService();
		// -- 페이지 처리 코드부분 -- //
		
			int startPage; // 한번에 표시 될 게시글들의 시작페이지
			int endPage;   // 한번에 표시 될 게시글들의 마지막페이지
			int maxPage;   // 전체 페이지의 마지막 페이지
			int currentPage; // 현재 페이지
			int limit;       // 한 페이지당 게시글 수
		//  startpage(1)	endpage(10)  	
		// ex) 1 2 3 4..........10 >
			// 게시판은 1 페이지 부터 시작
			currentPage = 1 ;
			
			// 한페이지에 보여질 게시글 수
			limit = 10;
			
			// 만약에 전달 받는 페이지가 있을 경우 즉, 현재 페이지 정보를 받을 경우 currentPage의 값을 수정한다.
			if(request.getParameter("currentPage") != null){
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			// 전체 게시글의 수
			int listCount = nService.getListCount();
			
			System.out.println("총 게시글 수 : "+listCount);
			
			// 총 게시글 수에 대한 페이지 계산
			// Ex) 목록의 수가 만약 123개라면 페이지 수는 13페이지로 나눠져야한다.
			// 10개 씩 묶고 남은 3개의 게시글 역시 하나의 페이지로 취급해야한다.
			// 10/1 --> 0.9 를 더하여 하나의 페이지로 만든다.
					
			maxPage = (int)((double)listCount / limit + 0.9);
			
			// 현재 화면에 표시할 페이지 개수
			// 첫 페이지의 번호
			//Ex) 한 화면에 10개의 페이지를 표시하는 경우
			startPage = (((int)((double)currentPage / limit + 0.9)) -1) * limit +1;
			
			
			// 한 화면에 표시할 마지막 페이지 번호
			endPage = startPage + limit - 1;
			
			
			if(maxPage < endPage){
				endPage = maxPage;
			}
			// 페이지 관련 변수 전달용 VO생성
			PageInfo pi = new PageInfo(currentPage, listCount, limit, startPage, endPage, maxPage);
			
			
			
			// -- 페이지 처리 코드 부분 -- //
		
		
		
		list = nService.selectList(currentPage, limit);
		String page ="";

		
		if(list != null){
			page ="views/notice/noticeList.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
			

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
