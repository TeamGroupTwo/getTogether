package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.gt.gettogether.department.work.model.service.WorkCommentService;
import com.gt.gettogether.department.work.model.vo.WorkComment;

@WebServlet("/selectList.wc")
public class WorkCommentSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkCommentSelectListServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		ArrayList<WorkComment> wcList = new WorkCommentService().selectWorkCommentListAll(pNo);
		
//		JSONObject wcJson = null;
//		JSONArray wcJsonList = null;
		if(wcList != null) {
			
//			wcJsonList = new JSONArray();
//			
//			for(WorkComment wc : wcList) {
//				
//				wcJson = new JSONObject();
//				
//				wcJson.put("wcNo", wc.getWcNo());
//				wcJson.put("wcWriter", wc.getWcWriter());
//				wcJson.put("wcContent", wc.getWcContent());
//				wcJson.put("wcDate", wc.getWcDate());
//				wcJson.put("wNo", wc.getwNo());
//				wcJson.put("eNo", wc.geteNo());
//				//wcJson.put("profile", wc.getProfile());
//				
//				wcJsonList.add(wcJson);
//				
//			}
			
			response.setContentType("application/json; charset=UTF-8");
			//System.out.println("들어오냐");
			//response.getWriter().print(wcJsonList.toJSONString());
			new Gson().toJson(wcList, response.getWriter());
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
