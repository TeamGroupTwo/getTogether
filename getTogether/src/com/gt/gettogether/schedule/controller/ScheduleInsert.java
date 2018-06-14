package com.gt.gettogether.schedule.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.schedule.model.service.ScheduleService;
import com.gt.gettogether.schedule.model.vo.Schedule;

/**
 * Servlet implementation class ScheduleInsert
 */
@WebServlet("/schedule_in.do")
public class ScheduleInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int eNo = Integer.parseInt(request.getParameter("empNo"));
		String title = request.getParameter("sTitle");
		String content = request.getParameter("sContent");
		String time = request.getParameter("sTime");
		String color = request.getParameter("sColor");
		String sDate = request.getParameter("sDate");
		SimpleDateFormat bFormat = new SimpleDateFormat("yyyymmdd");
		SimpleDateFormat aFormat = new SimpleDateFormat("yyyy-mm-dd");
		java.util.Date tempDate = null;
		try{
			tempDate = bFormat.parse(sDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String transDate = aFormat.format(tempDate);
		Date d = Date.valueOf(transDate);
		
		System.out.println("d : " + d);
		
		System.out.println("ㅇㅇ  : " + bFormat);
		System.out.println("------------------------------");
		System.out.println("사 원 은 ? : " + eNo);
		System.out.println("제 목 은 ? : " + title);
		System.out.println("내 용 은 ? : " + content);
		System.out.println("시 간 은 ? : " + time);
		System.out.println("색 깔 은 ? : " + color);
		System.out.println("날 짜 는 ? : " + sDate);
		System.out.println("------------------------------");

		
		Schedule s = new Schedule();
		
		
		s.setsTitle(title);
		s.setsContent(content);
		s.setsColor(color);
		s.setsTime(time);
		s.setsDate(d);
		s.seteNo(eNo);

		int result = new ScheduleService().insertSchedule(s);
		
		System.out.println("서블렛으로 돌와왓다 result : " + result);
		
		System.out.println(s.geteNo());
		System.out.println(s.getsTitle());
		System.out.println(s.getsContent());
		System.out.println(s.getsTime());
		System.out.println(s.getsColor());
		System.out.println(s.getsDate());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
