package com.gt.gettogether.department.work.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.gt.gettogether.department.files.model.vo.Files;
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
				w.setfName(rset.getString("F_NAME"));
				
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
	
	public int insertOnlyWork(Connection con, Work w) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertOnlyWork");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, w.getwTitle());
			pstmt.setString(2, w.getwContent());
			pstmt.setString(3, w.getwWriter());
			pstmt.setInt(4, w.getpNo());
			pstmt.setInt(5, w.geteNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int insertWork(Connection con, Work w) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertWork");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, w.getwTitle());
			pstmt.setString(2, w.getwContent());
			pstmt.setString(3, w.getwWriter());
			pstmt.setInt(4, w.getpNo());
			pstmt.setInt(5, w.geteNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int updateWorkWithInsertFiles(Connection con, Work w) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateWorkWithInsertFiles");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, w.getwTitle());
			pstmt.setString(2, w.getwContent());
			pstmt.setInt(3, w.getwNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int updateWorkWithUpdateFiles(Connection con, Work w) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateWorkWithUpdateFiles");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, w.getwTitle());
			pstmt.setString(2, w.getwContent());
			pstmt.setInt(3, w.getwNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteWork(Connection con, int wNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteWork");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, wNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		
		return result;
		
	}
	
	public Work selectOneWork(Connection con, int wNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Work result = null;
		
		String sql = prop.getProperty("selectOneWork");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, wNo);
			
			rset = pstmt.executeQuery();
			
			result = new Work();
			
			if(rset.next()) {
				
				result.setwNo(rset.getInt("W_NO"));
				result.setwTitle(rset.getString("W_TITLE"));
				result.setwContent(rset.getString("W_CONTENT"));
				result.setwWriter(rset.getString("W_WRITER"));
				result.setpNo(rset.getInt("P_NO"));
				result.setwDate(rset.getDate("W_DATE"));
				result.seteNo(rset.getInt("E_NO"));
				result.setfNo(rset.getInt("F_NO"));
				result.setfName(rset.getString("F_NAME"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return result;
		
	}

	public int insertFiles(Connection con, Files f) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertFiles");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, f.getfPath());
			pstmt.setString(2, f.getfName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public String selectPtitle(Connection con, int pNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = null;
		
		String sql = prop.getProperty("selectPtitle");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getString("P_TITLE");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	public int updateOnlyWork(Connection con, Work w) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateOnlyWork");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, w.getwTitle());
			pstmt.setString(2, w.getwContent());
			pstmt.setInt(3, w.getwNo());
			System.out.println(w.getwTitle()+", "+w.getwContent()+", "+w.getwNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int updateFiles(Connection con, Files f) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateFiles");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, f.getfName());
			pstmt.setInt(2, f.getfNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int workFileSelect(Connection con, Work w) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("workFileSelect");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, w.getwNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("F_NO");
				System.out.println("result : " + result);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
}

















