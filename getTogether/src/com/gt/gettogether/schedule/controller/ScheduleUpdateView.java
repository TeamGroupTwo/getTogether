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

/**
 * Servlet implementation class ScheduleUpdateView
 */
@WebServlet("/schedule_upview.do")
public class ScheduleUpdateView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleUpdateView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sNo = Integer.parseInt(request.getParameter("sNo"));
		String sTitle = request.getParameter("sTitle");
		
		System.out.println("ºä ¼­ºí·¿ : "+sNo+" : "+sTitle);
		
		ArrayList<Schedule> upview = new ScheduleService().updateview(sNo , sTitle);
		
		JSONArray result = new JSONArray();
		JSONObject userlist = null;
		for(Schedule user : upview){
			userlist = new JSONObject();
			userlist.put("sTitle",user.getsTitle());
			userlist.put("sColor", user.getsColor());
			userlist.put("sNo", user.getsNo());
			userlist.put("sContent", user.getsContent());
			userlist.put("sTime", user.getsTime());
			result.add(userlist);
		}
		System.out.println("À¯Àú ¸®½ºÆ®"+userlist);
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
