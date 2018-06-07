package com.gt.gettogether.notice.model.service;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.gt.gettogether.notice.model.dao.NoticeDao;
import com.gt.gettogether.notice.model.vo.*;
import com.gt.gettogether.notice.model.vo.NoticeNFiles;


public class NoticeService {

	
	public ArrayList<NoticeNFiles> selectList() {
		Connection con = getConnection();
		
		ArrayList<NoticeNFiles> list = new NoticeDao().selectList(con);
		
		close(con);
		
		System.out.println("Service 출력 확인용 : "+list);
		
		return list;
	}
	
	
	public int insertNotice(NoticeNFiles nf){
		
		Connection con = getConnection();
		
		int result = 0;
		
		if(nf.getfName() !=null){ //파일명이 있으면
			
		int result1 = new NoticeDao().fileUpload(con, nf);
		
			if(result1 > 0 ){
				
				int result2 = new NoticeDao().insertNotice(con, nf);
				
				if(result2 > 0){
					commit(con);
					System.out.println("파일명이 있을때 result2(Service) "+result2);
					result = result2;
				}else{
					rollback(con);
				}		
			}else{
				rollback(con);
			}
		
		// 파일명이 없으면
		}else if(nf.getfName() ==null){
			int result3 = new NoticeDao().insertNotice(con, nf);
			
			if(result3 > 0){
				commit(con);
				System.out.println("파일명이 있을때 result3(Service) "+result3);
				result = result3;
			}else{
				rollback(con);
			}
		}
		
		
		return result;
		
		
	}
	
	public NoticeNFiles selectOne(String num){
		
		Connection con = getConnection();
		
		int result = 0 ;
			
		NoticeNFiles n = new NoticeDao().selectOne(con, num);
		
		if(n != null){
			result = new NoticeDao().updateCount(con, num);
			if(result > 0)commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return n;
	}
	
	public NoticeNFiles selectUpdateOne(String num){
		
		Connection con = getConnection();
		
		int result = 0 ;
			
		NoticeNFiles n = new NoticeDao().selectOne(con, num);
		
		close(con);
		
		return n;
	}
	
	
	
	public int updateNotice(NoticeNFiles n){
		
		Connection con = getConnection();
		int result = new NoticeDao().updateNotice(con, n);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}
	
	public int deleteNotice(int nno){
		
		Connection con = getConnection();
		
		int result = new NoticeDao().deleteNotice(con, nno);
		
		if(result > 0 )commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}
	
	public ArrayList<NoticeNFiles> searchNotice(String condition, String keyword) {

		Connection con = getConnection();
		ArrayList<NoticeNFiles> list = null;
		
		NoticeDao nDao = new NoticeDao();
		
		if(condition.equals("title")){
			
			list = nDao.searchTitle(con, keyword);
			
		}else if(condition.equals("content")){
			
			list = nDao.searchContent(con, keyword);
			
		}else{
			
			list = nDao.selectList(con);
		}
		
		System.out.println("search 했을 시 service 값 : "+list);
		
		return list;
	}



}
