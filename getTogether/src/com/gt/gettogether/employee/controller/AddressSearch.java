package com.gt.gettogether.employee.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.gt.gettogether.employee.model.service.AddressService;
import com.gt.gettogether.employee.model.vo.Employee;


@WebServlet("/searchAddress.do")
public class AddressSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddressSearch() {  }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//String keyword = request.getParameter("keyword");
		//[START] GET NEW FUNCTION
		String keyword = request.getParameter("name");
		System.out.println("get :=!!!" + keyword);
		
		ArrayList<Employee> list = new AddressService().searchAddress(keyword);
		System.out.println(list);
		response.setContentType("application/json; charset=UTF-8"); 
		new Gson().toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
