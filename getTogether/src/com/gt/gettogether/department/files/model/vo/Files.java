package com.gt.gettogether.department.files.model.vo;


public class Files {
	
	private int fNo;
	private String fPath;
	private String fName;
	private String fType;
	
	public Files() {
		super();
	}

	public Files(int fNo, String fPath, String fName, String fType) {
		super();
		this.fNo = fNo;
		this.fPath = fPath;
		this.fName = fName;
		this.fType = fType;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getfPath() {
		return fPath;
	}

	public void setfPath(String fPath) {
		this.fPath = fPath;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getfType() {
		return fType;
	}

	public void setfType(String fType) {
		this.fType = fType;
	}

	@Override
	public String toString() {
		return "Files [fNo=" + fNo + ", fPath=" + fPath + ", fName=" + fName + ", fType=" + fType + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
