package com.gt.gettogether.employee.model.dao;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.gt.gettogether.employee.model.vo.Employee;
import com.gt.gettogether.employee.model.dao.AddressDao;

public class AddressDao {
	private Properties prop;

	
	public AddressDao(){
		prop = new Properties();
		
		String fileName = AddressDao.class.getResource("/config/employee/employee-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Employee> selectList(Connection con) {
		ArrayList<Employee> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Employee>();
			
			while(rset.next()){
				Employee a = new Employee();
				
				
				a.seteName(rset.getString("E_NAME"));
				a.setrCode(rset.getString("R_NAME"));
				a.setEmail(rset.getString("EMAIL"));
				a.setPhone(rset.getString("PHONE"));
				a.setProfile(rset.getString("PROFILE"));
				a.setdCode(rset.getString("D_CODE"));
				
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}	
		
		System.out.println("DAO 출력값확인 : "+list);
		return list;
		
		

	}
}
