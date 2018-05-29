package com.gt.gettogether.department.work.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Project implements Serializable{

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

	@Override
	public String toString() {
		return "Project [pNo=" + pNo + ", pTitle=" + pTitle + ", pDate=" + pDate + ", dCode=" + dCode + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dCode == null) ? 0 : dCode.hashCode());
		result = prime * result + ((pDate == null) ? 0 : pDate.hashCode());
		result = prime * result + pNo;
		result = prime * result + ((pTitle == null) ? 0 : pTitle.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Project other = (Project) obj;
		if (dCode == null) {
			if (other.dCode != null)
				return false;
		} else if (!dCode.equals(other.dCode))
			return false;
		if (pDate == null) {
			if (other.pDate != null)
				return false;
		} else if (!pDate.equals(other.pDate))
			return false;
		if (pNo != other.pNo)
			return false;
		if (pTitle == null) {
			if (other.pTitle != null)
				return false;
		} else if (!pTitle.equals(other.pTitle))
			return false;
		return true;
	}
	
}
