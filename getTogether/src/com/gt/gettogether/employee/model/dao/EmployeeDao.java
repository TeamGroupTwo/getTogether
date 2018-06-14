package com.gt.gettogether.employee.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
				eResult.setrCode(rset.getString("R_CODE"));
				eResult.setdCode(rset.getString("D_CODE"));
				eResult.setrName(rset.getString("R_NAME"));
				eResult.setdName(rset.getString("D_NAME"));
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

	public int updateEmployee(Connection con, Employee emp) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateEmployee");
		System.out.println("DAO : "+emp);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, emp.getePassword());
			pstmt.setString(2, emp.getPhone());
			pstmt.setString(3, emp.getEmail());
			pstmt.setString(4, emp.getProfile());
			pstmt.setString(5, emp.geteId());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int checkEmail(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = -1;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("checkEmail"));
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
				result = rset.getInt("RESULT");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			close(rset);
			close(pstmt);			
		}
		
		return result;
	}

	public Employee findId(Connection con, Employee emp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Employee eResult = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("findId"));
			pstmt.setInt(1, emp.geteNo());
			pstmt.setString(2, emp.geteName());
			pstmt.setString(3, emp.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				eResult = new Employee();
				eResult.seteId(rset.getString("E_ID"));
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

	public Employee findPassword(Connection con, Employee emp) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Employee eResult = null;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("findPassword"));
			pstmt.setInt(1, emp.geteNo());
			pstmt.setString(2, emp.geteName());
			pstmt.setString(3, emp.getEmail());
			pstmt.setString(4, emp.geteId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				eResult = new Employee();
				eResult.setePassword(rset.getString("E_PASSWORD"));
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

	public ArrayList<Employee> employeeList(Connection con) {
		ArrayList<Employee> list = null;
				
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("employeeList");
		
		try {
			stmt = con.prepareStatement(prop.getProperty("employeeList"));
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Employee>();
			
			while(rset.next()){
				Employee e = new Employee();
				
				e.seteNo(rset.getInt("E_NO"));
				e.seteId(rset.getString("E_ID"));
				e.seteName(rset.getString("E_NAME"));
				e.setdCode(rset.getString("D_NAME"));
				e.setrCode(rset.getString("R_NAME"));
				e.setPhone(rset.getString("PHONE"));
				e.setEmail(rset.getString("EMAIL"));
				
				list.add(e);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		System.out.println("DAO 단 : "+list);
		
		return list;
	}

	public ArrayList<Employee> searchDepartmentName(Connection con, String keyword) {
		
		ArrayList<Employee> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchDepartment");
		
		try {
			pstmt= con.prepareStatement(query);
			
			
			pstmt.setString(1, keyword);
			
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Employee>();
			while(rset.next()){
				Employee e = new Employee();
				
				e.seteNo(rset.getInt("E_NO"));
				e.seteId(rset.getString("E_ID"));
				e.seteName(rset.getString("E_NAME"));
				e.setdCode(rset.getString("D_NAME"));
				e.setrCode(rset.getString("R_NAME"));
				e.setPhone(rset.getString("PHONE"));
				e.setEmail(rset.getString("EMAIL"));
				
				list.add(e);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println("제목 search 했을 시 DAO 값 : "+list);
		
		return list;
	}

	public ArrayList<Employee> searchEmployeeName(Connection con, String keyword) {

		ArrayList<Employee> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchEmployeeName");
		
		try {
			pstmt= con.prepareStatement(query);
			
			
			pstmt.setString(1, keyword);
			
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Employee>();
			while(rset.next()){
				Employee e = new Employee();
				
				e.seteNo(rset.getInt("E_NO"));
				e.seteId(rset.getString("E_ID"));
				e.seteName(rset.getString("E_NAME"));
				e.setdCode(rset.getString("D_NAME"));
				e.setrCode(rset.getString("R_NAME"));
				e.setPhone(rset.getString("PHONE"));
				e.setEmail(rset.getString("EMAIL"));
				
				list.add(e);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println("제목 search 했을 시 DAO 값 : "+list);
		
		return list;
		
	}

	public int employeeInsert(Connection con,Employee emp) {
		
		int result = 0;

		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("employeeInsert");
	
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, emp.geteNo());
			pstmt.setString(2, emp.geteId());
			pstmt.setString(3, emp.getePassword());
			pstmt.setString(4, emp.geteName());
			pstmt.setString(5, emp.getrCode());
			pstmt.setString(6, emp.getdCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		
		}finally{
			close(pstmt);
		}
		System.out.println("직원 추가 DAO : " +result);
		
		return result;
	}

	public int adminUpdate(Connection con, Employee emp) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("adminUpdate");
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, emp.getrCode());
			pstmt.setString(2, emp.getdCode());
			pstmt.setInt(3,emp.geteNo());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		System.out.println("수정한 Dao result 값  : "+result );
		return result;
	}
	
	public int deleteEmployee(Connection con, String[] dellist2) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteEmployee");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0 ; i < dellist2.length ; i++) {
				
				pstmt.setInt(1, Integer.parseInt(dellist2[i]));
				System.out.println(Integer.parseInt(dellist2[i]));
				result += pstmt.executeUpdate();
			}			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("Dao delete : "+result);
		return result;
	}
	
}
