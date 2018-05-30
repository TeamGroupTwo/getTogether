package com.gt.gettogether.department.work.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.gt.gettogether.department.work.model.vo.Project;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

public class ProjectDao {
	
	private Properties prop;
	
	public ProjectDao() {
		
		prop = new Properties();
		
		String fileName
			= ProjectDao.class.getResource("/config/work/work-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<Project> selectProjectList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Project> pjList = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			pjList = new ArrayList<Project>();
			
			while(rset.next()) {
				
				Project p = new Project();
				
				p.setpNo(rset.getInt("P_NO"));
				p.setpTitle(rset.getString("P_TITLE"));
				p.setpDate(rset.getDate("P_DATE"));
				p.setdCode(rset.getString("D_CODE"));
				
				pjList.add(p);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(stmt);
			
		}
		
		return pjList;
		
	}
	
	public int insertProject(Connection con, Project pj) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertProject");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pj.getpTitle());
			pstmt.setString(2, pj.getdCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateProject(Connection con, String pTitle, String upTitle) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateProject");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, upTitle);
			pstmt.setString(2, pTitle);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteProject(Connection con, String[] chkList) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteProject");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			for(String str : chkList) {
				
				pstmt.setString(1, str);
				
				result += pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public Project selectOneProject() {
		return null;
	}
	
}
