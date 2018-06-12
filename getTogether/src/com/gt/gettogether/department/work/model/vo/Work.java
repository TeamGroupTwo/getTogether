package com.gt.gettogether.department.work.model.vo;

import java.sql.Date;

public class Work {

	private int wNo;
	private String wTitle;
	private String wContent;
	private String wWriter;
	private int pNo;
	private Date wDate;
	private int eNo;
	private int fNo;
	
	private String fName;
	private String profile;
	
	public Work() {
		super();
	}

	public Work(int wNo, String wTitle, String wContent, String wWriter, int pNo, Date wDate, int eNo, int fNo,
			String fName, String profile) {
		super();
		this.wNo = wNo;
		this.wTitle = wTitle;
		this.wContent = wContent;
		this.wWriter = wWriter;
		this.pNo = pNo;
		this.wDate = wDate;
		this.eNo = eNo;
		this.fNo = fNo;
		this.fName = fName;
		this.profile = profile;
	}

	public int getwNo() {
		return wNo;
	}

	public void setwNo(int wNo) {
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

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "Work [wNo=" + wNo + ", wTitle=" + wTitle + ", wContent=" + wContent + ", wWriter=" + wWriter + ", pNo="
				+ pNo + ", wDate=" + wDate + ", eNo=" + eNo + ", fNo=" + fNo + ", fName=" + fName + ", profile="
				+ profile + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + eNo;
		result = prime * result + ((fName == null) ? 0 : fName.hashCode());
		result = prime * result + fNo;
		result = prime * result + pNo;
		result = prime * result + ((profile == null) ? 0 : profile.hashCode());
		result = prime * result + ((wContent == null) ? 0 : wContent.hashCode());
		result = prime * result + ((wDate == null) ? 0 : wDate.hashCode());
		result = prime * result + wNo;
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
		if (fName == null) {
			if (other.fName != null)
				return false;
		} else if (!fName.equals(other.fName))
			return false;
		if (fNo != other.fNo)
			return false;
		if (pNo != other.pNo)
			return false;
		if (profile == null) {
			if (other.profile != null)
				return false;
		} else if (!profile.equals(other.profile))
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
		if (wNo != other.wNo)
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
