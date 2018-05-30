package com.gt.gettogether.department.work.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Project implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int pNo;
	private String pTitle;
	private Date pDate;
	private String dCode;
	
	public Project() {
		super();
	}

	public Project(int pNo, String pTitle, Date pDate, String dCode) {
		super();
		this.pNo = pNo;
		this.pTitle = pTitle;
		this.pDate = pDate;
		this.dCode = dCode;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getdCode() {
		return dCode;
	}

	public void setdCode(String dCode) {
		this.dCode = dCode;
	}
	
}
