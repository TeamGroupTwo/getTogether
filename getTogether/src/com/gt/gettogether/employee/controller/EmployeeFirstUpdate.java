package com.gt.gettogether.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gt.gettogether.employee.model.service.EmployeeService;
import com.gt.gettogether.employee.model.vo.Employee;
import com.gt.gettogether.employee.wrapper.LoginWrapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/firstUpdate.emp")
public class EmployeeFirstUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public EmployeeFirstUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024 * 1024 * 10;
	
		String root = request.getServletContext().getRealPath("/");
		
		String savePath = root + "resources/images/profiles";
		
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String profile = mrequest.getFilesystemName("empProfile");
		String id = mrequest.getParameter("rId");
		String password = LoginWrapper.getSha512(mrequest.getParameter("empPwd"));
		String phone = mrequest.getParameter("phone");
		String email = mrequest.getParameter("rEmail");	
		
		Employee e = new Employee();
		e.setProfile(profile);
		e.seteId(id);
		e.setePassword(password);
		e.setPhone(phone);
		e.setEmail(email);

		int result = new EmployeeService().updateEmployee(e);
		
		if(result > 0) {
			response.sendRedirect("main.jsp");
		}
		else {
			response.sendRedirect("views/employee/employeeFirstUpdate.jsp");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
