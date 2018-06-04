package com.gt.gettogether.employee.model.vo;

import java.io.Serializable;

public class Employee implements Serializable{

	private static final long serialVersionUID = 1L;

	private int eNo;
	private String eId;
	private String ePassword;
	private String eName;
	private String phone;
	private String email;
	private String profile;
	private String rCode;
	private String dCode;
	private String rName;
	private String dName;
	
	public Employee() {
		super();
	}

	public Employee(int eNo, String eId, String ePassword, String eName, String phone, String email, String profile,
			String rCode, String dCode) {
		super();
		this.eNo = eNo;
		this.eId = eId;
		this.ePassword = ePassword;
		this.eName = eName;
		this.phone = phone;
		this.email = email;
		this.profile = profile;
		this.rCode = rCode;
		this.dCode = dCode;
	}

	public Employee(int eNo, String eId, String ePassword, String eName, String phone, String email, String profile,
			String rCode, String dCode, String rName, String dName) {
		super();
		this.eNo = eNo;
		this.eId = eId;
		this.ePassword = ePassword;
		this.eName = eName;
		this.phone = phone;
		this.email = email;
		this.profile = profile;
		this.rCode = rCode;
		this.dCode = dCode;
		this.rName = rName;
		this.dName = dName;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String getePassword() {
		return ePassword;
	}

	public void setePassword(String ePassword) {
		this.ePassword = ePassword;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getrCode() {
		return rCode;
	}

	public void setrCode(String rCode) {
		this.rCode = rCode;
	}

	public String getdCode() {
		return dCode;
	}

	public void setdCode(String dCode) {
		this.dCode = dCode;
	}
	
	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	@Override
	public String toString() {
		return "Employee [eNo=" + eNo + ", eId=" + eId + ", ePassword=" + ePassword + ", eName=" + eName + ", phone="
				+ phone + ", email=" + email + ", profile=" + profile + ", rCode=" + rCode + ", dCode=" + dCode
				+ ", rName=" + rName + ", dName=" + dName + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dCode == null) ? 0 : dCode.hashCode());
		result = prime * result + ((dName == null) ? 0 : dName.hashCode());
		result = prime * result + ((eId == null) ? 0 : eId.hashCode());
		result = prime * result + ((eName == null) ? 0 : eName.hashCode());
		result = prime * result + eNo;
		result = prime * result + ((ePassword == null) ? 0 : ePassword.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((profile == null) ? 0 : profile.hashCode());
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
		Employee other = (Employee) obj;
		if (dCode == null) {
			if (other.dCode != null)
				return false;
		} else if (!dCode.equals(other.dCode))
			return false;
		if (dName == null) {
			if (other.dName != null)
				return false;
		} else if (!dName.equals(other.dName))
			return false;
		if (eId == null) {
			if (other.eId != null)
				return false;
		} else if (!eId.equals(other.eId))
			return false;
		if (eName == null) {
			if (other.eName != null)
				return false;
		} else if (!eName.equals(other.eName))
			return false;
		if (eNo != other.eNo)
			return false;
		if (ePassword == null) {
			if (other.ePassword != null)
				return false;
		} else if (!ePassword.equals(other.ePassword))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (profile == null) {
			if (other.profile != null)
				return false;
		} else if (!profile.equals(other.profile))
			return false;
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
