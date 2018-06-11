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
		
		int result = new ScheduleDao().insertMember(con, s);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		System.out.println("서비스 나간다 "  + result);
		
		return result;
	}
	
	public int updateMember(Schedule s) {
		Connection con = getConnection();
		
		int result = new ScheduleDao().updateMember(con, s);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteMember(int sNo) {
		Connection con = getConnection();
		
		int result = new ScheduleDao().deleteMember(con , sNo);
		
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

	public ArrayList<Schedule> selectDayOkList(int eNo , String sDate) {
		Connection con = getConnection();
		
		ArrayList<Schedule> list = new ScheduleDao().selectDayOkList(con , eNo , sDate);

		close(con);
		
		return list;
	}
}
