package com.gt.gettogether.work.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class WorkComment implements Serializable{

	private static final long serialVersionUID = 1L;

	private int wcNo;
	private String wcWriter;
	private String wcContent;
	private Date wcDate;
	private String wNo;
	private int eNo;
	
	public WorkComment() {
		super();
	}

	public WorkComment(int wcNo, String wcWriter, String wcContent, Date wcDate, String wNo, int eNo) {
		super();
		this.wcNo = wcNo;
		this.wcWriter = wcWriter;
		this.wcContent = wcContent;
		this.wcDate = wcDate;
		this.wNo = wNo;
		this.eNo = eNo;
	}

	public int getWcNo() {
		return wcNo;
	}

	public void setWcNo(int wcNo) {
		this.wcNo = wcNo;
	}

	public String getWcWriter() {
		return wcWriter;
	}

	public void setWcWriter(String wcWriter) {
		this.wcWriter = wcWriter;
	}

	public String getWcContent() {
		return wcContent;
	}

	public void setWcContent(String wcContent) {
		this.wcContent = wcContent;
	}

	public Date getWcDate() {
		return wcDate;
	}

	public void setWcDate(Date wcDate) {
		this.wcDate = wcDate;
	}

	public String getwNo() {
		return wNo;
	}

	public void setwNo(String wNo) {
		this.wNo = wNo;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	@Override
	public String toString() {
		return "WorkComment [wcNo=" + wcNo + ", wcWriter=" + wcWriter + ", wcContent=" + wcContent + ", wcDate="
				+ wcDate + ", wNo=" + wNo + ", eNo=" + eNo + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + eNo;
		result = prime * result + ((wNo == null) ? 0 : wNo.hashCode());
		result = prime * result + ((wcContent == null) ? 0 : wcContent.hashCode());
		result = prime * result + ((wcDate == null) ? 0 : wcDate.hashCode());
		result = prime * result + wcNo;
		result = prime * result + ((wcWriter == null) ? 0 : wcWriter.hashCode());
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
		WorkComment other = (WorkComment) obj;
		if (eNo != other.eNo)
			return false;
		if (wNo == null) {
			if (other.wNo != null)
				return false;
		} else if (!wNo.equals(other.wNo))
			return false;
		if (wcContent == null) {
			if (other.wcContent != null)
				return false;
		} else if (!wcContent.equals(other.wcContent))
			return false;
		if (wcDate == null) {
			if (other.wcDate != null)
				return false;
		} else if (!wcDate.equals(other.wcDate))
			return false;
		if (wcNo != other.wcNo)
			return false;
		if (wcWriter == null) {
			if (other.wcWriter != null)
				return false;
		} else if (!wcWriter.equals(other.wcWriter))
			return false;
		return true;
	}
	
}
