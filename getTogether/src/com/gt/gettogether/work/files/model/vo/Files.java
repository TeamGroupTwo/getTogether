package com.gt.gettogether.work.files.model.vo;

import java.io.Serializable;

public class Files implements Serializable {

	private static final long serialVersionUID = 1L;

	private int fNo;
	private String fName;
	private String fPath;
	private String fBoard;
	private String fType;

	public Files() {
		super();
	}

	public Files(int fNo, String fName, String fPath, String fBoard, String fType) {
		super();
		this.fNo = fNo;
		this.fName = fName;
		this.fPath = fPath;
		this.fBoard = fBoard;
		this.fType = fType;
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

	public String getfPath() {
		return fPath;
	}

	public void setfPath(String fPath) {
		this.fPath = fPath;
	}

	public String getfBoard() {
		return fBoard;
	}

	public void setfBoard(String fBoard) {
		this.fBoard = fBoard;
	}

	public String getfType() {
		return fType;
	}

	public void setfType(String fType) {
		this.fType = fType;
	}

	@Override
	public String toString() {
		return "Files [fNo=" + fNo + ", fName=" + fName + ", fPath=" + fPath + ", fBoard=" + fBoard + ", fType=" + fType
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fBoard == null) ? 0 : fBoard.hashCode());
		result = prime * result + ((fName == null) ? 0 : fName.hashCode());
		result = prime * result + fNo;
		result = prime * result + ((fPath == null) ? 0 : fPath.hashCode());
		result = prime * result + ((fType == null) ? 0 : fType.hashCode());
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
		Files other = (Files) obj;
		if (fBoard == null) {
			if (other.fBoard != null)
				return false;
		} else if (!fBoard.equals(other.fBoard))
			return false;
		if (fName == null) {
			if (other.fName != null)
				return false;
		} else if (!fName.equals(other.fName))
			return false;
		if (fNo != other.fNo)
			return false;
		if (fPath == null) {
			if (other.fPath != null)
				return false;
		} else if (!fPath.equals(other.fPath))
			return false;
		if (fType == null) {
			if (other.fType != null)
				return false;
		} else if (!fType.equals(other.fType))
			return false;
		return true;
	}
	
}
