package com.gt.gettogether.employee.model.service;

import com.gt.gettogether.employee.model.dao.EmployeeDao;
import com.gt.gettogether.employee.model.vo.Employee;
import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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
	
	public int checkEmail(String email){
		
		Connection con = getConnection();
		
		int result = eDao.checkEmail(con, email);
		
		close(con);
		
		return result;
	}
	
	public Employee findId(Employee emp){
		
		Connection con = getConnection();
		
		Employee eResult = eDao.findId(con, emp);
		
		close(con);
		
		return eResult;
	}	
	
	public Employee findPassword(Employee emp){
		
		Connection con = getConnection();
		
		Employee eResult = eDao.findPassword(con, emp);
		
		close(con);
		
		return eResult;
	}	
	
	public ArrayList<Employee> employeeList(){
		Connection con = getConnection();
		
		ArrayList<Employee> list = eDao.employeeList(con);
		
		close(con);
		
		System.out.println("서비스 단 : "+list);
		
		return list;
		
		
	}

	public ArrayList<Employee> searchEmployee(String condition, String keyword) {
		
		Connection con = getConnection();
		ArrayList<Employee> list = null;
		
		EmployeeDao eDao = new EmployeeDao();
		
		if(condition.equals("departmentName")){
			
			list = eDao.searchDepartmentName(con, keyword);
			
		}else if(condition.equals("employeeName")){
			
			list = eDao.searchEmployeeName(con, keyword);
			
		}else{
			
			list = eDao.employeeList(con);
		}
		
		System.out.println("search 했을 시 service 값 : "+list);
		
		return list;
		
	}

	public int employeeInsert(Employee emp) {

		Connection con = getConnection();
		
		int result = eDao.employeeInsert(con,emp);
		
		if(result > 0) commit(con);
		else rollback(con);
		System.out.println("직원 추가 service : " +result);
		
		return result;

	}

	public int adminUpdate(Employee emp) {

		Connection con = getConnection();
		int result = new EmployeeDao().adminUpdate(con, emp);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		System.out.println("수정한 service result 값  : "+result );
		
		return result;
		
		
	}
	public int deleteEmployee(String[] dellist2) {
		Connection con = getConnection();
		
		int result = new EmployeeDao().deleteEmployee(con, dellist2);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		System.out.println("service delete : "+result);
		return result;
	}

}
