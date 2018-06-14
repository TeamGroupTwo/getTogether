package com.gt.gettogether.employee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.employee.model.service.EmployeeService;
import com.gt.gettogether.employee.model.vo.Employee;
import com.gt.gettogether.notice.model.service.NoticeService;


@WebServlet("/aUpdate.do")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminUpdateServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int eNo = Integer.parseInt(request.getParameter("eNo1"));
		String updateRcode = request.getParameter("updateRcode");
		String updateDcode = request.getParameter("updateDcode");
		
		
		System.out.println("eNo 받아온 값  : "+eNo );
		System.out.println("updateRcode 받아온 값  : "+ updateRcode);
		System.out.println("updateDcode 받아온 값  : "+updateDcode );
		
		Employee emp = new Employee();
		
		emp.seteNo(eNo);
		emp.setrCode(updateRcode);
		emp.setdCode(updateDcode);
		
		int result = new EmployeeService().adminUpdate(emp);
		
		System.out.println("수정한 최종 서블릿 result 값  : "+result );
		
		String page="";
		if(result > 0){
			page = "elist.do";
			
		}
		request.getRequestDispatcher(page).forward(request, response);
		
       
		
		
		
		
		
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
