package com.gt.gettogether.department.work.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.gt.gettogether.department.work.model.dao.ProjectDao;
import com.gt.gettogether.department.work.model.vo.Project;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

public class ProjectService {

	public ArrayList<Project> selectProjectList(String loginDcode) {
		
		Connection con = getConnection();
		
		ArrayList<Project> pjList = new ProjectDao().selectProjectList(con, loginDcode);
		
		close(con);
		
		return pjList;
		
	}
	
	public Project insertProject(Project pj) {
		
		Connection con = getConnection();
		ProjectDao pDao = new ProjectDao();
		Project resultPj = null;
		
		int result = pDao.insertProject(con, pj);
		
		if(result > 0) {
			
			commit(con);
			
			resultPj = pDao.selectInsertOne(con, pj);
			
		}
		else rollback(con);
		
		close(con);
		
		return resultPj;
	}
	
	public int updateProject(int pNo, String upTitle) {
		
		Connection con = getConnection();
		
		int result = new ProjectDao().updateProject(con, pNo, upTitle);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int deleteProject(int[] deleteList) {
		
		Connection con = getConnection();
		
		int result = new ProjectDao().deleteProject(con, deleteList);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}
	
}
