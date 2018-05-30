package com.gt.gettogether.department.work.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.gt.gettogether.department.work.model.dao.ProjectDao;
import com.gt.gettogether.department.work.model.vo.Project;

import static com.gt.gettogether.common.jdbc.JDBCTemplate.*;

public class ProjectService {

	public ArrayList<Project> selectProjectList() {
		
		Connection con = getConnection();
		
		ArrayList<Project> pjList = new ProjectDao().selectProjectList(con);
		
		close(con);
		
		return pjList;
		
	}
	
	public int insertProject(Project pj) {
		
		Connection con = getConnection();
		
		int result = new ProjectDao().insertProject(con, pj);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int updateProject(String pTitle, String upTitle) {
		
		Connection con = getConnection();
		
		int result = new ProjectDao().updateProject(con, pTitle, upTitle);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int deleteProject(String[] chkList) {
		
		Connection con = getConnection();
		
		int result = new ProjectDao().deleteProject(con, chkList);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}
	
	public Project selectOneProject() {
		return null;
	}
	
}
