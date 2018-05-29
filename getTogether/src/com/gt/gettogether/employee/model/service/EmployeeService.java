package com.gt.gettogether.employee.model.service;

import com.gt.gettogether.employee.model.dao.EmployeeDao;
import com.gt.gettogether.employee.model.vo.Employee;
import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

public class EmployeeService {

	private EmployeeDao eDao;
	
	public EmployeeService() {
		eDao = new EmployeeDao();
	}
	
	public Employee selectEmployee(Employee emp) {

		Connection con = getConnection();
		
		Employee eResult = eDao.selectEmployee(con, emp);
		
		close(con);
		
		return eResult;
	}

}
