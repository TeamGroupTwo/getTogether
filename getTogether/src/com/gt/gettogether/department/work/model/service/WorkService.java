package com.gt.gettogether.department.work.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.gt.gettogether.department.files.model.vo.Files;
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
	
	public int insertWork(Files f, Work w) {
		
		Connection con = getConnection();
		WorkDao wDao = new WorkDao();
		
		int result = 0;

		
		if(f.getfName() == null) {
			
			result = wDao.insertOnlyWork(con, w);
			
			if(result > 0) commit(con);
			else rollback(con);
			
		} else {
			
			int fResult = wDao.insertFiles(con, f);
			
			if(fResult > 0) {
				
				int bResult = wDao.insertWork(con, w);
				
				if(bResult > 0) {
					commit(con);
					result = bResult;
				} else {
					rollback(con);
					result = bResult;
				}
				
			} else {
				rollback(con);
				result = fResult;
			}
			
		}
		
		close(con);
		
		return result;
		
	}
	
	public int updateWork(Files f, Work w) {

		Connection con = getConnection();
		WorkDao wDao = new WorkDao();
		
		int result = 0;
		
		if(f.getfName() == null) {
			
			result = wDao.updateOnlyWork(con, w);
			
			if(result > 0) commit(con);
			else rollback(con);
			
		} else {
			
			int wfResult = wDao.workFileSelect(con, w);
			
			int fResult = 0;
			
			if(wfResult > 0) {
				
				f.setfNo(wfResult);
				fResult = wDao.updateFiles(con, f);
				
				if(fResult > 0) {
					// 여기부터 시작하면됨
					int bResult = wDao.updateWork(con, w);
					
					if(bResult > 0) {
						commit(con);
						result = bResult;
					} else {
						rollback(con);
						result = bResult;
					}
					
				}
				
			} else {
				
				// 기존파일이 없으면 인서트
				rollback(con);
				result = fResult;
				
			}
			
		}
		
		close(con);
		
		return result;
		
	}
	
	public int deleteWork() {
		return 0;
	}
	
	public Work selectOneWork(int wNo) {
		
		Connection con = getConnection();
		
		Work result = new WorkDao().selectOneWork(con, wNo);
		
		close(con);
		
		return result;
		
	}

	public String selectPtitle(int pNo) {
		
		Connection con = getConnection();
		
		String result = new WorkDao().selectPtitle(con, pNo);
		
		close(con);
		
		return result;
		
	}
	
}
