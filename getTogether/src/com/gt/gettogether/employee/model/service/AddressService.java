package com.gt.gettogether.employee.model.service;


import java.sql.Connection;
import java.util.ArrayList;

import com.gt.gettogether.employee.model.dao.AddressDao;
import com.gt.gettogether.employee.model.vo.Employee;
import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;


public class AddressService {
	
	
	public ArrayList<Employee> selectList() {
		Connection con = getConnection();
		
		AddressDao aDao = new AddressDao();
		ArrayList<Employee> list = aDao.selectList(con);
		

		close(con);
		System.out.println("service 출력값확인 : "+list);
		return list;
}

}
