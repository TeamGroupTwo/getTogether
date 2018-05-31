package com.gt.gettogether.employee.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.employee.model.dao.AddressDao;
import com.gt.gettogether.employee.model.service.AddressService;
import com.gt.gettogether.employee.model.vo.Employee;

@WebServlet("/alist.do")
public class AddressSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddressSelectList() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<Employee> list = null;
		
		AddressService aServies = new AddressService();
		
		list = aServies.selectList();
		
		String page = "";
		
		if(list != null){
			page = "/views/address/addressList.jsp";
			request.setAttribute("list", list);
			
			request.getRequestDispatcher(page).forward(request, response);
		}
//		} else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "공지사항 조회 실패!");
//			
//			
//		}	
		
//		request.getRequestDispatcher(page).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
