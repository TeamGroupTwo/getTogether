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
	
	public ArrayList<WorkComment> selectWorkCommentList(Connection con, int wNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<WorkComment> wcList = null;
		
		String sql = prop.getProperty("selectWorkCommentList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, wNo);
			
			rset = pstmt.executeQuery();
			
			wcList = new ArrayList<WorkComment>();
			
			while(rset.next()) {
				
				WorkComment wc = new WorkComment();
				
				wc.setWcNo(rset.getInt("WC_NO"));
				wc.setWcWriter(rset.getString("WC_WRITER"));
				wc.setWcContent(rset.getString("WC_CONTENT"));
				wc.setwNo(rset.getInt("W_NO"));
				wc.seteNo(rset.getInt("E_NO"));
				
				wcList.add(wc);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return wcList;
		
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
	
	public int updateWorkComment(Connection con, WorkComment wc) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateWorkComment");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, wc.getWcContent());
			pstmt.setInt(2, wc.getWcNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteWorkComment(Connection con, int wcNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteWorkComment");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, wcNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int selectInsertOne(Connection con, int eNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int wcNo = 0;
		
		String sql = prop.getProperty("selectInsertCommentOne");
		
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













