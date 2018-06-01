package com.gt.gettogether.notice.model.service;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.gt.gettogether.notice.model.dao.NoticeDao;
import com.gt.gettogether.notice.model.vo.Notice;
import com.gt.gettogether.notice.model.vo.NoticeNFiles;

public class NoticeService {

	
	
	public ArrayList<NoticeNFiles> selectList(){
		
		Connection con = getConnection();
		
		ArrayList<NoticeNFiles> list = new NoticeDao().selectList(con);
		
		close(con);
		
		System.out.println("Service 출력 확인용 : "+list);
		
		return list;
	}
	
	public int insertNotice(NoticeNFiles nf1){
		
		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con, nf1);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		System.out.println("게시판Insert Service : "+result);
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
	public int fileUpload(NoticeNFiles nf) {
		Connection con = getConnection();
		
		int result = new NoticeDao().fileUpload(con, nf);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		System.out.println("파일Insert Service : "+result);
		return result;
	}
	
}
