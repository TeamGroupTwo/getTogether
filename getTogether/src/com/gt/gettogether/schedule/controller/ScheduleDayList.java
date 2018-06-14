package com.gt.gettogether.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.gt.gettogether.schedule.model.service.ScheduleService;
import com.gt.gettogether.schedule.model.vo.Schedule;

@WebServlet("/schedule_dayli.do")
public class ScheduleDayList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ScheduleDayList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int eNo = Integer.parseInt(request.getParameter("empNo"));
		String sDate = request.getParameter("daydate");
		System.out.println("day Å¬¸¯ ½Ã " + eNo + " : " + sDate);
		
		ArrayList<Schedule> list = new ScheduleService().selectDayList(eNo , sDate);
				
		System.out.println("¼­ºí·¿±îÁö¿È" + list);
		
		JSONArray result = new JSONArray();
		JSONObject userlist = null;
		for(Schedule user : list){
			userlist = new JSONObject();
			userlist.put("sNo",user.getsNo());
			userlist.put("sTitle",user.getsTitle());
			userlist.put("sColor", user.getsColor());
			result.add(userlist);
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(result.toJSONString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
