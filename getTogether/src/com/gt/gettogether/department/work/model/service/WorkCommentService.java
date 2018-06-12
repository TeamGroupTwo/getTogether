package com.gt.gettogether.department.work.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.gt.gettogether.department.work.model.dao.WorkCommentDao;
import com.gt.gettogether.department.work.model.dao.WorkDao;
import com.gt.gettogether.department.work.model.vo.WorkComment;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

public class WorkCommentService {

	public ArrayList<WorkComment> selectWorkCommentList(int wNo) {
		
		Connection con = getConnection();
		
		ArrayList<WorkComment> wcList = new WorkCommentDao().selectWorkCommentList(con, wNo);
		
		close(con);
		
		return wcList;
	}
	
	public int insertWorkComment(WorkComment wc) {
		
		Connection con = getConnection();
		
		int result = new WorkCommentDao().insertWorkComment(con, wc);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int updateWorkComment(WorkComment wc) {
		
		Connection con = getConnection();
		
		int result = new WorkCommentDao().updateWorkComment(con, wc);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}
	
	public int deleteWorkComment(int wcNo) {
		
		Connection con = getConnection();
		
		int result = new WorkCommentDao().deleteWorkComment(con, wcNo);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public WorkComment selectInsertOne(int eNo) {
		
		Connection con = getConnection();
		
		WorkComment wc = new WorkCommentDao().selectInsertOne(con, eNo);
		
		close(con);
		
		return wc;
	}

	public ArrayList<WorkComment> selectWorkCommentListAll(int pNo) {

		Connection con = getConnection();
		
		ArrayList<WorkComment> wcList = new WorkCommentDao().selectWorkCommentListAll(con, pNo);
		
		close(con);
		
		return wcList;
		
	}
	
}












