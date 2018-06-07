package com.gt.gettogether.schedule.model.vo;

import java.sql.Date;

public class Schedule implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;

	private int sNo;
	private String sTitle;
	private String sContent;
	private String sColor;
	private Date sDate; 
	private String sTime;
	private int eNo; 
	
	public Schedule() {
		super();
	}

	public Schedule(int sNo, String sTitle, String sContent, String sColor, Date sDate, String sTime, int eNo) {
		super();
		this.sNo = sNo;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sColor = sColor;
		this.sDate = sDate;
		this.sTime = sTime;
		this.eNo = eNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	public String getsColor() {
		return sColor;
	}

	public void setsColor(String sColor) {
		this.sColor = sColor;
	}

	public Date getsDate() {
		return sDate;
	}

	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}

	public String getsTime() {
		return sTime;
	}

	public void setsTime(String sTime) {
		this.sTime = sTime;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	@Override
	public String toString() {
		return "Schedule [sNo=" + sNo + ", sTitle=" + sTitle + ", sContent=" + sContent + ", sColor=" + sColor
				+ ", sDate=" + sDate + ", sTime=" + sTime + ", eNo=" + eNo + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + eNo;
		result = prime * result + ((sColor == null) ? 0 : sColor.hashCode());
		result = prime * result + ((sContent == null) ? 0 : sContent.hashCode());
		result = prime * result + ((sDate == null) ? 0 : sDate.hashCode());
		result = prime * result + sNo;
		result = prime * result + ((sTime == null) ? 0 : sTime.hashCode());
		result = prime * result + ((sTitle == null) ? 0 : sTitle.hashCode());
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
		Schedule other = (Schedule) obj;
		if (eNo != other.eNo)
			return false;
		if (sColor == null) {
			if (other.sColor != null)
				return false;
		} else if (!sColor.equals(other.sColor))
			return false;
		if (sContent == null) {
			if (other.sContent != null)
				return false;
		} else if (!sContent.equals(other.sContent))
			return false;
		if (sDate == null) {
			if (other.sDate != null)
				return false;
		} else if (!sDate.equals(other.sDate))
			return false;
		if (sNo != other.sNo)
			return false;
		if (sTime == null) {
			if (other.sTime != null)
				return false;
		} else if (!sTime.equals(other.sTime))
			return false;
		if (sTitle == null) {
			if (other.sTitle != null)
				return false;
		} else if (!sTitle.equals(other.sTitle))
			return false;
		return true;
	}
	
}
