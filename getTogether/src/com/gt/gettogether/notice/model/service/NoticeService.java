package com.gt.gettogether.notice.model.service;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.close;
import static com.gt.gettogether.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.gt.gettogether.notice.model.dao.NoticeDao;
import com.gt.gettogether.notice.model.vo.Notice;

public class NoticeService {

	
	
	public ArrayList<Notice> selectList(){
		
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		
		close(con);
		
		System.out.println("Service 출력 확인용 : "+list);
		
		return list;
	}
	
	public int insertNotice(){
		
		int result = 0 ;
		
		
		return result;
	}
	
	public Notice selectOne(){
		
		Notice n = new Notice();
		
		n=null;
		
		return n;
	}
	
	public int updateNotice(){
		
		int result = 0 ;
		
		
		return result;
	}
	
	public int deleteNotice(){
		
		int result = 0 ;
		
		
		return result;
	}
	
	public ArrayList<Notice> searchTitle(){
		
		ArrayList<Notice> list =null;
		
		return list;
		
	}
	
	public ArrayList<Notice> searchWrier(){
		
		ArrayList<Notice> list =null;
		
		return list;
		
	}

	public ArrayList<Notice> searchContent(){
		
		ArrayList<Notice> list =null;
		
		return list;
		
	}
}
