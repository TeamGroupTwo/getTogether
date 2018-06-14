package com.gt.gettogether.schedule.model.service;

import java.sql.*;
import java.util.ArrayList;

import com.gt.gettogether.schedule.model.dao.ScheduleDao;
import com.gt.gettogether.schedule.model.vo.Schedule;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

public class ScheduleService {
	
	private ScheduleDao sDao;
	
	public ArrayList<Schedule> selectList(int eNo){
		Connection con = getConnection();
		
		ArrayList<Schedule> list = new ScheduleDao().selectList(con, eNo);
		
		close(con);
		
		return list;
	}
	
	public int insertSchedule(Schedule s){
		
		Connection con = getConnection();
		
		System.out.println("여긴 서비스 들어왓다 " + s);
		
		int result = new ScheduleDao().insertSchdeule(con, s);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		System.out.println("서비스 나간다 "  + result);
		
		return result;
	}
	
	public int updateSchdeule(Schedule s) {
		Connection con = getConnection();
		
		int result = new ScheduleDao().updateSchdeule(con, s);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteSchdeule(int sNo) {
		Connection con = getConnection();
		
		int result = new ScheduleDao().deleteSchdeule(con , sNo);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Schedule> selectDayList(int eNo, String sDate) {
		Connection con = getConnection();
		
		ArrayList<Schedule> list = new ScheduleDao().selectDayList(con, eNo,sDate);

		close(con);
		
		return list;
	}

	public ArrayList<Schedule> scheduleDayList(int eNo, String date) {
		Connection con = getConnection();
		
		ArrayList<Schedule> list = new ScheduleDao().scheduleDayList(con , eNo , date);
		
		close(con);
		
		return list;
	}

	public ArrayList<Schedule> updateview(int sNo, String sTitle) {
		Connection con = getConnection();
		
		ArrayList<Schedule> upview = new ScheduleDao().updateview(con , sNo , sTitle);
		
		close(con);
		
		return upview;
	}

}
