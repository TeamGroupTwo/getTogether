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

import com.gt.gettogether.department.work.model.vo.WorkComment;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

public class WorkCommentDao {

	private Properties prop;
	
	public WorkCommentDao() {
		
		prop = new Properties();
		
		String fileName
			= ProjectDao.class.getResource("/config/work/work-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<WorkComment> selectWorkCommentList() {
		return null;
	}
	
	public int insertWorkComment(Connection con, WorkComment wc) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertWorkComment");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, wc.getWcWriter());
			pstmt.setString(2, wc.getWcContent());
			pstmt.setInt(3, wc.getwNo());
			pstmt.setInt(4, wc.geteNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateWorkComment() {
		return 0;
	}
	
	public int deleteWorkComment() {
		return 0;
	}

	public int selectInsertOne(Connection con, int eNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int wcNo = 0;
		
		String sql = prop.getProperty("selectInsertOne");
		
		try {
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, eNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				wcNo = rset.getInt("WC_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return wcNo;
		
	}
	
}













