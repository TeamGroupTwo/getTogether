package com.gt.gettogether.employee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.employee.model.service.EmployeeService;
import com.gt.gettogether.employee.model.vo.Employee;



@WebServlet("/eInsert.do")
public class EmployeeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public EmployeeInsert() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int eNo = Integer.parseInt(request.getParameter("eNo"));
		String eId = request.getParameter("eId");
		String ePwd = request.getParameter("ePwd");
		String eName = request.getParameter("eName");	
		String rCode = request.getParameter("rcode");
		String dCode = request.getParameter("dcode");
		
		Employee emp = new Employee();
		
		emp.seteNo(eNo);
		emp.seteId(eId);
		emp.setePassword(ePwd);
		emp.seteName(eName);
		emp.setrCode(rCode);
		emp.setdCode(dCode);
		
		int result = new EmployeeService().employeeInsert(emp);
		
		String page="";
		
		if(result > 0 ){
			
			page="views/admin/adminAuthority.jsp";
			
			request.setAttribute("list",  new EmployeeService().employeeList());
			
		}
		request.getRequestDispatcher(page).forward(request,response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
