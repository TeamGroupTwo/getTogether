package com.gt.gettogether.notice.model.vo;

import java.sql.Date;

public class NoticeNFiles extends Notice {

	private static final long serialVersionUID = 1L;

	private int fNo;
	private String fName;
	private String fPath;
	private String fBoard;
	private String fType;
	
	public NoticeNFiles(){ 
		super();
	}
	
	public NoticeNFiles(int nNo, String nTitle, String nContent, String nWriter, int nCount, Date nDate, String nFix,
			int eNo) {
		super(nNo, nTitle, nContent, nWriter, nCount, nDate, nFix, eNo);
	}
	
	public NoticeNFiles(int fNo, String fName, String fPath, String fBoard, String fType) {
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
}
