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
	
	public int updateEmployee(Employee emp){
		
		Connection con = getConnection();
		
		int result = eDao.updateEmployee(con, emp);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public String checkEmail(String email){
		
		Connection con = getConnection();
		
		String result = eDao.checkEmail(con, email);
		
		close(con);
		
		return result;
	}
	
	public int findId(Employee emp){
		
		Connection con = getConnection();
		
		int result = eDao.findId(con, emp);
		
		close(con);
		
		return result;
	}	
	
	public int findPassword(Employee emp){
		
		Connection con = getConnection();
		
		int result = eDao.findPassword(con, emp);
		
		close(con);
		
		return result;
	}	

}
