package com.gt.gettogether.department.work.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Work implements Serializable{

	private static final long serialVersionUID = 1L;

	private String wNo;
	private String wTitle;
	private String wContent;
	private String wWriter;
	private int pNo;
	private Date wDate;
	private int eNo;
	
	public Work() {
		super();
	}

	public Work(String wNo, String wTitle, String wContent, String wWriter, int pNo, Date wDate, int eNo) {
		super();
		this.wNo = wNo;
		this.wTitle = wTitle;
		this.wContent = wContent;
		this.wWriter = wWriter;
		this.pNo = pNo;
		this.wDate = wDate;
		this.eNo = eNo;
	}

	public String getwNo() {
		return wNo;
	}

	public void setwNo(String wNo) {
		this.wNo = wNo;
	}

	public String getwTitle() {
		return wTitle;
	}

	public void setwTitle(String wTitle) {
		this.wTitle = wTitle;
	}

	public String getwContent() {
		return wContent;
	}

	public void setwContent(String wContent) {
		this.wContent = wContent;
	}

	public String getwWriter() {
		return wWriter;
	}

	public void setwWriter(String wWriter) {
		this.wWriter = wWriter;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public Date getwDate() {
		return wDate;
	}

	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	@Override
	public String toString() {
		return "Work [wNo=" + wNo + ", wTitle=" + wTitle + ", wContent=" + wContent + ", wWriter=" + wWriter + ", pNo="
				+ pNo + ", wDate=" + wDate + ", eNo=" + eNo + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + eNo;
		result = prime * result + pNo;
		result = prime * result + ((wContent == null) ? 0 : wContent.hashCode());
		result = prime * result + ((wDate == null) ? 0 : wDate.hashCode());
		result = prime * result + ((wNo == null) ? 0 : wNo.hashCode());
		result = prime * result + ((wTitle == null) ? 0 : wTitle.hashCode());
		result = prime * result + ((wWriter == null) ? 0 : wWriter.hashCode());
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
		Work other = (Work) obj;
		if (eNo != other.eNo)
			return false;
		if (pNo != other.pNo)
			return false;
		if (wContent == null) {
			if (other.wContent != null)
				return false;
		} else if (!wContent.equals(other.wContent))
			return false;
		if (wDate == null) {
			if (other.wDate != null)
				return false;
		} else if (!wDate.equals(other.wDate))
			return false;
		if (wNo == null) {
			if (other.wNo != null)
				return false;
		} else if (!wNo.equals(other.wNo))
			return false;
		if (wTitle == null) {
			if (other.wTitle != null)
				return false;
		} else if (!wTitle.equals(other.wTitle))
			return false;
		if (wWriter == null) {
			if (other.wWriter != null)
				return false;
		} else if (!wWriter.equals(other.wWriter))
			return false;
		return true;
	}	
	
}
