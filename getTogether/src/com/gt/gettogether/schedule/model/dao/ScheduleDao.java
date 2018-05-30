package com.gt.gettogether.schedule.model.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import com.gt.gettogether.schedule.model.vo.Schedule;

public class ScheduleDao {
	private Properties prop;

	public int insertMember(Connection con, Schedule s) {
		
		return 0;
	}

	public int updateMember(Connection con, Schedule s) {
		
		return 0;
	}

	public int deleteMember(Connection con, String userId) {
		
		return 0;
	}

	public ArrayList<Schedule> selectList(Connection con, int currentPage, int limit) {
		
		return null;
	}

}
