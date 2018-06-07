package com.gt.gettogether.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.gt.gettogether.schedule.model.service.ScheduleService;
import com.gt.gettogether.schedule.model.vo.Schedule;

/**
 * Servlet implementation class ScheduleList
 */
@WebServlet("/schedule_li.do")
public class ScheduleList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int eNo = Integer.parseInt(request.getParameter("empNo"));
		
		ArrayList<Schedule> list = new ScheduleService().selectList(eNo);
		
		System.out.println("ScheduleList : " + list + " eNo : " + eNo);
		
		JSONArray result = new JSONArray();
		JSONObject userlist = null;
		for(Schedule user : list){
			userlist = new JSONObject();
			userlist.put("sTitle",user.getsTitle());
			userlist.put("sColor", user.getsColor());
			userlist.put("sNo", user.getsNo());
			result.add(userlist);
		}
		System.out.println("유저 리스트"+userlist);
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
