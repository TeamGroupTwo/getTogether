package com.gt.gettogether.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.chat.model.vo.OnlineUserList;
import com.gt.gettogether.employee.model.service.EmployeeService;
import com.gt.gettogether.employee.model.vo.Employee;

/**
 * 온라인 접속자가 로그아웃 할 때 동작하는 서블릿
 */
@WebServlet("/offlineEmp.do")
public class EmployeeLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeLogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eId = request.getParameter("loginId");
		String ePwd = request.getParameter("loginPwd");
		
		Employee emp = new Employee();
		emp.seteId(eId);
		emp.setePassword(ePwd);
		
		EmployeeService es = new EmployeeService();
		emp = es.selectEmployee(emp);
		
		OnlineUserList.delEmployee(emp);
		
		//System.out.println(OnlineUserList.getInstance());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
