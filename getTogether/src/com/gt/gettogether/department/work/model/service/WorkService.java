package com.gt.gettogether.department.work.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.gt.gettogether.department.work.model.dao.WorkDao;
import com.gt.gettogether.department.work.model.vo.Work;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

public class WorkService {

	public ArrayList<Work> selectWorkList(int pNo) {
		
		Connection con = getConnection();
		
		ArrayList<Work> workList = new WorkDao().selectWorkList(con, pNo);
		
		close(con);
		
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
	
	public Work selectOneBoard() {
		return null;
	}
	
}
