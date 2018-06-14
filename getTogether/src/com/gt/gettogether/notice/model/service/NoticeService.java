package com.gt.gettogether.notice.model.service;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;

import com.gt.gettogether.notice.model.dao.NoticeDao;
import com.gt.gettogether.notice.model.vo.*;
import com.gt.gettogether.notice.model.vo.NoticeNFiles;



public class NoticeService {

	
	public ArrayList<NoticeNFiles> selectList(int currentPage, int limit) {

			
	Connection con = getConnection();
	
	ArrayList<NoticeNFiles> list = new NoticeDao().selectList(con, currentPage, limit);
	
	close(con);
	
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
	
	public int deleteNotice(int nno){
		
		Connection con = getConnection();
		
		int result = new NoticeDao().deleteNotice(con, nno);
		
		if(result > 0 )commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}
	
	public ArrayList<NoticeNFiles> searchNotice(String condition, String keyword,int currentPage, int limit) {

		Connection con = getConnection();
		ArrayList<NoticeNFiles> list = null;
		
		NoticeDao nDao = new NoticeDao();
		
		if(condition.equals("title")){
			
			list = nDao.searchTitle(con, keyword,currentPage,limit);
			
		}else if(condition.equals("content")){
			
			list = nDao.searchContent(con, keyword,currentPage,limit);
			
		}else{
			
			list = nDao.selectList(con,currentPage,limit);
		}
		
		System.out.println("search 했을 시 service 값 : "+list);
		
		return list;
	}


	public int getListCount() {
		Connection con = getConnection();
		int listCount = new NoticeDao().getListCount(con);
		close(con);
		return listCount;
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
		NoticeDao nDao = new NoticeDao();
		int result = 0;
		
		int fNo = nDao.selectFno(con, n.getnNo());
		String originFname = nDao.selectOriginFname(con, fNo);
		
		if(fNo > 0) { // 기존 파일이 있는 경우
			
			if(n.getfName() == null) { // 새로운 파일이 없는 경우
				
				result = nDao.updateNotice(con, n);
				
			} else { // 새로운 파일이 있는 경우
				
				int nResult = nDao.updateNotice(con, n);
				
				if(nResult > 0) { // notice 업데이트 성공
					
					int fResult = nDao.filesUpdate(con, n, fNo);
					
					if(fResult > 0) { // files 업데이트 성공
						
						File f = new File(n.getfPath()+"/"+originFname);
						
						if(f.delete()) System.out.println("파일 삭제 성공");
						else System.out.println("파일 삭제 실패");
						
						result = fResult;
						
					}
					
				} else { // notice 업데이트 실패
					
					result = nResult;
					
				}
				
			}
			
		} else { // 기존 파일이 없는 경우
			
			if(n.getfName() == null) { // 새로운 파일이 없는 경우
				
				result = nDao.updateNotice(con, n);
				
			} else { // 새로운 파일이 있는 경우
				
				int fResult = nDao.fileUpload(con, n);
				
				if(fResult > 0) { // files 인서트 성공
					
					result = nDao.updateNoticeWIthNewFile(con, n);
					
				} else { // files 인서트 실패
					
					result = fResult;
					
				}
				
			}
			
		}
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}


}
