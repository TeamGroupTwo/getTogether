package com.gt.gettogether.schedule.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;
import com.gt.gettogether.schedule.model.vo.Schedule;

public class ScheduleDao {
	private Properties prop = new Properties();
	
	public ScheduleDao() {
		String fileName = ScheduleDao.class.getResource("/config/schedule/schedule-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertSchdeule(Connection con, Schedule s) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		System.out.println("���� �ٿ� :  " + s);
		
		String sql = prop.getProperty("insertSchedule");
		
		System.out.println("���⵵ �ٿ� : " + sql);
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,s.getsTitle());
			pstmt.setString(2, s.getsContent());
			pstmt.setString(3, s.getsColor());
			pstmt.setDate(4, s.getsDate());
			pstmt.setString(5, s.getsTime());
			pstmt.setInt(6, s.geteNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println("���� �ٿ� ������ : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateSchdeule(Connection con, Schedule s) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateSchedule");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,s.getsTitle());
			pstmt.setString(2, s.getsContent());
			pstmt.setString(3, s.getsColor());
			pstmt.setDate(4, s.getsDate());
			pstmt.setString(5, s.getsTime());
			pstmt.setInt(6, s.getsNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteSchdeule(Connection con, int sNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteSchedule");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Schedule> selectList(Connection con, int eNo) {
		ArrayList<Schedule> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");

		
		try {
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Schedule>();
			
			while(rset.next()){
				Schedule sc = new Schedule();
				
				sc.setsNo(rset.getInt("S_NO"));
				sc.setsTitle(rset.getString("S_TITLE"));
				sc.setsColor(rset.getString("S_COLOR"));
				sc.setsDate(rset.getDate("S_DATE"));
				sc.seteNo(rset.getInt("E_NO"));
				
				list.add(sc);
			}
			
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Schedule> selectDayList(Connection con, int eNo, String sDate) {
		ArrayList<Schedule> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDayList");

		try {
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eNo);
			pstmt.setString(2, sDate);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Schedule>();
			
			while(rset.next()){
				Schedule sc = new Schedule();
				
				sc.setsNo(rset.getInt("S_NO"));
				sc.setsTitle(rset.getString("S_TITLE"));
				sc.setsColor(rset.getString("S_COLOR"));
				sc.setsDate(rset.getDate("S_DATE"));
				sc.seteNo(rset.getInt("E_NO"));
				
				list.add(sc);
			}
			
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Schedule> scheduleDayList(Connection con, int eNo, String date) {
		
		ArrayList<Schedule> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("scheduleDayList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eNo);
			pstmt.setString(2, date);
		
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Schedule>();
			
			while(rset.next()){
				Schedule sc = new Schedule();
				
				sc.setsNo(rset.getInt("S_NO"));
				sc.setsTitle(rset.getString("S_TITLE"));
				sc.setsColor(rset.getString("S_COLOR"));
				sc.setsDate(rset.getDate("S_DATE"));
				sc.seteNo(rset.getInt("E_NO"));
				
				list.add(sc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Schedule> updateview(Connection con, int sNo, String sTitle) {
		ArrayList<Schedule> upview = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("updateview");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1 , sNo);
			pstmt.setString(2, sTitle);
			
			rset = pstmt.executeQuery();
			
			upview = new ArrayList<Schedule>();
			
			while(rset.next()){
				Schedule sc = new Schedule();
				
				sc.setsNo(rset.getInt("S_NO"));
				sc.setsTitle(rset.getString("S_TITLE"));
				sc.setsColor(rset.getString("S_COLOR"));
				sc.setsTime(rset.getString("S_TIME"));
				sc.setsDate(rset.getDate("S_DATE"));
				sc.setsContent(rset.getString("S_CONTENT"));
				sc.seteNo(rset.getInt("E_NO"));
				
				upview.add(sc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return upview;
	}
}
