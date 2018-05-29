package com.gt.gettogether.employee.model.vo;

import java.io.Serializable;

public class Rank implements Serializable {

	private static final long serialVersionUID = 1L;

	private String rCode;
	private String rName;
	
	public Rank() {
		super();
	}

	public Rank(String rCode, String rName) {
		super();
		this.rCode = rCode;
		this.rName = rName;
	}

	public String getrCode() {
		return rCode;
	}

	public void setrCode(String rCode) {
		this.rCode = rCode;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	@Override
	public String toString() {
		return "Rank [rCode=" + rCode + ", rName=" + rName + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((rCode == null) ? 0 : rCode.hashCode());
		result = prime * result + ((rName == null) ? 0 : rName.hashCode());
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
		Rank other = (Rank) obj;
		if (rCode == null) {
			if (other.rCode != null)
				return false;
		} else if (!rCode.equals(other.rCode))
			return false;
		if (rName == null) {
			if (other.rName != null)
				return false;
		} else if (!rName.equals(other.rName))
			return false;
		return true;
	}
	
}
