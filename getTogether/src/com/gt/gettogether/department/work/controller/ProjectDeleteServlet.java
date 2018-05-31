package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.gt.gettogether.department.work.model.service.ProjectService;

@WebServlet("/delete.pj")
public class ProjectDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProjectDeleteServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String chkList = request.getParameter("chkList");
		
		String[] delArr = chkList.substring(2, chkList.length()-2).split("\",\"");
		
		int[] deleteList = new int[delArr.length];
		
		for(int i=0; i<deleteList.length; i++) {
			deleteList[i] = Integer.parseInt(delArr[i]);
		}
		
		int result = new ProjectService().deleteProject(deleteList);
		
		if(result < 1) {
			request.getRequestDispatcher("views/department/deptError.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
