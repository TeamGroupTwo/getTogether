package com.gt.gettogether.schedule.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

	public int insertMember(Connection con, Schedule s) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		System.out.println("여긴 다오 :  " + s);
		
		String sql = prop.getProperty("insertSchedule");
		
		System.out.println("여기도 다오 : " + sql);
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,s.getsTitle());
			pstmt.setString(2, s.getsContent());
			pstmt.setString(3, s.getsColor());
			pstmt.setDate(4, s.getsDate());
			pstmt.setString(5, s.getsTime());
			pstmt.setInt(6, s.geteNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println("여긴 다오 나간다 : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMember(Connection con, Schedule s) {
		
		return 0;
	}

	public int deleteMember(Connection con, int sNo) {
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

	public ArrayList<Schedule> selectDayOkList(Connection con, int eNo, String sDate) {
		ArrayList<Schedule> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDayOkList");
		
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



}
