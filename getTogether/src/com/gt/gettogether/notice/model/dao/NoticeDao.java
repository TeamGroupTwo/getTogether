package com.gt.gettogether.notice.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;


import com.gt.gettogether.notice.model.vo.Notice;
import com.gt.gettogether.notice.model.vo.NoticeNFiles;
import com.gt.gettogether.notice.model.dao.NoticeDao;

public class NoticeDao {

	private Properties prop;
	
	public NoticeDao() {
		prop = new Properties();
		String fileName = NoticeDao.class.getResource("/config/notice/notice-query.properties").getPath();
		
		try{
		prop.load(new FileReader(fileName));
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}	
	}

	
	public ArrayList<NoticeNFiles> selectList(Connection con){
		
		ArrayList<NoticeNFiles> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<NoticeNFiles>();
			
			while(rset.next()){
				NoticeNFiles n = new NoticeNFiles();
				
				n.setnNo(rset.getInt("N_NO"));
				n.setnTitle(rset.getString("N_TITLE"));
				n.setnWriter(rset.getString("N_WRITER"));
				n.setnDate(rset.getDate("N_DATE"));
				n.setnCount(rset.getInt("N_COUNT"));
				n.setnFix(rset.getString("N_FIX"));
//				n.setfName(rset.getString("F_NAME"));
				list.add(n);
			}
			
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				close(rset);
				close(stmt);
			}
			
		System.out.println("DAO 출력 확인용 : "+list);
			return list;
	}
	
	
	public int insertNotice(Connection con,NoticeNFiles nf1){
		
		int result = 0 ;
		
		PreparedStatement pstmt = null;
		
		try{
			
			String query = prop.getProperty("insertNotice");
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, nf1.getnTitle());
			pstmt.setString(2, nf1.getnContent());
			pstmt.setString(3, nf1.getnWriter());
			pstmt.setString(4, nf1.getnFix());
			pstmt.setInt(5, nf1.geteNo());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			
			close(pstmt);			
		}
		System.out.println("게시판 Insert DAO : "+result);
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
	
	
	public int updateCount(){
		
		int result = 0;
		
		
		
		return result;
	}


	public int fileUpload(Connection con, NoticeNFiles nf) {
		
		int result = 0 ;
		
		PreparedStatement pstmt = null;
		
		try{
			
			String query = prop.getProperty("insertFile");
			
			pstmt = con.prepareStatement(query);
			
			
			pstmt.setString(1, nf.getfPath());
			pstmt.setString(2, nf.getfName());
			
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			
			close(pstmt);			
		}
		System.out.println("파일Insert DAO : "+result);
		return result;
		
		
	}
	
}
