package com.gt.gettogether.schedule.model.service;

import java.sql.*;
import java.util.ArrayList;

import com.gt.gettogether.schedule.model.dao.ScheduleDao;
import com.gt.gettogether.schedule.model.vo.Schedule;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

public class ScheduleService {
	
	private ScheduleDao sDao;
	
	public ArrayList<Schedule> selectList(int currentPage, int limit){
		Connection con = getConnection();
		
		ArrayList<Schedule> list = sDao.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	public int insertSchedule(Schedule s){
		Connection con = getConnection();
		
		int result = sDao.insertMember(con, s);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int updateMember(Schedule s) {
		Connection con = getConnection();
		
		int result = sDao.updateMember(con, s);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteMember(String userId) {
		Connection con = getConnection();
		
		int result = sDao.deleteMember(con, userId);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
}
