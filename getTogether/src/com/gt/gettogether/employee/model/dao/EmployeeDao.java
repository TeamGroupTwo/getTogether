package com.gt.gettogether.employee.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.gt.gettogether.employee.model.vo.Employee;
import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

public class EmployeeDao {
	
	private Properties prop = new Properties();
	
	public EmployeeDao(){
		String fileName = EmployeeDao.class.getResource("/config/employee/employee-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Employee selectEmployee(Connection con, Employee emp) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Employee eResult = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("selectEmployee"));
			pstmt.setString(1, emp.geteId());
			pstmt.setString(2, emp.getePassword());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				eResult = new Employee();
				
				eResult.seteNo(rset.getInt("E_NO"));
				eResult.seteId(rset.getString("E_ID"));
				eResult.setePassword(rset.getString("E_PASSWORD"));
				eResult.seteName(rset.getString("E_NAME"));
				eResult.setPhone(rset.getString("PHONE"));
				eResult.setEmail(rset.getString("EMAIL"));
				eResult.setProfile(rset.getString("PROFILE"));
				eResult.setrCode(rset.getString("R_NAME"));
				eResult.setdCode(rset.getString("D_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			close(rset);
			close(pstmt);			
		}
		
		return eResult;
	}

}
