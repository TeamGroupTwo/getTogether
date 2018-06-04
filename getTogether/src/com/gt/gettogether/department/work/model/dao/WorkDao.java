package com.gt.gettogether.department.work.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.gt.gettogether.department.work.model.vo.Work;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

public class WorkDao {

	private Properties prop;
	
	public WorkDao() {
		
		prop = new Properties();
		
		String fileName
			= ProjectDao.class.getResource("/config/work/work-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Work> selectWorkList(Connection con, int pNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Work> workList = null;
		
		String sql = prop.getProperty("selectWorkList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			workList = new ArrayList<Work>();
			
			while(rset.next()) {
				
				Work w = new Work();
				
				w.setwNo(rset.getInt("W_NO"));
				w.setwTitle(rset.getString("W_TITLE"));
				w.setwContent(rset.getString("W_CONTENT"));
				w.setwWriter(rset.getString("W_WRITER"));
				w.setpNo(rset.getInt("P_NO"));
				w.setwDate(rset.getDate("W_DATE"));
				w.seteNo(rset.getInt("E_NO"));
				w.setfNo(rset.getInt("F_NO"));
				
				workList.add(w);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return workList;
	}
	
	public int insertWork() {
		return 0;
	}
	
	public int updateWork() {
		return 0;
	}
	
	public int deleteWork() {
		return 0;
	}
	
	public Work selectOneWork() {
		return null;
	}
	
}
