package com.gt.gettogether.notice.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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

	
	public ArrayList<Notice> selectList(Connection con){
		
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Notice>();
			
			while(rset.next()){
				NoticeNFiles n = new NoticeNFiles();
				
				n.setnNo(rset.getString("N_NO"));
				n.setnTitle(rset.getString("N_TITLE"));
				n.setnWriter(rset.getString("N_WRITER"));
				n.setnWriter(rset.getString("N_WRITER"));
				n.setnDate(rset.getDate("N_DATE"));
				n.setnCount(rset.getInt("N_COUNT"));
				n.setnFix(rset.getString("N_FIX"));
				n.setfName(rset.getString("F_NAME"));
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
	
	
	public int updateCount(){
		
		int result = 0;
		
		
		
		return result;
	}
	
}
