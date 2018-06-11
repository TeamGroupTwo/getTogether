package com.gt.gettogether.department.work.model.service;

import java.io.File;
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
			
			// 기존 파일이 있으면
			if(wfResult > 0) {
				
				f.setfNo(wfResult);
				int fResult = wDao.updateFiles(con, f);
				
				if(fResult > 0) {
					// 여기부터 시작하면됨
					int bResult = wDao.updateWorkWithUpdateFiles(con, w);
					
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
				
			} else { // 기존파일이 없는데 파일을 업로드한 경우
				
				int fResult = wDao.insertFiles(con, f);
				
				if(fResult > 0) {
					
					int bResult = wDao.updateWorkWithInsertFiles(con, w);
					
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
			
		}
		
		close(con);
		
		return result;
		
	}
	
	public int deleteWork(String fName, String fPath) {
		
		Connection con = getConnection();
		
		int result = new WorkDao().deleteWork(con, fName);
		
		if(result > 0) {
			
			commit(con);
			System.out.println(fPath+"/"+fName);
			File file = new File(fPath+"/"+fName);
			
	        if( file.exists() ){
	            if(file.delete()){
	                System.out.println("파일삭제 성공");
	            }else{
	                System.out.println("파일삭제 실패");
	            }
	        }else{
	            System.out.println("파일이 존재하지 않습니다.");
	        }
			
		}
		else rollback(con);
		
		close(con);
		
		return result;
		
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
