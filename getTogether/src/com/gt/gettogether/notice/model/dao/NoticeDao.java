package com.gt.gettogether.notice.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

import com.gt.gettogether.notice.model.vo.*;
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
	
	public ArrayList<NoticeNFiles> selectList2(Connection con){
		
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
	
	
	
	public ArrayList<NoticeNFiles> selectList(Connection con, int currentPage, int limit){
		
	/*	ArrayList<NoticeNFiles> list = null;
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
			return list;*/
//-----------------------------------------------------------------------------------------------------------------------------			
			// Statement stmt = null;
			PreparedStatement pstmt = null;

			ResultSet rset = null;
			ArrayList<NoticeNFiles> list = null;

			String query = prop.getProperty("selectList2");

			System.out.println(query);

			try {
				// 페이징처리 전
				// stmt = con.createStatement();
				// rset = stmt.executeQuery(query);

				// 페이징처리 후
				
				pstmt = con.prepareStatement(query);
				
				//조회 시작할 행 번호와 마지막 행 번호 계산 
				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;
				
				pstmt.setInt(1, startRow); 
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				 
				
				list = new ArrayList<NoticeNFiles>();

				while (rset.next()) {
					NoticeNFiles n = new NoticeNFiles();
					n.setnNo(rset.getInt("N_NO"));
					n.setnTitle(rset.getString("N_TITLE"));
					n.setnWriter(rset.getString("N_WRITER"));
					n.setnDate(rset.getDate("N_DATE"));
					n.setnCount(rset.getInt("N_COUNT"));
					n.setnFix(rset.getString("N_FIX"));
					n.setfName(rset.getString("F_NAME"));
					
					list.add(n);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				//close(stmt);
				close(pstmt);
			}

			return list;
	}
	
	
	//공지사항 글 추가//공지사항 글 추가//공지사항 글 추가//공지사항 글 추가//공지사항 글 추가//공지사항 글 추가//공지사항 글 추가//공지사항 글 추가//공지사항 글 추가
	public int insertNotice(Connection con,NoticeNFiles nf){
		
		int result=0;
		
		PreparedStatement pstmt = null;

 		
		try{
			
			if(nf.getfName() != null){
			String query1 = prop.getProperty("insertNotice");
			
			pstmt = con.prepareStatement(query1);
			
			
			
			pstmt.setString(1, nf.getnTitle());
			pstmt.setString(2, nf.getnContent());
			pstmt.setString(3, nf.getnWriter());
			pstmt.setString(4, nf.getnFix());
			pstmt.setInt(5, nf.geteNo());

			int result1 = pstmt.executeUpdate();
			 
			result = result1;
		}else if(nf.getfName() == null){
		
			String query2 = prop.getProperty("insertNotice2");
			
			pstmt = con.prepareStatement(query2);
			
			
			
			pstmt.setString(1, nf.getnTitle());
			pstmt.setString(2, nf.getnContent());
			pstmt.setString(3, nf.getnWriter());
			pstmt.setString(4, nf.getnFix());
			pstmt.setInt(5, nf.geteNo());

			int result2 = pstmt.executeUpdate();
			result = result2;
		}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			
			close(pstmt);			
		}
		
		return result;
	}
	
	
	public NoticeNFiles selectOne(Connection con, String num){
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		NoticeNFiles n = null;
		
		int result = 0;
		
		String query = prop.getProperty("selectOne"); 
		
		try{
			
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, Integer.parseInt(num));
		
		rset = pstmt.executeQuery();
		if(rset.next()){
			n = new NoticeNFiles();
			
			n.setnNo(rset.getInt("N_NO"));
			n.setnTitle(rset.getString("N_TITLE"));
			n.setnWriter(rset.getString("E_NAME"));
			n.setnContent(rset.getString("N_CONTENT"));
			n.setnCount(rset.getInt("N_COUNT"));
			n.setnDate(rset.getDate("N_DATE"));
			n.setfName(rset.getString("F_NAME"));
								
		}
		
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
			
		}
		
		return n;
	}
	
	
	public int updateNotice(Connection con,NoticeNFiles n){
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try{
			pstmt = con .prepareStatement(query);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setInt(3,n.getnNo());
			
			result = pstmt.executeUpdate();
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	
	
	public int deleteNotice(Connection con, int nno){
		
		PreparedStatement pstmt = null;
		
		int result = 0 ;
		String query = prop.getProperty("deleteNotice");
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	
	
	public ArrayList<NoticeNFiles> searchTitle(Connection con, String keyword,int currentPage, int limit){
		
		ArrayList<NoticeNFiles> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchTitle");
		
		try {
			pstmt= con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow); 
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<NoticeNFiles>();
			while(rset.next()){
				NoticeNFiles n = new NoticeNFiles();

				n.setnNo(rset.getInt("N_NO"));
				n.setnTitle(rset.getString("N_TITLE"));
				n.setnContent(rset.getString("N_CONTENT"));
				n.setfName(rset.getString("F_NAME"));
				n.setnCount(rset.getInt("N_COUNT"));
				n.setnDate(rset.getDate("N_DATE"));
				n.setnFix(rset.getString("N_FIX"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println("제목 search 했을 시 DAO 값 : "+list);
		
		return list;
		
	}

	
	public ArrayList<NoticeNFiles> searchContent(Connection con, String keyword,int currentPage, int limit){
		
		ArrayList<NoticeNFiles> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchContent");
		
		try {
			pstmt= con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow); 
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<NoticeNFiles>();
			while(rset.next()){
				
				NoticeNFiles n = new NoticeNFiles();
				
				n.setnNo(rset.getInt("N_NO"));
				n.setnTitle(rset.getString("N_TITLE"));
				n.setnContent(rset.getString("N_CONTENT"));
				n.setfName(rset.getString("F_NAME"));
				n.setnCount(rset.getInt("N_COUNT"));
				n.setnDate(rset.getDate("N_DATE"));
				n.setnFix(rset.getString("N_FIX"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println("내용 search 했을 시 DAO 값"+list);
		
		return list;
		
	}
	
	
	public int updateCount(Connection con,String num){
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,Integer.parseInt(num));
			result = pstmt.executeUpdate();
					
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}


	public int fileUpload(Connection con, NoticeNFiles nf) {
		
		int result = 0;
	
		PreparedStatement pstmt = null;
		
		if(nf.getfName() !=null){
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
		
		}else{
			
			return result;
			
		}
	 
	}


	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public int selectFno(Connection con, int nNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectFno");
		
		try {
			
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, nNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("F_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return result;
		
	}

	public int filesUpdate(Connection con, NoticeNFiles n, int fNo) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("filesUpdate");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, n.getfName());
			pstmt.setInt(2, fNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public String selectOriginFname(Connection con, int fNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = null;
		
		String query = prop.getProperty("selectOriginFname");
		
		try {
			
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, fNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getString("F_NAME");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return result;
		
	}

	public NoticeNFiles selectUpdateOne(Connection con, int nno) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		NoticeNFiles nf = null;
		
		int result = 0;
		
		String query = prop.getProperty("selectUpdateOne"); 
		
		try{
			
		pstmt = con.prepareStatement(query);
		
		pstmt.setInt(1, nno);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()){
			nf = new NoticeNFiles();
			
			nf.setnNo(rset.getInt("N_NO"));
			nf.setnTitle(rset.getString("N_TITLE"));
			nf.setnWriter(rset.getString("E_NAME"));
			nf.setnContent(rset.getString("N_CONTENT"));
			nf.setnCount(rset.getInt("N_COUNT"));
			nf.setnDate(rset.getDate("N_DATE"));
			nf.setfName(rset.getString("F_NAME"));
								
		}
		
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
			
		}
		
		return nf;
		
	}

	public int updateNoticeWIthNewFile(Connection con, NoticeNFiles n) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNoticeWIthNewFile");
		
		try {
			
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setInt(3, n.getnNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
}
