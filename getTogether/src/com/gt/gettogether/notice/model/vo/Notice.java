package com.gt.gettogether.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {

	private static final long serialVersionUID = 1L;

	private String nNo;
	private String nTitle;
	private String nContent;
	private String nWriter;
	private int nCount;
	private Date nDate;
	private String nFix;
	private int eNo;
	
	public Notice() {
		super();
	}

	public Notice(String nNo, String nTitle, String nContent, String nWriter, int nCount, Date nDate, String nFix,
			int eNo) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWriter = nWriter;
		this.nCount = nCount;
		this.nDate = nDate;
		this.nFix = nFix;
		this.eNo = eNo;
	}
	
	public String getnNo() {
		return nNo;
	}
	public void setnNo(String nNo) {
		this.nNo = nNo;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getnWriter() {
		return nWriter;
	}
	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}
	public int getnCount() {
		return nCount;
	}
	public void setnCount(int nCount) {
		this.nCount = nCount;
	}
	public Date getnDate() {
		return nDate;
	}
	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}
	public String getnFix() {
		return nFix;
	}
	public void setnFix(String nFix) {
		this.nFix = nFix;
	}
	public int geteNo() {
		return eNo;
	}
	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nWriter=" + nWriter
				+ ", nCount=" + nCount + ", nDate=" + nDate + ", nFix=" + nFix + ", eNo=" + eNo + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + eNo;
		result = prime * result + ((nContent == null) ? 0 : nContent.hashCode());
		result = prime * result + nCount;
		result = prime * result + ((nDate == null) ? 0 : nDate.hashCode());
		result = prime * result + ((nFix == null) ? 0 : nFix.hashCode());
		result = prime * result + ((nNo == null) ? 0 : nNo.hashCode());
		result = prime * result + ((nTitle == null) ? 0 : nTitle.hashCode());
		result = prime * result + ((nWriter == null) ? 0 : nWriter.hashCode());
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
		Notice other = (Notice) obj;
		if (eNo != other.eNo)
			return false;
		if (nContent == null) {
			if (other.nContent != null)
				return false;
		} else if (!nContent.equals(other.nContent))
			return false;
		if (nCount != other.nCount)
			return false;
		if (nDate == null) {
			if (other.nDate != null)
				return false;
		} else if (!nDate.equals(other.nDate))
			return false;
		if (nFix == null) {
			if (other.nFix != null)
				return false;
		} else if (!nFix.equals(other.nFix))
			return false;
		if (nNo == null) {
			if (other.nNo != null)
				return false;
		} else if (!nNo.equals(other.nNo))
			return false;
		if (nTitle == null) {
			if (other.nTitle != null)
				return false;
		} else if (!nTitle.equals(other.nTitle))
			return false;
		if (nWriter == null) {
			if (other.nWriter != null)
				return false;
		} else if (!nWriter.equals(other.nWriter))
			return false;
		return true;
	}
	
}
